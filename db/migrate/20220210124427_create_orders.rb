class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.decimal :total_price, precision: 3, scale: 3
      t.integer :status
        
      t.timestamps
    end
  end
end
