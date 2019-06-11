$(function () {
	console.log('restaurants.js is loaded ...')
  listenForClick()
});

function listenForClick() {
	$('button#restaurants').on('click', function (event) {
		event.preventDefault()
		getRestaurants()
	})
}

function getRestaurants(){
  $.ajax({
    url: 'http://localhost:3000/restaurants',
    method: 'get',
    dataType: 'json',
    success: function(data){
      console.log(data)
      data.map(restaurant => {
        document.getElementById('allTheRestaurants').innerHTML += restaurant.name
      })
    }
  })
}
