class CreatePositions < ActiveRecord::Migration[7.2]
  def change
    create_table :positions do |t|
      t.timestamps
    end
  end
end
