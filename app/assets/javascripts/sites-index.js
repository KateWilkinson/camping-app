function updateTextInput(val) {
  document.getElementById('textInput').innerHTML=val;
}

$(document).on('page:change', function() {
  $('#show-filters').click(function() {
    $('#all-filters').toggle();
  });
});
