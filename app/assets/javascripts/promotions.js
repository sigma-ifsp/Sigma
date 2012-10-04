$(document).ready(function(){

    $( "#selecao > input" ).click( 
        function(){ 
            if ( this.value == 0 ){ 
                $( "#valor" ).hide(); 
                $( "#pontos" ).show(); 
            } else { 
                $( "#valor" ).show(); 
                $( "#pontos" ).hide();
            } 
        } 
    );

});