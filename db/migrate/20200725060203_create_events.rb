class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :event_day
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :prefecture, null: false, default: 0
      t.string :place
      t.integer :estimate_people
      t.integer :level, null: false, default: 0
      t.integer :organizer_user_id
      t.string :organizer_name
      t.string :organizer_tel
      t.text :comment

      t.timestamps
    end
  end
end
