class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.string :city
      t.datetime :date

      t.timestamps
    end
  end
end
