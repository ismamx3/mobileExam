// ═══════════════════════════════════════════════════════════════
//  DashboardGraficasView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla tipo "dashboard": 3 tarjetas con números arriba,
//              4 gráficas en cuadrícula 2x2 (barras, línea, dona y
//              puntos) y una barra de meta abajo. Con fondo completo.
//  ÚSALO PARA: una pantalla de "Resumen" o "Estadísticas" que se vea
//              armada y ordenada.
//  BUSCA:      dashboard, resumen, estadisticas, cuadricula, grid 2x2,
//              tarjetas, tiles, kpi, varias graficas, mitades iguales,
//              fondo completo, meta, ProgressView, gráfica
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/DashboardGraficasView.swift.
//   2. Pega el archivo completo: trae los 4 structs, sus datos y la vista.
//   3. Cambia lo marcado con ✏️ (títulos, colores y datos).
//  NECESITA:   import Charts (ya viene arriba). La dona pide iOS 17 o más.
//  CÓMO SE DIVIDE EN PARTES IGUALES: cada tarjeta lleva
//              .frame(maxWidth: .infinity); dentro de un HStack, todas las
//              que lo tengan se reparten el ancho por igual.
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// ── Modelos y datos de cada gráfica ✏️ ────────────────────────────

struct VentaDiaGrafica: Identifiable {
    let id: Int
    let dia: String
    let ventas: Double
}

let datosVentaDiaGrafica: [VentaDiaGrafica] = [
    VentaDiaGrafica(id: 1, dia: "L", ventas: 1200),
    VentaDiaGrafica(id: 2, dia: "M", ventas: 1800),
    VentaDiaGrafica(id: 3, dia: "Mi", ventas: 1500),
    VentaDiaGrafica(id: 4, dia: "J", ventas: 2100),
    VentaDiaGrafica(id: 5, dia: "V", ventas: 2600),
    VentaDiaGrafica(id: 6, dia: "S", ventas: 3000),
    VentaDiaGrafica(id: 7, dia: "D", ventas: 2200)
]

struct VisitaSemanaGrafica: Identifiable {
    var id: Int { return semana }
    let semana: Int
    let visitas: Double
}

let datosVisitaSemanaGrafica: [VisitaSemanaGrafica] = [
    VisitaSemanaGrafica(semana: 1, visitas: 120),
    VisitaSemanaGrafica(semana: 2, visitas: 180),
    VisitaSemanaGrafica(semana: 3, visitas: 150),
    VisitaSemanaGrafica(semana: 4, visitas: 240)
]

struct CanalVentaGrafica: Identifiable {
    let id: Int
    let canal: String
    let porcentaje: Double
}

let datosCanalVentaGrafica: [CanalVentaGrafica] = [
    CanalVentaGrafica(id: 1, canal: "Tienda", porcentaje: 50),
    CanalVentaGrafica(id: 2, canal: "En línea", porcentaje: 35),
    CanalVentaGrafica(id: 3, canal: "Teléfono", porcentaje: 15)
]

struct ProductoPrecioGrafica: Identifiable {
    let id: Int
    let precio: Double
    let unidades: Double
}

let datosProductoPrecioGrafica: [ProductoPrecioGrafica] = [
    ProductoPrecioGrafica(id: 1, precio: 50, unidades: 90),
    ProductoPrecioGrafica(id: 2, precio: 80, unidades: 70),
    ProductoPrecioGrafica(id: 3, precio: 120, unidades: 55),
    ProductoPrecioGrafica(id: 4, precio: 150, unidades: 40),
    ProductoPrecioGrafica(id: 5, precio: 200, unidades: 22)
]

// ── La pantalla ───────────────────────────────────────────────────

struct DashboardGraficasView: View {

    // Colores en un solo lugar. Con opacidad se ven bien en modo claro y oscuro.
    let colorPrincipal = Color.indigo                 // ✏️ tus colores
    let colorFondo = Color.indigo.opacity(0.06)
    let colorTarjeta = Color.indigo.opacity(0.12)

    let metaVentas = 20000.0                          // ✏️ tu meta

    // Total de la semana, sumado con un for.
    var totalVentas: Double {
        var suma = 0.0
        for venta in datosVentaDiaGrafica {
            suma += venta.ventas
        }
        return suma
    }

