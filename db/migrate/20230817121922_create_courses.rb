class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.float :price
      t.string :teacher
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
