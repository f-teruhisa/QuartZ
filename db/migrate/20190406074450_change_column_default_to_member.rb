class ChangeColumnDefaultToMember < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :text, :string, null: true, default: 'No Comments.'
    remove_column :members, :organizer
    add_column :member_organization_associations, :organizer, :boolean
  end
end
