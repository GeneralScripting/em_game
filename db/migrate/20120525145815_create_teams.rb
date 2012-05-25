class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :country
      t.integer :won
      t.integer :lost
      t.integer :draw
      t.integer :group_cd
      t.boolean :last_16
      t.boolean :last_8
      t.boolean :last_4
      t.boolean :last_2
      t.integer :place

      t.timestamps
    end
  end
end
