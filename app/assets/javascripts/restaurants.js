$(function () {
	console.log('restaurants.js is loaded ...')
  listenForAllItemsClick()
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
