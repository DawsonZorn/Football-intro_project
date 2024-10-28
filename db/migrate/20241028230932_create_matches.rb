class CreateMatches < ActiveRecord::Migration[7.2]
  def change
    create_table :matches do |t|
      t.string :round
      t.date :date
      t.string :time
      t.references :team1, null: false, foreign_key: true
      t.references :team2, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true
      t.integer :ht_team1
      t.integer :ht_team2
      t.integer :ft_team1
      t.integer :ft_team2

      t.timestamps
    end
  end
end
