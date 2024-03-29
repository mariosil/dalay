# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def fake_price(range: 20..100)
  Faker::Number.within(range: range) + [0.0, 0.25, 0.5, 0.99].sample
end

puts 'Generating Restaurant payloads'
restaurant_payloads = 4.times.map do
  {
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.phone_number
  }
end

puts 'Creating Restaurants'
restaurants = Restaurant.create(restaurant_payloads)

puts 'Attaching Restaurant logos'
restaurants.each_with_index do |restaurant, index|
  logo = File.open(Rails.root.join('db', 'seeds_logos', "logo_#{index}.jpg"))
  restaurant.logo.attach(io: logo, filename: File.basename(logo))
end

puts 'Creating Dish Groups'
dish_groups = DishGroup.create [
  { name: 'Entrees' },
  { name: 'Soups & Salads' },
  { name: 'Deserts' },
  { name: 'Drinks' }
]

puts 'Generating entree Dish payloads'
entree_group = dish_groups.shift
entree_dish_payloads = [
  {
    restaurant: restaurants[0],
    dish_group: entree_group,
    name: "Rockmelon bruschetta with goat's cheese and prosciutto",
    description: "Refresh the classic ham-and-melon combo with a smear of citrus-flecked goat's cheese.",
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[0],
    dish_group: entree_group,
    name: 'Antipasto platter',
    description: 'Recreate fine antipasto with all the favourites, then share them with a winning double of dips.',
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[1],
    dish_group: entree_group,
    name: 'Candied tomatoes on basil leaves',
    description: 'This sophisticated canape plays with taste and texture, as you bite through crunchy toffee into ripe, juicy tomato.',
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[1],
    dish_group: entree_group,
    name: 'Crispy bocconcini with tomato chilli sauce',
    description: 'Creamy bocconcini is golden fried for an enticing crunch, and served with a spicy tomato dip.',
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[2],
    dish_group: entree_group,
    name: 'Chicken and spinach dumplings',
    description: "These parcels deliver - and they're fun.",
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[2],
    dish_group: entree_group,
    name: "Goat's cheese pissaladiere tarts",
    description: 'Bring warmth and merriment to your next dinner party with these cheerful bites.',
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[3],
    dish_group: entree_group,
    name: 'Chilli smoked salmon cob dip',
    description: 'Take this old party favourite to another flavour dimension!',
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[3],
    dish_group: entree_group,
    name: 'Prawn, pork & crispy noodle balls',
    description: 'These crunchy balls are quick to cook and make fantastic finger food.',
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[0],
    dish_group: entree_group,
    name: 'Grilled seafood platter',
    description: 'Luxe up your dinner with this seafood platter rather than the usual antipasto.',
    price: fake_price(range: 5..15)
  },
  {
    restaurant: restaurants[1],
    dish_group: entree_group,
    name: 'Turkey sliders with slaw',
    description: 'A batch of these mini burgers make great party fare.',
    price: fake_price(range: 5..15)
  }
]

puts 'Creating Entree Dishes'
dishes = Dish.create(entree_dish_payloads)

puts 'Attaching Entree Dishes photos'
dishes.each_with_index do |dish, index|
  photo = File.open(Rails.root.join('db', 'seeds_imgs', "entree_#{index}.jpeg"))
  dish.photo.attach(io: photo, filename: File.basename(photo))
end

puts 'Generating soups & salads Dish payloads'
ss_group = dish_groups.shift
ss_dish_payloads = [
  {
    restaurant: restaurants[0],
    dish_group: ss_group,
    name: 'Mandarin Broccoli Salad',
    description: 'Sweet, crunchy and colorful, this salad has a fresh mix of textures and flavors.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[0],
    dish_group: ss_group,
    name: 'Pea and ham soup',
    description: 'An absolute classic, made with just five ingredients. Serve with crusty bread for a nourishing, colourful lunch.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[1],
    dish_group: ss_group,
    name: 'Shaved Fennel Salad',
    description: ' It has an incredible crunch thanks to the cucumbers, radishes and apples. And the finish of fennel fronds adds just the faintest hint of licorice flavor.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[1],
    dish_group: ss_group,
    name: 'Green lentil harissa soup',
    description: 'Nourishing and delicious, this soup comes stuffed with celery, parsnips, leek, kale and chickpeas.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[2],
    dish_group: ss_group,
    name: 'Apple Sausage Salad with Cinnamon Vinaigrette',
    description: 'Making croutons with cinnamon-raisin bread is sweet genius. Toss together the rest of the salad while they toast.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[2],
    dish_group: ss_group,
    name: 'Caldo verde (kale, chorizo and potato soup)',
    description: 'Make kale the star of this nutritious, low calorie potato and chorizo soup.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[3],
    dish_group: ss_group,
    name: 'Cashew-Pear Tossed Salad',
    description: 'The unexpected sweet-salty mix and lovely dressing make it a hit with everyone.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[3],
    dish_group: ss_group,
    name: 'Creamy pumpkin soup with blue cheese and sage toasties',
    description: 'Served in big mugs with fat fingers of melty cheese toasties for dipping.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[0],
    dish_group: ss_group,
    name: 'Grilled Apple Tossed Salad',
    description: 'The grilled apples in this salad combine so well with the blue cheese, walnuts and balsamic dressing.',
    price: fake_price(range: 10..25)
  },
  {
    restaurant: restaurants[1],
    dish_group: ss_group,
    name: 'French onion soup',
    description: 'This deep beefy onion soup is topped with bubbling cheese melts, perfect for a comforting winter warmer.',
    price: fake_price(range: 10..25)
  }
]

