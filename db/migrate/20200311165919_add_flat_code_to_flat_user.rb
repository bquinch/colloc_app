class AddFlatCodeToFlatUser < ActiveRecord::Migration[5.2]
  def change
    add_column :flat_users, :flat_code, :string
  end
end
