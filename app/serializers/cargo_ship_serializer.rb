class CargoShipSerializer < ActiveModel::Serializer
  attributes :id, :name, :route, :img_url, :leaving_date, :rate_per_cargo, :capacity
end
