FactoryBot.define do
  factory :user do
    email { 'eamil@website.com' }
    password { 'password' }
    username { Faker::Internet.username }
  end
end
