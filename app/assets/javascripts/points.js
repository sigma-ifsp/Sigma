$(document).ready(function () {
  var fillClientInfo = function(data) {
    var balance = (data ? data.balance : 0);
    var promotion_points = 0;
    $("#client_balance").text(balance);
    if (data && data.promotion) {
      promotion_points = data.promotion.points_to_exchange;
      $("#promotion_points").text(promotion_points);
      $(".promotion-details").show();
    }

    if(balance != 0 && balance >= promotion_points) {
      $(".exchange-box #exchange_promotion_id").val(data.promotion_id);
      $(".exchange-box #exchange_client_cpf").val(data.client.cpf);
      $(".exchange-box").show();
    }
  };

  $("#point_cpf").keydown(function(event) {
    // Prevents the default behavior unless key is number(48 <= 57 && 96 <= 105)
    // or enter / backspace / esc / tab
    if ( ! ( (event.which == 8 || event.which == 9 || event.which == 46 || event.which == 27) || 
        ( event.which >= 48 && event.which <= 57 ) || 
        ( event.which >= 96 && event.which <= 105 ) ) ) {
          event.preventDefault();
        }
  });

  $("#point_promotion_id, #point_cpf").change(function(){
    // Call the client balance api
    var cpf = $('#point_cpf').val();
    var promotion_id = $('#point_promotion_id').val();
    if (cpf.length == 11 && cpf && promotion_id){
      var url = "/clients/by_cpf/"+ cpf +"/promotions/"+ promotion_id +"/balance.json";
      $(".promotion-details, .exchange-box").hide();
      $.get(url, function(data){
        fillClientInfo(data);
      });
      $("#client-info-box").fadeIn();
    }
  });
});
