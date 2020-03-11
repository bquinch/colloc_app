class Flat < ApplicationRecord
  belongs_to :user
  validates :title, :description, :address, presence: true
  has_many :flat_users, dependent: :destroy
end
