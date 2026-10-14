// ═══════════════════════════════════════════════════════════════
//  ListaSimpleView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La lista más básica: List(arreglo) + renglón.
//  ÚSALO PARA: mostrar un arreglo de datos sin navegar a ningún lado.
//  BUSCA:      list, lista, listStyle, inset, plain, grouped, insetGrouped, tabla
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaSimpleView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Components/JugadorRow.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaSimpleView: View {

    // Esta vista es DUEÑA de los datos: los carga una sola vez.
    @State private var jugadores = cargarJugadores()      // ✏️ tu función de datos

    var body: some View {

        // ── 1. Lista dinámica ────────────────────────────────────────
        // Funciona porque Jugador es Identifiable (tiene `id`).
        List(jugadores) { jugadorItem in
            JugadorRow(jugador: jugadorItem)              // ✏️ tu renglón
        }
        // ── 2. Estilo de la lista ────────────────────────────────────
        // Otros estilos: .plain   .grouped   .insetGrouped
        .listStyle(.inset)
        .navigationTitle("Jugadores")                     // ✏️ tu título
    }
}

#Preview {
    NavigationStack {
        ListaSimpleView()
    }
}
