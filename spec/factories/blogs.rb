FactoryGirl.define do
  factory :blog do
    title { Faker::Lorem.words(4) }
    content { Faker::Lorem.paragraph }
    author { Faker::Name.name }
  end
end