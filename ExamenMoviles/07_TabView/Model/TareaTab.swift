// ═══════════════════════════════════════════════════════════════
//  TareaTab.swift  ·  07 TabView (Model)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El modelo (struct Identifiable) y los datos fijos que
//              comparten las pestañas de TabDatosCompartidosView.
//  ÚSALO PARA: cualquier lista que dos pestañas usan al mismo tiempo.
//  BUSCA:      modelo, struct, identifiable, tarea, datos fijos, model data
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/TareaTab.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (campos y datos de ejemplo)
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import Foundation

// Identifiable exige una propiedad llamada exactamente "id".
// Eso deja que List distinga cada elemento.
struct TareaTab: Identifiable {
    var id: Int
    var titulo: String          // ✏️
    var completada: Bool
}

// Datos fijos: una función que regresa el arreglo.
// La vista dueña de los datos la llama una sola vez.
func cargarTareasTab() -> [TareaTab] {
    return [
        TareaTab(id: 1, titulo: "Estudiar SwiftUI", completada: true),     // ✏️
        TareaTab(id: 2, titulo: "Repasar TabView", completada: false),
        TareaTab(id: 3, titulo: "Hacer la gráfica", completada: false),
        TareaTab(id: 4, titulo: "Subir a Canvas", completada: false)
    ]
}
