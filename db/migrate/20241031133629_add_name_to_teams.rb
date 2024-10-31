class AddNameToTeams < ActiveRecord::Migration[7.2]
  def change
    add_column :teams, :name, :string
  end
end
