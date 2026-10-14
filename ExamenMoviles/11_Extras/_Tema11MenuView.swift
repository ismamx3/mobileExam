// ═══════════════════════════════════════════════════════════════
//  _Tema11MenuView.swift  ·  11 Extras (menú del tema)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo es el menú del simulador que
//  lleva a cada ejemplo del tema.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema11MenuView: View {
    var body: some View {
        List {
            Section("Persistencia (guardar al cerrar la app)") {
                NavigationLink {
                    AppStorageView()
                } label: {
                    EjemploRow(titulo: "Ajustes con @AppStorage", archivo: "11_Extras/AppStorageView.swift", icono: "gearshape.fill")
                }
                NavigationLink {
                    UserDefaultsView()
                } label: {
                    EjemploRow(titulo: "UserDefaults a mano (guardar, leer, borrar)", archivo: "11_Extras/UserDefaultsView.swift", icono: "externaldrive.fill")
                }
            }

            Section("Sonido") {
                NavigationLink {
                    SonidoView()
                } label: {
                    EjemploRow(titulo: "Reproducir un mp3", archivo: "11_Extras/SonidoView.swift", icono: "music.note")
                }
            }
        }
        .navigationTitle("11 · Extras")
    }
}

#Preview {
    NavigationStack {
        Tema11MenuView()
    }
}
