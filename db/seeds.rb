# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# Create categories
book          = Category.find_or_create_by(name: "Book")
food          = Category.find_or_create_by(name: "Food")
medical       = Category.find_or_create_by(name: "Medical")
perfume       = Category.find_or_create_by(name: "Perfume")
entertainment = Category.find_or_create_by(name: "Entertainment")


# Create products
abook   = Product.create(category: book, name: 'A book', price: 12.49)
cd      = Product.create(category: entertainment, name: 'Music cd', price: 14.99)
chocolate_bar   = Product.create(category: food, name: 'Chocolate bar', price: 0.85)
imported_box_chocolate1   = Product.create(category: food, name: 'imported box of chocolates', price: 10.00, imported: true)
imported_bottle_perfume1 = Product.create(category: perfume, name: 'imported bottle of perfume', price: 47.50, imported: true)
imported_bottle_perfume2 = Product.create(category: perfume, name: 'imported bottle of perfume', price: 27.99, imported: true)
bottle_perfume = Product.create(category: perfume, name: 'bottle of perfume', price: 18.99)
headache_pills  = Product.create(category: medical, name: 'packet of headache pills', price: 9.75)
imported_box_chocolate2   = Product.create(category: food, name: 'box of imported chocolates', price: 11.25, imported: true)


# Create Orders
order1 = Order.create(name: "Input 1")
order1.order_products.create(product: abook, quantity: 1)
order1.order_products.create(product: cd, quantity: 1)
order1.order_products.create(product: chocolate_bar, quantity: 1)

order2 = Order.create(name: "Input 2")
order2.order_products.create(product: imported_box_chocolate1, quantity: 1)
order2.order_products.create(product: imported_bottle_perfume1, quantity: 1)

order3 = Order.create(name: "Input 3")
order3.order_products.create(product: imported_bottle_perfume2, quantity: 1)
order3.order_products.create(product: bottle_perfume, quantity: 1)
order3.order_products.create(product: headache_pills, quantity: 1)
order3.order_products.create(product: imported_box_chocolate2, quantity: 1)
