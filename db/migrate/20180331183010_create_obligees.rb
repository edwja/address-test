class CreateObligees < ActiveRecord::Migration[5.1]
  def change
    create_table :obligees do |t|
      t.string :name

      t.timestamps
    end
  end
end
