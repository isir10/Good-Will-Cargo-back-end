class CargoShipSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_location, :destination, :img_url, :leaving_date, :rate_per_cargo, :capacity, :remaining
end
