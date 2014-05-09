class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :status, default: 0, null: false
      t.integer :orderable_id
      t.string :orderable_type
      t.integer :address_id

      t.timestamps
    end

    add_index :orders, [:orderable_id, :orderable_type]
    add_index :orders, :address_id
  end
end
