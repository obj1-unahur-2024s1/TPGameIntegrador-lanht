import wollok.game.*
import juego.*

class Pantalla{
	var fotogramaActual=0
	
	method position(){
		return game.at(0,0)}
	
	method siguienteFotograma(){		
			if(fotogramaActual == 1)
				fotogramaActual = fotogramaActual - 1
			else 
				fotogramaActual = fotogramaActual + 1}
	method image()		
}

object pantallaInicio inherits Pantalla{
	override method image()= "assets/pantallaInicio/pantallaInicio"+"-"+fotogramaActual.toString()+".png"
}

object pantallaControles inherits Pantalla{
	override method image()= "assets/pantallaInicio/controles"+"-"+fotogramaActual.toString()+".png"
}

object pantallaGameOver inherits Pantalla{
	override method image()="assets/pantallaInicio/gameOver"+"-"+fotogramaActual.toString()+".png"
}

object pantallaInicioStage1 inherits Pantalla{
	override method image()="assets/pantallaInicio/inicioStage1.png"
}

object pantallaInicioStage2 inherits Pantalla{
	override method image()="assets/pantallaInicio/inicioStage2.png"
}

object pantallaYouWin inherits Pantalla{
	override method image()="assets/pantallaInicio/youWin.png"
}


object gameOver {
	var property musicaGameOver =  game.sound("assets/sonidos/muerte.wav")
	var validacion = 0
	method marioPierde(){
		game.clear()
		if (validacion > 0){
			self.musicaGameOver().resume()
		}else{
			self.musicaGameOver().play()
			musicaGameOver.shouldLoop(true)
			validacion = validacion + 1
		}
		
		game.addVisual(pantallaGameOver)
		game.onTick(1000,"cambio imagen muerte",{pantallaGameOver.siguienteFotograma()})
		keyboard.r().onPressDo{
			game.clear()
			juego.inicio()
			self.musicaGameOver().pause()
			}
		}
			
}

object youWin {
	method marioGana(){
		game.clear()
		juego.musicaFondoStage2().stop()
		game.sound("assets/sonidos/win.wav").play()      
		game.addVisual(pantallaYouWin)
		game.schedule(6000,{
			game.stop()})
	}
}

