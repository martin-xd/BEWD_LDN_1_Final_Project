module StocksHelper
	def get_current_price values, isin
		current_stock = values.select{ |val| val.symbol == isin}.first
		current_stock.last_trade_price
	end
end
