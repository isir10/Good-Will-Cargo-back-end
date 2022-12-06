class CreateCargoShips < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_ships do |t|
      t.string :ship_name
      t.string :img-url
      t.string :route 
      t.date :leaving_date
      


      t.timestamps
    end
  end
end
