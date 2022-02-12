class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :Fname
      t.string :Lname
      t.integer :age
      t.string :email

      t.timestamps
    end
  end
end
