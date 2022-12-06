class UserCargo < ApplicationRecord
    validates :cargo_ship_id, presence: true
    validates :user_id, presence: true
    belongs_to :user
    belongs_to :cargo_ship
end
