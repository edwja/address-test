class CreateMailingAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :mailing_addresses do |t|
      t.string :name
      t.string :addr1
      t.string :csz
      t.references :mailing_addressable, polymorphic: true, index: { name: 'index_addresses_on_addressable_type_and_addressable_id' }

      t.timestamps
    end
  end
end
