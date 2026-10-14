// ═══════════════════════════════════════════════════════════════
//  RecibeValoresView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla 2 que RECIBE valores de la pantalla 1 y los
//              muestra. Solo de ida.
//  ÚSALO PARA: detalle, resumen, confirmación de un formulario.
//  BUSCA:      recibir valores, recibir datos, parametros, var sin state,
//              pantalla 2, detalle, mostrar datos
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/RecibeValoresView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más. La llama PasoDeValoresView.swift.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct RecibeValoresView: View {

    // Paso 1 de la clase: variables que NO son private y NO llevan @State.
    // Así la pantalla anterior puede asignarlas al llamar la vista:
    //     RecibeValoresView(nombre: "Cristina", edad: 20)
    var nombre: String      // ✏️
    var edad: Int           // ✏️

    var body: some View {
        ZStack {
            Color.blue.opacity(0.08)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "person.text.rectangle.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(.blue)

                // ── Renglones con los datos recibidos ───────────────
                VStack(spacing: 14) {
                    HStack {
                        Text("Nombre")
                            .foregroundStyle(.secondary)
                        Spacer()
                        // Si llegó vacío, mostramos un texto en su lugar
                        Text(nombre.isEmpty ? "Sin nombre" : nombre)
                            .bold()
                    }

                    Divider()

                    HStack {
                        Text("Edad")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(edad) años")
                            .bold()
                    }

                    Divider()

                    HStack {
                        Text("Estatus")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(edad >= 18 ? "Mayor de edad" : "Menor de edad")
                            .bold()
                            .foregroundStyle(edad >= 18 ? .green : .orange)
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 12))

                Spacer()
            }
            .padding(30)
        }
        .navigationTitle("Tus datos")
    }
}

#Preview {
    NavigationStack {
        RecibeValoresView(nombre: "Cristina", edad: 20)
    }
}
