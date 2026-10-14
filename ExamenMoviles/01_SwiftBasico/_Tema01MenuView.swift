// ═══════════════════════════════════════════════════════════════
//  _Tema01MenuView.swift  ·  01 Swift básico (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo es el menú de este tema dentro
//  de la app del repo. El código útil está en los otros archivos.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema01MenuView: View {
    var body: some View {
        List {
            Section("Sintaxis") {
                NavigationLink {
                    TiposYVariablesView()
                } label: {
                    EjemploRow(titulo: "Tipos, var/let y operaciones", archivo: "01_SwiftBasico/TiposYVariablesView.swift", icono: "textformat.123")
                }
                NavigationLink {
                    OpcionalesView()
                } label: {
                    EjemploRow(titulo: "Opcionales e if let", archivo: "01_SwiftBasico/OpcionalesView.swift", icono: "questionmark.circle")
                }
                NavigationLink {
                    ArreglosYCiclosView()
                } label: {
                    EjemploRow(titulo: "Arreglos y ciclos for", archivo: "01_SwiftBasico/ArreglosYCiclosView.swift", icono: "list.number")
                }
                NavigationLink {
                    FuncionesYCondicionesView()
                } label: {
                    EjemploRow(titulo: "Funciones, if y switch", archivo: "01_SwiftBasico/FuncionesYCondicionesView.swift", icono: "arrow.triangle.branch")
                }
                NavigationLink {
                    FechasYNumerosView()
                } label: {
                    EjemploRow(titulo: "Fechas y formato de números", archivo: "01_SwiftBasico/FechasYNumerosView.swift", icono: "calendar")
                }
                NavigationLink {
                    StructsYClasesView()
                } label: {
                    EjemploRow(titulo: "Structs y clases", archivo: "01_SwiftBasico/StructsYClasesView.swift", icono: "shippingbox")
                }
            }

            Section("Ejemplo tipo examen") {
                NavigationLink {
                    CalculadoraIMCView()
                } label: {
                    EjemploRow(titulo: "Calculadora con validación (IMC)", archivo: "01_SwiftBasico/CalculadoraIMCView.swift", icono: "function")
                }
            }
        }
        .navigationTitle("01 · Swift básico")
    }
}

#Preview {
    NavigationStack {
        Tema01MenuView()
    }
}
