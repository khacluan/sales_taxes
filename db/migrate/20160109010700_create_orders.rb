class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.decimal :tax, default: 0, precision: 5, scale: 2
      t.decimal :total, default: 0, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end
