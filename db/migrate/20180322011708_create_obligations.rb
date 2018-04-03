class CreateObligations < ActiveRecord::Migration[5.1]
  def change
    create_table :obligations do |t|
      t.string :state
      t.references :template, foreign_key: true

      t.timestamps
    end
  end
end
