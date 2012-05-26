class Bet < ActiveRecord::Base
  attr_accessible :game, :game_id, :score, :team_a_goals, :team_b_goals, :user

  # relations
  belongs_to :game
  belongs_to :user, :touch => true

  # validations
  validates :game, :user, :team_a_goals, :team_b_goals, :presence => true
  validates :game_id, :uniqueness => { :scope => :user_id }



  def result
    "#{team_a_goals}:#{team_b_goals}"
  end

end
