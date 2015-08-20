function updateTextInput(val) {
  document.getElementById('textInput').innerHTML=val;
}

$(document).ready(function() {
  $('#show-filters').click(function() {
    $('#all-filters').toggle();
  });
});
