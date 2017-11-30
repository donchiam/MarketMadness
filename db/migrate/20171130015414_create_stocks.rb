class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
    	t.string :symbol
	    t.string :name
	    t.string :industry
	    t.decimal :rank
	    t.decimal :mom
      t.timestamps
    end
  end
end
