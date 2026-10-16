// ═══════════════════════════════════════════════════════════════
//  _Tema13MenuView.swift  ·  13 SF Symbols (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es el menú del tema 13.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema13MenuView: View {
    var body: some View {
        List {
            Section {
                NavigationLink {
                    SFSymbolsComoUsarView()
                } label: {
                    EjemploRow(titulo: "Cómo se usan los íconos", archivo: "13_SFSymbols/SFSymbolsComoUsarView.swift", icono: "questionmark.square.dashed")
                }
                NavigationLink {
                    SFSymbolsGuiaView()
                } label: {
                    EjemploRow(titulo: "¿Qué ícono uso para…? (300+, en español)", archivo: "13_SFSymbols/SFSymbols_GUIA.md", icono: "text.magnifyingglass")
                }
                NavigationLink {
                    SFSymbolsCatalogoView()
                } label: {
                    EjemploRow(titulo: "Catálogo completo (7,006 íconos)", archivo: "13_SFSymbols/SFSymbols_TODOS.md", icono: "square.grid.3x3.fill")
                }
            } footer: {
                Text("Son los íconos que ya trae iOS: no se agregan a Assets. Toca uno para verlo grande y copiar su nombre; el portapapeles del simulador se comparte con tu Mac, así que lo pegas directo en Xcode con ⌘V.")
            }
        }
        .navigationTitle("13 · SF Symbols")
    }
}

#Preview {
    NavigationStack {
        Tema13MenuView()
    }
}
