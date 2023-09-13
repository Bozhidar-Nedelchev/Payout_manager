class Admin::ApplicationsController < ApplicationController
before_action :set_application, only: [:show, :edit, :update, :destroy]

  def index
    @applications = Application.all
  end

  def show
    # The @application variable is already set in the before_action
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to admin_application_path(@application), notice: 'Application was successfully created.'
    else
      render :new
    end
  end

  def edit
    # The @application variable is already set in the before_action
  end

  def update
    if @application.update(application_params)
      redirect_to admin_application_path(@application), notice: 'Application was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @application.destroy
    redirect_to admin_applications_path, notice: 'Application was successfully destroyed.'
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:name, :uid, :secret, :active, :clients)
  end
end
