class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :no_of_order
      t.boolean :out_for_print
      
      t.timestamps
    end
  end
end
