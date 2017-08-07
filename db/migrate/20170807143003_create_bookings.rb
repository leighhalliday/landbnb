class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id, null: false
      t.integer :rental_id, null: false
      t.date :start_date, null: false
      t.date :stop_date, null: false
      t.integer :guests, null: false
      t.integer :review_score
      t.text :review_comments
      t.timestamp :reviewed_at

      t.timestamps
    end

    add_index :bookings, :user_id
    add_index :bookings, :rental_id
  end
end
