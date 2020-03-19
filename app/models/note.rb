class Note < ApplicationRecord
  belongs_to :flat_user
  validates :content, presence: true
  has_many :note_answers
end
