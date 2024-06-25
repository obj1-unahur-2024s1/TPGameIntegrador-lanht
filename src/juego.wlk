
import wollok.game.*
import mario.*
import kong.*
import pauline.*
import escenarios.*
import sonido.*
import objects.*
import pantallas.*
import score.*


object juego{
	var validacionMusicaInicio = 0
	var validacionMusicaJuego = 0
	var property musicaFondo = game.sound("assets/sonidos/background-1.mp3")
	var property musicaFondoStage2 = game.sound("assets/sonidos/musicaFondoStage2.mp3")
	var property musicaInicio = game.sound("assets/sonidos/sonidoInicial.mp3")
	method iniciarJuego(){
		
		self.inicio()
		
		game.start()
		}											
	
	method medidas(){
		game.width(18)
		game.height(18)
		game.cellSize(50)
	}
	
	method cambioImage(unaPantalla){
		game.onTick(700,"cambio imagen",{unaPantalla.siguienteFotograma()})
	}
	
	method aniadirVisuales(unStage){
	game.addVisual(unStage)
	game.addVisual(mazo)
	game.addVisual(mario)
	game.addVisual(kong)
	//game.addVisual(barriles)
	//game.addVisual(unidadTablero)
	//game.addVisual(decenaTablero)
	//game.addVisual(centenaTablero)
	//game.addVisual(milTablero)
	game.addVisual(vidas)
	if (unStage==stage1)
		game.addVisual(pauline)
	if (unStage==stage2){
		game.addVisual(palanca1)
		game.addVisual(palanca2)
		game.addVisual(palanca3)
		game.addVisual(palanca4)
		game.addVisual(coso1)
		game.addVisual(coso2)
		game.addVisual(coso3)
		game.addVisual(coso4)
		game.addVisual(coso5)
		game.addVisual(coso6)
		game.addVisual(coso7)
		game.addVisual(coso8)}
	}
	
	
	method inicio(){
		game.onTick(100,"musica inicial",{
			if(validacionMusicaInicio == 0){
				self.musicaInicio().play()
				musicaInicio.shouldLoop(true)
				validacionMusicaInicio = validacionMusicaInicio + 1
				game.removeTickEvent("musica inicial")
			}
			else{
				self.musicaInicio().resume()
				game.removeTickEvent("musica inicial")
			}})
		game.addVisual(pantallaInicio)
		self.cambioImage(pantallaInicio)
		self.medidas()
		keyboard.enter().onPressDo{
			self.controles()
			}
			}
	
	method controles(){
		var contador = 0
		
		game.onTick(100,"validacion",{contador = contador + 1})
		game.removeVisual(pantallaInicio)
		game.addVisual(pantallaControles)
		self.cambioImage(pantallaControles)
		self.medidas()
		game.schedule(1,{
			keyboard.enter().onPressDo{
			self.musicaInicio().pause()
		
			self.inicioStage1()
			game.onTick(100,"musica juego",{
			if(validacionMusicaJuego == 0){
				self.musicaFondo().play()
				self.musicaFondo().pause()
				self.musicaFondoStage2().play()	
				self.musicaFondoStage2().pause()			
				musicaFondo.shouldLoop(true)
				musicaFondoStage2.shouldLoop(true)
				musicaPlayJuego.musicaPlay().play()
				musicaPlayJuego.musicaPlay().shouldLoop(true)
				musicaPlayJuego.musicaPlay().pause()
				musicaFondoStage2.volume(0.5)
				validacionMusicaJuego = validacionMusicaJuego + 1
				game.removeTickEvent("musica juego")
			}})}})}
			
	method inicioStage1(){
			game.removeVisual(pantallaControles)
			game.addVisual(pantallaInicioStage1)
			self.medidas()
		game.schedule(2000,{
			self.configuracionNivel1()})}
		
	method pasarNivel(){
		self.musicaFondo().pause()
		game.sound("assets/sonidos/finish-board.wav").play()
		game.clear()
		game.addVisual(pantallaInicioStage2)
		self.medidas()
		game.schedule(2000,{
			self.configuracionNivel2()})}  
	
	
	//CONFIGURACION DE NIVELES
	
	method configuracion(unNivel){
		if (unNivel==1)
			game.removeVisual(pantallaInicioStage1)
		else
			game.removeVisual(pantallaInicioStage2)	
		if (unNivel==1)
			{self.aniadirVisuales(stage1)
			mario.stageEnQueMeMuevo(stage1)
			mazo.stageEnQueSeMueveMario(stage1)
			barriles.positionPrimerNivel()
			kong.positionPrimerNivel()}
			
		else
			{self.aniadirVisuales(stage2)
			mazo.stageEnQueSeMueveMario(stage2)}
		mario.inicioMario()		
		self.medidas()}
	
	method configuracionNivel1(){
		game.title("Donkey Kong (wollok Version)")
		self.configuracion(1)
		musicaPlayJuego.musicaPlay().resume()
		game.onTick(2500,"musica fondo juego",{
			musicaPlayJuego.musicaPlay().pause()
			self.musicaFondo().resume()
			game.removeTickEvent("musica fondo juego")
		})
		kong.animacionStage1()
		game.addVisual(barriles)
		game.onTick(5550,"lanzamientoDeBarriles",{prograBarril.tirarBarriles()})	
		game.addVisual(barrilAzul)
		game.addVisual(fuegoBarril)
		game.schedule(7000,{prograFueguito.aniadirFueguito()})
		fuegoBarril.animacion()
	}

	method configuracionNivel2(){
		stage2.reiniciarEscaleras()
		mario.reiniciarMarioLvl2()
		kong.positionSegundoNivel()
		kong.animacionStage2()
		barriles.positionSegundoNivel()  
		game.schedule(7000,{prograFantasma.aniadirFantasmas()})
		game.schedule(15000,{prograFantasma.aniadirFantasmas()})
		game.schedule(24000,{prograFantasma.aniadirFantasmas()})
		game.schedule(35000,{prograFantasma.aniadirFantasmas()})
		game.schedule(450000,{prograFantasma.aniadirFantasmas()})
		self.configuracion(2)
		game.schedule(2000,{self.musicaFondoStage2().resume()})
		}
}
