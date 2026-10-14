// ═══════════════════════════════════════════════════════════════
//  BarrasView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Gráficas de barras: fijas, con arreglo, con colores,
//              horizontales y con el valor encima de cada barra.
//  ÚSALO PARA: comparar categorías (votos por comida, ventas por mes,
//              alumnos por carrera).
//  BUSCA:      barras, bar chart, BarMark, columnas, comparar, Chart,
//              foregroundStyle by, chartForegroundStyleScale, horizontal,
//              annotation, valor encima, grafica, gráfica
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/BarrasView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo: trae el struct, los datos y la vista.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import Charts (ya viene arriba). iOS 16 o más.
//  ⚠️ NO VISTO EN CLASE: .annotation (bloque 7) para escribir el valor
//              encima de la barra.
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// El modelo de una gráfica es igual que el de una lista: Identifiable.
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
                // Chart(arreglo) recorre el arreglo, igual que List(arreglo).
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
                // chartForegroundStyleScale va sobre el Chart, no sobre el BarMark.
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
                // Solo se intercambian x y y. Sirve cuando los nombres son largos.
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
