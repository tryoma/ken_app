class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :event_day
      t.datetime :start_time
      t.datetime :finish_time
      t.string :place
      t.integer :estimate_people
      t.string :level
      t.string :organizer_name
      t.string :organizer_tel
      t.text :comment

      t.timestamps
    end
  end
end
