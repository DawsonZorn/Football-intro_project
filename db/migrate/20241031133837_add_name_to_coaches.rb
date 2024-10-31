class AddNameToCoaches < ActiveRecord::Migration[7.2]
  def change
    add_column :coaches, :name, :string
  end
end
