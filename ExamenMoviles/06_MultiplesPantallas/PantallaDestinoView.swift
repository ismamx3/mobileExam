// ═══════════════════════════════════════════════════════════════
//  PantallaDestinoView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La pantalla a la que se llega con un NavigationLink.
//              Recibe título, color e ícono y tiene un botón "Regresar"
//              que usa dismiss() para volver por código.
//  ÚSALO PARA: cualquier pantalla "hija": detalle, perfil, ajustes…
//  BUSCA:      destino, detalle, dismiss, regresar, volver, back, environment,
//              pantalla 2, segunda pantalla, destination
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PantallaDestinoView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más. (NO lleva NavigationStack: ya viene de la
//              pantalla anterior.)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PantallaDestinoView: View {

    // Variables que llegan desde la pantalla anterior (sin @State, sin private).
    // Como tienen valor por default, se puede llamar PantallaDestinoView()
    // sin pasar nada, o PantallaDestinoView(titulo: "Perfil", color: .orange).
    var titulo: String = "Pantalla destino"   // ✏️
    var color: Color = .purple                 // ✏️
    var icono: String = "star.fill"            // ✏️ nombre de un SF Symbol

    // 1. Para regresar por código a la pantalla anterior
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            // Fondo de toda la pantalla
            color.opacity(0.15)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: icono)
                    .font(.system(size: 80))
                    .foregroundStyle(color)

                Text(titulo)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)

                Text("Llegaste con un NavigationLink. Regresa con la flecha de arriba o con el botón.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                // 2. Botón que regresa (hace lo mismo que la flecha "<")
                Button {
                    dismiss()
                } label: {
                    Text("Regresar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(color)
            }
            .padding(30)
        }
        .navigationTitle(titulo)
    }
}

#Preview {
    NavigationStack {
        PantallaDestinoView(titulo: "Perfil", color: .orange, icono: "person.fill")
    }
}
