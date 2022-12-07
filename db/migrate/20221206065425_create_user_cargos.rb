class CreateUserCargos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_cargos do |t|
      t.integer :count
      t.integer :amount
      t.integer :user_id
      t.integer :cargo_ship_id

      t.timestamps
    end
  end
end
