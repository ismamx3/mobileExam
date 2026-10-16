// ═══════════════════════════════════════════════════════════════
//  EditarNicknameView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de edición que recibe @Binding. Lo que escribes
//              aquí cambia el dato de la pantalla anterior.
//  ÚSALO PARA: editar perfil, cambiar ajustes, modificar un elemento.
//  BUSCA:      binding, @Binding, editar, modificar, constant, .constant, preview binding,
//              dismiss, guardar y regresar, toggle
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/EditarNicknameView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más. La llama BindingIdaYVueltaView.swift.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EditarNicknameView: View {

    // Paso 1: 1) @Binding, 2) NO private y 3) SIN valor inicial.
    // El valor real vive en la pantalla anterior (la fuente de verdad).
    @Binding var nickname: String          // ✏️
    @Binding var notificaciones: Bool      // ✏️

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.mint.opacity(0.12)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {

                Text("Nuevo nickname")
                    .font(.headline)

                // Con $ porque el TextField también necesita modificarlo.
                // Cada letra que escribes ya cambia el dato de la otra pantalla.
                TextField("Escribe tu nickname", text: $nickname)
                    .textFieldStyle(.roundedBorder)

                Toggle("Recibir notificaciones", isOn: $notificaciones)
                    .tint(.mint)

                Spacer()

                // El cambio ya se hizo. El botón solo regresa.
                Button {
                    dismiss()
                } label: {
                    Text("Guardar y regresar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            }
            .padding(30)
        }
        .navigationTitle("Editar")
    }
}

#Preview {
    // En el #Preview no existe un parent view real que pase el Binding,
    // así que hay que "inyectar" un Binding de prueba. La forma más limpia
    // (clase 6B) es .constant(...): un Binding de solo lectura con valor fijo.
    // Clase:  DetalleView(nickname: .constant(""))
    NavigationStack {
        EditarNicknameView(nickname: .constant("Neo"), notificaciones: .constant(true))
    }
}
