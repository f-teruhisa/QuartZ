class AddColumnGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :rank, :integer, null: false
  end
end
