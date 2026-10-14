// ═══════════════════════════════════════════════════════════════
//  EditarJugadorView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Detalle que EDITA el elemento con @Binding (ida y vuelta).
//  ÚSALO PARA: cambiar datos de un elemento y que la lista se actualice.
//  BUSCA:      binding, editar, detalle editable, toggle favorito, stepper, dismiss, regresar
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/EditarJugadorView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift (solo para el #Preview)
//              Quien la abre debe pasarle un binding:  EditarJugadorView(jugador: $jugador)
//  ⚠️ NO VISTO EN CLASE: Stepper
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EditarJugadorView: View {

    // @Binding = recibe PERMISO para leer y modificar el dato de otra vista.
    // No es privada y no lleva valor inicial.
    @Binding var jugador: Jugador                              // ✏️ tu modelo

    // Para regresar por código.
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Image(jugador.imagen)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                // ── 1. TextField ligado a un campo del modelo ─────────
                // $jugador.nombre = binding SOLO a ese campo.
                Text("Nombre")
                    .font(.headline)
                TextField("Nombre", text: $jugador.nombre)          // ✏️
                    .textFieldStyle(.roundedBorder)

                Text("Apellido")
                    .font(.headline)
                TextField("Apellido", text: $jugador.apellido)      // ✏️
                    .textFieldStyle(.roundedBorder)

                // ── 2. Stepper para un Int ───────────────────────────
                // ⚠️ NO VISTO EN CLASE: Stepper suma/resta 1 con botones + y −.
                Stepper("Número: \(jugador.numero)", value: $jugador.numero, in: 0...99)   // ✏️

                // ── 3. Slider para un Double ─────────────────────────
                Text("Estatura: \(jugador.estatura, specifier: "%.2f") m")
                Slider(value: $jugador.estatura, in: 1.60...2.30, step: 0.01)   // ✏️
                    .tint(.purple)

                // ── 4. Toggle para un Bool ───────────────────────────
                Toggle(isOn: $jugador.esFavorito) {
                    Label("Favorito", systemImage: jugador.esFavorito ? "heart.fill" : "heart")
                }
                .tint(.purple)

                // ── 5. Regresar por código ───────────────────────────
                // No hay que "guardar": el binding ya cambió el dato original.
                Button {
                    dismiss()
                } label: {
                    Text("Listo")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Editar")                               // ✏️
    }
}

#Preview {
    // En el preview no hay pantalla padre: se inyecta un binding de prueba.
    NavigationStack {
        EditarJugadorView(jugador: .constant(cargarJugadores()[0]))
    }
}
