FactoryGirl.define do
  factory :idea do
    name { Faker::App.name }
    description { Faker::Lorem.sentence }
  end

end
