// ═══════════════════════════════════════════════════════════════
//  BindingIdaYVueltaView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paso de valores de IDA Y VUELTA con @Binding.
//              Esta pantalla tiene el dato (@State). La pantalla de
//              edición lo cambia (@Binding) y el cambio se ve aquí
//              al regresar, sin código extra.
//  ÚSALO PARA: editar perfil, ajustes, cualquier pantalla que MODIFICA
//              un dato de la pantalla anterior.
//  BUSCA:      binding, @Binding, ida y vuelta, regresar valor, modificar
//              dato de otra pantalla, editar, state vs binding, $
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/BindingIdaYVueltaView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   06_MultiplesPantallas/EditarNicknameView.swift
//
//  LOS CONCEPTOS (para defenderlo):
//   @State   = esta vista es DUEÑA del dato.
//   @Binding = esta vista recibe PERMISO para leer y modificar el dato
//              de otra vista.
//   Un binding se parece a pasar por referencia, pero además NOTIFICA:
//   cuando el valor cambia, SwiftUI redibuja todas las vistas que
//   dependen de él. Por eso el cambio aparece solo al regresar.
//
//  LOS 3 PASOS:
//   1. Detalle: @Binding var dato (no private, sin valor inicial).
//   2. Base:    @State private var dato.
//   3. Base:    llamar la vista CON $  →  EditarNicknameView(nickname: $nickname)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct BindingIdaYVueltaView: View {

    // Paso 2: la vista base es dueña de los datos
    @State private var nickname: String = ""        // ✏️
    @State private var notificaciones = true        // ✏️

    var body: some View {
        NavigationStack {
            ZStack {
                Color.mint.opacity(0.12)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .font(.system(size: 80))
                        .foregroundStyle(.mint)

                    Text("Tu nickname")
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    Text(nickname.isEmpty ? "(todavía no tienes)" : nickname)
                        .font(.largeTitle)
                        .bold()

                    Text(notificaciones ? "🔔 Notificaciones activadas" : "🔕 Notificaciones apagadas")
                        .font(.title3)

                    Spacer()

                    // Paso 3: se manda CON $ para dar permiso de modificar
                    NavigationLink {
                        EditarNicknameView(nickname: $nickname, notificaciones: $notificaciones)
                    } label: {
                        Text("Editar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                }
                .padding(30)
            }
            .navigationTitle("Ida y vuelta")
        }
    }
}

#Preview {
    BindingIdaYVueltaView()
}
