function getPosition(callback) {

  var geocoder = new google.maps.Geocoder();
  var postcode = document.getElementById("postcode").innerHTML;

  geocoder.geocode({'address': postcode}, function(results, status)
  {
    if (status == google.maps.GeocoderStatus.OK)
    {
      callback({
        latt: results[0].geometry.location.lat(),
        long: results[0].geometry.location.lng()
      });
    }
  });

};

function setup_map(latitude, longitude) {
  styles: [
  ]

  var _position = { lat: latitude, lng: longitude};

  var mapOptions = {
    zoom: 8,
    center: _position
  }

  var map = new google.maps.Map(document.getElementById('map'), mapOptions);

  var marker = new google.maps.Marker({
    position: mapOptions.center,
    map: map
  });
};

$(document).on('page:change', function() {
  if(!document.getElementById('map')) { return };
  getPosition(function(position){
    setup_map(position.latt, position.long);
  });
});
