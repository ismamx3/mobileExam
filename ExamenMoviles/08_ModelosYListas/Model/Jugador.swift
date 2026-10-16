// ═══════════════════════════════════════════════════════════════
//  Jugador.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El MODELO (struct) de un elemento de la lista.
//  ÚSALO PARA: cualquier lista: productos, alumnos, canciones, mascotas…
//              Clase: carpeta "Model" → archivo Jugador.swift con el struct
//              (id, nombre, apellido, numero, estatura). Los campos posicion,
//              imagen y esFavorito son extra de este repo.
//  BUSCA:      modelo, model, struct, Identifiable, id, propiedad calculada, computed property,
//              estructura, modelar, carpeta Model
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea la carpeta Model y adentro Model/Jugador.swift
//      (cámbiale el nombre a tu tema).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (nombre del struct y sus campos).
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import Foundation

// En clase primero se escribe el struct solo (struct Jugador { ... }) y luego,
// para que la lista lea DINÁMICAMENTE todo el arreglo, se le agrega el
// protocolo Identifiable.
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
