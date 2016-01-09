class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.decimal :price, default: 0, precision: 5, scale: 2
      t.boolean :imported, default: false

      t.timestamps null: false
    end
  end
end
