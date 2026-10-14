// ═══════════════════════════════════════════════════════════════
//  ListaSeccionesView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista dividida en SECCIONES con título (agrupada por categoría).
//  ÚSALO PARA: agrupar: "Frutas / Verduras", "Pendientes / Hechas", por posición…
//  BUSCA:      section, seccion, secciones, agrupar, group, header, encabezado, footer, insetGrouped
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaSeccionesView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Components/JugadorRow.swift
//  ⚠️ NO VISTO EN CLASE: Section, ForEach dentro de List
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaSeccionesView: View {

    @State private var jugadores = cargarJugadores()         // ✏️ tus datos

    // Regresa solo los jugadores de una posición.
    func jugadoresDe(_ posicion: String) -> [Jugador] {
        var resultado: [Jugador] = []
        for jugador in jugadores {
            if jugador.posicion == posicion {                // ✏️ campo para agrupar
                resultado.append(jugador)
            }
        }
        return resultado
    }

    var body: some View {
        List {
            // ── Una Section por categoría ────────────────────────────
            // ⚠️ NO VISTO EN CLASE: Section agrupa renglones con un título arriba
            // (header) y un texto abajo (footer). ForEach es como List(lista) { }
            // pero se puede poner DENTRO de otra cosa (una Section, un VStack).
            Section {
                ForEach(jugadoresDe("Base")) { jugadorItem in        // ✏️
                    JugadorRow(jugador: jugadorItem)
                }
            } header: {
                Text("Bases")                                        // ✏️
            } footer: {
                Text("\(jugadoresDe("Base").count) jugadores")
            }

            Section {
                ForEach(jugadoresDe("Alero")) { jugadorItem in
                    JugadorRow(jugador: jugadorItem)
                }
            } header: {
                Text("Aleros")
            } footer: {
                Text("\(jugadoresDe("Alero").count) jugadores")
            }

            // Forma corta: solo con título.
            Section("Pívots") {
                ForEach(jugadoresDe("Pívot")) { jugadorItem in
                    JugadorRow(jugador: jugadorItem)
                }
            }
        }
        // .insetGrouped es el estilo que mejor luce con secciones.
        .listStyle(.insetGrouped)
        .navigationTitle("Por posición")                             // ✏️
    }
}

#Preview {
    NavigationStack {
        ListaSeccionesView()
    }
}
