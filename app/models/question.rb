class Question < ApplicationRecord
  validates :title, presence: true, length: { minimum: 20 }
  validates :description, presence: true, length: { minimum: 50 }
  validates :user_id, presence: true

  has_many :answers
end
