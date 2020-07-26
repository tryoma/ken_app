class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :member_name
      t.integer :user_id
      t.boolean :attendance, default: false
      t.string :note
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
