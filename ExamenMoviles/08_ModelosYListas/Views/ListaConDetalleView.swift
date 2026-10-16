// ═══════════════════════════════════════════════════════════════
//  ListaConDetalleView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista donde cada renglón abre una pantalla de DETALLE.
//              Pasos de clase: (3) un NavigationStack que incluya la lista;
//              (4) cambiar el Row por un NavigationLink que lleve al
//              DetalleView y cuyo label: sea el JugadorRow.
//  ÚSALO PARA: "al tocar un elemento, ver su información completa".
//  BUSCA:      lista con detalle, navigationlink, list detail, navegar, master detail,
//              tocar renglon, DetalleView, label
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaJugadoresView.swift (o usa tu ContentView).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Components/JugadorRow.swift
//              08_ModelosYListas/Views/DetalleJugadorView.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaConDetalleView: View {
    var body: some View {
        // Pantalla RAÍZ: lleva su propio NavigationStack.
        // Si la metes dentro de un TabView, el NavigationStack va dentro de la pestaña.
        NavigationStack {
            // Esta pantalla solo LEE: usa la var listaJugadores de ModelData (como en clase).
            List(listaJugadores){ jugadorItem in                 // ✏️ tu arreglo

                // ── Renglón que navega ───────────────────────────────
                // Lo que va en { } es el DESTINO; lo que va en label: es lo que se VE.
                NavigationLink {
                    DetalleJugadorView(jugador: jugadorItem)    // ✏️ tu detalle (en clase: DetalleView)
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