    var body: some View {
        // Fondo completo: ZStack con el color hasta las orillas.
        ZStack {
            colorFondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. Tres tarjetas de números del mismo ancho ───
                    HStack(spacing: 12) {
                        VStack(spacing: 4) {
                            Image(systemName: "dollarsign.circle.fill")
                                .font(.title2)
                                .foregroundStyle(colorPrincipal)
                            Text("$\(Int(totalVentas))")
                                .font(.headline)
                            Text("Ventas")                          // ✏️
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(colorTarjeta)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                        VStack(spacing: 4) {
                            Image(systemName: "bag.fill")
                                .font(.title2)
                                .foregroundStyle(colorPrincipal)
                            Text("128")                             // ✏️
                                .font(.headline)
                            Text("Pedidos")                         // ✏️
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(colorTarjeta)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                        VStack(spacing: 4) {
                            Image(systemName: "person.2.fill")
                                .font(.title2)
                                .foregroundStyle(colorPrincipal)
                            Text("87")                              // ✏️
                                .font(.headline)
                            Text("Clientes")                        // ✏️
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(colorTarjeta)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    // ── 2. Cuadrícula 2x2 de gráficas ─────────────────
                    // Un VStack con dos HStack; cada tarjeta con maxWidth .infinity.
                    VStack(spacing: 12) {

                        // Renglón de arriba
                        HStack(spacing: 12) {

                            // Arriba izquierda: barras
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Ventas por día")              // ✏️
                                    .font(.subheadline)
                                    .bold()
                                Chart(datosVentaDiaGrafica) { item in
                                    BarMark(
                                        x: .value("Día", item.dia),
                                        y: .value("Ventas", item.ventas)
                                    )
                                    .foregroundStyle(colorPrincipal)
                                }
                                .frame(height: 130)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(colorTarjeta)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                            // Arriba derecha: línea
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Visitas por semana")          // ✏️
                                    .font(.subheadline)
                                    .bold()
                                Chart(datosVisitaSemanaGrafica) { item in
                                    LineMark(
                                        x: .value("Semana", item.semana),
                                        y: .value("Visitas", item.visitas)
                                    )
                                    .foregroundStyle(.orange)

                                    PointMark(
                                        x: .value("Semana", item.semana),
                                        y: .value("Visitas", item.visitas)
                                    )
                                    .foregroundStyle(.orange)
                                }
                                .frame(height: 130)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(colorTarjeta)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }

                        // Renglón de abajo
                        HStack(spacing: 12) {

                            // Abajo izquierda: dona
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Ventas por canal")            // ✏️
                                    .font(.subheadline)
                                    .bold()
                                Chart(datosCanalVentaGrafica) { item in
                                    SectorMark(
                                        angle: .value("Porcentaje", item.porcentaje),
                                        innerRadius: .ratio(0.5)
                                    )
                                    .foregroundStyle(by: .value("Canal", item.canal))
                                }
                                .chartLegend(position: .bottom, alignment: .center)
                                .frame(height: 130)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(colorTarjeta)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                            // Abajo derecha: puntos
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Precio vs unidades")          // ✏️
                                    .font(.subheadline)
                                    .bold()
                                Chart(datosProductoPrecioGrafica) { item in
                                    PointMark(
                                        x: .value("Precio", item.precio),
                                        y: .value("Unidades", item.unidades)
                                    )
                                    .foregroundStyle(.teal)
                                }
                                .frame(height: 130)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(colorTarjeta)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }

                    // ── 3. Meta del mes (ancho completo) ──────────────
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Meta de ventas")                  // ✏️
                                .font(.headline)
                            Spacer()
                            Text("\(Int(totalVentas / metaVentas * 100))%")
                                .bold()
                                .foregroundStyle(colorPrincipal)
                        }
                        ProgressView(value: totalVentas, total: metaVentas)
                            .scaleEffect(x: 1, y: 3)
                            .tint(colorPrincipal)
                            .padding(.vertical, 6)
                        Text("Llevas $\(Int(totalVentas)) de $\(Int(metaVentas))")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .background(colorTarjeta)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
        }
        .navigationTitle("Dashboard")
    }
}

#Preview {
    NavigationStack {
        DashboardGraficasView()
    }
}
