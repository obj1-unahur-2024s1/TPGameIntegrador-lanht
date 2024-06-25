import wollok.game.*
/* 
object puntaje {
	
	var puntos=0
	
    var property unidad = 0
    var property decena = 0
    var property centena = 0
    var property mil = 0 
    
    var property imagenUnidad="imagenUnidad0.png"
    var property imagenDecena="imagenDecena0.png"
    var property imagenCentena="imagenCentena0.png"
    var property imagenMil="imagenMil0.png"
    
    method puntos() = puntos
    
    method sumaPuntos(cantidad){
    	puntos+=cantidad
    	self.actualizarImagenPuntos()
    }
    
     method actualizarImagenPuntos(){
    	imagenUnidad = "imagenUnidad" + self.unidad().toString() +".png"
        imagenDecena = "imagenDecena" + self.decena().toString() +".png"
        imagenCentena ="imagenCentena" + self.centena().toString() +".png"
        imagenMil = "imagenMil" + self.mil().toString() +".png"
        
        unidadTablero.cambiarNumero(imagenUnidad)
        decenaTablero.cambiarNumero(imagenDecena)
        centenaTablero.cambiarNumero(imagenCentena)
        milTablero.cambiarNumero(imagenMil)
    }



    method dividirNumeros(numero){
     	
         if (numero.digits()==3){
            centena = (numero / 100).truncate(0)
            decena = ((numero - (centena*100))/10).truncate(0)
            unidad = numero - (centena*100 + decena*10)
        }
        else if(numero.digits()==4){
            mil = (numero / 1000).truncate(0)
            centena = ((numero - (mil * 1000) )/ 100).truncate(0)
            decena = ((numero - (mil * 1000 + centena*100))/10).truncate(0)
            unidad = numero - (mil * 1000 + centena*100 + decena*10)
        }
    }


    
    
    
}




object unidadTablero {
	var imagen = "imagenUnidad0.png"

	method position() = game.at(16,16)

	method cambiarNumero(nuevoNumero) {
		imagen = nuevoNumero
	}
	
	method image() = imagen
	
	
}

 object decenaTablero {
	var imagen = "imagenDecena0.png"

	method position() = game.at(15,16)

	method cambiarNumero(nuevoNumero) {
		imagen = nuevoNumero
	}
	
	method image() = imagen
}

object centenaTablero {
	var imagen = "imagenCentena0.png"

	method position() = game.at(14,16)

	method cambiarNumero(nuevoNumero) {
		imagen = nuevoNumero
	}
	
	method image() = imagen
}

object milTablero{
	var imagen = "imagenMil0.png"

	method position() = game.at(13,16)

	method cambiarNumero(nuevoNumero) {
		imagen = nuevoNumero
	}
	
	method image() = imagen
}*/