// ═══════════════════════════════════════════════════════════════
//  TabViewUnArchivoView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Versión RÁPIDA del TabView: 3 pestañas escritas en un
//              solo archivo (el contenido de cada pestaña va adentro).
//              La forma de CLASE (cada pestaña es su propia vista:
//              PrincipalView, DetallesView, EvolucionesView) está en
//              07_TabView/TabViewBasicoView.swift. Usa esa si puedes.
//  ÚSALO PARA: probar pestañas en 1 minuto sin crear más archivos.
//  BUSCA:      tabview rapido, un solo archivo, pestañas, pestanas, tabs,
//              tab bar, barra de abajo, tabItem, label, systemImage, tint
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TabViewUnArchivoView.swift (o pégalo en ContentView).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️.
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TabViewUnArchivoView: View {
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
        // "Cambiar el color de ícono" (clase): .tint sobre el TabView
        // pinta el ícono y el texto de la pestaña seleccionada.
        .tint(.orange)                                          // ✏️
    }
}

#Preview {
    TabViewUnArchivoView()
}
