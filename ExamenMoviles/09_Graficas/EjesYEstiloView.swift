// ═══════════════════════════════════════════════════════════════
//  EjesYEstiloView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Ajustes de una gráfica: escala fija del eje Y, títulos
//              de los ejes, ocultar ejes, ponerla en una tarjeta y
//              color según el valor (aprobado / reprobado).
//  ÚSALO PARA: que la gráfica se vea más clara y "terminada".
//  BUSCA:      ejes, axis, escala, chartYScale, domain, rango 0 a 100,
//              titulo eje, chartXAxisLabel, chartYAxisLabel, ocultar eje,
//              hidden, tarjeta, card, fondo grafica, color condicional,
//              aprobado, reprobado, minimo, grafica, gráfica
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/EjesYEstiloView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo: trae el struct, los datos y la vista.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import Charts (ya viene arriba). iOS 16 o más.
//  ⚠️ NO VISTO EN CLASE: .chartYScale (bloque 1), .chartXAxisLabel /
//              .chartYAxisLabel (bloque 2), .chartXAxis(.hidden) /
//              .chartYAxis(.hidden) (bloque 3), RuleMark (bloque 5).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

struct CalificacionMateria: Identifiable {
    let id: Int
    let materia: String          // ✏️ eje X
    let calificacion: Double     // ✏️ eje Y
}

// ✏️ tus datos
let datosCalificacionesGrafica: [CalificacionMateria] = [
    CalificacionMateria(id: 1, materia: "Mate", calificacion: 85),
    CalificacionMateria(id: 2, materia: "Física", calificacion: 62),
    CalificacionMateria(id: 3, materia: "Química", calificacion: 90),
    CalificacionMateria(id: 4, materia: "Progra", calificacion: 98),
    CalificacionMateria(id: 5, materia: "Inglés", calificacion: 68)
]

struct EjesYEstiloView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Escala fija en el eje Y (de 0 a 100) ───────────
                // ⚠️ NO VISTO EN CLASE: .chartYScale(domain:) fija el rango.
                // Sin esto, Charts escoge el rango solo (por ejemplo, de 0 a 120).
                Text("1. Eje Y siempre de 0 a 100")
                    .font(.headline)

                Chart(datosCalificacionesGrafica) { item in
                    BarMark(
                        x: .value("Materia", item.materia),
                        y: .value("Calificación", item.calificacion)
                    )
                }
                .chartYScale(domain: 0 ... 100)    // ✏️ tu rango
                .frame(height: 200)

                Divider()

                // ── 2. Títulos en los ejes ────────────────────────────
                // ⚠️ NO VISTO EN CLASE: .chartXAxisLabel y .chartYAxisLabel.
                Text("2. Títulos en los ejes")
                    .font(.headline)

                Chart(datosCalificacionesGrafica) { item in
                    BarMark(
                        x: .value("Materia", item.materia),
                        y: .value("Calificación", item.calificacion)
                    )
                    .foregroundStyle(.purple)
                }
                .chartXAxisLabel("Materia")             // ✏️ título eje X
                .chartYAxisLabel("Calificación")        // ✏️ título eje Y
                .frame(height: 220)

                Divider()

                // ── 3. Sin ejes (gráfica mini) ────────────────────────
                // ⚠️ NO VISTO EN CLASE: .chartXAxis(.hidden) y .chartYAxis(.hidden).
                // Útil para una gráfica chiquita dentro de una tarjeta.
                Text("3. Sin ejes")
                    .font(.headline)

                Chart(datosCalificacionesGrafica) { item in
                    LineMark(
                        x: .value("Materia", item.materia),
                        y: .value("Calificación", item.calificacion)
                    )
                    .foregroundStyle(.teal)
                }
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .frame(height: 80)

                Divider()

                // ── 4. Gráfica dentro de una tarjeta ──────────────────
                // Título + gráfica en un VStack, con padding, fondo y esquinas.
                Text("4. Gráfica en tarjeta")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Mis calificaciones")          // ✏️ título de la tarjeta
                        .font(.title3)
                        .bold()
                    Text("Semestre agosto–diciembre")
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                    Chart(datosCalificacionesGrafica) { item in
                        BarMark(
                            x: .value("Materia", item.materia),
                            y: .value("Calificación", item.calificacion)
                        )
                        .foregroundStyle(.indigo)
                    }
                    .frame(height: 180)
                }
                .padding()
                .background(Color.indigo.opacity(0.08))    // ✏️ color de la tarjeta
                .clipShape(RoundedRectangle(cornerRadius: 12))

                Divider()

                // ── 5. Color según el valor + línea de mínimo ─────────
                // El ternario escoge el color de cada barra.
                // ⚠️ NO VISTO EN CLASE: RuleMark (línea fija) + ForEach dentro de Chart.
                Text("5. Aprobado (verde) / reprobado (rojo)")
                    .font(.headline)

                Chart {
                    ForEach(datosCalificacionesGrafica) { item in
                        BarMark(
                            x: .value("Materia", item.materia),
                            y: .value("Calificación", item.calificacion)
                        )
                        .foregroundStyle(item.calificacion >= 70 ? Color.green : Color.red)   // ✏️ 70 = mínimo
                    }

                    RuleMark(y: .value("Mínimo", 70))
                        .foregroundStyle(.gray)
                        .lineStyle(StrokeStyle(lineWidth: 2, dash: [6]))
                        .annotation(position: .top, alignment: .leading) {
                            Text("Mínimo: 70")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                }
                .chartYScale(domain: 0 ... 100)
                .frame(height: 220)
            }
            .padding()
        }
        .navigationTitle("Ejes y estilo")
    }
}

#Preview {
    NavigationStack {
        EjesYEstiloView()
    }
}
