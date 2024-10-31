class AddCodeToLeagues < ActiveRecord::Migration[7.2]
  def change
    add_column :leagues, :code, :string
  end
end
