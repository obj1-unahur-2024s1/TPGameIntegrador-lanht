import wollok.game.*
import animacion.*

object kong{	
	var property position = game.at(2,14)
	var fotograma = 0
	const property gifKongStage1 = ["assets/personajes/donkeyKong/0.png",
							"assets/personajes/donkeyKong/14.png",
							"assets/personajes/donkeyKong/0.png",
							"assets/personajes/donkeyKong/6.png",
							"assets/personajes/donkeyKong/9.png",
							"assets/personajes/donkeyKong/7.png"]
	var property image = gifKongStage1.get(fotograma)
	const property gifKongStage2 = ["assets/personajes/donkeyKong/22.png",
							"assets/personajes/donkeyKong/23.png",
							"assets/personajes/donkeyKong/22.png",
							"assets/personajes/donkeyKong/0.png",
							"assets/personajes/donkeyKong/0.png",
							"assets/personajes/donkeyKong/0.png"]
	
	method siguienteFotograma(lista){
		fotograma = (fotograma+1) % lista.size()
		image = lista.get(fotograma)
	}
	
	method animacionStage1(){
		game.onTick(900,
		"animacion-tirarBarriles",
		{self.siguienteFotograma(gifKongStage1)})
	}
	
	method animacionStage2(){
		game.onTick(900,
		"animacion-tirarBarriles",
		{self.siguienteFotograma(gifKongStage2)})
	}
	
	method esChocadoPor(otro){}
	
	method positionPrimerNivel(){
		self.position(game.at(2,14))
		image=gifKongStage1.get(fotograma)
	}
	
	method positionSegundoNivel(){
		self.position(game.at(8,14))
		image = gifKongStage2.get(fotograma)
	}
}