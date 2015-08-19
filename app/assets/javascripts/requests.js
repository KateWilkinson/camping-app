var isLeft = true;

function move_info(request){
  if (isLeft === true) {
    $('#no-bookings').fadeOut(100);
    $request_info = request;
    $('request_info').remove();
    $('#right').append($request_info);
    isLeft = false;
  } else {
  console.log('boo')
    move_info_back(request);
    isLeft = true;
  }
}

function move_info_back(request){
  $request_info = request;
  $('request_info').remove();
  $('#left').append($request_info);
}
