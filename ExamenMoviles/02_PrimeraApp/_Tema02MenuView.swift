// ═══════════════════════════════════════════════════════════════
//  _Tema02MenuView.swift  ·  02 Mi primera app (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo es el menú de este tema dentro
//  de la app del repo. El código útil está en los otros archivos.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema02MenuView: View {
    var body: some View {
        List {
            Section("Elementos básicos") {
                NavigationLink {
                    TextosView()
                } label: {
                    EjemploRow(titulo: "Textos y fuentes", archivo: "02_PrimeraApp/TextosView.swift", icono: "textformat")
                }
                NavigationLink {
                    ImagenesView()
                } label: {
                    EjemploRow(titulo: "Imágenes y SF Symbols", archivo: "02_PrimeraApp/ImagenesView.swift", icono: "photo")
                }
                NavigationLink {
                    StacksBasicosView()
                } label: {
                    EjemploRow(titulo: "VStack, HStack, ZStack y Spacer", archivo: "02_PrimeraApp/StacksBasicosView.swift", icono: "square.stack.3d.up")
                }
                NavigationLink {
                    ModificadoresView()
                } label: {
                    EjemploRow(titulo: "Modificadores y su orden", archivo: "02_PrimeraApp/ModificadoresView.swift", icono: "slider.horizontal.3")
                }
            }

            Section("Colores y fondos") {
                NavigationLink {
                    ColoresYFondosView()
                } label: {
                    EjemploRow(titulo: "Colores, paleta y contraste", archivo: "02_PrimeraApp/ColoresYFondosView.swift", icono: "paintpalette")
                }
                NavigationLink {
                    FondoCompletoZStackView()
                } label: {
                    EjemploRow(titulo: "Fondo completo · Opción 1 (ZStack)", archivo: "02_PrimeraApp/FondoPantallaCompletaView.swift", icono: "rectangle.fill")
                }
                NavigationLink {
                    FondoCompletoBackgroundView()
                } label: {
                    EjemploRow(titulo: "Fondo completo · Opción 2 (.background)", archivo: "02_PrimeraApp/FondoPantallaCompletaView.swift", icono: "rectangle.inset.filled")
                }
            }

            Section("Pantalla lista para usar") {
                NavigationLink {
                    TarjetaPerfilView()
                } label: {
                    EjemploRow(titulo: "Perfil / Acerca de mí", archivo: "02_PrimeraApp/TarjetaPerfilView.swift", icono: "person.crop.circle")
                }
            }
        }
        .navigationTitle("02 · Mi primera app")
    }
}

#Preview {
    NavigationStack {
        Tema02MenuView()
    }
}
