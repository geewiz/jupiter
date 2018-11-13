# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_resource_attribute(resource:, name:, value:)
  ResourceAttribute.create(
    resource: resource,
    resource_type_attribute:
      ResourceTypeAttribute.find_by(name: name),
    value: value,
  )
end

digital_ocean = Provider.create(
  name: "DigitalOcean",
)

droplet = digital_ocean.resource_types.create(
  name: "Droplet",
)

%w[ data_centre_location memory_size ].each do |attribute_name|
  droplet.resource_type_attributes.create(
    name: attribute_name,
  )
end

droplet_lon = Resource.create(
  name: "Droplet London",
  resource_type: droplet,
)

create_resource_attribute(
  resource: droplet_lon,
  name: "data_centre_location",
  value: "lon"
)

create_resource_attribute(
  resource: droplet_lon,
  name: "memory_size",
  value: "4"
)
