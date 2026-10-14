// ═══════════════════════════════════════════════════════════════
//  Personaje.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Un PROTOCOLO y 3 CLASES que se conforman a él (cada una con su lógica).
//  ÚSALO PARA: "define un protocolo X e impleméntalo en 2-3 clases".
//  BUSCA:      protocol, protocolo, class, clase, conformar, get set, init, metodos, herencia, interfaz
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/Personaje.swift (o un archivo por clase).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import Foundation

// ── 1. El protocolo: la LISTA de lo que toda clase debe tener ──────
// { get }     = basta con poder leerla (puede ser let).
// { get set } = también se debe poder modificar (tiene que ser var).
protocol Personaje {                                  // ✏️ nombre del protocolo
    var nombre: String { get }
    var icono: String { get }                         // SF Symbol para dibujarlo
    var poderAtaque: Int { get }
    var vida: Int { get set }
    var energia: Int { get set }

    func atacar() -> Int                              // regresa el daño
    func recibirAtaque(_ dano: Int)
    func curar()
    func describir() -> String
}

// ── 2. Guerrero: ataque fijo, a veces bloquea ──────────────────────
class Guerrero: Personaje {
    let nombre = "Odiseo"                             // ✏️
    let icono = "shield.fill"
    let poderAtaque = 10
    var vida: Int
    var energia: Int

    init() {
        self.vida = 100
        self.energia = 10
    }

    func atacar() -> Int {
        if energia <= 0 {
            energia = 10                              // descansa este turno
            return 0
        }
        energia -= 1
        return poderAtaque
    }

    func recibirAtaque(_ dano: Int) {
        // 20% de probabilidad de bloquear el golpe.
        let suerte = Int.random(in: 1...100)
        if suerte > 20 {
            vida = max(0, vida - dano)
        }
    }

    func curar() {
        vida = min(100, vida + 10)
    }

    func describir() -> String {
        return "Guerrero: golpe fijo de \(poderAtaque). Bloquea 20% de los ataques."
    }
}

// ── 3. Mago: pega fuerte pero gasta mucha energía ─────────────────
class Mago: Personaje {
    let nombre = "Arcane"                             // ✏️
    let icono = "wand.and.stars"
    let poderAtaque = 15
    var vida: Int
    var energia: Int

    init() {
        self.vida = 80
        self.energia = 9
    }

    func atacar() -> Int {
        if energia < 3 {
            energia = 9
            return 0
        }
        energia -= 3
        return poderAtaque
    }

    func recibirAtaque(_ dano: Int) {
        vida = max(0, vida - dano)
    }

    func curar() {
        // Cura mucho, pero cuesta energía.
        if energia >= 2 {
            energia -= 2
            vida = min(80, vida + 25)
        }
    }

    func describir() -> String {
        return "Mago: golpe de \(poderAtaque), gasta 3 de energía. Cura 25."
    }
}

// ── 4. Arquero: a veces hace ataque doble ─────────────────────────
class Arquero: Personaje {
    let nombre = "Catnis"                             // ✏️
    let icono = "scope"
    let poderAtaque = 8
    var vida: Int
    var energia: Int

    init() {
        self.vida = 90
        self.energia = 10
    }

    func atacar() -> Int {
        if energia <= 0 {
            energia = 10
            return 0
        }
        energia -= 1
        let suerte = Int.random(in: 1...100)
        if suerte <= 25 {
            return poderAtaque * 2                    // 25%: ataque doble
        }
        return poderAtaque
    }

    func recibirAtaque(_ dano: Int) {
        vida = max(0, vida - dano)
    }

    func curar() {
        vida = min(90, vida + 15)
    }

    func describir() -> String {
        return "Arquero: golpe de \(poderAtaque), 25% de ataque doble. Cura 15."
    }
}
