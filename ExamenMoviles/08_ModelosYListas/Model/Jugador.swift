// ═══════════════════════════════════════════════════════════════
//  Jugador.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El MODELO (struct) de un elemento de la lista.
//  ÚSALO PARA: cualquier lista: productos, alumnos, canciones, mascotas…
//  BUSCA:      modelo, model, struct, Identifiable, id, propiedad calculada, computed property
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/Jugador.swift (cámbiale el nombre a tu tema).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (nombre del struct y sus campos).
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import Foundation

// Identifiable exige una propiedad llamada EXACTAMENTE `id`.
// Gracias a eso, List(lista) sabe distinguir cada renglón sin ayuda extra.
struct Jugador: Identifiable {           // ✏️ nombre de tu modelo
    var id: Int
    var nombre: String                   // ✏️ tus campos
    var apellido: String
    var numero: Int
    var estatura: Double
    var posicion: String
    var imagen: String                   // nombre del asset (texto), NO un Image
    var esFavorito: Bool

    // Propiedad calculada: no se guarda, se arma cada vez que se pide.
    var nombreCompleto: String {
        return "\(nombre) \(apellido)"
    }
}
