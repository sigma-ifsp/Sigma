$(document).ready(function () {
  $("#point_cpf").keydown(function(event) {
    if ( ! ( (event.which == 8 || event.which == 9 || event.which == 46 || event.which == 27) || 
        ( event.which >= 48 && event.which <= 57 ) || 
        ( event.which >= 96 && event.which <= 105 ) ) ) {
      event.preventDefault();
    }
  });
});
