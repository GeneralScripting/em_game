class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :game_id, :user_id
      t.integer :team_a_goals, :team_b_goals
      t.integer :score

      t.timestamps
    end
    add_index :bets, :game_id
    add_index :bets, :user_id
    add_index :bets, :score
  end
end
