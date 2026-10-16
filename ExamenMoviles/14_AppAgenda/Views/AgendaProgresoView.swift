// ═══════════════════════════════════════════════════════════════
//  AgendaProgresoView.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Progreso": cuántas cosas completaste CADA DÍA
//              de la última semana en una gráfica de LÍNEAS, eventos por
//              categoría en BARRAS y el porcentaje completado en un
//              ProgressView.
//  ÚSALO PARA: gráficas con fechas (avance por día, gastos por día,
//              minutos de ejercicio por día).
//  BUSCA:      grafica de lineas, LineMark, fechas en grafica, por dia,
//              ultima semana, tendencia, BarMark por categoria, progreso,
//              ProgressView, porcentaje, Charts
//
//  POR QUÉ LÍNEAS AQUÍ (Clase 15): las líneas son para EVOLUCIÓN EN EL
//  TIEMPO (días seguidos). Para comparar categorías (Escuela vs Trabajo)
//  se usan BARRAS. Nunca líneas para categorías.
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Views/ → New File → SwiftUI View.
//   2. Pega el archivo (incluye los structs de los datos de las gráficas).
//  NECESITA:   import Charts, Model/EventoAgenda.swift, Model/ModelDataAgenda.swift,
//              Utils/FechasAgenda.swift, Utils/PaletaAgenda.swift.
//  DE CLASE (15): Chart(datos) { LineMark / BarMark }, .foregroundStyle(by:),
//     .chartForegroundStyleScale, ProgressView con .scaleEffect(x: 1, y: 3).
//  ⚠️ NO VISTO EN CLASE: LineMark + PointMark juntos, eje de FECHAS
//     .value("Día", fecha, unit: .day) (bloque 2), .environment(\.locale, …)
//     y .chartLegend(.hidden).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// Un punto de la gráfica de líneas: un día y cuántos completaste.
struct PuntoProgresoAgenda: Identifiable {
    var id: Int
    var dia: String         // "lun 12"  (para el eje como texto, bloque 1)
    var fecha: Date         // la fecha real (para el eje de fechas, bloque 2 ⚠️)
    var cantidad: Int
}

// Una barra: una categoría y cuántos eventos tiene.
struct BarraCategoriaAgenda: Identifiable {
    var id: String { return categoria }
    var categoria: String
    var cantidad: Int
}

struct AgendaProgresoView: View {

    var eventos: Array<EventoAgenda>                 // solo lee

    let paleta = PaletaAgenda()

    // Los últimos 7 días (de hace 6 días a hoy) con cuántos completaste.
    var completadosPorDia: Array<PuntoProgresoAgenda> {
        var resultado = Array<PuntoProgresoAgenda>()
        for i in 0..<7 {
            let fechaDelDia = fechaAgenda(dias: i - 6, horas: 12)   // i=0 → hace 6 días · i=6 → hoy
            let clave = claveDiaAgenda(fecha: fechaDelDia)
            var cuenta = 0
            for evento in eventos {
                if evento.completado && claveDiaAgenda(fecha: evento.fecha) == clave {
                    cuenta += 1
                }
            }
            let etiqueta = formatearFechaAgenda(fecha: fechaDelDia, formato: "EEE d")
            resultado.append(PuntoProgresoAgenda(id: i, dia: etiqueta, fecha: fechaDelDia, cantidad: cuenta))
        }
        return resultado
    }

    // Cuántos eventos hay de cada categoría (dos for: categorías × eventos)
    var porCategoria: Array<BarraCategoriaAgenda> {
        var resultado = Array<BarraCategoriaAgenda>()
        for categoria in categoriasAgenda {
            var cuenta = 0
            for evento in eventos {
                if evento.categoria == categoria {
                    cuenta += 1
                }
            }
            resultado.append(BarraCategoriaAgenda(categoria: categoria, cantidad: cuenta))
        }
        return resultado
    }

    var totalCompletados: Int {
        var cuenta = 0
        for evento in eventos {
            if evento.completado {
                cuenta += 1
            }
        }
        return cuenta
    }

    // Porcentaje (cuidado: si no hay eventos, no dividir entre 0)
    var porcentaje: Double {
        if eventos.isEmpty {
            return 0
        }
        return Double(totalCompletados) / Double(eventos.count) * 100
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        // ── 1. Línea: completados por día (eje con TEXTO) ─
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Completados por día")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text("Última semana · líneas = evolución en el tiempo")
                                .font(.caption)
                                .foregroundStyle(paleta.textoSuave)
                            Chart(completadosPorDia) { punto in
                                LineMark(
                                    x: .value("Día", punto.dia),
                                    y: .value("Completados", punto.cantidad)
                                )
                                .foregroundStyle(paleta.primario)
                                // ⚠️ NO VISTO EN CLASE: un puntito en cada día
                                PointMark(
                                    x: .value("Día", punto.dia),
                                    y: .value("Completados", punto.cantidad)
                                )
                                .foregroundStyle(paleta.primario)
                            }
                            .frame(height: 200)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 2. La misma línea con eje de FECHAS ⚠️ ─────────
                        // ⚠️ NO VISTO EN CLASE: .value("Día", fecha, unit: .day) le
                        // pasa la fecha REAL a la gráfica; Charts acomoda los días
                        // solo (y deja espacio si falta un día). .environment pone
                        // los nombres de los días en español.
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Misma gráfica, eje de fechas ⚠️")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Chart(completadosPorDia) { punto in
                                LineMark(
                                    x: .value("Día", punto.fecha, unit: .day),
                                    y: .value("Completados", punto.cantidad)
                                )
                                .foregroundStyle(paleta.secundario)
                            }
                            .environment(\.locale, Locale(identifier: "es_MX"))
                            .frame(height: 180)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 3. Barras: eventos por categoría ────────────
                        // Barras = comparar categorías (Clase 15).
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Eventos por categoría")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Chart(porCategoria) { barra in
                                BarMark(
                                    x: .value("Categoría", barra.categoria),
                                    y: .value("Eventos", barra.cantidad)
                                )
                                .foregroundStyle(by: .value("Categoría", barra.categoria))
                            }
                            // Opción C de la Clase 15: mis colores por categoría
                            .chartForegroundStyleScale([
                                "Escuela": paleta.graficas[0],
                                "Trabajo": paleta.graficas[1],
                                "Personal": paleta.graficas[3],
                                "Salud": paleta.graficas[4]
                            ])
                            .chartLegend(.hidden)                    // ⚠️ el eje ya dice cuál es cuál
                            .frame(height: 200)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 4. ProgressView: porcentaje completado ──────
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Llevas \(totalCompletados) de \(eventos.count) completados")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            ProgressView(value: Double(totalCompletados), total: Double(max(eventos.count, 1)))
                                .scaleEffect(x: 1, y: 3)
                                .tint(paleta.exito)
                            Text("\(porcentaje, specifier: "%.0f")% completado")
                                .font(.subheadline)
                                .foregroundStyle(paleta.textoSuave)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)
                    }
                    .padding()
                }
            }
            .navigationTitle("Progreso")
        }
    }
}

#Preview {
    AgendaProgresoView(eventos: cargarEventosAgenda())
}
