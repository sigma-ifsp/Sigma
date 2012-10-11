
var checkDatesInterval = function(initial_year, initial_month, initial_day, ending_year, ending_month, ending_day ){
  if ( ( initial_year > ending_year ) || (initial_year >= ending_year && initial_month > ending_month ) ) {
    return false;
  }

  if ( initial_year == ending_year && initial_month == ending_month && ( initial_day >= ending_day ) ) {
    return false;
  }

  return true;
};


$(document).ready(function(){
  var verifyPointsValueChoice = function() {
    if ( this.value == 0 ){
      $("#value").hide();
      $("#points").show();
    } else {
      $("#value").show();
      $("#points").hide();
    }
  };

  var verifyPromotionDates = function(){
    var initial_year = $("#promotion_initial_date_1i").val();
    var initial_month = $("#promotion_initial_date_2i").val();
    var initial_day = $("#promotion_initial_date_3i").val();

    var ending_year = $("#promotion_ending_date_1i").val();
    var ending_month = $("#promotion_ending_date_2i").val();
    var ending_day = $("#promotion_ending_date_3i").val();
    if ( checkDatesInterval(initial_year, initial_month, initial_day, ending_year, ending_month, ending_day ) ) {
      return true;
    } else {
      return false;
    }
  };

  $("#promotion_category > input").click(verifyPointsValueChoice);
  $(".actions > input[type=submit]").click(verifyPromotionDates);
});
