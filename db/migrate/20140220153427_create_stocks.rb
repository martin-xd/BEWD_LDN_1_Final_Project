class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
    	t.string :name
    	t.string :isin
    	t.integer :volume
    	t.date :purchased_on
    	t.decimal :purchase_price
    	t.decimal :purchase_value
    	t.decimal :current_price
    	t.decimal :current_value
    	t.decimal :difference
    	t.integer :country_id
    	t.integer :industry_id
      	t.timestamps
    end
  end
end
