$(function () {
  listenForAllItemsClick()
	listenForItemClick()
	listenForNewRestaurant()
  listenForNewItem()
});

// ===========================index===========================

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

// ===========================show===========================

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

// ===========================create restaurant===========================

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

//=========================== create item ===========================

function listenForNewItem(){
	$('form#new_item.new_item').on('submit', function (event) {
		$(this).prop('disabled', true);
		event.preventDefault()
    createItem()
	})
}

function createItem(){
    let newObject = {name: document.querySelector('#item_name').value,
    vegetarian:  document.querySelector('#item_vegetarian').value,
    calories:  document.querySelector('#item_calories').value,
    restaurant_id:  document.querySelector('#item_restaurant_id').value,
    price:  document.querySelector('#item_price').value,
    category:  document.querySelector('#item_category').value,
  }
   validateItem(newObject)

}

function validateItem(newObject){
  if (newObject.name === ""){
    alert("Please refresh page, then fill in name. This is a required field.")
  } else {
    saveItem(newObject)
  }
}

function saveItem(newObject){
  let id = newObject.restaurant_id
	fetch('http://localhost:3000/restaurants/' + id + '/items', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify(newObject)
	})
	.then(response => response.json())
	.then(json => console.log('Yay you created a new item!'))
  let newItem = new Item(newObject);
  newItem.newItemFormat()
}

class Item {
  constructor(object) {
    this.name = object.name
    this.vegetarian = object.vegetarian;
    this.calories = object.calories;
    this.restaurant_id = object.restaurant_id;
    this.price = object.price;
    this.category = object.category;
  }
}

Item.prototype.newItemFormat = function(){

		document.querySelector('#itemResults').innerHTML +=
						`Results:

            <div id="itemName"> Name: ${this.name} </div>
						<div id="itemVeg"> Vegetarian: ${this.vegetarian} </div>
						<div id="itemCalories"> Calories: ${this.calories} </div>
						<div id="itemPrice"> Price: ${this.price} </div>
						<div id="itemCategory"> Category: ${this.category} </div>`

}
