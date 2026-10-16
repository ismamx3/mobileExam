// ═══════════════════════════════════════════════════════════════
//  _Tema12MenuView.swift  ·  12 Paletas (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es el menú del tema 12.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema12MenuView: View {
    var body: some View {
        List {
            Section {
                NavigationLink {
                    ComoUsarPaletaView()
                } label: {
                    EjemploRow(titulo: "Cómo se usa una paleta", archivo: "12_Paletas/ComoUsarPaletaView.swift", icono: "paintbrush.pointed")
                }
                NavigationLink {
                    PaletasGaleriaView()
                } label: {
                    EjemploRow(titulo: "Galería: 25 paletas listas", archivo: "12_Paletas/Paletas/", icono: "swatchpalette")
                }
            } footer: {
                Text("Todas son monocromáticas o análogas (lo que pide la rúbrica) y ya tienen el contraste revisado. Elige una, cópiala a Utils/ y renómbrala a Paleta.")
            }
        }
        .navigationTitle("12 · Paletas de colores")
    }
}

#Preview {
    NavigationStack {
        Tema12MenuView()
    }
}
