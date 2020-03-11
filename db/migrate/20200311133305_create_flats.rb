class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :flat_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
