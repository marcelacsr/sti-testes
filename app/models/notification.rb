class Notification < ApplicationRecord
  belongs_to :followed, class_name: 'User'
  # t.integer "followed_id"
  belongs_to :follower, class_name: 'User'
  # t.integer "follower_id"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
# não é muito bom o usuário saber criar uma notificação, isso
# parece mais que é responsabilidade da própria Notification
end
