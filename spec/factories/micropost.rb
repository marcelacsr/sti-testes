FactoryBot.define do
  factory :micropost do
    user{ build :user}
    content 'Conteúdo do micropost'
  end
end