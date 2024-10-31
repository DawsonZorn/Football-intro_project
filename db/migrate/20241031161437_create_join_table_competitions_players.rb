class CreateJoinTableCompetitionsPlayers < ActiveRecord::Migration[7.2]
  def change
    create_join_table :competitions, :players do |t|
       t.index [ :competition_id, :player_id ]
       t.index [ :player_id, :competition_id ]
    end
  end
end
