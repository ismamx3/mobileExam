// ═══════════════════════════════════════════════════════════════
//  _Tema09MenuView.swift  ·  09 Gráficas (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es solo el menú que se ve en el simulador.
//  Cada renglón dice en qué archivo está el código.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema09MenuView: View {
    var body: some View {
        List {
            Section("Tipos de gráfica") {
                NavigationLink {
                    BarrasView()
                } label: {
                    EjemploRow(titulo: "Barras", archivo: "09_Graficas/BarrasView.swift", icono: "chart.bar.fill")
                }
                NavigationLink {
                    LineasView()
                } label: {
                    EjemploRow(titulo: "Líneas", archivo: "09_Graficas/LineasView.swift", icono: "chart.line.uptrend.xyaxis")
                }
                NavigationLink {
                    PuntosView()
                } label: {
                    EjemploRow(titulo: "Puntos (dispersión)", archivo: "09_Graficas/PuntosView.swift", icono: "chart.dots.scatter")
                }
                NavigationLink {
                    PastelYDonaView()
                } label: {
                    EjemploRow(titulo: "Pastel y dona", archivo: "09_Graficas/PastelYDonaView.swift", icono: "chart.pie.fill")
                }
            }

            Section("Avance y estilo") {
                NavigationLink {
                    ProgressViewEjemplosView()
                } label: {
                    EjemploRow(titulo: "Barras de avance (ProgressView)", archivo: "09_Graficas/ProgressViewEjemplosView.swift", icono: "hourglass")
                }
                NavigationLink {
                    EjesYEstiloView()
                } label: {
                    EjemploRow(titulo: "Ejes, escala y tarjeta", archivo: "09_Graficas/EjesYEstiloView.swift", icono: "ruler")
                }
            }

            Section("Tipo examen") {
                NavigationLink {
                    GraficaInteractivaView()
                } label: {
                    EjemploRow(titulo: "Agregar datos y cambiar tipo", archivo: "09_Graficas/GraficaInteractivaView.swift", icono: "hand.tap")
                }
                NavigationLink {
                    GraficaDesdeListaView(registros: datosRegistrosGrafica)
                } label: {
                    EjemploRow(titulo: "Graficar los datos de una lista", archivo: "09_Graficas/GraficaDesdeListaView.swift", icono: "list.bullet.rectangle")
                }
                NavigationLink {
                    DashboardGraficasView()
                } label: {
                    EjemploRow(titulo: "Dashboard 2x2", archivo: "09_Graficas/DashboardGraficasView.swift", icono: "square.grid.2x2")
                }
            }
        }
        .navigationTitle("09 · Gráficas")
    }
}

#Preview {
    NavigationStack {
        Tema09MenuView()
    }
}
