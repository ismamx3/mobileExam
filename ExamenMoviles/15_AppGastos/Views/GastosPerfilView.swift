// ═══════════════════════════════════════════════════════════════
//  GastosPerfilView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Perfil": nombre (llegó del login), cuántos gastos
//              hay, el presupuesto mensual con un botón para EDITARLO en
//              otra pantalla, y "Cerrar sesión" con confirmación.
//  ÚSALO PARA: perfil + editar un dato en otra pantalla + cerrar sesión.
//  BUSCA:      perfil, editar, Binding, ida y vuelta, pasar con $,
//              NavigationLink, cerrar sesion, logout, alerta con dos
//              botones, role destructive, inicial del nombre
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PerfilView.swift y pega el archivo.
//   2. Copia también Views/GastosEditarPresupuestoView.swift.
//  NECESITA:   Model/GastoApp.swift (textoPesosGastos), Utils/PaletaGastos.swift,
//              Components/GastosFilaDato.swift, Views/GastosEditarPresupuestoView.swift
//
//  QUÉ RECIBE Y POR QUÉ:
//   - nombreUsuario, totalGastos → `var`: solo los muestra (6B ida).
//   - presupuesto → @Binding: NO lo cambia aquí, pero se lo PASA (con $)
//     a GastosEditarPresupuestoView, que sí lo cambia. El permiso viaja:
//     GastosAppView (@State) → Perfil (@Binding) → Editar (@Binding).
//   - sesionIniciada → @Binding: "Cerrar sesión" la pone en false y la raíz
//     regresa al login.
//
//  DE CLASE: @Binding ida y vuelta (6B), NavigationLink (6A), alerta (Clase 3).
//  ⚠️ NO VISTO EN CLASE: role: .destructive / .cancel en los botones de la alerta,
//     .prefix(1) (primera letra del nombre).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosPerfilView: View {

    var nombreUsuario: String
    var totalGastos: Int
    @Binding var presupuesto: Double
    @Binding var sesionIniciada: Bool

    @State private var mostrarCerrarSesion = false

    let paleta = PaletaGastos()

    // Primera letra del nombre para el "avatar". ⚠️ prefix(1)
    var inicial: String {
        if nombreUsuario.isEmpty {
            return "?"
        }
        return String(nombreUsuario.prefix(1)).uppercased()
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {

                        // ── 1. Avatar con la inicial ───────────
                        Text(inicial)
                            .font(.system(size: 44))
                            .bold()
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .frame(width: 100, height: 100)
                            .background(paleta.primario)
                            .clipShape(.circle)
                            .padding(.top, 10)

                        Text(nombreUsuario)
                            .font(.title)
                            .bold()
                            .foregroundStyle(paleta.texto)

                        // ── 2. Datos ───────────────────────────
                        VStack(spacing: 0) {
                            GastosFilaDato(icono: "list.number", etiqueta: "Gastos registrados", valor: "\(totalGastos)")
                            Divider()
                            GastosFilaDato(icono: "banknote.fill", etiqueta: "Presupuesto mensual", valor: textoPesosGastos(presupuesto))
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 3. Ir a editar el presupuesto (con $) ─
                        NavigationLink {
                            // $presupuesto: le paso PERMISO para cambiarlo (6B ida y vuelta)
                            GastosEditarPresupuestoView(presupuesto: $presupuesto)
                        } label: {
                            Label("Editar presupuesto", systemImage: "pencil")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(paleta.textoSobrePrimario)
                                .background(paleta.primario)
                                .cornerRadius(14)
                        }

                        // ── 4. Cerrar sesión con confirmación ──
                        Button {
                            mostrarCerrarSesion.toggle()
                        } label: {
                            Label("Cerrar sesión", systemImage: "rectangle.portrait.and.arrow.right")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(paleta.peligro)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(paleta.peligro, lineWidth: 2)
                                )
                        }
                        .alert("¿Cerrar sesión?", isPresented: $mostrarCerrarSesion) {
                            Button("Cerrar sesión", role: .destructive) {      // ⚠️ role
                                sesionIniciada = false     // la raíz regresa al login
                            }
                            Button("Cancelar", role: .cancel) {}
                        } message: {
                            Text("Tendrás que volver a escribir tu usuario y contraseña.")
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Perfil")
        }
    }
}

#Preview {
    GastosPerfilView(nombreUsuario: "Alumno", totalGastos: 14,
                     presupuesto: .constant(6000), sesionIniciada: .constant(true))
}
