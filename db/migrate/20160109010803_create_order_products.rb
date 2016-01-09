class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity, default: 0
      t.decimal :price, default: 0, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end
