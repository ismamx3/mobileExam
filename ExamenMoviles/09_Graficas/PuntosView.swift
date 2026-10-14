// ═══════════════════════════════════════════════════════════════
//  PuntosView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Gráfica de puntos (dispersión): básica y con color
//              y forma por grupo.
//  ÚSALO PARA: ver si dos números se relacionan (horas de estudio vs
//              calificación, edad vs estatura).
//  BUSCA:      puntos, dispersion, dispersión, scatter, PointMark,
//              relacion, correlacion, grupo, symbol, grafica, gráfica
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PuntosView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo: trae el struct, los datos y la vista.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import Charts (ya viene arriba). iOS 16 o más.
//  ⚠️ NO VISTO EN CLASE: .symbol(by:) y .symbolSize (bloque 3).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

struct PuntoDispersion: Identifiable {
    let id: Int
    let horasEstudio: Double    // ✏️ eje X
    let calificacion: Double    // ✏️ eje Y
    let grupo: String           // ✏️ para separar por color
}

// ✏️ tus datos
let datosDispersion: [PuntoDispersion] = [
    PuntoDispersion(id: 1, horasEstudio: 1, calificacion: 55, grupo: "Grupo A"),
    PuntoDispersion(id: 2, horasEstudio: 2, calificacion: 62, grupo: "Grupo A"),
    PuntoDispersion(id: 3, horasEstudio: 3, calificacion: 70, grupo: "Grupo A"),
    PuntoDispersion(id: 4, horasEstudio: 5, calificacion: 81, grupo: "Grupo A"),
    PuntoDispersion(id: 5, horasEstudio: 6, calificacion: 88, grupo: "Grupo A"),
    PuntoDispersion(id: 6, horasEstudio: 1, calificacion: 60, grupo: "Grupo B"),
    PuntoDispersion(id: 7, horasEstudio: 3, calificacion: 65, grupo: "Grupo B"),
    PuntoDispersion(id: 8, horasEstudio: 4, calificacion: 78, grupo: "Grupo B"),
    PuntoDispersion(id: 9, horasEstudio: 7, calificacion: 92, grupo: "Grupo B"),
    PuntoDispersion(id: 10, horasEstudio: 8, calificacion: 97, grupo: "Grupo B")
]

struct PuntosView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Dispersión básica ──────────────────────────────
                Text("1. Puntos (dispersión)")
                    .font(.headline)

                Chart(datosDispersion) { item in
                    PointMark(
                        x: .value("Horas de estudio", item.horasEstudio),
                        y: .value("Calificación", item.calificacion)
                    )
                }
                .frame(height: 220)

                Divider()

                // ── 2. Un color por grupo ─────────────────────────────
                Text("2. Color por grupo")
                    .font(.headline)

                Chart(datosDispersion) { item in
                    PointMark(
                        x: .value("Horas de estudio", item.horasEstudio),
                        y: .value("Calificación", item.calificacion)
                    )
                    .foregroundStyle(by: .value("Grupo", item.grupo))
                }
                .frame(height: 220)

                Divider()

                // ── 3. Color y forma por grupo, puntos más grandes ────
                // ⚠️ NO VISTO EN CLASE: .symbol(by:) cambia la figura (círculo,
                // cuadro…) según el grupo; .symbolSize cambia el tamaño del punto.
                Text("3. Color, forma y tamaño")
                    .font(.headline)

                Chart(datosDispersion) { item in
                    PointMark(
                        x: .value("Horas de estudio", item.horasEstudio),
                        y: .value("Calificación", item.calificacion)
                    )
                    .foregroundStyle(by: .value("Grupo", item.grupo))
                    .symbol(by: .value("Grupo", item.grupo))
                    .symbolSize(120)    // ✏️ tamaño
                }
                .frame(height: 220)
            }
            .padding()
        }
        .navigationTitle("Puntos")
    }
}

#Preview {
    NavigationStack {
        PuntosView()
    }
}
