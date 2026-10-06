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

class Armadura {
  method puntosDeArmadura()
}

class Casco inherits Armadura{
  override method puntosDeArmadura() = 10
}

class Escudo inherits Armadura {
  override method puntosDeArmadura(gladiador) = 5 + 0.1* gladiador.destreza()
}

class Gladiador {
  const vida = 100
  method atacar(otro)
  method defender()
  method fuerza()
  method destreza()
  //var arma =
  //method arma() = arma
  // method cambiarArma(nuevaArma) {
  //      arma = nuevaArma}
}

class Mirmillones inherits Gladiador{
  var fuerza = 1
  method arma() 
  method armadura()
  override method fuerza() = fuerza
  override method destreza() = 15
  method poderDeAtaque() = self.arma.poderDeAtaque() + fuerza
  method inflingirDaño(otro) = self.poderDeAtaque - otro.defensa()
}

class Dimachaerus inherits Gladiador{
  var destreza = 100
  method arma1()
  method arma2()
  method poderDeArmas() = self.arma1.poderDeAtaque() + self.arma2.poderDeAtaque()
  override method fuerza() = 10
  override method destreza() = destreza
  method poderDeAtaque() = self.poderDeArmas() + fuerza
  method inflingirDaño(otro) = self.poderDeAtaque - otro.defensa()
}

