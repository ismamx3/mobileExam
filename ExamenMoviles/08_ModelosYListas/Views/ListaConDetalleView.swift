// ═══════════════════════════════════════════════════════════════
//  ListaConDetalleView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista donde cada renglón abre una pantalla de DETALLE.
//  ÚSALO PARA: "al tocar un elemento, ver su información completa".
//  BUSCA:      lista con detalle, navigationlink, list detail, navegar, master detail, tocar renglon
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaConDetalleView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Components/JugadorRow.swift
//              08_ModelosYListas/Views/DetalleJugadorView.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaConDetalleView: View {

    @State private var jugadores = cargarJugadores()       // ✏️ tus datos

    var body: some View {
        // Pantalla RAÍZ: lleva su propio NavigationStack.
        // Si la metes dentro de un TabView, el NavigationStack va dentro de la pestaña.
        NavigationStack {
            List(jugadores) { jugadorItem in

                // ── Renglón que navega ───────────────────────────────
                // Lo que va en { } es el DESTINO; lo que va en label: es lo que se VE.
                NavigationLink {
                    DetalleJugadorView(jugador: jugadorItem)    // ✏️ tu detalle
                } label: {
                    JugadorRow(jugador: jugadorItem)            // ✏️ tu renglón
                }
            }
            .listStyle(.inset)
            // navigationTitle va sobre el CONTENIDO (el List), no sobre el NavigationStack.
            .navigationTitle("Jugadores")                       // ✏️ tu título
        }
    }
}

#Preview {
    ListaConDetalleView()
}
