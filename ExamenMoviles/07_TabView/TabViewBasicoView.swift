// ═══════════════════════════════════════════════════════════════
//  TabViewBasicoView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El TabView EXACTO de la clase (Clase 7): 3 pestañas
//              abajo, cada una es su PROPIA vista:
//                PrincipalView · DetallesView · EvolucionesView
//              (el ejemplo de Charmander de la presentación).
//  ÚSALO PARA: organizar tu app en secciones con pestañas abajo.
//  BUSCA:      tabview, tab view, pestañas, pestanas, tabs, tab bar,
//              barra de abajo, tabItem, label, systemImage, tint,
//              cambiar el color de icono, PrincipalView, DetallesView,
//              EvolucionesView, EjemploTabView, charmander
//
//  CÓMO COPIARLO (pasos de la clase):
//   1. Crea una carpeta Views (clic derecho a la carpeta principal
//      > New Folder).
//   2. Dentro, crea las 3 vistas (New File > SwiftUI View) que van en
//      cada pestaña. Copia: PrincipalView.swift, DetallesView.swift,
//      EvolucionesView.swift y PokemonEncabezado.swift.
//   3. En tu ContentView pega el body de abajo (VStack + TabView).
//   4. Cambia lo marcado con ✏️. Íconos: https://developer.apple.com/sf-symbols/
//  NECESITA:   07_TabView/PrincipalView.swift
//              07_TabView/DetallesView.swift
//              07_TabView/EvolucionesView.swift
//              07_TabView/PokemonEncabezado.swift
//  Versión rápida en un solo archivo: 07_TabView/TabViewUnArchivoView.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// ✏️ En tu app esto es tu ContentView
struct TabViewBasicoView: View {
    var body: some View {
        // La clase pide: "Dentro de la vista principal ContentView,
        // agregar un VStack y dentro de él, el elemento TabView".
        VStack {
            TabView {
                // Cada vista lleva su .tabItem con un Label (texto + ícono).
                PrincipalView()
                    .tabItem {
                        // En la lámina dice "Home". Aquí "Inicio" para no
                        // mezclar inglés y español en la app (se califica).
                        Label("Inicio", systemImage: "house.circle")             // ✏️
                    }

                DetallesView()
                    .tabItem {
                        Label("Detalle", systemImage: "doc.richtext.fill")       // ✏️
                    }

                EvolucionesView()
                    .tabItem {
                        Label("Evoluciones", systemImage: "bolt.heart.fill")     // ✏️
                    }
            }
            // "Cambiar el color de ícono": .tint va sobre el TabView
            // y pinta la pestaña seleccionada.
            .tint(.orange)                                                       // ✏️
        }
    }
}

#Preview {
    TabViewBasicoView()
}
