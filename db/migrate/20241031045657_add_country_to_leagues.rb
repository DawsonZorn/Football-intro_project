class AddCountryToLeagues < ActiveRecord::Migration[7.2]
  def change
    add_column :leagues, :country, :string
  end
end
