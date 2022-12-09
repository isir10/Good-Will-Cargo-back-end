class UserCargo < ApplicationRecord
    validates :cargo_ship_id, presence: true
    validates :user_id, presence: true
    validate :count_range
    belongs_to :user
    belongs_to :cargo_ship
    def count_range
        if count > 0
            errors.add(:count, "must be greater than 0")
        end 
    end
end
