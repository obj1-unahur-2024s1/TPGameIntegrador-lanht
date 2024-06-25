import wollok.game.*

	
object musicaPlayJuego {
	var property musicaPlay = game.sound("assets/sonidos/start-board.wav")

}		
	

object sonidoMario{
	method deMovimiento(){
		const rain = game.sound("assets/sonidos/spring.wav")
		rain.volume(0.5)
		game.schedule(10, { rain.play()})
		}
	
	method deSalto(){
		const rain = game.sound("assets/sonidos/jump.wav")
		rain.shouldLoop(true)
		keyboard.space().onPressDo({rain.volume(0.5)})
		game.schedule(1,{rain.play()})
		game.schedule(800,{rain.stop()})}
		
		method deObjeto(){
		
		const rain = game.sound("assets/sonidos/smash.wav")
		rain.play()}
	
	method pierdeVida(){
		const rain = game.sound("assets/sonidos/pierdeVida.wav")
		rain.volume(0.5)
		game.schedule(10, { rain.play()})
		game.schedule(900, { rain.stop()})}
}