FactoryGirl.define do
  factory :project do
    category "personal"
    status "active"
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentences(2) }
  end
end
