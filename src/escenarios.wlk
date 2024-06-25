import wollok.game.*
import mario.*
import juego.*
import animacion.*

class Stage{
	const property vigas=[]
	var property escaleras=[]
	const property caidaBarril=[]
	const property caidas=[]
	const property caidaMenor=[]
	var property image=null
	const property vigaGanadora
	var escaleraLvl2=0
	
	method hayVigaDebajo()= vigas.any{v=>v==mario.obtenerPosicionAbajo()}
	
	method hayCaidaDebajo()=caidas.any{c=>c==mario.obtenerPosicionAbajo()}
	
	method hayCaidaMenorDebajo()=caidaMenor.any{c=>c==mario.obtenerPosicionAbajo()}
	
	method hayEscaleraArriba()= escaleras.any{v=>v==mario.obtenerPosicionArriba()}
	
	method hayEscaleraDebajo()= escaleras.any{v=>v==mario.position()}
	
	method puedoPasarAlSiguienteNivel()= vigaGanadora==mario.obtenerPosicionAbajo()
	
	method position(){
		return game.at(0,0)}
		
	method reiniciarEscaleras(){
		animacionNivel2.reinicio()
		escaleraLvl2=0
		escaleras=[]}
	
		
	method activarEscaleraNvl2(){
		animacionNivel2.bajarEscaleras()
		escaleraLvl2+=1
		self.bajarEscaleras(escaleraLvl2)
	}
	
	method bajarEscaleras(unNumero){
		if (unNumero==1)
			escaleras=[game.at(1,4),game.at(1,2),game.at(1,3),game.at(9,4),game.at(9,2),game.at(9,3),game.at(16,4),game.at(16,2),game.at(16,3)]
		
		else if (unNumero==2){
			escaleras+=[game.at(2,7),game.at(2,5),game.at(2,6),game.at(7,7),game.at(7,5),game.at(7,6),game.at(11,7),game.at(11,5),game.at(11,6),game.at(15,7),game.at(15,5),game.at(15,6)]}
		
		else if (unNumero==3){
			escaleras+=[game.at(3,11),game.at(3,8),game.at(3,9),game.at(3,10),game.at(7,11),game.at(7,8),game.at(7,9),game.at(7,10),game.at(14,11),game.at(14,8),game.at(14,9),game.at(14,10),game.at(11,11),game.at(11,8),game.at(11,9),game.at(11,10)]}
				
		else 
			escaleras+=[game.at(9,14),game.at(9,12),game.at(9,13),game.at(3,14),game.at(3,12),game.at(3,13),game.at(14,14),game.at(14,12),game.at(14,13)]}
	
}


