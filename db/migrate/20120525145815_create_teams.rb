class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :country
      t.integer :won, :lost, :draw, :default => 0
      t.integer :group_cd
      t.boolean :last_16, :last_8, :last_4, :last_2, :default => nil
      t.integer :place

      t.timestamps
    end
    add_index :teams, :country
    add_index :teams, :group_cd
    add_index :teams, :place
  end
end
