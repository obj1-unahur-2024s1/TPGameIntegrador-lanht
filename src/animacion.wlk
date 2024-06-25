import mario.*
import escenarios.*

//MARIO

object animacionMario {
	
	var direccion="derecha"
	var fotogramaActual=0
	
	method direccion(nuevaDireccion){
		direccion=nuevaDireccion}
	
	method siguienteFotograma(){
		if (direccion=="derecha" or direccion=="izquierda") fotogramaActual=(fotogramaActual+1)%4 else if (direccion=="caida")fotogramaActual= 0 else fotogramaActual=(fotogramaActual+1)%2}
	
	method image(){
		return "assets/personajes/mario/"+direccion+"-"+fotogramaActual.toString()+".png"}
		
	//ANIMAR DIRECCION SI SE PUEDE
	
	method animarAbajo(){
		self.direccion("abajo")
		self.siguienteFotograma()}

	method animarArriba(){
		self.direccion("arriba")
		self.siguienteFotograma()}

	method animarIzquierda(){
		self.direccion("izquierda")
		self.siguienteFotograma()}
	
	method animarDerecha(){
		self.direccion("derecha")
		self.siguienteFotograma()}
	
	method animarSalto(){
		self.direccion("salto")
		self.siguienteFotograma()}
	
	method animarSaltoCaida(){
		if(not mario.tieneMazo())
			self.direccion("caidaSalto")		
		else 
			self.direccion("caidaSaltoMazo")
		self.siguienteFotograma()}
	
	method animarCaida(){
		self.direccion("caida")
		self.siguienteFotograma()}
	
	method animarDerechaConMazo(){
		self.direccion("derechaMazo")
		self.siguienteFotograma()}
		
	method animarIzquierdaConMazo(){
		self.direccion("izquierdaMazo")
		self.siguienteFotograma()}
	
	method pierdeVida(){
		self.direccion("perdioVida")}	
}

object animacionNivel2{
	var property fotogramas=["assets/fondo/fondoNvl2-0.png",
						"assets/fondo/fondoNvl2-1.png",
						"assets/fondo/fondoNvl2-2.png",
						"assets/fondo/fondoNvl2-3.png",
						"assets/fondo/fondoNvl2-4.png"]
	
	method image()=fotogramas.first()
	
	method reinicio(){
		fotogramas=["assets/fondo/fondoNvl2-0.png",
					"assets/fondo/fondoNvl2-1.png",
					"assets/fondo/fondoNvl2-2.png",
					"assets/fondo/fondoNvl2-3.png",
					"assets/fondo/fondoNvl2-4.png"]
					stage2.image(self.image())
	}
	
	method bajarEscaleras(){
		fotogramas.remove(fotogramas.first())
		stage2.image(self.image())
	}
	
}
