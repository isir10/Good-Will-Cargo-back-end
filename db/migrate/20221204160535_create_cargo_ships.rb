class CreateCargoShips < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_ships do |t|
      t.string :name
      t.string :current_location
      t.string :destination
      t.string :img_url
      t.date :leaving_date
      t.integer :rate_per_cargo
      t.integer :capacity
      t.integer :remaining

      t.timestamps
    end
  end
end
