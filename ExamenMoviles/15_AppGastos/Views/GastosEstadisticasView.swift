// ═══════════════════════════════════════════════════════════════
//  GastosEstadisticasView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Estadísticas" con 3 gráficas calculadas a partir
//              de la lista (NO datos fijos):
//               1. Dona: cuánto se gastó por categoría (partes de un total).
//               2. Líneas: cuánto se gastó cada día (tendencia en el TIEMPO)
//                  + una línea punteada con el presupuesto diario.
//               3. Barras: efectivo vs tarjeta (comparar categorías).
//  ÚSALO PARA: graficar los datos de tu lista.
//  BUSCA:      graficas, charts, dona, pastel, SectorMark, innerRadius,
//              LineMark, tiempo, por dia, RuleMark, linea de presupuesto,
//              promedio, BarMark, chartForegroundStyleScale, sumar por
//              categoria, agrupar por dia, for
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/EstadisticasView.swift y pega el archivo.
//   2. Cambia las categorías del chartForegroundStyleScale (✏️) por las tuyas.
//  NECESITA:   import Charts, Model/GastoApp.swift, Model/ModelDataGastos.swift,
//              Utils/PaletaGastos.swift
//
//  QUÉ GRÁFICA PARA QUÉ (Clase 15):
//   barras = comparar categorías · líneas = evoluciones / tendencias /
//   TIEMPO (nunca para comparar categorías) · puntos = relación entre 2
//   variables · pastel/dona = proporciones de un total.
//   Aquí: categorías → dona y barras; días → líneas.
//
//  DE CLASE (Clase 15): Chart(datos) { item in … }, SectorMark con
//     innerRadius: .ratio(0.5), .foregroundStyle(by:) + .chartForegroundStyleScale
//     (opción C de colores), LineMark, BarMark, .chartLegend.
//  ⚠️ NO VISTO EN CLASE: RuleMark (línea de referencia; lo usaste en tu
//     tarea graficas), ForEach dentro de Chart, .value("Día", fecha, unit: .day)
//     (fechas en el eje X), .lineStyle, .annotation, PointMark junto a LineMark.
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// Structs SOLO para las gráficas (cada gráfica necesita un arreglo de
// elementos Identifiable). Se llenan con for a partir de la lista de gastos.
struct GastoCategoriaGrafica: Identifiable {
    var id: String {
        return categoria
    }
    let categoria: String
    let total: Double
}

struct GastoDiaGrafica: Identifiable {
    var id: String {
        return clave
    }
    let clave: String          // "2026-10-15": para agrupar los gastos del mismo día
    let fecha: Date
    let total: Double
}

struct GastoMetodoGrafica: Identifiable {
    var id: String {
        return metodo
    }
    let metodo: String
    let total: Double
}

struct GastosEstadisticasView: View {

    var gastos: Array<GastoApp>       // solo lee
    var presupuesto: Double

    let paleta = PaletaGastos()

    // ── A. Datos: total por categoría (para la dona del bloque 1) ─
    // Para cada categoría, se recorren los gastos y se suman los que son de ella.
    var totalesPorCategoria: Array<GastoCategoriaGrafica> {
        var resultado = Array<GastoCategoriaGrafica>()
        for categoria in categoriasGastos {
            var suma = 0.0
            for gasto in gastos {
                if gasto.categoria == categoria {
                    suma += gasto.monto
                }
            }
            if suma > 0 {
                resultado.append(GastoCategoriaGrafica(categoria: categoria, total: suma))
            }
        }
        return resultado
    }

    // ── B. Datos: total por día (para la línea del bloque 2) ─────
    // Los gastos del mismo día se juntan usando el texto "yyyy-MM-dd" como
    // clave: si dos fechas dan el mismo texto, son del mismo día.
    var totalesPorDia: Array<GastoDiaGrafica> {
        let formato = DateFormatter()
        formato.dateFormat = "yyyy-MM-dd"

        var resultado = Array<GastoDiaGrafica>()
        for gasto in gastos {
            let clave = formato.string(from: gasto.fecha)

            // ¿Ya hay un elemento de ese día? Se busca su posición.
            var posicion = -1
            for i in 0..<resultado.count {
                if resultado[i].clave == clave {
                    posicion = i
                }
            }

            if posicion == -1 {
                resultado.append(GastoDiaGrafica(clave: clave, fecha: gasto.fecha, total: gasto.monto))
            } else {
                let anterior = resultado[posicion]
                resultado[posicion] = GastoDiaGrafica(clave: clave, fecha: anterior.fecha,
                                                      total: anterior.total + gasto.monto)
            }
        }

        // Una línea de tiempo debe ir en orden de fecha. ⚠️ sorted
        return resultado.sorted { a, b in
            a.fecha < b.fecha
        }
    }

