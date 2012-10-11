test("checking dates", function() {
  var initial = [2012,02,12];
  var end = [2014,12,12];
  ok( checkDatesInterval(initial[0],initial[1],initial[2],end[0],end[1], end[2] ), "Interval should be valid");
  ok( !checkDatesInterval(end[0],initial[1],initial[2],initial[0],end[1], end[2] ), "Initial year should not be greater then ending year");
  ok( !checkDatesInterval(initial[0],end[1],initial[2],initial[0],initial[1], end[2] ), "Initial month should not be greater then ending month on the same year");
  
  ok( !checkDatesInterval(2012,02,14,2012,02,12), "Initial day should not be greater then end date when month and year is the same");
});
