class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.integer :user_id, null: false
      t.string :rental_type, null: false
      t.integer :accommodates, null: false
      t.integer :bathrooms, null: false
      t.integer :bedrooms, null: false
      t.integer :beds, null: false
      t.decimal :nightly_cost, null: false, precision: 8, scale: 2
      t.text :description
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :street1, null: false
      t.string :street2
      t.string :city, null: false
      t.string :province
      t.string :country, null: false
      t.string :postal_code

      t.timestamps
    end

    add_index :rentals, :user_id
  end
end
