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
	$('form#new_restaurant').on('click', function (event) {
		event.preventDefault()

	})
}

class Restaurant{
	constructor(obj) {
		this.id = obj.id
		this.name = obj.name
		this.price_range = obj.price_range
		this.parking = obj.parking
		this.wifi = obj.wifi
		this.occasion = obj.occasion
		this.takeS_reservations = obj.takeS_reservations
		this.rating = obj.rating
		this.comment = obj.comment
	}
}
