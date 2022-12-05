class UserCargoSerializer < ActiveModel::Serializer
  attributes :count, :amount, :user_id, :cargo_ship
end
