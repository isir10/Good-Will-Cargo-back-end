class CreateUserCargos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_cargos do |t|

      t.timestamps
    end
  end
end
