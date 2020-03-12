class CreateNoteAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :note_answers do |t|
      t.string :content
      t.references :flat_user, foreign_key: true
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
