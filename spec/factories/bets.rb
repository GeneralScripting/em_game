# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bet do
    game_id 1
    user_id 1
    team_a_goals 1
    team_b_goals 1
    score 1
  end
end
