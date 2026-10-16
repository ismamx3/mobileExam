// ═══════════════════════════════════════════════════════════════
//  AgendaAppView.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La pantalla RAÍZ de "Mi Agenda": un TabView con 5
//              pestañas. Es la DUEÑA de la lista de eventos (@State) y
//              la reparte:
//                - Agenda la MODIFICA (agregar, borrar, completar) → con $
//                - Hoy, Semana y Progreso solo la LEEN               → sin $
//              Así, si completas algo en Agenda, Hoy y Progreso lo ven
//              al instante (es la MISMA lista, no una copia).
//  ÚSALO PARA: el esqueleto de una app con varias pestañas que
//              comparten datos.
//  BUSCA:      TabView, pestañas, raiz, root, agenda, compartir datos,
//              @State, @Binding, tabItem, tint
//
//  CÓMO COPIARLO:
//   1. Copia la carpeta 14_AppAgenda completa a tu proyecto
//      (arrástrala a Xcode con "Copy items if needed").
//   2. En TuAppApp.swift cambia ContentView() por AgendaAppView().
//  NECESITA:   toda la carpeta 14_AppAgenda.
//  DE CLASE (Clase 7): cada pestaña = una vista + .tabItem { Label(...) },
//     y .tint(...) para el color de la pestaña seleccionada.
//  ⚠️ NO VISTO EN CLASE: .preferredColorScheme(.light) (lo usaste en Movil2).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AgendaAppView: View {

    // UN solo dueño de la lista. Las demás pantallas la reciben.
    @State private var eventos = cargarEventosAgenda()

    let paleta = PaletaAgenda()

    var body: some View {
        TabView {
            AgendaHoyView(eventos: eventos)                          // solo lee
                .tabItem {
                    Label("Hoy", systemImage: "sun.max.fill")
                }

            AgendaListaView(eventos: $eventos)                       // modifica
                .tabItem {
                    Label("Agenda", systemImage: "calendar")
                }

            AgendaSemanaView(eventos: eventos)                       // solo lee
                .tabItem {
                    Label("Semana", systemImage: "calendar.day.timeline.left")
                }

            AgendaProgresoView(eventos: eventos)                     // solo lee
                .tabItem {
                    Label("Progreso", systemImage: "chart.xyaxis.line")
                }

            AgendaGuiaFechasView()                                   // laboratorio de fechas
                .tabItem {
                    Label("Fechas", systemImage: "testtube.2")
                }
        }
        .tint(paleta.primario)
        // ⚠️ NO VISTO EN CLASE: la paleta es clara; así el texto del sistema
        // no sale blanco si el iPhone está en modo oscuro.
        .preferredColorScheme(.light)
    }
}

#Preview {
    AgendaAppView()
}
