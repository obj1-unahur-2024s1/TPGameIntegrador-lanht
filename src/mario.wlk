import juego.*
import wollok.game.*
import animacion.*
import escenarios.*
import sonido.*
import objects.*
import pantallas.*
import pauline.*
import score.*


object mario {
	//var vidas=0
	//var puntos = 0
	
 	//method puntaje()
	//method sumaPuntos()
	var property tieneMazo=false
	const velocidad=100
	var property position=game.at(1,1)
	var property stageEnQueMeMuevo= stage1
	var property palancasQueEncontrar=[palanca1,palanca2,palanca3,palanca4]
	var property cososAmarillosQueEncontrar=[coso1,coso2,coso3,coso4,coso5,coso6,coso7,coso8]
	var contadorCosos=0
	
	method image()= animacionMario.image()
	
	method configuracionInicioMario(){		
		position=game.at(3,1)
		vidas.iniciarConDosVidas()
	    //puntos = 0
	    tieneMazo=false
		animacionMario.animarDerecha()}
		
		//KEYBOARD
	method inicioMario(){
		self.configuracionInicioMario()
		
		keyboard.m().onPressDo{
			tieneMazo=true
		}                                     ////prueba hasta que se arregle las vidas
		keyboard.n().onPressDo{
			tieneMazo=false
		}
		
		keyboard.d().onPressDo{
		if(tieneMazo)
			mazo.moverDerechaConMazo()}
			
		keyboard.a().onPressDo{
		if(tieneMazo)
			mazo.moverIzquierdaConMazo()}
	
		keyboard.d().onPressDo{
		if(not tieneMazo)
			self.moverDerecha()}
			
		keyboard.a().onPressDo{
		if(not tieneMazo)
			self.moverIzquierda()}
			
		keyboard.w().onPressDo{
			self.moverArriba()}
			
		keyboard.s().onPressDo{
			self.moverAbajo()}
			
		keyboard.space().onPressDo{
			self.saltar()}	
}
	
	//method juegoTerminado()= vidas.cantidadDeVida()==0
	
	method ganaElJuego()= contadorCosos==8
    
   // method sumaPuntos(cantidad){puntos+=cantidad}
 
   	//method eliminarBarril(){puntaje.sumaPuntos(100)} 
	
 	method esColisionadoPor(){}
   		
 	method esChocadoPor(otro){
 	
   		if(self.tieneMazo())
   			otro.removerBarril()
   		else {
   			animacionMario.pierdeVida()
   			sonidoMario.pierdeVida()
   			game.say(self, "¡Auch!")
   			//vidas= vidas - 1
   			vidas.pierdeVida()}}
   	
		
		//MOVIMIENTO
	method moverDerecha(){
		self.moverDerechaSiSePuede()
		self.verificarObjetos()
		self.animarDerechaSiSePuede()
		if (stageEnQueMeMuevo.hayCaidaDebajo()) self.caer()
	}

	method moverIzquierda(){
		self.moverIzquierdaSiSePuede()
		self.verificarObjetos()
		self.animarIzquierdaSiSePuede()
		if (stageEnQueMeMuevo.hayCaidaDebajo()) self.caer()
	}
	
	method moverArriba(){
		self.moverArribaSiSePuede()
		self.verificarObjetos()
		self.animarArribaSiSePuede()
	}

	method moverAbajo(){
		self.moverAbajoSiSePuede()
		self.animarAbajoSiSePuede()
	}
	
	method saltar(){
			self.saltarSiSePuede()																									  
	}
	
	method caer(){
		position= if (stageEnQueMeMuevo==stage1)
					game.at(position.x(),position.y() - if (position.y()==4 or position.y()== 9 or position.y()==12) 3 else 2)
				  else 
				  	game.at(position.x(),position.y() - if (position.y()==4) 3 else if (position.y()==7) 6 else if (position.y()==11 and not stage2.hayCaidaMenorDebajo())10 else if(position.y()==11 and stage2.hayCaidaMenorDebajo())4  else 13)
		
		
		animacionMario.animarCaida()}
	
	//OBTIENE POSITION VIGA Y ESCALERA
	
	method obtenerPosicionAbajo()= game.at(position.x(),position.y()-1)
	
	method obtenerPosicionArriba()= game.at(position.x(),position.y()+1)
	
	method obtenerPosicionIzquierda()= game.at(position.x()-1,position.y()+1)
	

	//MUEVE DIRECCION SI SE PUEDE
	
	method saltarSiSePuede(){
			if(stageEnQueMeMuevo.hayVigaDebajo()){      // antes self.validarSalto()
			self.moverArribaSinCondicion()
			sonidoMario.deSalto()
			animacionMario.animarSalto()											
			game.schedule(velocidad*3,{self.caidaSalto()})}}
	
