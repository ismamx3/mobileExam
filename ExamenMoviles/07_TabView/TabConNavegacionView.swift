// ═══════════════════════════════════════════════════════════════
//  TabConNavegacionView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     TabView donde CADA pestaña tiene su propio
//              NavigationStack, con NavigationLinks adentro.
//  ÚSALO PARA: apps con pestañas que además navegan a un detalle
//              (pestaña Lista → detalle del elemento).
//  BUSCA:      tabview con navegacion, navigationstack dentro de tab,
//              pestañas con detalle, tab navigation, navigationlink en tab
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TabConNavegacionView.swift
//   2. Pega el archivo completo (trae TabNavDetalleView al final).
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//
//  ¿POR QUÉ EL NavigationStack VA DENTRO DE CADA PESTAÑA?
//   - Cada pestaña guarda su propio historial: si navegas en "Inicio",
//     cambias a "Favoritos" y regresas, sigues donde estabas.
//   - La barra de pestañas se queda visible al entrar a un detalle.
//   - Cada pestaña tiene su propio título.
//   Si pones UN NavigationStack afuera del TabView, al navegar el detalle
//   tapa la barra de pestañas y todas comparten un solo título.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TabConNavegacionView: View {
    var body: some View {
        TabView {

            // ── Pestaña 1: su propio NavigationStack ────────────────
            NavigationStack {
                List {
                    NavigationLink("Noticias") {                         // ✏️
                        TabNavDetalleView(titulo: "Noticias", icono: "newspaper.fill")
                    }
                    NavigationLink("Eventos") {
                        TabNavDetalleView(titulo: "Eventos", icono: "calendar")
                    }
                    NavigationLink("Avisos") {
                        TabNavDetalleView(titulo: "Avisos", icono: "megaphone.fill")
                    }
                }
                .listStyle(.inset)
                .navigationTitle("Inicio")
            }
            .tabItem {
                Label("Inicio", systemImage: "house")
            }

            // ── Pestaña 2: otro NavigationStack independiente ───────
            NavigationStack {
                List {
                    NavigationLink("Canción favorita") {
                        TabNavDetalleView(titulo: "Canción favorita", icono: "music.note")
                    }
                    NavigationLink("Película favorita") {
                        TabNavDetalleView(titulo: "Película favorita", icono: "film.fill")
                    }
                }
                .listStyle(.inset)
                .navigationTitle("Favoritos")
            }
            .tabItem {
                Label("Favoritos", systemImage: "star")
            }
        }
        .tint(.purple)
    }
}

// ═══════════════════════════════════════════════════════════════
//  TabNavDetalleView — pantalla destino sencilla (sin NavigationStack,
//  porque ya viene del de su pestaña).
// ═══════════════════════════════════════════════════════════════
struct TabNavDetalleView: View {

    var titulo: String
    var icono: String

    var body: some View {
        ZStack {
            Color.purple.opacity(0.1)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: icono)
                    .font(.system(size: 70))
                    .foregroundStyle(.purple)
                Text(titulo)
                    .font(.largeTitle)
                    .bold()
                Text("Fíjate: la barra de pestañas sigue abajo.")
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle(titulo)
    }
}

#Preview {
    TabConNavegacionView()
}
