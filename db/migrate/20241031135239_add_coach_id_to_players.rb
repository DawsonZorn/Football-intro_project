class AddCoachIdToPlayers < ActiveRecord::Migration[7.2]
  def change
    add_reference :players, :coach, null: false, foreign_key: true
  end
end
