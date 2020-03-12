class FlatUser < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :events
  has_many :participations
end