    // ── C. Datos: total por método (para las barras del bloque 3) 
    var totalesPorMetodo: Array<GastoMetodoGrafica> {
        var resultado = Array<GastoMetodoGrafica>()
        for metodo in metodosPagoGastos {
            var suma = 0.0
            for gasto in gastos {
                if gasto.metodoPago == metodo {
                    suma += gasto.monto
                }
            }
            resultado.append(GastoMetodoGrafica(metodo: metodo, total: suma))
        }
        return resultado
    }

    // Presupuesto repartido entre 30 días.
    var presupuestoDiario: Double {
        return presupuesto / 30
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        if gastos.isEmpty {
                            Text("Agrega gastos para ver tus estadísticas.")
                                .foregroundStyle(paleta.textoSuave)
                                .frame(maxWidth: .infinity)
                                .padding(.top, 60)
                        } else {

                            // ── 1. Dona por categoría ──────────────
                            VStack(alignment: .leading, spacing: 10) {
                                Text("¿En qué se va mi dinero?")
                                    .font(.headline)
                                    .foregroundStyle(paleta.texto)
                                Chart(totalesPorCategoria) { item in
                                    SectorMark(angle: .value("Total", item.total), innerRadius: .ratio(0.5))
                                        .foregroundStyle(by: .value("Categoría", item.categoria))
                                }
                                // Opción C de la Clase 15: mis colores por categoría ✏️
                                .chartForegroundStyleScale([
                                    "Comida": paleta.graficas[0],
                                    "Transporte": paleta.graficas[1],
                                    "Escuela": paleta.graficas[2],
                                    "Diversión": paleta.graficas[3],
                                    "Otros": paleta.graficas[4]
                                ])
                                .chartLegend(position: .bottom, alignment: .center)
                                .frame(height: 240)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)

                            // ── 2. Línea: gasto por día (TIEMPO) ───
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Gasto por día")
                                    .font(.headline)
                                    .foregroundStyle(paleta.texto)
                                Text("La línea punteada es tu presupuesto diario: \(textoPesosGastos(presupuestoDiario))")
                                    .font(.caption)
                                    .foregroundStyle(paleta.textoSuave)
                                Chart {
                                    // ⚠️ ForEach dentro de Chart: para combinar varias marcas.
                                    ForEach(totalesPorDia) { dia in
                                        // ⚠️ unit: .day → el eje X es de FECHAS, agrupado por día
                                        LineMark(x: .value("Día", dia.fecha, unit: .day),
                                                 y: .value("Gasto", dia.total))
                                            .foregroundStyle(paleta.primario)
                                        PointMark(x: .value("Día", dia.fecha, unit: .day),
                                                  y: .value("Gasto", dia.total))
                                            .foregroundStyle(paleta.primario)
                                    }
                                    // ⚠️ RuleMark: línea horizontal de referencia (como en tu tarea graficas).
                                    RuleMark(y: .value("Presupuesto diario", presupuestoDiario))
                                        .foregroundStyle(paleta.peligro)
                                        .lineStyle(StrokeStyle(lineWidth: 2, dash: [6]))
                                        .annotation(position: .top, alignment: .leading) {
                                            Text("Límite diario")
                                                .font(.caption)
                                                .foregroundStyle(paleta.peligro)
                                        }
                                }
                                .frame(height: 220)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)

                            // ── 3. Barras: efectivo vs tarjeta ─────
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Efectivo vs tarjeta")
                                    .font(.headline)
                                    .foregroundStyle(paleta.texto)
                                Chart(totalesPorMetodo) { item in
                                    BarMark(x: .value("Método", item.metodo),
                                            y: .value("Total", item.total))
                                        .foregroundStyle(paleta.secundario)      // opción A: un solo color
                                }
                                .frame(height: 200)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Estadísticas")
        }
    }
}

#Preview {
    GastosEstadisticasView(gastos: cargarGastosApp(), presupuesto: 6000)
}
