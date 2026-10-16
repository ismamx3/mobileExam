// ═══════════════════════════════════════════════════════════════
//  EntrenamientoGym.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El MODELO de un entrenamiento registrado (el "molde" de
//              cada renglón del historial). Lleva fecha (Date) y
//              propiedades calculadas para mostrarla bonita.
//  ÚSALO PARA: cualquier registro con fecha: entrenamientos, comidas,
//              gastos, citas…
//  BUSCA:      struct, modelo, Identifiable, Codable, Equatable, Date,
//              fecha, DateFormatter, propiedad calculada, computed
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/EntrenamientoGym.swift.
//   2. Pega el archivo y cambia los campos marcados con ✏️.
//  NECESITA:   nada más (solo Foundation).
//  ⚠️ NO VISTO EN CLASE: Equatable (deja comparar dos listas con ==;
//     lo necesita .onChange(of: lista) para saber si la lista cambió).
// ═══════════════════════════════════════════════════════════════

import Foundation

// Identifiable → List/ForEach saben cuál renglón es cuál (por el id).
// Codable      → se puede convertir a JSON para GUARDARLO (PersistenciaGym).
// Equatable    → Swift puede comparar dos entrenamientos con ==.
struct EntrenamientoGym: Identifiable, Codable, Equatable {
    var id: Int                     // único: nunca repetir (y nunca mostrarlo)
    var ejercicio: String           // ✏️ tus campos
    var grupo: String
    var tipo: String
    var icono: String
    var minutos: Int
    var series: Int
    var repeticiones: Int
    var peso: Double                // kg levantados (0 si no aplica)
    var calorias: Double
    var intensidad: String
    var esRecord: Bool
    var fecha: Date                 // Date guarda fecha Y hora juntas

    // ── Propiedades calculadas: se recalculan solas ─────────────────
    // La fecha se GUARDA como Date y se CONVIERTE a texto solo para
    // mostrarla (3 pasos de la Clase 3B: formateador → formato → string).
    var fechaTexto: String {
        let formato = DateFormatter()
        formato.dateFormat = "EEE d 'de' MMMM"            // "jue 15 de octubre"
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: fecha)
    }

    var fechaCompletaTexto: String {
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.full      // "jueves, 15 de octubre de 2026"
        formato.timeStyle = DateFormatter.Style.short     // "7:30 p.m."
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: fecha)
    }

    var seriesTexto: String {
        if tipo == "Fuerza" {
            return "\(series) × \(repeticiones)"
        }
        return "—"
    }
}
