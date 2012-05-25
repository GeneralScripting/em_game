# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    country "MyString"
    won 1
    lost 1
    draw 1
    group_cd 1
    last_16 false
    last_8 false
    last_4 false
    last_2 false
    place 1
  end
end
