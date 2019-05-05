class ChangeColumnToOrganization < ActiveRecord::Migration[5.2]
  def change
    rename_column :organizations, :numbers_of_group_members, :numbers_of_groups
  end
end
