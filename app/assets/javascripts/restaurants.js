$(function () {
  listenForAllItemsClick()
	listenForItemClick()
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
