function mouseMoving(e){
                
    if(window.event){ //IE5-8 liefern das Event Objekt nicht mit. Das Attribut pageX und pageY sind nicht vorhanden
        actual_x = document.body.scrollLeft+window.event.clientX;
        actual_y = document.body.scrollTop+window.event.clientY;
    } else {
        actual_x = e.pageX; //Mauseposition relativ zum linken Rand
        actual_y = e.pageY; //Mauseposition relativ zum oberen Rand
    }
        
    //alert(actual_x);
                                        
    new_x = Math.abs((Math.round(actual_x/4)%256)-122)*2;
                // Math.abs absolutes Resultat
                // Math.round rundet das Resultat auf den nächsten ganzen Integer
                // z.B actual_x = 1001
                // actual_x/4 = 250.25
                // Math.round(250.25) = 250
                // 250%256 = 250
                // 250 - 122 = 128
                // Math.abs(-97) = 128
                // 128 * 2 = 256
    new_y = Math.abs((Math.round(actual_y/4)%256)-122)*2;
    green = Math.round(((255-new_x) + (255-new_y))/2);
    body_elm = document.getElementsByTagName('body')[0].style;
    body_elm.backgroundColor="rgb("+new_y+","+green+","+new_x+")";
    
    //Ausgabe RGB
    myrgb = document.getElementById('rgb');
    myrgb.textContent="rgb= "+new_y+","+green+","+new_x;
    
    //Ausgabe Koordinaten
    mycoords = document.getElementById('coords');
    mycoords.textContent="x: " +actual_x+ " y: "+actual_y;
    
}

//alt und unsicher
//document.onmousemove = mouseMoving;

//Chrome, Safari, Firefox ...
if(document.addEventListener){
    document.addEventListener('mousemove', mouseMoving, false);
} else { //IE 5-8
    document.attachEvent("onmousemove", mouseMoving, false);
}