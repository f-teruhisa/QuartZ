class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.text :name, :null => false
      t.text :url, :null => false
      t.text :image_url, :null => true
      t.text :text, :null => true

      t.timestamps
    end
  end
end
