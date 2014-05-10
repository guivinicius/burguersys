class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :postalcode
      t.string :neighborhood
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
