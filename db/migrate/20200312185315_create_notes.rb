class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :content
      t.references :flat_user, foreign_key: true

      t.timestamps
    end
  end
end
