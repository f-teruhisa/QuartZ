class AddNumbersOfGroupMembersToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :numbers_of_group_members, :integer, null: false, default: 0, comment: "Number of members belonging to one group."
  end
end
