class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digests
      t.string :img_url
      t.string :bio 

      t.timestamps
    end
  end
end
