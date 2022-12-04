class CargoShip < ApplicationRecord
    has_many :user_cargos
    has_many :users, through: :user_cargos
end
