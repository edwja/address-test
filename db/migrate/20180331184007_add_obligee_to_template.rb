class AddObligeeToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_reference :templates, :obligee, foreign_key: true
  end
end
