bens = Restaurant.create(name: "Bens", price_range:"$", parking: "Street", wifi: "No", occasion: "Casual", takeS_reservations:"No", rating: "5", comment: "good price for quantity and quality")
nyc= Location.create(state:"New York", city:"New York City")
bens.locations << nyc
grandma= Item.create(name: "Grandma Slice", vegetarian: "Yes", calories: "500", price: "$3.5", category:"Main Meal")
pepper= Item.create(name: "Pepperoni", vegetarian: "No", calories: "750", price: "$4.5", category:"Main Meal")
bens.items << [grandma, pepper]

melt = Restaurant.create(name: "Melt", price_range:"$$", parking: "Street", wifi: "Yes", occasion: "Casual", takeS_reservations:"No", rating: "5", comment: "one of my favorite places to go to when I visit!" )
cleveland= Location.create(state:"Ohio", city:"Cleveland")
melt.locations << cleveland
pickles= Item.create(name: "Fried Pickles", vegetarian: "Yes", calories: "500", price: "$7", category:"Appetizer")
pepper= Item.create(name: "Wake and Bacon", vegetarian: "No", calories: "I don't want to know" , price: "$8", category:"Main Meal")
melt.items << [pickles, pepper]

cheesies = Restaurant.create(name: "Cheesies", price_range:"$$", parking: "Street", wifi: "Yes", occasion: "Full Meal", takeS_reservations:"No", rating: "5", comment: "chicago favorite" )
chicago1= Location.create(state:"Illinois", city:"Chicago")
cheesies.locations << chicago1
mac= Item.create(name: "The Mac" , vegetarian: "Yes", calories: "I don't want to know" , price: "$8", category:"Main Meal")
tomato= Item.create(name: "Tomato Soup", vegetarian: "Yes", calories: "300", price: "$3.5", category:"Side")
caprese= Item.create(name: "Caprese", vegetarian: "Yes", calories: "I don't want to know" , price: "$8", category:"Main Meal")
cheesies.items << [mac, tomato, caprese]


wasabi = Restaurant.create(name: "Wasabi", price_range:"$$", parking: "Street", wifi: "Yes", occasion: "Full Meal", takeS_reservations:"No", rating: "5", comment: "best ramen in the city")
chicago2= Location.create(state:"Illinois", city:"Chicago")
wasabi.locations << chicago2
orig= Item.create(name: "Original Tonkotsu", vegetarian: "No", calories: "800", price: "$14", category:"Main Meal")
edamame= Item.create(name: "Edamame", vegetarian: "Yes", calories: "300", price: "$4.5", category:"Appetizer")
wasabi.items << [orig, edamame]

portillos = Restaurant.create(name: "Portillos", price_range:"$", parking: "Parking lot" , wifi: "No", occasion: "Casual", takeS_reservations:"No", rating: "5", comment: "excellent hot dogs")
oswego= Location.create(state:"Illinois", city:"Oswego")
tempe= Location.create(state:"Arizona", city:"Arizona")
naperville= Location.create(state:"Illinois", city:"Naperville")
portillos.locations << [oswego, tempe, naperville]
hotdog= Item.create(name: "Hot Dog", vegetarian: "No", calories: "340", price: "$3", category:"Main Meal")
chocolate= Item.create(name: "Chocolate Cake Shake", vegetarian: "Yes", calories: "850", price: "$4", category:"Beverage")
fries= Item.create(name: "Cheese Fries" , vegetarian: "Yes", calories: "520", price: "$3", category:"Side")
portillos.items << [hotdog, chocolate, fries]

lizzie = User.create(name: "Eliza", username: "Eliza", password: "Eliza")
Location.all.each do |l|
  lizzie.locations << l
end
