class CreateBurguers < ActiveRecord::Migration
  def change
    create_table :burguers do |t|
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, default: 0, null: false

      t.timestamps
    end
  end
end
