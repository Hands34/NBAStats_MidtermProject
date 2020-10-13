class CreatePlayerPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :player_positions do |t|
      t.references :player, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
