class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :address
      t.string :title
      t.date :date
      t.time :time
      t.references :flat_user, foreign_key: true

      t.timestamps
    end
  end
end
