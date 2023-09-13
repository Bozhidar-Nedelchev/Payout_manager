class CountriesController < ApplicationController
    before_action :set_country, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    load_and_authorize_resource

  def index
    authorize! :read, Country
    @countries = Country.all
    
  # Retrieve only active countries and order them by name.
 

  respond_to do |format|
    format.html
    format.csv { send_data generate_csv(@countries), filename: "active_countries.csv" }
    end
  end

  def show
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to @country, notice: 'Country was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to @country, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_url, notice: 'Country was successfully destroyed.'
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :currency, :active)
  end
  def filtered_and_paginated_countries(params)
  # Example logic: Filter and paginate countries based on params.
  @all_countries = Country.all
  @filtered_countries = @all_countries # Replace with your filtering logic.
  @paginated_countries = @filtered_countries.page(params[:page]).per(10) # Adjust per page as needed.
  end
  def generate_csv(countries)
  # Example logic: Generate CSV data from the countries collection.
  CSV.generate(headers: true) do |csv|
    csv << ["Name", "Currency", "Active"] # CSV header row
    countries.each do |country|
      csv << [country.name, country.currency, country.active]
      end
    end
  end
end
