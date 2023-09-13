class Api::ProductsController < ApplicationController
before_action :set_product, only: [:show, :update, :destroy]

  # GET /api/products
  def index
    @products = Product.where(active: true)
    render json: @products
  end

  # GET /api/products/:id
  def show
    render json: @product
  end

  # POST /api/products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/products/:id
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :amount, :brand_id, :active)
  end
end
