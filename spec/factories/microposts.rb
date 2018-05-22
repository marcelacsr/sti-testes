FactoryBot.define do
  factory :micropost do
    user { create :user }
    content 'Conteúdo do micropost'
  end
end