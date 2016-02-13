# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create! id: 1, productid: "C1", category: "Cameras", name: "Sony NEX6", price: 1199
Product.create! id: 2, productid: "C2", category: "Cameras", name: "Canon 7D", price: 2999
Product.create! id: 3, productid: "A1", category: "Audio", name: "Sony Speakers", price: 499

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

