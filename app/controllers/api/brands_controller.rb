class Api::BrandsController < ApplicationController
before_action :set_brand, only: [:show, :update, :destroy]

  # GET /api/brands
  def index
    @brands = Brand.where(active: true)
    render json: @brands
  end

  # GET /api/brands/:id
  def show
    render json: @brand
  end

  # POST /api/brands
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      render json: @brand, status: :created
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/brands/:id
  def update
    if @brand.update(brand_params)
      render json: @brand
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/brands/:id
  def destroy
    @brand.destroy
    head :no_content
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :description, :active)
  end
end