puts 'Creating soups & salads Dishes'
dishes = Dish.create(ss_dish_payloads)

puts 'Attaching soups & salads Dishes photos'
dishes.each_with_index do |dish, index|
  photo = File.open(Rails.root.join('db', 'seeds_imgs', "ss_#{index}.jpg"))
  dish.photo.attach(io: photo, filename: File.basename(photo))
end

puts 'Generating deserts Dish payloads'
deserts_group = dish_groups.shift
deserts_dish_payloads = [
  {
    restaurant: restaurants[0],
    dish_group: deserts_group,
    name: 'No Bake Kool-Aid Pie',
    description: 'Creamy, cool, and delicious with only 3 ingredients!',
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[0],
    dish_group: deserts_group,
    name: 'Peanut Butter Stuffed Brownies',
    description: 'Rich, fudge brownies that are stuffed with peanut butter cups, topped with melted chocolate and more peanut butter cups!',
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[1],
    dish_group: deserts_group,
    name: 'Monster Cookie No Bake Bars',
    description: 'All the flavors of classic monster cookies.',
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[1],
    dish_group: deserts_group,
    name: 'Strawberry Cheesecake Lasagna',
    description: 'Layers of fresh strawberries, sweet cream, and graham crackers are stacked high in this no-bake sweet treat.',
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[2],
    dish_group: deserts_group,
    name: 'No Bake Mint Chocolate Chip Pie',
    description: 'A creamy mint pie with chocolate chips, topped with Andes mints, all in an Oreo crust!',
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[2],
    dish_group: deserts_group,
    name: 'Easy No Bake Avalanche Cookies',
    description: "Cookie version of Rocky Mountain Chocolate Factory's Avalanche Bark!",
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[3],
    dish_group: deserts_group,
    name: 'Gooey Brownie Pie',
    description: 'A gooey chocolate brownie with a crackly top baked into a pie and topped with hot fudge.',
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[3],
    dish_group: deserts_group,
    name: 'Reeses Fudge',
    description: 'A layer of creamy peanut butter fudge topped with melted chocolate and peanut butter.',
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[0],
    dish_group: deserts_group,
    name: 'Apple Pie',
    description: 'Let the aroma of a freshly baked apple pie fill your home.',
    price: fake_price(range: 10..15)
  },
  {
    restaurant: restaurants[1],
    dish_group: deserts_group,
    name: 'Almond Malai Kulfi',
    description: 'Condensed milk, saffron, dry fruits are teamed together, chilled and served in a matki.',
    price: fake_price(range: 10..15)
  }
]

puts 'Creating deserts Dishes'
dishes = Dish.create(deserts_dish_payloads)

puts 'Attaching deserts  Dishes photos'
dishes.each_with_index do |dish, index|
  photo = File.open(Rails.root.join('db', 'seeds_imgs', "desert_#{index}.jpg"))
  dish.photo.attach(io: photo, filename: File.basename(photo))
end

puts 'Generating drinks Dish payloads'
drinks_group = dish_groups.shift
drinks_dish_payloads = [
  {
    restaurant: restaurants[0],
    dish_group: drinks_group,
    name: 'Mojito',
    description: 'Classic cocktail for a party using fresh mint, white rum, sugar, zesty lime and cooling soda water.',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[0],
    dish_group: drinks_group,
    name: 'Rhubarb gin',
    description: 'Use seasonal rhubarb to make a G&T with a difference.',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[1],
    dish_group: drinks_group,
    name: 'Sangria',
    description: 'With red wine, Spanish brandy, sparkling water, cinnamon and chopped fruit.',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[1],
    dish_group: drinks_group,
    name: 'Espresso martini',
    description: 'Freshly brewed espresso, a dash of coffee liqueur and a simple sugar syrup.',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[2],
    dish_group: drinks_group,
    name: 'Mudslide',
    description: 'Creamy adults-only drink with the chocolate lover in your life.',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[2],
    dish_group: drinks_group,
    name: 'Sex on the beach cocktail',
    description: 'Combine vodka with peach schnapps and cranberry juice to make a classic sex on the beach cocktail',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[3],
    dish_group: drinks_group,
    name: 'Pink gin iced tea',
    description: 'Blend pink gin with iced tea and you have this unique cocktail, made with spiced rum, elderflower and pink grapefruit.',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[3],
    dish_group: drinks_group,
    name: 'Hurricane cocktail',
    description: 'Our tropical, rum-based hurricane cocktail.',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[0],
    dish_group: drinks_group,
    name: 'Pink negroni',
    description: 'Go pink with this fabulous cocktail flavoured with pink gin, rose vermouth and Aperol.',
    price: fake_price(range: 5..10)
  },
  {
    restaurant: restaurants[1],
    dish_group: drinks_group,
    name: 'Vodka martini',
    description: 'Vodka martini with our simple recipe for an elegant party tipple.',
    price: fake_price(range: 5..10)
  }
]

puts 'Creating drinks Dishes'
dishes = Dish.create(drinks_dish_payloads)

puts 'Attaching drink Dishes photos'
dishes.each_with_index do |dish, index|
  photo = File.open(Rails.root.join('db', 'seeds_imgs', "drink_#{index}.jpg"))
  dish.photo.attach(io: photo, filename: File.basename(photo))
end
