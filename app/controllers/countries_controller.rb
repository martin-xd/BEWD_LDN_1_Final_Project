class CountriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @countries = Country.all
  end


  def new
    @country = Country.new
  end


  def safe_params
    params.require(:country).permit(:name)
  end

  def create
    @country = Country.new safe_params
    if @country.save
      flash.now[:info] = "#{@country.name} created!"
      redirect_to countries_path
    else
      flash.now[:info] = "Something went wrong. Please try again."
      render :new
    end
  end


  def show
  end


  def edit
    @country = Country.find params[:id]
  end


  def update
    @country = Country.find params[:id]
    if @country.update_attributes safe_params
      redirect_to countries_path
    else
      render :new
    end
  end


  def destroy
    @country = Country.find params[:id]
    if @country.delete
      flash[:info] = "sucessfully deleted #{@country.name}"
      redirect_to countries_path
    else
      render :edit
    end
  end
end
