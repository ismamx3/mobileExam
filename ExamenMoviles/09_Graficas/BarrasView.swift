// ═══════════════════════════════════════════════════════════════
//  BarrasView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Gráficas de barras: fijas, con arreglo, con colores,
//              horizontales y con el valor encima de cada barra.
//  ÚSALO PARA: COMPARAR CATEGORÍAS (así lo define la clase): votos por
//              comida, ventas por mes, alumnos por carrera.
//  BUSCA:      barras, bar chart, BarMark, columnas, comparar categorias,
//              Chart, import Charts, Comida, dataBarChart, colores barras,
//              foregroundStyle by, chartForegroundStyleScale, horizontal,
//              annotation, valor encima, grafica, gráfica
//
//  CLASE 15 (Gráficas): SwiftUI hace gráficas con la librería Charts
//  (o dibujando figuras geométricas desde cero, que no se practicó).
//  Pasos de la lámina: 1) import Charts  2) Chart { BarMark(x:, y:) }.
//  En la lámina el struct se llama Comida y el arreglo dataBarChart.
//  Aquí se llaman ComidaVotos / datosComidaVotos para que no choquen
//  con otros archivos del repo; en tu app puedes usar los de la lámina.
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/BarrasView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo: trae el struct, los datos y la vista.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import Charts (ya viene arriba). iOS 16 o más.
//  ⚠️ NO VISTO EN CLASE: barras horizontales (bloque 6: mismo BarMark con
//              x y y intercambiados) y .annotation (bloque 7) para
//              escribir el valor encima de la barra.
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// El modelo de una gráfica es igual que el de una lista: Identifiable.
// Lámina: struct Comida: Identifiable { let id: Int; let tipo: String; let votos: Double }
struct ComidaVotos: Identifiable {
    let id: Int
    let tipo: String      // ✏️ la categoría (eje X)
    let votos: Double     // ✏️ el número (eje Y)
}

// ✏️ tus datos
let datosComidaVotos: [ComidaVotos] = [
    ComidaVotos(id: 1, tipo: "Pizza", votos: 10),
    ComidaVotos(id: 2, tipo: "Hamburguesa", votos: 15),
    ComidaVotos(id: 3, tipo: "Tacos", votos: 7),
    ComidaVotos(id: 4, tipo: "Sushi", votos: 12)
]

struct BarrasView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Barras estáticas (cada barra escrita a mano) ──────
                // Idéntico a la lámina. Cada BarMark es una barra:
                //   x: .value("Etiqueta del eje X", valor de X)
                //   y: .value("Etiqueta del eje Y", valor de Y)
                Text("1. Barras estáticas")
                    .font(.headline)

                Chart {
                    BarMark(
                        x: .value("Comida", "Pizza"),
                        y: .value("Votos", 10)
                    )
                    BarMark(
                        x: .value("Comida", "Hamburguesa"),
                        y: .value("Votos", 15)
                    )
                    BarMark(
                        x: .value("Comida", "Tacos"),
                        y: .value("Votos", 7)
                    )
                }
                .frame(height: 200)

                Divider()

                // ── 2. Barras con datos de un arreglo ─────────────────
                // "Llenamos dinámicamente la gráfica": Chart(arreglo) recorre
                // el arreglo, igual que List(arreglo).
                Text("2. Barras con un arreglo")
                    .font(.headline)

                Chart(datosComidaVotos) { item in
                    BarMark(
                        x: .value("Comida", item.tipo),
                        y: .value("Votos", item.votos)
                    )
                }
                .frame(height: 200)

                Divider()

                // ── 3. Todas del mismo color ──────────────────────────
                // Lámina "Cambiar colores", opción A (TODAS): el modificador
                // va en el BarMark.
                Text("3. Todas del mismo color")
                    .font(.headline)

                Chart(datosComidaVotos) { item in
                    BarMark(
                        x: .value("Comida", item.tipo),
                        y: .value("Votos", item.votos)
                    )
                    .foregroundStyle(.purple)    // ✏️ tu color
                }
                .frame(height: 200)

                Divider()

                // ── 4. Un color automático por categoría (con leyenda) ──
                // Opción B (DIFERENTES, automáticos): en el BarMark, diciendo
                // cuál es el campo de las categorías.
                Text("4. Color automático por categoría")
                    .font(.headline)

                Chart(datosComidaVotos) { item in
                    BarMark(
                        x: .value("Comida", item.tipo),
                        y: .value("Votos", item.votos)
                    )
                    .foregroundStyle(by: .value("Comida", item.tipo))
                }
                .frame(height: 220)

                Divider()

                // ── 5. Tus propios colores por categoría ─────────────
                // Opción C (DIFERENTES, personalizados): ADEMÁS de la B
                // (foregroundStyle(by:) en el BarMark), agrega al Chart
                // .chartForegroundStyleScale. Va sobre el Chart, no sobre el BarMark.
                // Los nombres deben ser EXACTAMENTE los mismos que en los datos.
                Text("5. Colores propios por categoría")
                    .font(.headline)

                Chart(datosComidaVotos) { item in
                    BarMark(
                        x: .value("Comida", item.tipo),
                        y: .value("Votos", item.votos)
                    )
                    .foregroundStyle(by: .value("Comida", item.tipo))
                }
                .chartForegroundStyleScale([
                    "Pizza": .red,             // ✏️ categoría: color
                    "Hamburguesa": .brown,
                    "Tacos": .orange,
                    "Sushi": .pink
                ])
                .frame(height: 220)

                Divider()

                // ── 6. Barras horizontales ────────────────────────────
                // ⚠️ NO VISTO EN CLASE (las láminas solo muestran barras
                // verticales). Solo se intercambian x y y. Sirve cuando los
                // nombres son largos.
                Text("6. Barras horizontales")
                    .font(.headline)

                Chart(datosComidaVotos) { item in
                    BarMark(
                        x: .value("Votos", item.votos),
                        y: .value("Comida", item.tipo)
                    )
                    .foregroundStyle(.indigo)
                }
                .frame(height: 200)

                Divider()

                // ── 7. Valor escrito encima de cada barra ─────────────
                // ⚠️ NO VISTO EN CLASE: .annotation pone una vista pegada a la barra.
                Text("7. Valor encima de cada barra")
                    .font(.headline)

                Chart(datosComidaVotos) { item in
                    BarMark(
                        x: .value("Comida", item.tipo),
                        y: .value("Votos", item.votos)
                    )
                    .foregroundStyle(.teal)
                    .annotation(position: .top) {
                        Text("\(Int(item.votos))")
                            .font(.caption)
                            .bold()
                    }
                }
                .frame(height: 220)
            }
            .padding()
        }
        .navigationTitle("Barras")
    }
}

#Preview {
    NavigationStack {
        BarrasView()
    }
}
