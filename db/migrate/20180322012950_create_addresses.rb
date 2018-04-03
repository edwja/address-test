class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :addr1
      t.string :csz
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
