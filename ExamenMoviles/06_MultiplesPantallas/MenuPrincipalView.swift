// ═══════════════════════════════════════════════════════════════
//  MenuPrincipalView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de inicio con encabezado y una cuadrícula 2x2
//              de botones grandes. Cada botón navega a una pantalla
//              distinta. Patrón típico de examen ("menú de la app").
//  ÚSALO PARA: home, menú principal, dashboard con opciones.
//  BUSCA:      menu principal, inicio, home, cuadricula, 2x2, grid, botones
//              grandes, tarjetas, navegar a varias pantallas, dashboard
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/MenuPrincipalView.swift
//   2. Pega el archivo completo (trae también el componente
//      MenuPrincipalBoton al final; si quieres, muévelo a Components/).
//   3. Cambia lo marcado con ✏️ (títulos, íconos, colores, destinos)
//  NECESITA:   06_MultiplesPantallas/PantallaDestinoView.swift
//              (o cambia cada PantallaDestinoView(...) por tus pantallas).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct MenuPrincipalView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.purple.opacity(0.08)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {

                        // ── 1. Encabezado ───────────────────────────────
                        VStack(spacing: 6) {
                            Image(systemName: "sparkles")
                                .font(.system(size: 50))
                                .foregroundStyle(.purple)
                            Text("Mi App")                        // ✏️
                                .font(.largeTitle)
                                .bold()
                            Text("¿Qué quieres hacer hoy?")       // ✏️
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 20)

                        // ── 2. Cuadrícula 2x2 ───────────────────────────
                        // Cada renglón es un HStack. Cada botón usa
                        // .frame(maxWidth: .infinity) y por eso los dos
                        // miden lo mismo (mitad y mitad).
                        HStack(spacing: 16) {
                            NavigationLink {
                                PantallaDestinoView(titulo: "Perfil", color: .purple, icono: "person.fill")   // ✏️
                            } label: {
                                MenuPrincipalBoton(titulo: "Perfil", icono: "person.fill", color: .purple)    // ✏️
                            }

                            NavigationLink {
                                PantallaDestinoView(titulo: "Lista", color: .blue, icono: "list.bullet")
                            } label: {
                                MenuPrincipalBoton(titulo: "Lista", icono: "list.bullet", color: .blue)
                            }
                        }

                        HStack(spacing: 16) {
                            NavigationLink {
                                PantallaDestinoView(titulo: "Gráficas", color: .orange, icono: "chart.bar.fill")
                            } label: {
                                MenuPrincipalBoton(titulo: "Gráficas", icono: "chart.bar.fill", color: .orange)
                            }

                            NavigationLink {
                                PantallaDestinoView(titulo: "Ajustes", color: .teal, icono: "gearshape.fill")
                            } label: {
                                MenuPrincipalBoton(titulo: "Ajustes", icono: "gearshape.fill", color: .teal)
                            }
                        }
                    }
                    .padding()
                }
            }
            // El título no se ve (la barra está escondida) pero sí aparece
            // junto a la flecha "<" de las pantallas siguientes.
            .navigationTitle("Inicio")
            .toolbar(.hidden)
        }
    }
}

// ═══════════════════════════════════════════════════════════════
//  MenuPrincipalBoton — componente para que los 4 botones se vean
//  iguales. Solo muestra (variables sin @State).
// ═══════════════════════════════════════════════════════════════
struct MenuPrincipalBoton: View {

    var titulo: String
    var icono: String
    var color: Color

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icono)
                .font(.system(size: 40))
            Text(titulo)
                .font(.headline)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)      // ocupa su mitad del HStack
        .frame(height: 140)              // ✏️ alto del botón
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    MenuPrincipalView()
}
