# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) do |i|
      "email+#{i}@example.org"
    end
  end
end
