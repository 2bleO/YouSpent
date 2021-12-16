class AddUsersRefToEntities < ActiveRecord::Migration[6.1]
  def change
    add_reference :entities, :author, references: :users, foreign_key: true
  end
end
