class ChangeColumnToMember < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :name, :string, null: true, default: nil
  end
end
