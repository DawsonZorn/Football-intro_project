class AddNameToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :name, :string
  end
end
