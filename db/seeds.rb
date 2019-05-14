#locations
location1 = Location.create(city: "Cleveland",state: "Ohio", user_id: 1)
location2 = Location.create(city: "Chicago", state: "Illinois", user_id: 1)
location3 = Location.create(city: "NYC", state: "New York", user_id: 1)

#restaurants
restaurant1 = Restaurant.create(name: "Ben's Pizzeria", occasion: "Casual", price_range: "$", reservations?:0, parking: "Street", wifi: 0)
restaurant2 = Restaurant.create(name: "Cheesies", occasion: "Lunch and Dinner" , price_range: "$$", reservations?:0, parking: "Street", wifi: 1)
restaurant3 = Restaurant.create(name: "Melt", occasion: "Lunch and Dinner" , price_range: "$$" , reservations?:0, parking: "Parking Lot", wifi: 0)
restaurant4 = Restaurant.create(name: "RPM Steak" , occasion: "Dinner", price_range: "$$$$", reservations?:1, parking: "None" , wifi: 1)
restaurant5 = Restaurant.create(name: "Wasabi", occasion: "Dinner", price_range: "$$$", reservations?:0, parking: "Street", wifi: 1)

#items
item1 = Item.create(name: "The Mac", category: "Main Meal" , vegetarian?: 1, calories: "1200", price: "$7.50")
item2 = Item.create(name: "Hand Cut Filet" , category: "Main Meal" , vegetarian?: 0, calories: "700", price: "$52.00")
item3 = Item.create(name: "Tater Tots" , category: "Side" , vegetarian?: 1, calories: "180", price: "$2.50")
item4 = Item.create(name: "Grandma Slice", category: "Main Meal" , vegetarian?: 1, calories: "350", price: "$4.75")
item5 = Item.create(name: "Classic Ramen", category: "Main Meal" , vegetarian?: 0, calories: "800", price: "$9.50")
item6 = Item.create(name: "Edemame", category: "Appetizer", vegetarian?: 1, calories: "100", price: "$3.00")
item7 = Item.create(name: "Sweet Potato Fries" , category: "Side" , vegetarian?: 1, calories: "250", price: "$3.50")
item8 = Item.create(name: "Mac and Cheese Bites", category: "Appetizer", vegetarian?: 1, calories: "600", price: "$5.00")
item9 = Item.create(name: "Wake and Bacon" , category: "Main Meal" , vegetarian?: 0, calories: "1400", price: "$12.00")
item10 = Item.create(name: "Tomato Soup", category: "Side" , vegetarian?: 1, calories: "400", price: "$3.50")

#assocations
restaurant1.location_id = 3
restaurant2.location_id = 2
restaurant3.location_id = 1
restaurant4.location_id = 2
restaurant5.location_id = 2

restaurant1.items << [item4]
restaurant2.items << [item1, item3, item10]
restaurant3.items << [item7, item8, item9]
restaurant4.items << [item2]
restaurant5.items << [item5, item6]
