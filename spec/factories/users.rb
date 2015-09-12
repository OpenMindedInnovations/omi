FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'secretpass'
    password_confirmation { password }
    confirmed_at Date.today
  end
end
