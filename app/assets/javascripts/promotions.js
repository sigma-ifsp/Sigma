$(document).ready(function(){

    $( "#promotion_category > input" ).click( 
        function(){ 
            if ( this.value == 0 ){ 
                $( "#value" ).hide(); 
                $( "#points" ).show(); 
            } else { 
                $( "#value" ).show(); 
                $( "#points" ).hide();
            } 
        } 
    );
    
    $( ".actions > input[type=submit]" ).click(
        function( event ){
            var initial_year = $( "#initial_date > select" ).get( 0 ).value;
            var initial_month = $( "#initial_date > select" ).get( 1 ).value; 
            var initial_day = $( "#initial_date > select" ).get( 2 ).value; 
            
            var ending_year = $( "#ending_date > select" ).get( 0 ).value;
            var ending_month = $( "#ending_date > select" ).get( 1 ).value;
            var ending_day = $( "#ending_date > select" ).get( 2 ).value;
            
            console.log(checkDates( 
                    initial_year, initial_month, initial_day,
                    ending_year, ending_month, ending_day)
            );
            
            
            
            
            if ( $( "#promotion_category > input" ).val() == 0 ){
                return $( "#points" ).val().length > 0;
            } else {
                return $( "#value" ).val().length > 0
            }
            
        }
    );
});


function checkDates( 
        initial_year, initial_month, initial_day, 
        ending_year, ending_month, ending_day ){
    
    if ( initial_year > ending_year ){
        return false;
    } else if ( initial_month > ending_month ) {
        return false;
    } else if ( initial_year > ending_year ) {
        return false;
    }
    
    return true;

}