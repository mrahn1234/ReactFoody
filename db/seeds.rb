categories = ["Chien xao","Lau","Nuong","Sushi","Hai san"]
i = 0;
5.times do
  name = categories[i];
  description = Faker::Food.description
  i = i + 1;
  Category.create!(name: name, description: description);
end
10.times do
    name = Faker::Name.name
    description = "Coca cola la orion"
    quantity = 100
    price = 10000
    image = "no_image.jpg"
    category_id = Category.all[rand(0..4)].id
    classify = rand(0..1)
    Product.create!(name: name, description: description, quantity: quantity, price: price, 
    image: image, category_id: category_id, classify:classify)
end

  