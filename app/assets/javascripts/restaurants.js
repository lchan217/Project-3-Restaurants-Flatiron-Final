// ============================== index ==============================
  $(function showIndex() {
    $(".show").on("click", function(){
      var id = $(this).data("id");

      $(".itemNames").empty()

      $.getJSON("/restaurants/" + id + "/items.json", function(data){
        let collection = data
        $.each(collection, function(index){
          let id = this.restaurant.id
            $(".itemNames-"+id).append(
                $('<div>')
                    .text(index+1 + ". " + this.name)
            );
        });
      });
    });
  });

  $(function hideIndex() {
    $(".hide").on("click", function(){
      var id = $(this).data("id");
      $(".itemNames-"+id).empty()
    });
  });
// ============================== show ==============================
$(function showDetail() {
    $(".js-item-detail").on("click", function(event){
      var restaurantId = parseInt($(".js-item-detail").attr("rest-id"));
      var id = $(this).data("id");
      event.preventDefault()

      $.getJSON("/restaurants/" + restaurantId + "/items/" + id + ".json", function(data){
        $(`.itemVeg-${id}`).text(`Vegetarian: ${data["vegetarian"]}`);
        $(`.itemCalories-${id}`).text(`Calories: ${data["calories"]}`);
        $(`.itemPrice-${id}`).text(`Price: ${data["price"]}`);
        $(`.itemCategory-${id}`).text(`Category: ${data["category"]}`);
      });
    });
  });
// ============================== create new restaurant ==============================
$(function createNewRestaurant() {
   $('form#new_restaurant').submit(function(event) {
     event.preventDefault();

     validatesNewRestaurant()
     var values = $(this).serialize();
     var posting = $.post('/restaurants', values);
     posting.done(function(data){
             const newRestaurant = new Restaurant({state: data.locations[0].state, city: data.locations[0].city, name: data.name, price_range: data.price_range, parking: data.parking, wifi: data.wifi, occasion: data.occasion, takeS_reservations: data.takeS_reservations, rating: data.rating, comment: data.comment})
              $("#restResult").append($(newRestaurant.newFormat()));

    });
  });
});

function validatesNewRestaurant() {

  let name = $('#restaurant_name')[0].value
  let rating = $('#restaurant_rating')[0].value
  let state = $('#restaurant_locations_attributes_0_state')[0].value

  if (name === "" || rating === "" || state ==="") {
    alert("Please refresh page, then fill in name, rating, and state. These fields are required.")
  } else if (rating > 5 || rating < 1) {
    alert("Please refresh page, then enter a rating between 1 and 5")
  }
}

class Restaurant {
  constructor(object) {
    this.name = object.name
    this.price_range = object.price_range;
    this.parking = object.parking;
    this.wifi = object.wifi;
    this.occasion = object.occasion;
    this.takeS_reservations = object.takeS_reservations;
    this.rating = object.rating;
    this.comment = object.comment;
		this.city = object.city;
		this.state = object.state;
  }
}

Restaurant.prototype.newFormat = function(){
	return `<div id="restName"> Name: ${this.name} </div>
					<div id="restPrice"> Price Range: ${this.price_range} </div>
					<div id="restWifi"> Wifi: ${this.wifi} </div>
					<div id="restOccasion"> Occasion: ${this.occasion} </div>
					<div id="restReserves"> Reservations: ${this.takeS_reservations} </div>
					<div id="restRating"> Rating: ${this.rating} </div>
					<div id="restComment"> Comment: ${this.comment} </div>
					<div id="restCity"> City: ${this.city} </div>
					<div id="restState"> State: ${this.state} </div>
					`
}
// ============================== create new item ==============================
class Item {
  constructor(object) {
    this.name = object.name
    this.vegetarian = object.vegetarian;
    this.calories = object.calories;
    this.price = object.price;
    this.category = object.category;
    this.restaurant_id = object.restaurant_id
  }
}

Item.prototype.newItemFormat = function(){
	return `<div id="itemName"> Name: ${this.name} </div>
					<div id="itemVeg"> Vegetarian: ${this.vegetarian} </div>
					<div id="itemCalories"> Calories: ${this.calories} </div>
					<div id="itemPrice"> Price: ${this.price} </div>
					<div id="itemCategory"> Category: ${this.category} </div>`
}

$(function createNewItem() {
   $('form#new_item').submit(function(event) {
     event.preventDefault();
     validatesNewItem()

     var restId = document.querySelector('#item_restaurant_id').value

     var values = $(this).serialize();
     var posting = $.post('/restaurants/' + restId + '/items', values);
     posting.done(function(data){

             const newItem = new Item({name: data.name, vegetarian: data.vegetarian, calories: data.calories, price: data.price, category: data.category})

              $("#itemResult").append($(newItem.newItemFormat()));

    });
  });
});

function validatesNewItem() {
  let name = $('#item_name')[0].value 
  if (name === "") {
    alert("Please refresh page, then fill in the name. This field is required.")
  }
}