const stage1= new Stage(vigas=[game.at(0,0),game.at(1,0),game.at(2,0),game.at(3,0),game.at(4,0),game.at(5,0),game.at(6,0),game.at(7,0),game.at(8,0),game.at(9,0),game.at(10,0),game.at(11,0),game.at(12,0),game.at(13,0),game.at(14,0),game.at(15,0),game.at(16,0),game.at(17,0),
				game.at(0,3),game.at(1,3),game.at(2,3),game.at(3,3),game.at(4,3),game.at(5,3),game.at(6,3),game.at(7,3),game.at(8,3),game.at(9,3),game.at(10,3),game.at(11,3),game.at(12,3),game.at(13,3),game.at(14,3),game.at(15,3),game.at(16,3),
				game.at(1,5),game.at(2,5),game.at(3,5),game.at(4,5),game.at(5,5),game.at(6,5),game.at(7,5),game.at(8,5),game.at(9,5),game.at(10,5),game.at(11,5),game.at(12,5),game.at(13,5),game.at(14,5),game.at(15,5),game.at(16,5),game.at(17,5),
				game.at(0,8),game.at(1,8),game.at(2,8),game.at(3,8),game.at(4,8),game.at(5,8),game.at(6,8),game.at(7,8),game.at(8,8),game.at(9,8),game.at(10,8),game.at(11,8),game.at(12,8),game.at(13,8),game.at(14,8),game.at(15,8),game.at(16,8),
				game.at(17,11),game.at(1,11),game.at(2,11),game.at(3,11),game.at(4,11),game.at(5,11),game.at(6,11),game.at(7,11),game.at(8,11),game.at(9,11),game.at(10,11),game.at(11,11),game.at(12,11),game.at(13,11),game.at(14,11),game.at(15,11),game.at(16,11),
				game.at(1,13),game.at(2,13),game.at(3,13),game.at(4,13),game.at(5,13),game.at(6,13),game.at(7,13),game.at(8,13),game.at(9,13),game.at(10,13),game.at(11,13),game.at(12,13),game.at(13,13),game.at(14,13),game.at(15,13),game.at(16,13),game.at(0,13),
				game.at(7,15),game.at(8,15),game.at(9,15),game.at(10,15)],
				
				escaleras=[game.at(15,4),game.at(15,2),game.at(15,3),game.at(2,6),game.at(2,5),game.at(8,6),game.at(8,5),game.at(9,9),game.at(9,7),game.at(9,8),game.at(15,9),
				game.at(15,7),game.at(15,8),game.at(2,12),game.at(2,10),game.at(2,11),game.at(5,12),game.at(5,10),game.at(5,11), game.at(15,14),game.at(15,13),game.at(5,118),
				game.at(5,15),game.at(5,16),game.at(5,17),game.at(6,18),game.at(6,15),game.at(6,16),game.at(6,17),game.at(10,16),game.at(10,15)],
				
				caidaBarril=[game.at(5,4),game.at(15,4),game.at(2,6),game.at(8,6),game.at(9,9),game.at(15,8),game.at(2,12),game.at(5,12),game.at(12,11),game.at(8,14),game.at(15,14)],//(da problemas al barril ,game.at(5,9))
				
				caidas=[game.at(17,3),game.at(0,5),game.at(17,8),game.at(0,11),game.at(17,13),game.at(11,15)],
				
				image="assets/fondo/fondoNvl1.png",
				
				vigaGanadora=game.at(8,16)
				)
				

const stage2= new Stage(vigas=[game.at(0,0),game.at(1,0),game.at(2,0),game.at(3,0),game.at(4,0),game.at(5,0),game.at(6,0),game.at(7,0),game.at(8,0),game.at(9,0),game.at(10,0),game.at(11,0),game.at(12,0),game.at(13,0),game.at(14,0),game.at(15,0),game.at(16,0),game.at(17,0),
				game.at(1,3),game.at(2,3),game.at(3,3),game.at(5,3),game.at(6,3),game.at(7,3),game.at(8,3),game.at(9,3),game.at(10,3),game.at(11,3),game.at(12,3),game.at(14,3),game.at(15,3),game.at(16,3),
				game.at(1,6),game.at(2,6),game.at(3,6),game.at(5,6),game.at(6,6),game.at(7,6),game.at(8,6),game.at(9,6),game.at(10,6),game.at(11,6),game.at(12,6),game.at(14,6),game.at(15,6),game.at(16,6),
				game.at(2,10),game.at(3,10),game.at(5,10),game.at(6,10),game.at(7,10),game.at(8,10),game.at(9,10),game.at(10,10),game.at(11,10),game.at(12,10),game.at(14,10),game.at(15,10),
				game.at(3,13),game.at(5,13),game.at(6,13),game.at(7,13),game.at(8,13),game.at(9,13),game.at(10,13),game.at(11,13),game.at(12,13),game.at(14,13),
				game.at(5,16),game.at(6,16),game.at(7,16),game.at(8,16),game.at(9,16),game.at(10,16),game.at(11,16),game.at(12,16)],

				
				caidaBarril=[/*hernan lo tiene que rellenar */],
				
				caidas=[game.at(0,3),game.at(4,3),game.at(13,3),game.at(17,3),
				game.at(0,6),game.at(4,6),game.at(13,6),game.at(17,6),
				game.at(1,10),game.at(4,10),game.at(13,10),game.at(16,10),
				game.at(2,13),game.at(4,13),game.at(13,13),game.at(15,13)],
				
				image=animacionNivel2.image(),
				vigaGanadora=null,
				caidaMenor=[game.at(1,10),game.at(16,10)]
				)
				






