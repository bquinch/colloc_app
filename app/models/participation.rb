class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :flat_user
end
