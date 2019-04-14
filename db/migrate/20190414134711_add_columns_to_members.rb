class AddColumnsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :uid, :string, null: true, default: nil
    add_column :members, :provider, :string, null: true, default: nil
  end
end
