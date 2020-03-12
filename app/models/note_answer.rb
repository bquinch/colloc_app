class NoteAnswer < ApplicationRecord
  belongs_to :flat_user
  belongs_to :note
end
