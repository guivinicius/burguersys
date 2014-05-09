class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
    add_index :partners, :token
  end
end
