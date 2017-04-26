class Question < ApplicationRecord
  validates :title, presence: true, length: { minimum: 20 }
  validates :description, presence: true, length: { minimum: 50 }, :if => 'markdown.blank?'
  validates :markdown, presence: true, length: { minimum: 50 }, :unless => 'markdown.blank?'
  validates :user_id, presence: true

  has_many :answers
end
