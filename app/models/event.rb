class Event < ApplicationRecord
  belongs_to :flat_user
  has_many :participations
  validates :description, :address, :title, :date, :time, presence: true
end
