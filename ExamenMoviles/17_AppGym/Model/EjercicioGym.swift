// ═══════════════════════════════════════════════════════════════
//  EjercicioGym.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Un PROTOCOLO (EjercicioGym) y 3 CLASES que se conforman
//              a él: CardioGym, FuerzaGym y FlexibilidadGym. Las 3 tienen
//              los mismos nombres de propiedades y métodos, pero cada
//              una CALCULA las calorías con su propia fórmula.
//  ÚSALO PARA: "define un protocolo e impleméntalo en 2-3 clases"
//              (Clase 8). Ej: Figura (círculo/cuadrado), Empleado
//              (por hora/fijo), Vehículo (auto/bici), Personaje…
//  BUSCA:      protocol, protocolo, class, clase, conformar, conforms,
//              get set, init, metodo, polimorfismo, interfaz, calorias
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/EjercicioGym.swift (Swift File).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (nombres, fórmulas, textos).
//  NECESITA:   nada más (solo Foundation).
// ═══════════════════════════════════════════════════════════════

import Foundation

// ── 1. El protocolo: la LISTA de lo que toda clase debe tener ──────
// Un protocolo NO tiene código: solo dice "quien se conforme a mí
// tiene que tener ESTO". Es como un contrato (en otros lenguajes se
// llama interfaz).
//   { get }     = basta con poder LEERLA (la clase puede usar let).
//   { get set } = también se debe poder MODIFICAR (tiene que ser var).
protocol EjercicioGym {                                   // ✏️ nombre del protocolo
    var nombre: String { get }
    var grupoMuscular: String { get }
    var icono: String { get }                             // SF Symbol para dibujarlo
    var tipo: String { get }                              // "Cardio", "Fuerza" o "Flexibilidad"
    var vecesRealizado: Int { get set }                   // { get set }: cambia cada vez que lo haces

    func caloriasQuemadas(minutos: Int, pesoPersona: Double) -> Double
    func descripcionRutina() -> String
    func registrarVez()                                   // suma 1 a vecesRealizado
}

// ── 2. CardioGym: calorías según el MET y TU peso ──────────────────
// "class CardioGym: EjercicioGym" = la clase se CONFORMA al protocolo.
// Si le falta algo de la lista, Xcode marca error:
// "Type 'CardioGym' does not conform to protocol 'EjercicioGym'".
class CardioGym: EjercicioGym {
    let nombre: String
    let grupoMuscular: String
    let icono: String
    let tipo = "Cardio"
    var vecesRealizado: Int
    let met: Double              // qué tan intenso es (correr ≈ 9, caminar ≈ 3.5)

    // Las clases NO tienen init automático: hay que escribirlo.
    init(nombre: String, grupoMuscular: String, icono: String, met: Double) {
        self.nombre = nombre
        self.grupoMuscular = grupoMuscular
        self.icono = icono
        self.met = met
        self.vecesRealizado = 0
    }

    // Fórmula de cardio: MET × peso (kg) × horas.
    func caloriasQuemadas(minutos: Int, pesoPersona: Double) -> Double {
        return met * pesoPersona * Double(minutos) / 60
    }

    func descripcionRutina() -> String {
        return "Mantén un ritmo constante todo el tiempo. Intensidad: \(met) MET."
    }

    func registrarVez() {
        vecesRealizado += 1
    }
}

// ── 3. FuerzaGym: descansas entre series, cuenta solo el 70% ──────
class FuerzaGym: EjercicioGym {
    let nombre: String
    let grupoMuscular: String
    let icono: String
    let tipo = "Fuerza"
    var vecesRealizado: Int
    let seriesSugeridas: Int
    let repeticionesSugeridas: Int

    init(nombre: String, grupoMuscular: String, icono: String, seriesSugeridas: Int, repeticionesSugeridas: Int) {
        self.nombre = nombre
        self.grupoMuscular = grupoMuscular
        self.icono = icono
        self.seriesSugeridas = seriesSugeridas
        self.repeticionesSugeridas = repeticionesSugeridas
        self.vecesRealizado = 0
    }

    // Fórmula de fuerza: MET 5, pero solo el 70% del tiempo es esfuerzo
    // (el resto es descanso entre series).
    func caloriasQuemadas(minutos: Int, pesoPersona: Double) -> Double {
        let minutosActivos = Double(minutos) * 0.7
        return 5.0 * pesoPersona * minutosActivos / 60
    }

    func descripcionRutina() -> String {
        return "\(seriesSugeridas) series de \(repeticionesSugeridas) repeticiones. Descansa 90 segundos entre series."
    }

    func registrarVez() {
        vecesRealizado += 1
    }
}

// ── 4. FlexibilidadGym: calorías fijas por minuto (no usa el peso) ─
class FlexibilidadGym: EjercicioGym {
    let nombre: String
    let grupoMuscular = "Flexibilidad"
    let icono: String
    let tipo = "Flexibilidad"
    var vecesRealizado: Int

    init(nombre: String, icono: String) {
        self.nombre = nombre
        self.icono = icono
        self.vecesRealizado = 0
    }

    // Fórmula de flexibilidad: 2.5 kcal por minuto, pesen lo que pesen.
    // El parámetro pesoPersona existe porque el PROTOCOLO lo pide,
    // aunque esta clase no lo use.
    func caloriasQuemadas(minutos: Int, pesoPersona: Double) -> Double {
        return 2.5 * Double(minutos)
    }

    func descripcionRutina() -> String {
        return "Sostén cada postura 30 segundos y respira profundo. Sin rebotes."
    }

    func registrarVez() {
        vecesRealizado += 1
    }
}

// ── 5. ¿Por qué cada clase calcula distinto? (polimorfismo) ────────
// Todas se usan IGUAL:   ejercicio.caloriasQuemadas(minutos: 30, pesoPersona: 70)
// pero cada una responde con SU fórmula. El código que las usa no
// necesita saber si es Cardio, Fuerza o Flexibilidad: solo sabe que
// cumple el protocolo. Por eso una lista puede ser del tipo del
// protocolo y guardar las 3 clases mezcladas:
//     let catalogo: [EjercicioGym] = [CardioGym(...), FuerzaGym(...), ...]
// (En Swift nuevo a veces verás  [any EjercicioGym]: es lo mismo,
//  el "any" solo hace explícito que ahí cabe cualquier clase que cumpla.)
