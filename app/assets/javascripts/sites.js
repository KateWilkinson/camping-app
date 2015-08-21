function getPosition(callback) {

  var geocoder = new google.maps.Geocoder();
  var postcode = document.getElementById("postcode").innerHTML;

  geocoder.geocode({'address': postcode}, function(results, status)
  {
    if (status == google.maps.GeocoderStatus.OK)
    {
      callback(
        results[0].geometry.location.lat(),
        results[0].geometry.location.lng()
      );
    }
  });

};


function setup_map(latitude, longitude) {
  if(!document.getElementById('map') || document.getElementById('map').innerHTML) { return };

  var _position = new google.maps.LatLng(latitude, longitude);
  var mapOptions = {
    zoom: 10,
    center: _position
  }

  map = new google.maps.Map(document.getElementById('map'), mapOptions);

  var marker = new google.maps.Marker({
    position: mapOptions.center,
    map: map
  });
};

$(document).on('page:change', function() {
  $("a[href=#section-linemove-2]").on('click', function(){ getPosition(setup_map)})
});
