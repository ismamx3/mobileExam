// ═══════════════════════════════════════════════════════════════
//  GraficaInteractivaView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Gráfica TIPO EXAMEN: el usuario escribe una categoría y
//              una cantidad, se valida con alertas, se agrega al arreglo
//              y la gráfica se actualiza sola. Un Picker cambia entre
//              barras, línea y pastel con los MISMOS datos.
//  ÚSALO PARA: "el usuario captura datos y se muestran en una gráfica".
//  BUSCA:      grafica interactiva, agregar dato, capturar, TextField,
//              validar, alerta, append, @State arreglo, Picker segmented,
//              cambiar tipo de grafica, barras linea pastel, borrar,
//              removeLast, total, gráfica
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GraficaInteractivaView.swift.
//   2. Pega el archivo completo: trae el struct y la vista.
//   3. Cambia lo marcado con ✏️ (nombres de campos y datos iniciales).
//  NECESITA:   import Charts (ya viene arriba). Pastel pide iOS 17 o más.
//  ⚠️ NO VISTO EN CLASE: .keyboardType(.decimalPad) (teclado de números)
//              y .disabled (botón apagado si no hay datos).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

struct GastoCategoria: Identifiable {
    let id = UUID()
    let nombre: String       // ✏️ la categoría
    let cantidad: Double     // ✏️ el número
}

struct GraficaInteractivaView: View {

    // El arreglo es @State: al hacer append, SwiftUI redibuja la gráfica.
    @State private var gastos: [GastoCategoria] = [
        GastoCategoria(nombre: "Comida", cantidad: 1200),          // ✏️ datos iniciales
        GastoCategoria(nombre: "Transporte", cantidad: 500),
        GastoCategoria(nombre: "Diversión", cantidad: 800)
    ]

    // Campos del formulario (el TextField siempre trabaja con String).
    @State private var nombre: String = ""
    @State private var cantidadTexto: String = ""

    // 1 = barras, 2 = línea, 3 = pastel
    @State private var tipoGrafica: Int = 1

    @State private var showAlert = false
    @State private var alertMessage = ""
    @FocusState private var campoEnFoco: Bool

    // Total calculado con un for.
    var total: Double {
        var suma = 0.0
        for gasto in gastos {
            suma += gasto.cantidad
        }
        return suma
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Elegir el tipo de gráfica ──────────────────────
                Text("1. Tipo de gráfica")
                    .font(.headline)

                Picker(selection: $tipoGrafica, label: Text("Tipo de gráfica")) {
                    Text("Barras").tag(1)
                    Text("Línea").tag(2)
                    Text("Pastel").tag(3)
                }
                .pickerStyle(.segmented)

                // ── 2. La gráfica (mismos datos, distinta marca) ──────
                // Un if por tipo: cada rama es un Chart completo, así se
                // puede copiar solo el que necesites.
                if tipoGrafica == 1 {
                    Chart(gastos) { gasto in
                        BarMark(
                            x: .value("Categoría", gasto.nombre),
                            y: .value("Cantidad", gasto.cantidad)
                        )
                        .foregroundStyle(by: .value("Categoría", gasto.nombre))
                    }
                    .frame(height: 250)
                } else if tipoGrafica == 2 {
                    Chart(gastos) { gasto in
                        LineMark(
                            x: .value("Categoría", gasto.nombre),
                            y: .value("Cantidad", gasto.cantidad)
                        )
                        .foregroundStyle(.purple)

                        PointMark(
                            x: .value("Categoría", gasto.nombre),
                            y: .value("Cantidad", gasto.cantidad)
                        )
                        .foregroundStyle(.purple)
                    }
                    .frame(height: 250)
                } else {
                    Chart(gastos) { gasto in
                        SectorMark(
                            angle: .value("Cantidad", gasto.cantidad),
                            innerRadius: .ratio(0.5)
                        )
                        .foregroundStyle(by: .value("Categoría", gasto.nombre))
                    }
                    .chartLegend(position: .bottom, alignment: .center)
                    .frame(height: 250)
                }

                Text("Total: \(total, format: .currency(code: "MXN"))")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity)

                Divider()

                // ── 3. Agregar un dato con validación ─────────────────
                Text("3. Agregar un dato")
                    .font(.headline)

                TextField("Categoría (ej. Escuela)", text: $nombre)        // ✏️
                    .textFieldStyle(.roundedBorder)
                    .focused($campoEnFoco)

                TextField("Cantidad (ej. 250)", text: $cantidadTexto)      // ✏️
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($campoEnFoco)

                Button {
                    agregarGasto()
                } label: {
                    Label("Agregar a la gráfica", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)

                // ── 4. Quitar el último dato ──────────────────────────
                Button {
                    gastos.removeLast()
                } label: {
                    Label("Quitar el último", systemImage: "trash")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .disabled(gastos.isEmpty)    // removeLast truena si el arreglo está vacío
            }
            .padding()
        }
        .navigationTitle("Gráfica interactiva")
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }

    // Valida cada campo con un mensaje específico; si todo está bien, agrega.
    func agregarGasto() {
        if nombre.isEmpty {
            alertMessage = "Escribe el nombre de la categoría"
            showAlert.toggle()
        } else if cantidadTexto.isEmpty {
            alertMessage = "Escribe la cantidad"
            showAlert.toggle()
        } else if let cantidad = Double(cantidadTexto) {
            if cantidad <= 0 {
                alertMessage = "La cantidad debe ser mayor a 0"
                showAlert.toggle()
            } else {
                gastos.append(GastoCategoria(nombre: nombre, cantidad: cantidad))
                nombre = ""
                cantidadTexto = ""
                campoEnFoco = false
            }
        } else {
            alertMessage = "La cantidad debe ser un número"
            showAlert.toggle()
        }
    }
}

#Preview {
    NavigationStack {
        GraficaInteractivaView()
    }
}
