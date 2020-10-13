class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :full_name
      t.int :games_played
      t.int :minutes
      t.int :points
      t.int :rebounds
      t.int :assists
      t.int :steals
      t.int :blocks
      t.int :turnovers
      t.int :age
      t.char :birth_place
      t.char :position
      t.references :college, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
