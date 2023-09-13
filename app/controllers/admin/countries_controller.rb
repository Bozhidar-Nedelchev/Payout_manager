# app/controllers/admin/countries_controller.rb
class Admin::CountriesController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in
  before_action :set_country, only: [:edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to admin_countries_path, notice: 'Country was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to admin_countries_path, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to admin_countries_path, notice: 'Country was successfully destroyed.'
  end
  def show
  @country = Country.find(params[:id])
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :currency)
  end
end
