class Admin::ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end
  def show
    # The @product variable is already set in the before_action
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    # The @product variable is already set in the before_action
  end

  def update
  @product = Product.find(params[:id])

  # Create a copy of the permitted parameters
  updated_params = product_params.dup

  # Remove the attribute you want to exclude (e.g., :amount)
  updated_params.delete(:amount)

  if @product.update(updated_params)
    redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
  else
    render :edit
  end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :active, :amount, :brand)
  end
end
