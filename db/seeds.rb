#restaurants
bens = Restaurant.create(name: "Bens", price_range:"$", parking: "Street", wifi: "No", occasion: "Casual", takeS_reservations:"No", city:"NYC" , state: "New York", rating: "5", comment: "good price for quantity and quality")
nyc= Location.create(state:"New York", city:"New York City")
bens.locations << nyc

melt = Restaurant.create(name: "Melt", price_range:"$$", parking: "Street", wifi: "Yes", occasion: "Casual", takeS_reservations:"No", city:"Cleveland", state: "Ohio", rating: "5", comment: "one of my favorite places to go to when I visit!" )
cleveland= Location.create(state:"Ohio", city:"Cleveland")
melt.locations << cleveland

cheesies = Restaurant.create(name: "Cheesies", price_range:"$$", parking: "Street", wifi: "Yes", occasion: "Full Meal", takeS_reservations:"No", city:"Chicago", state: "Illinois", rating: "5", comment: "chicago favorite" )
chicago1= Location.create(state:"Illinois", city:"Chicago")
cheesies.locations << chicago1

wasabi = Restaurant.create(name: "Wasabi", price_range:"$$", parking: "Street", wifi: "Yes", occasion: "Full Meal", takeS_reservations:"No", city:"Chicago", state: "Illinois", rating: "5", comment: "best ramen in the city")
chicago2= Location.create(state:"Illinois", city:"Chicago")
wasabi.locations << chicago2

mcds = Restaurant.create(name: "Mcds" , price_range:"$", parking: "Parking lot", wifi: "Yes", occasion: "Fast Food", takeS_reservations:"No", city:"Naperville", state: "Illinois", rating: "5", comment: "breakfast is the best" )
naperville= Location.create(state:"Illinois", city:"Naperville")
nyc2= Location.create(state:"New York", city:"New York City")
cleveland3= Location.create(state:"Ohio", city:"Cleveland")
chicago3= Location.create(state:"Illinois", city:"Chicago")
mcds.locations << [chicago3, naperville, nyc2, cleveland3]
