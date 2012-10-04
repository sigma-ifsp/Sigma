$( "#selecao > input" ).click( 
    function(){ 
        if ( this.value == 1 ){ 
            $( "#valor" ).hide(); 
            $( "#pontos" ).show(); 
        } else { 
            $( "#valor" ).show(); 
            $( "#pontos" ).hide() 
        } 
    } 
);