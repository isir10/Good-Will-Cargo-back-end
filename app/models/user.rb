class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true

    has_many :user_cargos, dependent: :destroy
    has_many :cargo_ships, through: :user_cargos
    
end
