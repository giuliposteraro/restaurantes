class Estudiante{
	var property tieneDineroSuficiente 
	var platosProbados 
	var categoria 
	method irDeGira(gira){
		if(not self.esBuenaOnda() and not self.tieneDineroSuficiente()){
			error.throwWithMessage("No puede ir de gira")
		}
			gira.estudiantes().add(self)
			return self.realizarGira(gira)
	}
	method realizarGira(gira){
			return gira.realizarse()
	}
	method esBuenaOnda()
	
	method pagarCuenta(lugar){
		return lugar.cuenta() / lugar.comenzales()
	}
	method probarPlato(){
		platosProbados += 1
	}
	method cambiarCategoria(estudiante){
		categoria = categoria.cambiar(self)
	}
}

object principiante{
	method cambiar(estudiante){
		var gira
		if(estudiante.irDeGira(gira)){
			return clasico
		}
			return self
	}
}
object clasico{
	method cambiar(estudiante){
		estudiante.esBuenaOnda() 
		return experto
	}
}

object experto{
	method cambiar(nueva){
		return self
	}
}

class Gira{
	var property estudiantes = []
	var restaurantes = []
	var bodegones = []
	method valeLaPena(){
		return restaurantes.all{restaurante => restaurante.valenLaPena()} and bodegones.all{bodegon => bodegon.valenLaPena()}
	}
	method realizarse(){
		self.irARestaurantes(restaurantes)
		self.irABodegones(bodegones)
	}
	method irARestaurantes(lista){
		restaurantes.add(lista)
	}
	method irABodegones(lista){
		bodegones.add(lista)
	}
}

class Bodegon{
	var property variedadSuficiente 
	var comenzales
	var cuenta 
	method valenLaPena(){
		return self.variedadSuficiente()
	}
}

class Restaurante{
	var calificacion
	var chefFamoso
	var cuenta
	var comenzales
	method valenLaPena(){
		return calificacion >= 3 and chefFamoso
	}
}

class Etnico inherits Restaurante{
	var lugar
	override method valenLaPena(){
		return lugar.esExotico()
	}
}

object camboya{
	method esExotico(){
		return true
	}
}
object etiopia{
	method esExotico(){
		return true
	}
}
object moldavia{
	method esExotico(){
		return true
	}
}

class Deglutidor inherits Estudiante{
	var property tieneAuto 
	override method esBuenaOnda(){
		return platosProbados > 20 and self.tieneAuto()
	}
	override method irDeGira(gira){
		return super(gira) and self.sumarPlatos()
	}
	method sumarPlatos(){
		return platosProbados += 3
	}
}

class Critico inherits Estudiante{
	var property horasTV
	override method esBuenaOnda(){
		return (platosProbados / horasTV).min(10)
	}
	override method irDeGira(gira){
		return super(gira) and self.incrementarHoras()
	}
	method incrementarHoras(){
		return horasTV * 0.1
	}
}

