class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :car
      t.datetime :pickup_datetime
      t.datetime :dropoff_datetime
      t.string :pickup_location
      t.string :dropoff_location
      t.float :distance
      t.decimal :price, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
