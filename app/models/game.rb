class Game < ActiveRecord::Base
  attr_accessible :comment, :end_at, :finals, :group, :start_at, :team_a_goals, :team_a_halftime_goals, :team_a, :team_a_penalty_goals, :team_b_goals, :team_b_halftime_goals, :team_b, :team_b_penalty_goals

  # relations
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"

  # validations
  validates :team_a, :team_b, :start_at, :presence => true

  # plugins
  as_enum :group,   { :a => 0, :b => 1, :c => 2, :d => 3 }
  as_enum :finals,  { :last_16 => 0, :last_8 => 1, :last_4 => 2, :last_2 => 3 }

  # scopes
  scope :unfinished,  where( :end_at => nil )


  def round
    finals.nil? ? group : finals
  end


end
