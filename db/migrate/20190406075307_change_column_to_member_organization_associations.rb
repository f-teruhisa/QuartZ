class ChangeColumnToMemberOrganizationAssociations < ActiveRecord::Migration[5.2]
  def change
    change_column :member_organization_associations, :organizer, :boolean, null: false, default: false
  end
end
