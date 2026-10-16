// ═══════════════════════════════════════════════════════════════
//  ListaSimpleView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La lista básica de clase: List(arreglo) + renglón.
//              En clase esta vista se llamó ListaJugadoresView (o se hizo
//              directo en ContentView).
//              Trae dos versiones:
//                · ListaSimpleView: la DINÁMICA (lee todo el arreglo).
//                · ListaEstaticaJugadoresView: el primer paso de clase,
//                  renglón por renglón con listaJugadores[0], [1]…
//  ÚSALO PARA: mostrar un arreglo de datos sin navegar a ningún lado.
//  BUSCA:      list, lista, List, listStyle, inset, plain, grouped, insetGrouped, tabla,
//              ListaJugadoresView, lista dinamica, lista estatica, jugadorItem
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea la carpeta Views y adentro Views/ListaJugadoresView.swift
//      (o pega el List dentro de tu ContentView).
//   2. Pega el struct que quieras.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift (función + var listaJugadores)
//              08_ModelosYListas/Components/JugadorRow.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaSimpleView: View {
    var body: some View {

        // ── 1. Lista dinámica (la de clase) ──────────────────────────
        // Lee TODO lo que tiene el arreglo. Funciona porque Jugador es
        // Identifiable (tiene `id`). jugadorItem es cada jugador del arreglo.
        List(listaJugadores){ jugadorItem in              // ✏️ tu arreglo
            JugadorRow(jugador: jugadorItem)              // ✏️ tu renglón
        }
        // ── 2. Estilo de la lista ────────────────────────────────────
        // En clase usamos .inset. Otros: .plain  .grouped  .insetGrouped
        // (ejemplos: https://sarunw.com/posts/swiftui-list-style/)
        .listStyle(.inset)
        .navigationTitle("Jugadores")                     // ✏️ tu título

        // Esta pantalla solo LEE, por eso usa la var global de ModelData.
        // Si vas a agregar/borrar/editar, la vista debe ser dueña de los datos:
        //     @State private var jugadores = cargarJugadores()
        //     List(jugadores) { jugadorItem in ... }
    }
}

// ── Primer paso de clase: lista ESTÁTICA ────────────────────────
// Un JugadorRow por cada posición del arreglo, escrito a mano.
// Sirve para probar el renglón; luego se cambia por la dinámica de arriba.
struct ListaEstaticaJugadoresView: View {
    var body: some View {
        VStack {
            List{
                JugadorRow(jugador: listaJugadores[0])    // ✏️
                JugadorRow(jugador: listaJugadores[1])
                JugadorRow(jugador: listaJugadores[2])
                JugadorRow(jugador: listaJugadores[3])
            }
            .listStyle(.inset)
        }
        .navigationTitle("Lista estática")                // ✏️
    }
}

#Preview("Dinámica") {
    NavigationStack {
        ListaSimpleView()
    }
}

#Preview("Estática") {
    NavigationStack {
        ListaEstaticaJugadoresView()
    }
}
