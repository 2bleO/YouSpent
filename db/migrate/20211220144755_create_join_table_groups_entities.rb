class CreateJoinTableGroupsEntities < ActiveRecord::Migration[6.1]
  def change
    create_join_table :groups, :entities do |t|
      t.index [:group_id, :entity_id]
    end
  end
end
