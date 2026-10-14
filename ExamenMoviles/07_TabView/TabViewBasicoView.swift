// ═══════════════════════════════════════════════════════════════
//  TabViewBasicoView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     App con 3 pestañas abajo (TabView). Cada pestaña tiene
//              su ícono (SF Symbol), su texto y su fondo.
//  ÚSALO PARA: organizar la app en secciones: Inicio / Lista / Perfil.
//  BUSCA:      tabview, pestañas, pestanas, tabs, tab bar, barra de abajo,
//              tabItem, label, systemImage, tint, menu inferior
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TabViewBasicoView.swift (o pégalo en ContentView).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️. En tu app, normalmente cada pestaña es
//      su propia vista:  InicioView().tabItem { ... }
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TabViewBasicoView: View {
    var body: some View {
        TabView {

            // ── Pestaña 1 ───────────────────────────────────────────
            ZStack {
                Color.orange.opacity(0.15)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(.orange)
                    Text("Inicio")                              // ✏️
                        .font(.largeTitle)
                        .bold()
                    Text("Esta es la primera pestaña.")
                        .foregroundStyle(.secondary)
                }
            }
            .tabItem {
                Label("Inicio", systemImage: "house.circle")    // ✏️ texto e ícono
            }

            // ── Pestaña 2 ───────────────────────────────────────────
            ZStack {
                Color.blue.opacity(0.15)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Image(systemName: "list.bullet.rectangle.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(.blue)
                    Text("Lista")
                        .font(.largeTitle)
                        .bold()
                    Text("Aquí iría tu List.")
                        .foregroundStyle(.secondary)
                }
            }
            .tabItem {
                Label("Lista", systemImage: "list.bullet")
            }

            // ── Pestaña 3 ───────────────────────────────────────────
            ZStack {
                Color.green.opacity(0.15)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(.green)
                    Text("Perfil")
                        .font(.largeTitle)
                        .bold()
                    Text("Aquí irían tus datos.")
                        .foregroundStyle(.secondary)
                }
            }
            .tabItem {
                Label("Perfil", systemImage: "person.circle")
            }
        }
        // .tint sobre el TabView = color de la pestaña seleccionada
        .tint(.orange)                                          // ✏️
    }
}

#Preview {
    TabViewBasicoView()
}
