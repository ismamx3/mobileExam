// ═══════════════════════════════════════════════════════════════
//  Mascota.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El MODELO: la estructura de datos de una mascota.
//  ÚSALO PARA: cualquier "cosa" que tu app registre (producto, alumno,
//              película, receta…). Cambia el nombre y los campos.
//  BUSCA:      modelo, model, struct, Identifiable, propiedad calculada,
//              computed property, switch, UIImage en modelo
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/Mascota.swift.
//   2. Pega el archivo completo.
//   3. Cambia los campos marcados con ✏️
//      Si agregas un campo, también agrégalo en ModelDataMascotas.swift
//      (cada Mascota(...) de la lista) y en AgregarMascotaView.swift.
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: guardar un UIImage? (foto) dentro del modelo.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Identifiable exige un campo llamado exactamente `id`.
// Gracias a eso List y Chart distinguen cada mascota sin ayuda extra.
struct Mascota: Identifiable {
    var id: Int
    var nombre: String          // ✏️
    var especie: String         // ✏️ "Perro", "Gato"… (las opciones están en ModelDataMascotas.swift)
    var edad: Int               // ✏️ años
    var peso: Double            // ✏️ kg
    var imagen: String          // ✏️ NOMBRE del asset ("mascota") o "" si no tiene
    var vacunada: Bool          // ✏️

    // ⚠️ NO VISTO EN CLASE: la foto que el usuario eligió con PhotosPicker.
    // Es opcional (?) porque al principio no hay foto. Al ser opcional y `var`,
    // NO hace falta ponerla al crear una Mascota(...): vale nil solita.
    var foto: UIImage?

    // Propiedad calculada: no se guarda, se calcula cada vez que se pide.
    // Devuelve el SF Symbol según la especie.
    var iconoEspecie: String {
        switch especie {
        case "Perro":
            return "dog.fill"
        case "Gato":
            return "cat.fill"
        case "Ave":
            return "bird.fill"
        case "Pez":
            return "fish.fill"
        case "Conejo":
            return "hare.fill"
        default:
            return "pawprint.fill"
        }
    }

    // "1 año" o "3 años" (para no escribir "1 años").
    var textoEdad: String {
        if edad == 1 {
            return "1 año"
        } else {
            return "\(edad) años"
        }
    }
}
