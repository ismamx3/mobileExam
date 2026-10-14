// ═══════════════════════════════════════════════════════════════
//  EjemploPantallaCompleta.swift  ·  _Menu (infraestructura del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO.
//
//  Algunos ejemplos traen su propio NavigationStack o TabView porque
//  así irían en tu app (como pantalla raíz). Si los metiéramos con un
//  NavigationLink normal quedarían dos barras de navegación encimadas.
//  Por eso este renglón los abre a pantalla completa, con un botón ✕
//  arriba a la derecha para regresar al menú.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EjemploPantallaCompleta<Contenido: View>: View {

    var titulo: String
    var archivo: String
    var icono: String
    @ViewBuilder var contenido: () -> Contenido

    @State private var mostrar = false

    var body: some View {
        Button {
            mostrar.toggle()
        } label: {
            HStack {
                EjemploRow(titulo: titulo, archivo: archivo, icono: icono)
                Spacer()
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .foregroundStyle(.secondary)
            }
        }
        .foregroundStyle(.primary)
        .fullScreenCover(isPresented: $mostrar) {
            contenido()
                .overlay(alignment: .topTrailing) {
                    Button {
                        mostrar = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white, .black.opacity(0.6))
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 2)
                }
        }
    }
}

#Preview {
    List {
        EjemploPantallaCompleta(titulo: "TabView básico", archivo: "07_TabView/TabViewBasicoView.swift", icono: "rectangle.split.3x1") {
            Text("Contenido a pantalla completa")
        }
    }
}
