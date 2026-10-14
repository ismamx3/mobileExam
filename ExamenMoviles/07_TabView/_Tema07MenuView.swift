// ═══════════════════════════════════════════════════════════════
//  _Tema07MenuView.swift  ·  07 TabView (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo es el menú de este tema dentro de
//  la app del repo. Los ejemplos con TabView propio se abren a
//  pantalla completa (botón ✕ para regresar).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema07MenuView: View {
    var body: some View {
        List {
            Section("Pestañas") {
                EjemploPantallaCompleta(titulo: "TabView básico (3 pestañas)", archivo: "07_TabView/TabViewBasicoView.swift", icono: "rectangle.split.3x1") {
                    TabViewBasicoView()
                }
                EjemploPantallaCompleta(titulo: "Pestañas con navegación", archivo: "07_TabView/TabConNavegacionView.swift", icono: "rectangle.stack") {
                    TabConNavegacionView()
                }
                EjemploPantallaCompleta(titulo: "Datos compartidos entre pestañas", archivo: "07_TabView/TabDatosCompartidosView.swift", icono: "arrow.triangle.2.circlepath") {
                    TabDatosCompartidosView()
                }
                EjemploPantallaCompleta(titulo: "Cambiar de pestaña por código + badge", archivo: "07_TabView/TabSeleccionView.swift", icono: "app.badge") {
                    TabSeleccionView()
                }
            }

            Section("Páginas que se deslizan") {
                NavigationLink {
                    CarruselView()
                } label: {
                    EjemploRow(titulo: "Carrusel de fotos", archivo: "07_TabView/CarruselView.swift", icono: "photo.on.rectangle.angled")
                }
                EjemploPantallaCompleta(titulo: "Onboarding (bienvenida)", archivo: "07_TabView/OnboardingView.swift", icono: "hand.wave") {
                    OnboardingView()
                }
            }
        }
        .navigationTitle("07 · TabView")
    }
}

#Preview {
    NavigationStack {
        Tema07MenuView()
    }
}
