class AddUserIdToStocks < ActiveRecord::Migration
  def change
  	add_column :stocks, :user_id, :integer, index: true
  end
end
