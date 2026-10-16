// ═══════════════════════════════════════════════════════════════
//  PastelYDonaView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Gráfica de pastel y de dona: estática, con arreglo, con
//              colores propios, con porcentaje en cada rebanada y con
//              texto en el centro.
//  ÚSALO PARA: PROPORCIONES DE UN TOTAL (así lo define la clase):
//              porcentaje de gastos, votos por opción, jugadores por consola.
//  BUSCA:      pastel, pie, pie chart, dona, donut, SectorMark, angle,
//              innerRadius, ratio, porcentaje, proporcion, leyenda,
//              chartLegend, Consolas, listaConsolas, centro, angularInset,
//              grafica, gráfica
//
//  CLASE 15: a partir de iOS 17 la librería Charts hace pasteles con
//  SectorMark(angle:) + .foregroundStyle(by:). Para la DONA "solo
//  agregamos una segunda propiedad a SectorMark": innerRadius: .ratio(0.5).
//  En la lámina el struct se llama Consolas y el arreglo listaConsolas.
//  Aquí: ConsolaJugadores / datosConsolas (para no chocar en el repo).
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PastelYDonaView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo: trae el struct, los datos y la vista.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import Charts (ya viene arriba). SectorMark pide iOS 17 o más.
//  ⚠️ NO VISTO EN CLASE: angularInset y .cornerRadius (bloque 4),
//              .chartLegend(.hidden) (bloque 5) y .annotation (bloque 6).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// Como en la lámina: el id es UUID() porque no hay un identificador natural.
// Lámina: struct Consolas: Identifiable { let id = UUID(); let nombre: String; let numeroJugadores: Double }
struct ConsolaJugadores: Identifiable {
    let id = UUID()
    let nombre: String            // ✏️ la rebanada
    let numeroJugadores: Double   // ✏️ el tamaño de la rebanada
}

// ✏️ tus datos
let datosConsolas: [ConsolaJugadores] = [
    ConsolaJugadores(nombre: "Switch", numeroJugadores: 20),
    ConsolaJugadores(nombre: "Xbox", numeroJugadores: 30),
    ConsolaJugadores(nombre: "PlayStation", numeroJugadores: 35),
    ConsolaJugadores(nombre: "Compu", numeroJugadores: 15)
]

struct PastelYDonaView: View {

    // Suma de todos los valores (para el centro de la dona y los porcentajes).
    var total: Double {
        var suma = 0.0
        for consola in datosConsolas {
            suma += consola.numeroJugadores
        }
        return suma
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Pastel estático (cada rebanada escrita a mano) ──
                // Idéntico a la lámina (ella usa emojis como categoría; puede
                // ser cualquier texto). El tamaño de cada rebanada sale solo.
                Text("1. Pastel estático")
                    .font(.headline)

                Chart {
                    SectorMark(angle: .value("Valor", 2))                       // ✏️
                        .foregroundStyle(by: .value("Categoría", "👩🏻"))
                    SectorMark(angle: .value("Valor", 24))                      // ✏️
                        .foregroundStyle(by: .value("Categoría", "🧔🏻"))
                }
                .chartLegend(position: .bottom, alignment: .center)
                .frame(height: 220)

                Divider()

                // ── 2. Pastel con datos de un arreglo ─────────────────
                // Igual que la lámina: Chart(listaConsolas) { consolaItem in ... }
                // El tamaño de cada rebanada sale solo: Charts calcula el porcentaje.
                Text("2. Pastel con un arreglo")
                    .font(.headline)

                Chart(datosConsolas) { consolaItem in
                    SectorMark(angle: .value("Valor", consolaItem.numeroJugadores))
                        .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
                }
                .chartLegend(position: .bottom, alignment: .center)
                .frame(height: 250)

                Divider()

                // ── 3. Dona ───────────────────────────────────────────
                // Lámina: "para convertir la gráfica de pastel → DONA, solo
                // agregamos una segunda propiedad a SectorMark". innerRadius es
                // el radio interior con el que simulamos la dona:
                // .ratio(0.5) = la mitad del radio.
                Text("3. Dona")
                    .font(.headline)

                Chart(datosConsolas) { consolaItem in
                    SectorMark(
                        angle: .value("Valor", consolaItem.numeroJugadores),
                        innerRadius: .ratio(0.5)
                    )
                    .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
                }
                .chartLegend(position: .bottom, alignment: .center)
                .frame(height: 250)

                Divider()

                // ── 4. Dona con rebanadas separadas ───────────────────
                // ⚠️ NO VISTO EN CLASE: angularInset deja un espacio entre
                // rebanadas y .cornerRadius redondea sus esquinas.
                Text("4. Dona con separación")
                    .font(.headline)

                Chart(datosConsolas) { consolaItem in
                    SectorMark(
                        angle: .value("Valor", consolaItem.numeroJugadores),
                        innerRadius: .ratio(0.6),
                        angularInset: 2
                    )
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
                }
                .chartLegend(position: .bottom, alignment: .center)
                .frame(height: 250)

                Divider()

                // ── 5. Dona con el total en el centro ─────────────────
                // ZStack: la gráfica abajo y el texto encima, centrado.
                // ⚠️ NO VISTO EN CLASE: .chartLegend(.hidden) quita la leyenda.
                // Se quita porque si está abajo, el centro de la dona se mueve
                // y el texto ya no queda en medio.
                Text("5. Dona con texto en el centro")
                    .font(.headline)

                ZStack {
                    Chart(datosConsolas) { consolaItem in
                        SectorMark(
                            angle: .value("Valor", consolaItem.numeroJugadores),
                            innerRadius: .ratio(0.6)
                        )
                        .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
                    }
                    .chartLegend(.hidden)

                    VStack {
                        Text("Total")              // ✏️ tu texto
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Text("\(Int(total))")
                            .font(.title)
                            .bold()
                    }
                }
                .frame(height: 220)

                Divider()

                // ── 6. Pastel con tus colores y el porcentaje encima ──
                // chartForegroundStyleScale (el de las barras, opción C): los
                // nombres deben ser iguales a los datos.
                // ⚠️ NO VISTO EN CLASE: .annotation(position: .overlay) escribe
                // el texto encima de cada rebanada.
                Text("6. Colores propios y porcentaje")
                    .font(.headline)

                Chart(datosConsolas) { consolaItem in
                    SectorMark(
                        angle: .value("Valor", consolaItem.numeroJugadores)
                    )
                    .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
                    .annotation(position: .overlay) {
                        Text("\(consolaItem.numeroJugadores / total * 100, specifier: "%.0f")%")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.white)
                    }
                }
                .chartForegroundStyleScale([
                    "Switch": .red,            // ✏️ categoría: color
                    "Xbox": .green,
                    "PlayStation": .blue,
                    "Compu": .purple
                ])
                .chartLegend(position: .bottom, alignment: .center)
                .frame(height: 250)
            }
            .padding()
        }
        .navigationTitle("Pastel y dona")
    }
}

#Preview {
    NavigationStack {
        PastelYDonaView()
    }
}
