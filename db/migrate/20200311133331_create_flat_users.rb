class CreateFlatUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :flat_users do |t|
      t.references :flat, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :owner

      t.timestamps
    end
  end
end
