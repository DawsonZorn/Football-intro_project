class CreateJoinTableTeamsCompetitions < ActiveRecord::Migration[7.2]
  def change
    create_join_table :teams, :competitions do |t|
      # t.index [:team_id, :competition_id]
      # t.index [:competition_id, :team_id]
    end
  end
end
