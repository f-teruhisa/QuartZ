class AddColumnToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :numbers_of_groups, :integer, null: false, default: 0
  end
end
