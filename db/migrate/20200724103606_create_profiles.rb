class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :image_name
      t.date :birth_day
      t.integer :grade
      t.integer :prefecture
      t.string :dojo
      t.string :junior_high
      t.string :high
      t.string :university
      t.string :affilation
      t.string :history
      t.string :signature
      t.integer :frequency
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
