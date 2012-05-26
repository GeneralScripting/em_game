class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :team_a_id
      t.integer :team_b_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :team_a_goals
      t.integer :team_b_goals
      t.integer :team_a_penalty_goals
      t.integer :team_b_penalty_goals
      t.integer :team_a_halftime_goals
      t.integer :team_b_halftime_goals
      t.integer :group_cd
      t.integer :finals_cd
      t.text :comment

      t.timestamps
    end
    add_index :games, :team_a_id
    add_index :games, :team_b_id
    add_index :games, :start_at
    add_index :games, :end_at
    add_index :games, :team_a_goals
    add_index :games, :team_b_goals
    add_index :games, :group_cd
    add_index :games, :finals_cd
  end
end
