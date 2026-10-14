// ═══════════════════════════════════════════════════════════════
//  TabDatosCompartidosView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Dos pestañas que trabajan sobre la MISMA lista.
//              La pestaña "Tareas" agrega y marca (con @Binding).
//              La pestaña "Resumen" solo lee y muestra el avance.
//              Lo que cambias en una se ve en la otra al instante.
//  ÚSALO PARA: lista + estadísticas, carrito + total, registro + gráfica.
//  BUSCA:      compartir datos entre pestañas, tabview binding, state en
//              tabview, datos compartidos, shared data, pasar lista a tab
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TabDatosCompartidosView.swift (o pégalo en ContentView).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   07_TabView/Model/TareaTab.swift
//              07_TabView/TareasListaTabView.swift
//              07_TabView/TareasResumenTabView.swift
//
//  LA IDEA (para defenderlo):
//   El @State vive en la vista que CONTIENE el TabView (la dueña) y se
//   reparte hacia abajo:
//     - con $  → la pestaña puede MODIFICAR la lista (@Binding)
//     - sin $  → la pestaña solo LEE la lista (var normal)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TabDatosCompartidosView: View {

    // La dueña de los datos: se cargan una vez.
    @State private var tareas = cargarTareasTab()          // ✏️ tu función de datos

    var body: some View {
        TabView {
            // Con $: puede modificar
            TareasListaTabView(tareas: $tareas)
                .tabItem {
                    Label("Tareas", systemImage: "checklist")
                }

            // Sin $: solo lee
            TareasResumenTabView(tareas: tareas)
                .tabItem {
                    Label("Resumen", systemImage: "chart.pie")
                }
        }
        .tint(.green)
    }
}

#Preview {
    TabDatosCompartidosView()
}
