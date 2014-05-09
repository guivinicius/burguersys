class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :price, default: 0, precision: 10, scale: 2, null: false
      t.integer :product_id
      t.integer :quantity, default: 1
      t.integer :order_id

      t.timestamps
    end
    
    add_index :order_items, :product_id
    add_index :order_items, :order_id
  end
end
