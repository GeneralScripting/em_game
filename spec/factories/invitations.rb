# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    user_id 1
    request_id 1
    guest_id 1
    accepted_at "2012-05-30 10:23:12"
  end
end
