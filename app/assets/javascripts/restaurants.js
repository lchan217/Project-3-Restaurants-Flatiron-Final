$(function () {
  listenForAllItemsClick()
	listenForItemClick()
	listenForNewRestaurant()
});

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

function listenForNewRestaurant(){
	$('#new_restaurant').on('submit', function (event) {
		event.preventDefault()
		createNewRestaurant()
	})
}

function createNewRestaurant(data) {
	fetch('http://localhost:3000/restaurants.json', {
	 	method: 'POST',
		body: JSON.stringify(data)
	})
 .then(res => res.json())
 .then(json => console.log(json));
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
	 allCaps() {
    console.log(`${this.name.toUpperCase()}`);
  }
}

Restaurant.prototype.newFormat = function(){
		document.getElementById('NewRestaurantResults').innerHTML +=

						`<div id="restName"> Name: ${this.name} </div>
						<div id="restPrice"> Price Range: ${this.price_range} </div>
						<div id="restWifi"> Wifi: ${this.wifi} </div>
						<div id="restOccasion"> Occasion: ${this.occasion} </div>
						<div id="restReserves"> Reservations: ${this.takeS_reservations} </div>
						<div id="restRating"> Rating: ${this.rating} </div>
						<div id="restComment"> Comment: ${this.comment} </div>
						<div id="restCity"> City: ${this.city} </div>
						<div id="restState"> State: ${this.state} </div>`
}
