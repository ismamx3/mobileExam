// ═══════════════════════════════════════════════════════════════
//  GymProgresoView.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Progreso": 3 gráficas, cada una del TIPO
//              CORRECTO para su dato (regla de la Clase 15):
//               1. PUNTOS  → minutos vs calorías (relación entre 2 variables)
//               2. BARRAS  → minutos por grupo muscular (comparar categorías)
//               3. LÍNEAS  → calorías de los últimos 7 días (tendencia en el tiempo)
//              Los datos de cada gráfica se CALCULAN de la lista con for.
//  ÚSALO PARA: graficar los datos de tu lista; saber qué gráfica usar.
//  BUSCA:      grafica, chart, PointMark, puntos, scatter, dispersion,
//              BarMark, barras, LineMark, lineas, tiempo, ultimos 7 dias,
//              relacion entre variables, chartForegroundStyleScale, sumar por categoria
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GymProgresoView.swift.
//   2. Pega el archivo. Cambia lo marcado con ✏️.
//   3. Desde la vista del TabView:  GymProgresoView(entrenamientos: lista)  (sin $)
//  NECESITA:   import Charts, Model/ (EntrenamientoGym, ModelDataGym),
//              Utils/PaletaGym.swift.
//  DE CLASE (Clase 15): Chart(datos) { item in Mark(x: .value(…), y: .value(…)) },
//     struct Identifiable para cada gráfica, colores A (.foregroundStyle(color))
//     y C (.foregroundStyle(by:) + .chartForegroundStyleScale), .chartLegend.
//  ⚠️ NO VISTO EN CLASE: nada nuevo. (En modo oscuro los ejes se leen gracias
//     a .preferredColorScheme(.dark) en GymAppView.)
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// Modelos de las gráficas: Identifiable, igual que en la Clase 15.
struct ResumenGrupoGym: Identifiable {
    var id: String {                 // id calculado: el grupo no se repite
        return grupo
    }
    let grupo: String
    let minutos: Int
}

struct CaloriasDiaGym: Identifiable {
    let id: Int                      // 0 = el más viejo … 6 = hoy
    let etiqueta: String             // "lun 12"
    let calorias: Double
}

struct GymProgresoView: View {

    // Solo LEE la lista → var simple.
    var entrenamientos: [EntrenamientoGym]

    let paleta = PaletaGym()

    // ── 1. Minutos por grupo (sumar con for, Clase 15 + ciclos) ─────
    var minutosPorGrupo: [ResumenGrupoGym] {
        var resultado: [ResumenGrupoGym] = []
        for grupo in gruposMuscularesGym {
            var suma = 0
            for entrenamiento in entrenamientos {
                if entrenamiento.grupo == grupo {
                    suma += entrenamiento.minutos
                }
            }
            if suma > 0 {
                resultado.append(ResumenGrupoGym(grupo: grupo, minutos: suma))
            }
        }
        return resultado
    }

    // ── 2. Calorías de cada uno de los últimos 7 días ───────────────
    // Del más viejo (hace 6 días) a hoy, para que la línea vaya en orden.
    var caloriasUltimos7Dias: [CaloriasDiaGym] {
        var resultado: [CaloriasDiaGym] = []
        for posicion in 0...6 {
            let fechaDia = fechaHaceDiasGym(dias: 6 - posicion)
            let textoDia = textoFechaGym(fecha: fechaDia, formato: "dd/MM/yyyy")
            var suma = 0.0
            for entrenamiento in entrenamientos {
                // ¿Mismo día? se comparan las fechas como texto.
                if textoFechaGym(fecha: entrenamiento.fecha, formato: "dd/MM/yyyy") == textoDia {
                    suma += entrenamiento.calorias
                }
            }
            let etiqueta = textoFechaGym(fecha: fechaDia, formato: "EEE d")          // "lun 12"
            resultado.append(CaloriasDiaGym(id: posicion, etiqueta: etiqueta, calorias: suma))
        }
        return resultado
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        // ── 3. PUNTOS: relación entre 2 variables ──
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Minutos vs calorías")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text("Puntos = relación entre 2 datos: ¿más minutos, más calorías?")
                                .font(.caption)
                                .foregroundStyle(paleta.textoSuave)
                            Chart(entrenamientos) { entrenamiento in
                                PointMark(
                                    x: .value("Minutos", entrenamiento.minutos),
                                    y: .value("Calorías", entrenamiento.calorias)
                                )
                                // Opción B: un color automático por tipo…
                                .foregroundStyle(by: .value("Tipo", entrenamiento.tipo))
                            }
                            // …y opción C: los colores que yo quiero (sobre el Chart).
                            .chartForegroundStyleScale([
                                "Cardio": paleta.graficas[4],
                                "Fuerza": paleta.graficas[2],
                                "Flexibilidad": paleta.graficas[0]
                            ])
                            .chartLegend(position: .bottom, alignment: .center)
                            .frame(height: 220)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 4. BARRAS: comparar categorías ─────────
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Minutos por grupo muscular")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text("Barras = comparar categorías.")
                                .font(.caption)
                                .foregroundStyle(paleta.textoSuave)
                            Chart(minutosPorGrupo) { item in
                                BarMark(
                                    x: .value("Grupo", item.grupo),
                                    y: .value("Minutos", item.minutos)
                                )
                                .foregroundStyle(paleta.primario)        // opción A: un solo color
                            }
                            .frame(height: 220)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 5. LÍNEAS: tendencia en el tiempo ──────
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calorías de los últimos 7 días")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text("Líneas = cómo cambia algo con el TIEMPO. Nunca para comparar categorías.")
                                .font(.caption)
                                .foregroundStyle(paleta.textoSuave)
                            Chart(caloriasUltimos7Dias) { item in
                                LineMark(
                                    x: .value("Día", item.etiqueta),
                                    y: .value("Calorías", item.calorias)
                                )
                                .foregroundStyle(paleta.primario)
                            }
                            .frame(height: 220)
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
    GymProgresoView(entrenamientos: cargarEntrenamientosEjemploGym())
        .preferredColorScheme(.dark)
}
