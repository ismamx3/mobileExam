// ═══════════════════════════════════════════════════════════════
//  PasoDeValoresView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paso de valores de Pantalla 1 a Pantalla 2 (SOLO DE IDA).
//              Escribes nombre y edad aquí y la siguiente pantalla los
//              muestra.
//  ÚSALO PARA: mandar datos a otra pantalla que solo los MUESTRA
//              (detalle, resumen, confirmación).
//  BUSCA:      paso de valores, pasar datos, mandar variable, parametro,
//              enviar a otra pantalla, ida, pass data, slider, textfield
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PasoDeValoresView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   06_MultiplesPantallas/RecibeValoresView.swift
//
//  OJO: si la pantalla 2 cambia el valor, NO regresa a esta.
//       Para ida y vuelta mira BindingIdaYVueltaView.swift (@Binding).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PasoDeValoresView: View {

    // Datos que se van a mandar. Esta vista es dueña de ellos (@State).
    @State private var nombre: String = ""      // ✏️
    @State private var edad = 18.0              // ✏️ Slider usa Double

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.08)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Capturar los datos ───────────────────────────
                    Text("Nombre")
                        .font(.headline)
                    TextField("Escribe tu nombre", text: $nombre)
                        .textFieldStyle(.roundedBorder)

                    Text("Edad: \(Int(edad)) años")
                        .font(.headline)
                    Slider(value: $edad, in: 1...100, step: 1)
                        .tint(.blue)

                    Spacer()

                    // ── 2. Mandar los datos al llamar la vista ──────────
                    // Se asignan como parámetros: RecibeValoresView(nombre:edad:)
                    NavigationLink {
                        RecibeValoresView(nombre: nombre, edad: Int(edad))
                    } label: {
                        Text("Ver mis datos en otra pantalla")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                .padding(30)
            }
            .navigationTitle("Paso de valores")
        }
    }
}

#Preview {
    PasoDeValoresView()
}
