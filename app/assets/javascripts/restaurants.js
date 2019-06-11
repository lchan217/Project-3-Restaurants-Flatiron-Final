  $(function () {
    $('form').submit(function(event) {
      event.preventDefault();

      var values = $(this).serialize();

      var posting = $.post('/restaurants', values);

      posting.done(function(data){
        const newRestaurant = new Restaurant({state: data.locations[0].state, city: data.locations[0].city, name: data.name, price_range: data.price_range, parking: data.parking, wifi: data.wifi, occasion: data.occasion, takeS_reservations: data.takeS_reservations, rating: data.rating, comment: data.comment})
				newRestaurant.newFormat()
         $("#restResult").append($(newRestaurant.newFormat()));
      });
    });
  });

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

	 allCaps() {
    console.log(`${this.name.toUpperCase()}`);
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
