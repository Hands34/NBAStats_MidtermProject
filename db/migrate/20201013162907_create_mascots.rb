class CreateMascots < ActiveRecord::Migration[6.0]
  def change
    create_table :mascots do |t|
      t.string :name
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
