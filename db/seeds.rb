Product.destroy_all

20.times do
  Product.create(name: Faker::Commerce.product_name, description: Faker::Lorem.paragraph(2), price: Faker::Commerce.price, imagen: Faker::Avatar.image('SuperProducto', '200x160', 'jpg'))
end