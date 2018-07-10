FactoryBot.define do
  factory :notification do
    follower { create :user }
    followed { create :user }
  end
end