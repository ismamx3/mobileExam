// ═══════════════════════════════════════════════════════════════
//  LineasView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Gráficas de líneas: una línea, línea con puntos, varias
//              líneas (series), línea de promedio y línea curva.
//  ÚSALO PARA: tendencias en el tiempo (ventas por mes, temperatura
//              por día, peso por semana).
//  BUSCA:      lineas, línea, line chart, LineMark, tendencia, tiempo,
//              series, varias lineas, promedio, RuleMark, curva,
//              catmullRom, PointMark, grafica, gráfica
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/LineasView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo: trae los structs, los datos y la vista.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import Charts (ya viene arriba). iOS 16 o más.
//  ⚠️ NO VISTO EN CLASE: RuleMark + ForEach dentro de Chart (bloque 4;
//              lo usaste en tu tarea "graficas") y .interpolationMethod
//              (bloque 5).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// Igual que en clase: si ya hay un campo único (mes), el id puede
// ser una propiedad calculada que lo regresa.
struct PuntoMes: Identifiable {
    var id: Int { return mes }
    let mes: Int         // ✏️ eje X (número de mes)
    let valor: Double    // ✏️ eje Y
}

// ✏️ tus datos
let datosPuntoMes: [PuntoMes] = [
    PuntoMes(mes: 1, valor: 20),
    PuntoMes(mes: 2, valor: 100),
    PuntoMes(mes: 3, valor: 60),
    PuntoMes(mes: 4, valor: 80),
    PuntoMes(mes: 5, valor: 45),
    PuntoMes(mes: 6, valor: 90)
]

// Para varias líneas: cada dato dice a qué serie (tienda) pertenece.
struct VentaSerie: Identifiable {
    let id: Int
    let mes: String       // ✏️ eje X
    let tienda: String    // ✏️ la serie (una línea por tienda)
    let ventas: Double    // ✏️ eje Y
}

// ✏️ tus datos (ordenados por mes para que el eje X salga en orden)
let datosVentaSerie: [VentaSerie] = [
    VentaSerie(id: 1, mes: "Ene", tienda: "Centro", ventas: 30),
    VentaSerie(id: 2, mes: "Feb", tienda: "Centro", ventas: 45),
    VentaSerie(id: 3, mes: "Mar", tienda: "Centro", ventas: 40),
    VentaSerie(id: 4, mes: "Abr", tienda: "Centro", ventas: 60),
    VentaSerie(id: 5, mes: "Ene", tienda: "Norte", ventas: 20),
    VentaSerie(id: 6, mes: "Feb", tienda: "Norte", ventas: 25),
    VentaSerie(id: 7, mes: "Mar", tienda: "Norte", ventas: 50),
    VentaSerie(id: 8, mes: "Abr", tienda: "Norte", ventas: 55)
]

struct LineasView: View {

    // Promedio calculado con un for, para dibujar la línea del bloque 4.
    var promedio: Double {
        if datosPuntoMes.isEmpty {
            return 0
        }
        var suma = 0.0
        for punto in datosPuntoMes {
            suma += punto.valor
        }
        return suma / Double(datosPuntoMes.count)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Una línea ──────────────────────────────────────
                Text("1. Una línea")
                    .font(.headline)

                Chart(datosPuntoMes) { item in
                    LineMark(
                        x: .value("Mes", item.mes),
                        y: .value("Valor", item.valor)
                    )
                }
                .frame(height: 200)

                Divider()

                // ── 2. Línea con puntos ───────────────────────────────
                // Dentro de un Chart puedes poner dos marcas por dato.
                Text("2. Línea con puntos")
                    .font(.headline)

                Chart(datosPuntoMes) { item in
                    LineMark(
                        x: .value("Mes", item.mes),
                        y: .value("Valor", item.valor)
                    )
                    .foregroundStyle(.purple)

                    PointMark(
                        x: .value("Mes", item.mes),
                        y: .value("Valor", item.valor)
                    )
                    .foregroundStyle(.purple)
                }
                .frame(height: 200)

                Divider()

                // ── 3. Varias líneas (una por serie) ──────────────────
                // foregroundStyle(by:) separa los datos en una línea por tienda
                // y le da a cada una su color y su leyenda.
                Text("3. Varias líneas")
                    .font(.headline)

                Chart(datosVentaSerie) { item in
                    LineMark(
                        x: .value("Mes", item.mes),
                        y: .value("Ventas", item.ventas)
                    )
                    .foregroundStyle(by: .value("Tienda", item.tienda))

                    PointMark(
                        x: .value("Mes", item.mes),
                        y: .value("Ventas", item.ventas)
                    )
                    .foregroundStyle(by: .value("Tienda", item.tienda))
                }
                .frame(height: 220)

                Divider()

                // ── 4. Línea de promedio (RuleMark) ───────────────────
                // ⚠️ NO VISTO EN CLASE: RuleMark dibuja una línea fija de lado a lado.
                // Para mezclarla con los datos se usa ForEach dentro de Chart
                // (así lo hiciste en tu tarea de gráficas con "Nivel de peligro").
                Text("4. Línea de promedio")
                    .font(.headline)

                Chart {
                    ForEach(datosPuntoMes) { item in
                        LineMark(
                            x: .value("Mes", item.mes),
                            y: .value("Valor", item.valor)
                        )
                        .foregroundStyle(.indigo)
                    }

                    RuleMark(y: .value("Promedio", promedio))
                        .foregroundStyle(.red)
                        .lineStyle(StrokeStyle(lineWidth: 2, dash: [6]))
                        .annotation(position: .top, alignment: .leading) {
                            Text("Promedio: \(promedio, specifier: "%.1f")")
                                .font(.caption)
                                .foregroundStyle(.red)
                        }
                }
                .frame(height: 220)

                Divider()

                // ── 5. Línea curva (suavizada) ────────────────────────
                // ⚠️ NO VISTO EN CLASE: .interpolationMethod(.catmullRom) redondea la línea.
                Text("5. Línea curva")
                    .font(.headline)

                Chart(datosPuntoMes) { item in
                    LineMark(
                        x: .value("Mes", item.mes),
                        y: .value("Valor", item.valor)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(.green)
                }
                .frame(height: 200)
            }
            .padding()
        }
        .navigationTitle("Líneas")
    }
}

#Preview {
    NavigationStack {
        LineasView()
    }
}
