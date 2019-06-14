$(function () {
  listenForAllItemsClick()
	listenForItemClick()
	listenForNewRestaurant()
});

// ================================================================

function listenForAllItemsClick() {
	$('button#items').on('click', function (event) {
		$(this).prop('disabled', true);
		event.preventDefault()
		getItems(this.dataset.id)
	})
}

function getItems(id){
	const url = 'http://localhost:3000/restaurants/'+ id + '/items.json'
  fetch(url)
	.then(response => response.json())
	.then(json => {json.map(element =>
		document.getElementById('allTheItems-'+ id).innerHTML += `<div> ${element.name} </div>`
		)

	})
}

// ================================================================

function listenForItemClick(){
	$('a#show-item').on('click', function (event) {
		event.preventDefault()
		getItem(this.dataset.id)
	})
}

function getItem(id){
	document.getElementById('itemDetail-'+id).innerHTML = ''

	const path = this.location.pathname
	const url = 'http://localhost:3000' + path + '/items/' + id + '.json'

	fetch(url)
	.then(response => response.json())
	.then(json =>
	document.getElementById('itemDetail-'+id).innerHTML += `<div> Vegetarian: ${json.vegetarian} </div>
		<div> Calories: ${json.calories} </div>
		<div> Price: ${json.price} </div>
		<div> Category: ${json.category} </div>`)
}

// ================================================================

function listenForNewRestaurant(){
	$('form#new_restaurant').on('submit', function (event) {
		$(this).prop('disabled', true);
		event.preventDefault()
    createRestaurant()
	})
}

function createRestaurant(){
    let newObject = {name: document.querySelector('#restaurant_name').value,
    price_range:  document.querySelector('#restaurant_price_range').value,
    takeS_reservations:  document.querySelector('#restaurant_takeS_reservations').value,
    parking:  document.querySelector('#restaurant_parking').value,
    wifi:  document.querySelector('#restaurant_wifi').value,
    occasion:  document.querySelector('#restaurant_occasion').value,
    rating: document.querySelector('#restaurant_rating').value,
    comment: document.querySelector('#restaurant_comment').value,

    locations_attributes: {"0": {city: document.querySelector('#restaurant_locations_attributes_0_city').value,
    state: document.querySelector('#restaurant_locations_attributes_0_state').value,
    user_id: document.querySelector('#restaurant_locations_attributes_0_user_id').value
  }
    }
  }
   validateRestaurant(newObject)
}

function validateRestaurant(newObject){
  if (newObject.name === "" || newObject.locations_attributes[0].state === "" || newObject.rating ===""){
    alert("Please refresh page, then fill in name, rating, and state")
  } else if (newObject.rating > 5 || newObject.rating < 1) {
      alert("Please refresh page and enter details again - rating must be between 1 and 5")
  } else {
    saveRestaurant(newObject)
  }
}

function saveRestaurant(newObject){
	fetch('http://localhost:3000/restaurants', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify(newObject)
	})
	.then(response => response.json())
	.then(json => console.log('Yay you created a new restaurant!'))
  let newRestaurant = new Restaurant(newObject);
  newRestaurant.newFormat()
}

// ================================================================

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
    this.state = object.locations_attributes[0].state
    this.city = object.locations_attributes[0].city
    this.user_id = object.locations_attributes[0].user_id
  }
}

Restaurant.prototype.newFormat = function(){

		document.querySelector('#formResults').innerHTML +=
						`Results:

            <div id="restName"> Name: ${this.name} </div>
						<div id="restPrice"> Price Range: ${this.price_range} </div>
						<div id="restWifi"> Wifi: ${this.wifi} </div>
						<div id="restOccasion"> Occasion: ${this.occasion} </div>
						<div id="restReserves"> Reservations: ${this.takeS_reservations} </div>
						<div id="restRating"> Rating: ${this.rating} </div>
						<div id="restComment"> Comment: ${this.comment} </div>
						<div id="restCity"> City: ${this.city} </div>
						<div id="restState"> State: ${this.state} </div>`

}
