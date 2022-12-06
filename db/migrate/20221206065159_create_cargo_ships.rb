class CreateCargoShips < ActiveRecord::Migration[7.0]
  def change
    create_table :cargo_ships do |t|

      t.timestamps
    end
  end
end
