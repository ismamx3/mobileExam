// ═══════════════════════════════════════════════════════════════
//  EstadisticasMascotasView.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Gráficas calculadas a partir de la lista REAL:
//                1) barras: cuántas mascotas hay por especie
//                2) barras horizontales: peso de cada mascota
//                3) dona: vacunadas vs pendientes
//                4) ProgressView: % de vacunadas
//              Si agregas o editas mascotas, las gráficas cambian solas.
//  ÚSALO PARA: pestaña de estadísticas / reportes / dashboard.
//  BUSCA:      grafica, chart, Charts, BarMark, SectorMark, dona, pastel,
//              pie, donut, barras horizontales, contar por categoria,
//              agrupar, ProgressView, porcentaje, annotation
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/EstadisticasMascotasView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import Charts (ya viene arriba), Model/Mascota.swift,
//              Model/ModelDataMascotas.swift (especiesMascotas),
//              Utils/PaletaMascotas.swift
//  QUÉ GRÁFICA PARA QUÉ (Clase 15):
//     barras = comparar categorías · líneas = evoluciones/tendencias en el
//     TIEMPO (NUNCA para comparar categorías) · puntos = relación entre 2
//     variables · pastel/dona = proporciones de un total.
//     Por eso aquí: especies → barras; vacunadas vs pendientes → dona.
//  ⚠️ NO VISTO EN CLASE: .annotation para poner el número sobre la barra
//     (tú lo usaste en tu tarea de gráficas sobre un RuleMark).
//  ⚠️ NO VISTO EN CLASE: barras horizontales (bloque 2: x y y intercambiados).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// Modelo de un dato de gráfica: una etiqueta y su valor.
// El id es una propiedad calculada (la etiqueta ya es única),
// igual que `var id: Int { return x }` de la clase de gráficas.
struct DatoGraficaMascotas: Identifiable {
    var id: String { return etiqueta }
    let etiqueta: String
    let valor: Int
}

struct EstadisticasMascotasView: View {

    // Solo lee → sin @Binding.
    var mascotas: Array<Mascota>

    // ── Cálculos con for ────────────────────────────────────────

    // Cuántas mascotas hay de cada especie.
    func conteoPorEspecie() -> Array<DatoGraficaMascotas> {
        var resultado = Array<DatoGraficaMascotas>()
        for especie in especiesMascotas {
            var cantidad = 0
            for mascota in mascotas {
                if mascota.especie == especie {
                    cantidad += 1
                }
            }
            resultado.append(DatoGraficaMascotas(etiqueta: especie, valor: cantidad))
        }
        return resultado
    }

    var totalVacunadas: Int {
        var cuenta = 0
        for mascota in mascotas {
            if mascota.vacunada {
                cuenta += 1
            }
        }
        return cuenta
    }

    func datosVacunas() -> Array<DatoGraficaMascotas> {
        return [
            DatoGraficaMascotas(etiqueta: "Vacunadas", valor: totalVacunadas),
            DatoGraficaMascotas(etiqueta: "Pendientes", valor: mascotas.count - totalVacunadas)
        ]
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paletaFondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {

                        // Sin datos, las gráficas salen vacías: mejor un mensaje.
                        if mascotas.isEmpty {
                            Text("Agrega mascotas para ver tus estadísticas.")
                                .foregroundStyle(paletaTextoSuave)
                                .padding(.top, 60)
                        } else {

                            // ── 1. Barras: mascotas por especie ─────
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Mascotas por especie")                    // ✏️
                                    .font(.headline)
                                    .foregroundStyle(paletaTexto)

                                Chart(conteoPorEspecie()) { dato in
                                    BarMark(
                                        x: .value("Especie", dato.etiqueta),
                                        y: .value("Cantidad", dato.valor)
                                    )
                                    .foregroundStyle(paletaPrimario)
                                    // ⚠️ NO VISTO EN CLASE: número encima de la barra.
                                    .annotation(position: .top) {
                                        Text("\(dato.valor)")
                                            .font(.caption)
                                            .bold()
                                            .foregroundStyle(paletaTexto)
                                    }
                                }
                                .frame(height: 220)
                            }
                            .padding()
                            .background(paletaSuperficie)
                            .cornerRadius(16)

                            // ── 2. Barras HORIZONTALES: peso ────────
                            // ⚠️ NO VISTO EN CLASE: barras acostadas.
                            // Truco: el número va en x y la categoría en y.
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Peso de cada mascota (kg)")               // ✏️
                                    .font(.headline)
                                    .foregroundStyle(paletaTexto)

                                Chart(mascotas) { mascota in
                                    BarMark(
                                        x: .value("Peso", mascota.peso),
                                        y: .value("Mascota", mascota.nombre)
                                    )
                                    .foregroundStyle(paletaPrimario.opacity(0.8))
                                }
                                .frame(height: 260)
                            }
                            .padding()
                            .background(paletaSuperficie)
                            .cornerRadius(16)

                            // ── 3. Dona: vacunadas vs pendientes ────
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Estado de vacunas")                       // ✏️
                                    .font(.headline)
                                    .foregroundStyle(paletaTexto)

                                Chart(datosVacunas()) { dato in
                                    // Dona = pastel + segunda propiedad innerRadius
                                    // (Clase 15). Quítala para que sea pastel.
                                    SectorMark(
                                        angle: .value("Cantidad", dato.valor),
                                        innerRadius: .ratio(0.5)
                                    )
                                    .foregroundStyle(by: .value("Estado", dato.etiqueta))
                                }
                                // Colores propios: además de foregroundStyle(by:),
                                // sobre el Chart (opción C de la Clase 15).
                                .chartForegroundStyleScale([
                                    "Vacunadas": paletaPrimario,                // ✏️
                                    "Pendientes": paletaPrimarioClaro
                                ])
                                .chartLegend(position: .bottom, alignment: .center)
                                .frame(height: 220)

                                // ── 4. ProgressView: porcentaje ─────
                                Text("\(totalVacunadas * 100 / mascotas.count)% vacunadas")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundStyle(paletaTexto)
                                    .padding(.top, 8)
                                // Clase 15: ProgressView(value: 75, total: 100).scaleEffect(x: 1, y: 3)
                                ProgressView(value: Double(totalVacunadas), total: Double(mascotas.count))
                                    .scaleEffect(x: 1, y: 3)    // y: 3 = barra más gruesa
                                    .tint(paletaPrimario)
                                    .padding(.bottom, 8)
                            }
                            .padding()
                            .background(paletaSuperficie)
                            .cornerRadius(16)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Estadísticas")                                    // ✏️
        }
    }
}

#Preview {
    EstadisticasMascotasView(mascotas: cargarMascotas())
}
