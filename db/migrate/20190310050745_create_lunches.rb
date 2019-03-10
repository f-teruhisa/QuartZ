class CreateLunches < ActiveRecord::Migration[5.2]
  def change
    create_table :lunches do |t|
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
