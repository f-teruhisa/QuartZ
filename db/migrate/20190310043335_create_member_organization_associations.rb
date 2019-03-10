class CreateMemberOrganizationAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :member_organization_associations do |t|
      t.references :member, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
