// ═══════════════════════════════════════════════════════════════
//  ListaBuscarFiltrarView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista con BUSCADOR, FILTRO por categoría y ORDEN.
//  ÚSALO PARA: "buscar por nombre", "mostrar solo los de tipo X", "ordenar por…".
//  BUSCA:      buscar, buscador, search, searchable, filtrar, filter, ordenar, sort, categoria, sin resultados
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaBuscarFiltrarView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Components/JugadorRow.swift
//  ⚠️ NO VISTO EN CLASE: .searchable (barra de búsqueda), .sort (ordenar),
//                        .lowercased() / .contains() (comparar textos)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaBuscarFiltrarView: View {

    @State private var jugadores = cargarJugadores()          // ✏️ tus datos
    @State private var textoBusqueda = ""
    @State private var posicionElegida = "Todas"
    @State private var orden = "Original"

    // La lista que SÍ se muestra. Es calculada: se rehace sola cada vez
    // que cambia el texto, el filtro o el orden. El arreglo original no se toca.
    var jugadoresFiltrados: [Jugador] {
        var resultado: [Jugador] = []

        for jugador in jugadores {
            // ¿Coincide con lo que escribió? (sin importar mayúsculas)
            let coincideTexto = textoBusqueda.isEmpty ||
                jugador.nombreCompleto.lowercased().contains(textoBusqueda.lowercased())   // ✏️ campo a buscar

            // ¿Es de la categoría elegida?
            let coincidePosicion = posicionElegida == "Todas" || jugador.posicion == posicionElegida   // ✏️ campo a filtrar

            if coincideTexto && coincidePosicion {
                resultado.append(jugador)
            }
        }

        // ⚠️ NO VISTO EN CLASE: sort ordena el arreglo; { a, b in a.x < b.x }
        // dice "a va antes que b si su x es menor".
        if orden == "Nombre" {
            resultado.sort { a, b in a.nombre < b.nombre }        // ✏️
        } else if orden == "Número" {
            resultado.sort { a, b in a.numero < b.numero }        // ✏️
        }

        return resultado
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {

                // ── 1. Filtro por categoría ──────────────────────────
                Picker(selection: $posicionElegida, label: Text("Posición")) {
                    Text("Todas").tag("Todas")
                    Text("Base").tag("Base")                      // ✏️ tus categorías
                    Text("Alero").tag("Alero")
                    Text("Pívot").tag("Pívot")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                // ── 2. Orden ─────────────────────────────────────────
                Picker(selection: $orden, label: Text("Orden")) {
                    Text("Original").tag("Original")
                    Text("Nombre").tag("Nombre")
                    Text("Número").tag("Número")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                // ── 3. Lista filtrada o mensaje de "sin resultados" ──
                if jugadoresFiltrados.isEmpty {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 50))
                        .foregroundStyle(.secondary)
                    Text("Sin resultados")
                        .foregroundStyle(.secondary)
                    Spacer()
                } else {
                    List(jugadoresFiltrados) { jugadorItem in
                        JugadorRow(jugador: jugadorItem)
                    }
                    .listStyle(.inset)
                }
            }
            .navigationTitle("Buscar")                            // ✏️
            // ── 4. Barra de búsqueda ─────────────────────────────────
            // ⚠️ NO VISTO EN CLASE: .searchable pone una barra de búsqueda bajo
            // el título y guarda lo escrito en textoBusqueda. Va DENTRO del NavigationStack.
            .searchable(text: $textoBusqueda, prompt: "Buscar jugador")    // ✏️
        }
    }
}

#Preview {
    ListaBuscarFiltrarView()
}
