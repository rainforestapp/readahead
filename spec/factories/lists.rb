# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    user
    name 'default'

    trait :with_links do
      after(:create) do |list|
        create(:link_list, list: list)
      end
    end
  end
end
