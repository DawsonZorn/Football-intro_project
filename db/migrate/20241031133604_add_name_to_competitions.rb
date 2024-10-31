class AddNameToCompetitions < ActiveRecord::Migration[7.2]
  def change
    add_column :competitions, :name, :string
  end
end