	method caidaSalto(){														
		position = game.at(position.x(),if(position.y()-1>=0)position.y()-1 else position.y())				
		animacionMario.animarSaltoCaida()}
		
	method moverArribaSiSePuede(){
		const alto = game.height()
		position = game.at(position.x(),if(position.y()+1<alto and stageEnQueMeMuevo.hayEscaleraArriba())position.y()+1 else position.y())
		//if (stageEnQueMeMuevo.puedoPasarAlSiguienteNivel())
		}
	method moverArribaSinCondicion(){
		const alto = game.height()
		position = game.at(position.x(),if(position.y()+1<alto)position.y()+1 else position.y())}
	
	method moverAbajoSiSePuede(){
		if (stageEnQueMeMuevo.hayEscaleraDebajo())
		position = game.at(position.x(),if(position.y()-1>=0)position.y()-1 else position.y())}
		
	method moverDerechaSiSePuede(){
		if (stageEnQueMeMuevo.hayVigaDebajo()){
		const ancho = game.width()
		position = game.at(if(position.x()+1<ancho)position.x()+1 else position.x() ,position.y())}}
	
	method moverIzquierdaSiSePuede(){
		if (stageEnQueMeMuevo.hayVigaDebajo())
			position = game.at(if(position.x()-1>=0)position.x()-1 else position.x() ,position.y())
			}
	
	// ANIMAR SI SE PUEDE
	
	method animarArribaSiSePuede(){
		if (stageEnQueMeMuevo.hayEscaleraArriba())
		animacionMario.animarArriba()}
	
	method animarAbajoSiSePuede(){
		if (not stageEnQueMeMuevo.hayVigaDebajo())
		animacionMario.animarArriba()}
	
	method animarIzquierdaSiSePuede(){
		if (stageEnQueMeMuevo.hayVigaDebajo()){
		sonidoMario.deMovimiento()
			if (self.tieneMazo())
				animacionMario.animarIzquierdaConMazo()
			else
				animacionMario.animarIzquierda()}}


	method animarDerechaSiSePuede(){
		if (stageEnQueMeMuevo.hayVigaDebajo()){
			sonidoMario.deMovimiento()
			if (self.tieneMazo())
				animacionMario.animarDerechaConMazo()
			else					
				animacionMario.animarDerecha()}}

	//VERIFICAR OBJETOS
	method verificarObjetos(){
		self.verificarVigaGanadora()
		self.verificarPalanca()
		self.verificarCosoAmarillo()}
	
	method verificarVigaGanadora(){
		if (position==stageEnQueMeMuevo.vigaGanadora()){
			juego.pasarNivel()
			stageEnQueMeMuevo=stage2}}	
	
	method verificarPalanca(){
		if (stageEnQueMeMuevo==stage2 and palancasQueEncontrar.any{p=>p.position()==position}){
			palancasQueEncontrar.first().consecuencias()
			self.eliminarPalanca()}}
	
	method verificarCosoAmarillo(){
		if (stageEnQueMeMuevo==stage2 and cososAmarillosQueEncontrar.any{p=>p.position()==position}){
			self.encontrarCosoAmarillo().consecuencias()
			self.eliminarCosoAmarillo()
			contadorCosos+=1
			self.verificarWin()}}
			
	method verificarWin(){
		if (self.ganaElJuego()){
			youWin.marioGana()
		}
	}
	
	//ELIMINAR OBJETOS
	
	method eliminarPalanca(){
		palancasQueEncontrar.remove(palancasQueEncontrar.first())}
	
	method eliminarCosoAmarillo(){
		cososAmarillosQueEncontrar.remove(self.encontrarCosoAmarillo())}
		
	method encontrarCosoAmarillo(){
		return cososAmarillosQueEncontrar.find{p=>p.position()==position}
	}
	method reiniciarMarioLvl2(){
		palancasQueEncontrar=[palanca1,palanca2,palanca3,palanca4]
		cososAmarillosQueEncontrar=[coso1,coso2,coso3,coso4,coso5,coso6,coso7,coso8]
		contadorCosos=0
	}
}

object vidas{
	var property image= "assets/objects/2-Vidas.png"
	var cantidadDeVida=2
	
	method position()=game.at(16,17)
	
	method iniciarConDosVidas(){
		cantidadDeVida=2
		image= "assets/objects/2-Vidas.png"
	}
	
	method juegoTerminado()= cantidadDeVida==0
	
	method pierdeVida(){
		cantidadDeVida= cantidadDeVida-1
		image = "assets/objects/1-Vidas.png"
		if(cantidadDeVida==0){
   				if (mario.stageEnQueMeMuevo()==stage1)
   					juego.musicaFondo().pause()
   				else 
   					juego.musicaFondoStage2().pause()
   				gameOver.marioPierde()}
	}
	
			
}


