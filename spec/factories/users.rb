FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name #{n}" }
    sequence(:email) { |n| "teste#{n}@teste.com" }
    password 'password'
  end
end
