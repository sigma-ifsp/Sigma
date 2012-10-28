$(document).ready(function () {
  

  $("#point_cpf").keydown(function(event) {
    if ( ! ( (event.which == 8 || event.which == 9 || event.which == 46 || event.which == 27) || 
        ( event.which >= 48 && event.which <= 57 ) || 
        ( event.which >= 96 && event.which <= 105 ) ) ) {
      event.preventDefault();
    }
  });

  $("#point_promotion_id, #point_cpf").change(function(){
      var cpf = $('#point_cpf').val();
      var promotion_id = $('#point_promotion_id').val();
      if (cpf.length == 11){
        var url = "/clients/"+cpf+"/promotions/"+promotion_id+"/balance";
        $.get(url, function(data){ 
          if (data == null || data == undefined){
          $("#client_balance").text('');
          } else{
          $("#client_balance").text(data.balance);
          }
        });
  
      }      
  });

  
});

    