class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.text :image_url, null: true, default: nil
      t.text :url, null: true, default: nil
      t.text :comment, null: true, default: nil
      t.references :lunch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
