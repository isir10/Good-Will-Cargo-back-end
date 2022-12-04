class CargoShipSerializer < ActiveModel::Serializer
  attributes :id, :ship_name, :name, :route, :img_url, :leaving_date, :rate_per_cargo, :capacity
end
