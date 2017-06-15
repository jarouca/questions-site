class Answer < ApplicationRecord
  validates :body,
    presence: true,
    length: { minimum: 50 },
    if: 'markdown.blank?'
  validates :markdown,
    presence: true,
    length: { minimum: 50 },
    if: 'body.blank?'
  validates :question_id,
    presence: true
  validates :user_id,
    presence: true

  belongs_to :question
end
