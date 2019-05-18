class RemoveNumbersOfGroupsFromOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :numbers_of_groups, :integer
  end
end
