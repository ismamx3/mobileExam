// ═══════════════════════════════════════════════════════════════
//  LineasView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Gráficas de líneas: estática, con arreglo, línea con
//              puntos, varias líneas (series), línea de promedio y
//              línea curva.
//  ÚSALO PARA: EVOLUCIONES, TENDENCIAS, TIEMPO (así lo define la clase):
//              ventas por mes, temperatura por día, peso por semana.
//  BUSCA:      lineas, línea, line chart, LineMark, tendencia, tiempo,
//              evolucion, meses, Punto, dataLinesXY, series, varias lineas,
//              promedio, RuleMark, curva, catmullRom, PointMark, grafica,
//              gráfica
//
//  ⚠️ NOTA IMPORTANTE DE LA PROFESORA (Clase 15): la gráfica de líneas
//  NO se usa para comparar categorías (para eso son las barras). Se usa
//  para ver la tendencia en el tiempo de una misma variable.
//
//  En la lámina el struct se llama Punto y el arreglo dataLinesXY.
//  Aquí se llaman PuntoMes / datosPuntoMes para que no choquen con otros
//  archivos del repo; los campos (x, y) y el id son iguales a la lámina.
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/LineasView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo: trae los structs, los datos y la vista.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import Charts (ya viene arriba). iOS 16 o más.
//  ⚠️ NO VISTO EN CLASE: juntar LineMark + PointMark en el mismo Chart
//              (bloques 3 y 4; la lámina los muestra por separado),
//              RuleMark + ForEach + .lineStyle + .annotation (bloque 5;
//              lo usaste en tu tarea "graficas") y .interpolationMethod
//              (bloque 6).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// Igual que en la lámina: si ya hay un campo único (x), el id puede
// ser una propiedad calculada que lo regresa.
struct PuntoMes: Identifiable {
    var id: Int { return x }
    let x: Int           // ✏️ eje X (número de mes)
    let y: Double        // ✏️ eje Y
}

// ✏️ tus datos (los 3 primeros son los de la lámina)
let datosPuntoMes: [PuntoMes] = [
    PuntoMes(x: 1, y: 20),
    PuntoMes(x: 2, y: 100),
    PuntoMes(x: 3, y: 60),
    PuntoMes(x: 4, y: 80),
    PuntoMes(x: 5, y: 45),
    PuntoMes(x: 6, y: 90)
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

    // Promedio calculado con un for, para dibujar la línea del bloque 5.
    var promedio: Double {
        if datosPuntoMes.isEmpty {
            return 0
        }
        var suma = 0.0
        for punto in datosPuntoMes {
            suma += punto.y
        }
        return suma / Double(datosPuntoMes.count)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Líneas estáticas (cada punto escrito a mano) ───
                // Idéntico a la lámina: cada LineMark es un punto de la línea
                // y Charts los une en orden.
                Text("1. Línea estática")
                    .font(.headline)

                Chart {
                    LineMark(
                        x: .value("Meses", 1),
                        y: .value("Votos", 20)
                    )
                    LineMark(
                        x: .value("Meses", 2),
                        y: .value("Votos", 100)
                    )
                    LineMark(
                        x: .value("Meses", 3),
                        y: .value("Votos", 60)
                    )
                }
                .frame(height: 200)

                Divider()

                // ── 2. Línea con datos de un arreglo ──────────────────
                // Igual que la lámina: Chart(dataLinesXY) { item in LineMark(...) }
                Text("2. Línea con un arreglo")
                    .font(.headline)

                Chart(datosPuntoMes) { item in
                    LineMark(
                        x: .value("Meses", item.x),
                        y: .value("Votos", item.y)
                    )
                }
                .frame(height: 200)

                Divider()

                // ── 3. Línea con puntos ───────────────────────────────
                // Dentro de un Chart puedes poner dos marcas por dato.
                Text("3. Línea con puntos")
                    .font(.headline)

                Chart(datosPuntoMes) { item in
                    LineMark(
                        x: .value("Meses", item.x),
                        y: .value("Votos", item.y)
                    )
                    .foregroundStyle(.purple)

                    PointMark(
                        x: .value("Meses", item.x),
                        y: .value("Votos", item.y)
                    )
                    .foregroundStyle(.purple)
                }
                .frame(height: 200)

                Divider()

                // ── 4. Varias líneas (una por serie) ──────────────────
                // foregroundStyle(by:) (el mismo de las barras) separa los
                // datos en una línea por tienda y le da a cada una su color
                // y su leyenda. Sigue siendo tiempo (meses) en el eje X.
                Text("4. Varias líneas")
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

                // ── 5. Línea de promedio (RuleMark) ───────────────────
                // ⚠️ NO VISTO EN CLASE: RuleMark dibuja una línea fija de lado a lado.
                // Para mezclarla con los datos se usa ForEach dentro de Chart
                // (así lo hiciste en tu tarea de gráficas con "Nivel de peligro").
                // .lineStyle la hace punteada y .annotation le pone un texto.
                Text("5. Línea de promedio")
                    .font(.headline)

                Chart {
                    ForEach(datosPuntoMes) { item in
                        LineMark(
                            x: .value("Meses", item.x),
                            y: .value("Votos", item.y)
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

                // ── 6. Línea curva (suavizada) ────────────────────────
                // ⚠️ NO VISTO EN CLASE: .interpolationMethod(.catmullRom) redondea la línea.
                Text("6. Línea curva")
                    .font(.headline)

                Chart(datosPuntoMes) { item in
                    LineMark(
                        x: .value("Meses", item.x),
                        y: .value("Votos", item.y)
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
