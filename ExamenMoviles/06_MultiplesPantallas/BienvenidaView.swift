// ═══════════════════════════════════════════════════════════════
//  BienvenidaView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla a la que llega el Login. Recibe el nombre del
//              usuario, lo saluda y tiene "Cerrar sesión" (dismiss).
//              Esconde la flecha de regreso para que solo se pueda
//              salir con el botón.
//  ÚSALO PARA: home después del login, pantalla de bienvenida.
//  BUSCA:      bienvenida, home, cerrar sesion, logout, dismiss, ocultar flecha,
//              back button, navigationBarBackButtonHidden, saludo, fecha
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/BienvenidaView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más. La llama LoginView.swift.
//  ⚠️ NO VISTO EN CLASE: .navigationBarBackButtonHidden
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct BienvenidaView: View {

    var usuario: String                       // llega desde LoginView

    @Environment(\.dismiss) private var dismiss

    // Fecha de hoy como texto (ej. "miércoles, 14 de octubre")
    var fechaHoy: String {
        let formato = DateFormatter()
        formato.dateFormat = "EEEE, dd 'de' MMMM"
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: Date())
    }

    var body: some View {
        ZStack {
            Color.indigo.opacity(0.12)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "hand.wave.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.indigo)
                    .padding(.top, 40)

                Text("¡Hola, \(usuario)!")                // ✏️
                    .font(.largeTitle)
                    .bold()

                Text("Hoy es \(fechaHoy)")
                    .font(.title3)
                    .foregroundStyle(.secondary)

                Spacer()

                // Cerrar sesión = regresar al login
                Button {
                    dismiss()
                } label: {
                    Label("Cerrar sesión", systemImage: "rectangle.portrait.and.arrow.right")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            .padding(30)
        }
        .navigationTitle("Inicio")
        // ⚠️ NO VISTO EN CLASE: quita la flecha "<" (y el gesto de deslizar).
        // Así solo se sale con "Cerrar sesión".
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        BienvenidaView(usuario: "admin")
    }
}
