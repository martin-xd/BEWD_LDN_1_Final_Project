class StocksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # for the moment this show all stocks in DB
    @stocks = current_user.stocks.order(:name)
    symbols = @stocks.map { |stock| stock.isin }
    # the code below will only show the stocks for the current_user
    # symbols = current_user.stocks.order(:name).map { |stock| stock.isin }
    @realtime_values = YahooFinance.quotes( symbols, [:last_trade_price])

  end


  def new
  	@stock = Stock.new
  end


  def safe_params
    params.require(:stock).permit(:name, :isin, :volume, :purchased_on, :purchase_price, :purchase_value, :country_id, :industry_id)
  end

  def create
    @stock = Stock.new safe_params
    @stock.user = current_user
    if @stock.save
      flash.now[:info] = "#{@stock.name} Purchased"
      redirect_to stocks_path
    else
      flash.now[:info] = "Something went wrong. Please try again."
      render :new
    end
  end

  def edit
    @stock = Stock.find params[:id]
  end


  def update
    @stock = Stock.find params[:id]
    if @stock.update_attributes safe_params
      redirect_to stocks_path
    else
      render :new
    end
  end


  def destroy
    @stock = Stock.find params[:id]
    if @stock.delete
      flash[:info] = "sucessfully deleted #{@stock.name}"
      redirect_to stocks_path
    else
      render :edit
    end
  end

end
