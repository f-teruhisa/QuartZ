class CreateMemberGroupAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :member_group_associations do |t|
      t.references :member, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
