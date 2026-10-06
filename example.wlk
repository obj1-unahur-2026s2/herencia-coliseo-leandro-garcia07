class Arma {
  method poderDeAtaque()
}

class ArmaDeFilo inherits Arma{
  var filo = 1
  const longitud =
  method cambiarFilo(nuevoFilo) {
    filo = ((nuevoFilo).min(1).max(0))
  }
  override method poderDeAtaque() = filo * longitud
}

class ArmaContundente inherits Arma {
  const peso = 
  override method poderDeAtaque() = peso
}


object casco() {
  method puntosDeArmadura() = 10
}

object escudo(gladiador) {
  method puntosDeArmadura(gladiador) = 5 + 0.1* gladiador.destreza()
}

class Gladiador {
  const vida = 100
  method atacar(unGladiador)
  method defenza()
  method fuerza()
  method destreza()
  method recibirDaño(unGladiador){
    var daño = unGladiador.poderDeAtaque - self.defensa()
    vida = vida - daño
    self.atacar(unGladiador)
  }
  method estaVivo() = (vida>0)
}

class Mirmillones inherits Gladiador{
  var fuerza 
  var armadura 
  var arma 
  method cambiarArmadura(nuevaArmadura){
    armadura = nuevaArmadura
  }
  override method fuerza() = fuerza
  override method destreza() = 15
  method poderDeAtaque() = arma.poderDeAtaque() + fuerza
  method inflingirDaño(otro) = self.poderDeAtaque - otro.defensa()
  override method atacar(unGladiador){
    unGladiador.recibirDaño(self)
  }
  method defensa() {
    armadura.puntosDeArmadura(self) + self.destreza()
  }
}

class Dimachaerus inherits Gladiador{
  var destreza = 100
  const armas = []
  method poderDeArmas() = self.arma1.poderDeAtaque() + self.arma2.poderDeAtaque()
  override method fuerza() = 10
  override method destreza() = destreza
  method poderDeAtaque() = armas.sum({ a => a poderDeAtaque()}) + self.fuerza()
  method inflingirDaño(otro) = self.poderDeAtaque - otro.defensa()
  override method atacar(unGladiador) {
    super(unGladiador)
    destreza += 1
  }
  method defensa() {
    destreza / 2
  } 
}

class Grupos{
  const gladiadores = []
  const nombre
  var cantPeleas = 0
  method pelear(otroGrupo){
    self.campeon().atacar(otroGrupo.campeon())
}

  method campeon(){
    gladiadores.filter({g => g.estaVivo()}).max({g => g fuerza()})
  }
}