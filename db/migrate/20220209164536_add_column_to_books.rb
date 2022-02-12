class AddColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :price, :decimal, precision: 2, scale: 3
  end
end
