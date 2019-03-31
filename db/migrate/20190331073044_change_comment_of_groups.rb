class ChangeCommentOfGroups < ActiveRecord::Migration[5.2]
  def change
    change_column :groups, :comment, :string, null: true, default: 'No Comments.'
  end
end
