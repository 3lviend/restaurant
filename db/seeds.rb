# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "admin@mail.com", password:"admin@mail.com", :role_id => 1)
User.create(:email => "waitress@mail.com", :password => "waitress@mail.com", :role_id => 2)
User.create(:email => "chef@mail.com", :password => "chef@mail.com", :role_id => 3)
User.create(:email => "owner@mail.com", :password => "owner@mail.com", :role_id => 4)
User.create(:email => "customer@mail.com", :password => "customer@mail.com", :role_id => 5)

Role.create(:name => "admin")
Role.create(:name => "waitress")
Role.create(:name => "chef")
Role.create(:name => "owner/manager")
Role.create(:name => "customer")

Ingredient.create(:name => "Merica", :quantity => 2, :detail_of_quantity => "botol")
Ingredient.create(:name => "Garam", :quantity => 3, :detail_of_quantity => "Bungkus")
Ingredient.create(:name => "Bawang merah", :quantity => 3, :detail_of_quantity => "Ons")
Ingredient.create(:name => "Bawang Bombai", :quantity => 4, :detail_of_quantity => "Ons")
Ingredient.create(:name => "Gula Pasir", :quantity => 4, :detail_of_quantity => "Kg")

Item.create(:name => "Nasi Goreng spesial", :detail_of_item => "Nasi goreng + telor + ayam + mie", :price => 20000, :portion =>1, :type_of_item =>"Makanan")
Item.create(:name => "Nasi Goreng Lada", :detail_of_item => "Nasi goreng super lada", :price => 20000, :portion =>1, :type_of_item =>"Makanan")
Item.create(:name => "Nasi Goreng singapura", :detail_of_item => "Nasi khas singapur", :price => 20000, :portion =>1, :type_of_item =>"Makanan")
Item.create(:name => "Jus Strawberry", :detail_of_item => "Jus Strawberry dari buah strawberry manis", :price => 20000,:portion =>1, :type_of_item =>"Minuman")
Item.create(:name => "Jus Apel", :detail_of_item => "Jus Apel dari buah segar", :price => 15000, :portion =>1, :type_of_item =>"Minuman")
Item.create(:name => "Jus Mangga", :detail_of_item => "Jus Mangga dari buah segar", :price => 15000, :portion =>1, :type_of_item =>"Minuman")
Item.create(:name => "Jus Sirsak", :detail_of_item => "Jus Sirsak dari buah segar", :price => 15000, :portion =>1, :type_of_item =>"Minuman")
Item.create(:name => "Jus Bengkoang", :detail_of_item => "Jus Bengkoang dari buah segar", :price => 15000, :portion =>1, :type_of_item =>"Minuman")

Table.create(:name => "Table 1")
Table.create(:name => "Table 2")
Table.create(:name => "Table 3")
Table.create(:name => "Table 4")
Table.create(:name => "Table 5")
Table.create(:name => "Table 6")
Table.create(:name => "Table 7")
Table.create(:name => "Table 8")

LineItem.create(:item_id =>1, :quantity => 2, :order_id => 1, :complete => true)
LineItem.create(:item_id =>2, :quantity => 3, :order_id => 2, :complete => true)
LineItem.create(:item_id =>2, :quantity => 3, :order_id => 2, :complete => true)
LineItem.create(:item_id =>3, :quantity => 2, :order_id => 3, :complete => true)
LineItem.create(:item_id =>3, :quantity => 1, :order_id => 3)
LineItem.create(:item_id =>4, :quantity => 2, :order_id => 4)
LineItem.create(:item_id =>5, :quantity => 2, :order_id => 5)
LineItem.create(:item_id =>5, :quantity => 2, :order_id => 5)
LineItem.create(:item_id =>6, :quantity => 2, :order_id => 6)
LineItem.create(:item_id =>7, :quantity => 3, :order_id => 7)
LineItem.create(:item_id =>8, :quantity => 2, :order_id => 8)
LineItem.create(:item_id =>8, :quantity => 2, :order_id => 8)
LineItem.create(:item_id =>3, :quantity => 1, :order_id => 9)
LineItem.create(:item_id =>3, :quantity => 1, :order_id => 10)
LineItem.create(:item_id =>5, :quantity => 1, :order_id => 17)
LineItem.create(:item_id =>5, :quantity => 1, :order_id => 18)
LineItem.create(:item_id =>5, :quantity => 1, :order_id => 28)
LineItem.create(:item_id =>5, :quantity => 1, :order_id => 29)

Order.create(:table_id =>1, :status => "paid")
Order.create(:table_id =>2, :status => "paid")
Order.create(:table_id =>3, :status => "paid")
Order.create(:table_id =>4, :status => "paid")
Order.create(:table_id =>5, :status => "unpaid")
Order.create(:table_id =>6, :status => "unpaid")
Order.create(:table_id =>7, :status => "unpaid")
Order.create(:table_id =>8, :status => "unpaid")
Order.create(:status => "unpaid")
Order.create(:status => "unpaid")
Order.create(:status => "paid")