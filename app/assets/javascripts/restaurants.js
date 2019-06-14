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
    $(".js-item-detail").on("click", function(){
      var restaurantId = parseInt($(".js-item-detail").attr("rest-id"));
      var id = $(this).data("id");

      $.getJSON("/restaurants/" + restaurantId + "/items/" + id + ".json", function(data){
        $(".moreDetails").text(`More Details:`);
        $(".itemName").text(`Name: ${data["name"]}`);
        $(".itemVeg").text(`Vegetarian: ${data["vegetarian"]}`);
        $(".itemCalories").text(`Calories: ${data["calories"]}`);
        $(".itemPrice").text(`Price: ${data["price"]}`);
        $(".itemCategory").text(`Category: ${data["category"]}`);
      });
    });
  });
// ============================== create new ==============================
$(function createNew() {
   $('form#new_restaurant').submit(function(event) {
     event.preventDefault();

     validatesNew()
     var values = $(this).serialize();
     var posting = $.post('/restaurants', values);

     posting.done(function(data){
             const newRestaurant = new Restaurant({state: data.locations[0].state, city: data.locations[0].city, name: data.name, price_range: data.price_range, parking: data.parking, wifi: data.wifi, occasion: data.occasion, takeS_reservations: data.takeS_reservations, rating: data.rating, comment: data.comment})
     				newRestaurant.newFormat()
              $("#restResult").append($(newRestaurant.newFormat()));

    });
  });
});

function validatesNew() {

  let name = document.querySelector('#restaurant_name').value
  let rating = document.querySelector('#restaurant_rating').value
  let state = document.querySelector('#restaurant_locations_attributes_0_state').value

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
