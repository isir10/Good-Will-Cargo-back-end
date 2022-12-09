class UserCargoSerializer < ActiveModel::Serializer
  attributes :id, :count, :amount, :user_id, :cargo_ship
  belongs_to :cargo_ship
end
