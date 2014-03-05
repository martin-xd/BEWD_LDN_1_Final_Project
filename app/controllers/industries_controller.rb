class IndustriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @industries = Industry.all
  end


  def new
    @industry = Industry.new
  end


  def safe_params
    params.require(:industry).permit(:sector)
  end

  def create
    @industry = Industry.new(safe_params)
    if @industry.save
      flash.now[:info] = "#{@industry.sector} created!"
      redirect_to industries_path
    else
      flash.now[:info] = "Something went wrong. Please try again."
      render :new
    end
  end


  def show
  end


  def edit
    @industry = Industry.find params[:id]
  end


  def update
    @industry = Industry.find params[:id]
    if @industry.update_attributes safe_params
      redirect_to industries_path
    else
      render :new
    end
  end


  def destroy
    @industry = Industry.find params[:id]
    if @industry.delete
      flash[:info] = "sucessfully deleted #{@industry.name}"
      redirect_to industries_path
    else
      render :edit
    end
  end
end
