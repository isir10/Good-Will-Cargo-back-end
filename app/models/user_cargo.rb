class UserCargo < ApplicationRecord
    validates :cargo_ship_id
    belongs_to :user
    belongs_to :cargo_ships
end
