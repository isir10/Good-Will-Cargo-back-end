class CreateCargoShips < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_ships do |t|
      t.string :name
      t.string :img_url
      t.string :destination
      t.date :leaving_date
      t.integer :rate_per_cargo_ships
      t.integer :capacity
  
      t.timestamps
    end
  end
end