class Bet < ActiveRecord::Base
  attr_accessible :game, :game_id, :score, :team_a_goals, :team_b_goals, :user

  # relations
  belongs_to :game
  belongs_to :user, :touch => true

  # validations
  validates :game, :user, :team_a_goals, :team_b_goals, :presence => true
  validates :game_id, :uniqueness => { :scope => :user_id }
  validate :game_not_started_yet

  # scope
  scope :scored,  where( 'bets.score IS NOT NULL AND bets.score != 0' )

  # hooks
  after_save :update_user_score



  def result
    "#{team_a_goals}:#{team_b_goals}"
  end


  def draw?
    team_a_goals == team_b_goals
  end

  def team_a_won?
    team_a_goals > team_b_goals
  end

  def team_b_won?
    team_b_goals > team_a_goals
  end


  def score!
    the_score = 0
    if game.draw?
      if draw?
        the_score = 3
        the_score += 5  if game.team_a_goals == team_a_goals
      end
    elsif game.team_a_won?
      if team_a_won?
        the_score = 3
        if game.team_a_goals == team_a_goals && game.team_b_goals == team_b_goals
          the_score += 5
        elsif game.team_a_goals == team_a_goals || game.team_b_goals == team_b_goals
          the_score += 2
        end
      end
    else # team_b_won must be true
      if team_b_won?
        the_score = 3
        if game.team_a_goals == team_a_goals && game.team_b_goals == team_b_goals
          the_score += 5
        elsif game.team_a_goals == team_a_goals || game.team_b_goals == team_b_goals
          the_score += 2
        end
      end
    end
    self.score = the_score
    save!
  end




 protected

  def game_not_started_yet
    errors.add(:base, :invalid) unless game && game.pending?
  end

  def update_user_score
    user.update_score! if score && score > 0
  end

end
