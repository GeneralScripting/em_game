# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    team_a_id 1
    team_b_id 1
    start_at "2012-05-26 15:35:04"
    end_at "2012-05-26 15:35:04"
    team_a_goals 1
    team_b_goals 1
    team_a_penalty_goals 1
    team_b_penalty_goals 1
    team_a_halftime_goals 1
    team_b_halftime_goals 1
    group_cd 1
    finals_cd 1
    comment "MyText"
  end
end
