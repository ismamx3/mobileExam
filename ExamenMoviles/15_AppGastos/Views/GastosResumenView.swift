// ═══════════════════════════════════════════════════════════════
//  GastosResumenView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Resumen": saludo con el nombre del login, cuánto
//              llevas gastado ESTE MES, una barra de presupuesto que cambia
//              de color (verde / naranja / rojo) con un switch, 3 tarjetas
//              iguales (total, promedio, gasto mayor) y los últimos gastos.
//  ÚSALO PARA: un tablero/dashboard con cálculos de dinero.
//  BUSCA:      resumen, dashboard, total, suma, promedio, maximo, mayor,
//              porcentaje, presupuesto, ProgressView, switch rangos, color
//              segun valor, mismo mes, dividir entre cero, for, propiedad calculada
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ResumenView.swift y pega el archivo.
//   2. Cambia lo marcado con ✏️.
//  NECESITA:   Model/GastoApp.swift, Utils/PaletaGastos.swift,
//              Components/GastosTarjetaResumen.swift, Components/GastoRow.swift
//
//  ¿POR QUÉ `var gastos` Y NO @State NI @Binding?
//   La DUEÑA de la lista es GastosAppView (@State). Esta pestaña SOLO la
//   muestra, así que la recibe con `var` (paso de valores de IDA, Clase 6B).
//   Si aquí pusieras @State private var gastos = cargarGastosApp(), sería
//   OTRA lista: lo que agregues en la pestaña Gastos no se vería aquí.
//
//  ¿POR QUÉ LOS TOTALES SON PROPIEDADES CALCULADAS Y NO @State?
//   Porque SALEN de la lista. Si los guardaras en otra @State, al agregar un
//   gasto la lista cambia pero el total se queda viejo. Una propiedad
//   calculada (var x: Double { ... }) se vuelve a calcular sola.
//   (Y no puedes hacer  @State private var total = gastos.count : Xcode
//   marca "Cannot use instance member … within property initializer".)
//
//  DE CLASE: for + if para sumar/contar, switch, ProgressView con
//     .scaleEffect(x: 1, y: 3) (Clase 15), DateFormatter (Clase 3B).
//  ⚠️ NO VISTO EN CLASE: switch con rangos de Double (case 0..<70:),
//     min(a, b), sorted { a, b in … } para ordenar por fecha.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosResumenView: View {

    var gastos: Array<GastoApp>        // solo lee (la dueña es GastosAppView)
    var presupuesto: Double
    var nombreUsuario: String

    let paleta = PaletaGastos()

    // ── Cálculos (propiedades calculadas) ───────────────────────

    // "10/2026" de HOY, para comparar con el mes de cada gasto.
    var mesActual: String {
        let formato = DateFormatter()
        formato.dateFormat = "MM/yyyy"
        return formato.string(from: Date())
    }

    // Solo los gastos de este mes (for + if + append).
    var gastosDelMes: Array<GastoApp> {
        var resultado = Array<GastoApp>()
        for gasto in gastos {
            if gasto.mesTexto == mesActual {
                resultado.append(gasto)
            }
        }
        return resultado
    }

    // Suma de los montos del mes.
    var totalDelMes: Double {
        var suma = 0.0
        for gasto in gastosDelMes {
            suma += gasto.monto
        }
        return suma
    }

    // Promedio = suma / cantidad. OJO: si no hay gastos, dividir entre 0
    // da un resultado inválido (NaN), por eso primero se revisa.
    var promedio: Double {
        if gastosDelMes.isEmpty {
            return 0
        }
        return totalDelMes / Double(gastosDelMes.count)
    }

    // El gasto más caro del mes (se recorre buscando el mayor).
    var gastoMayor: Double {
        var mayor = 0.0
        for gasto in gastosDelMes {
            if gasto.monto > mayor {
                mayor = gasto.monto
            }
        }
        return mayor
    }

    // Qué tanto del presupuesto llevas, en porcentaje.
    var porcentajeUsado: Double {
        if presupuesto <= 0 {
            return 0
        }
        return totalDelMes / presupuesto * 100
    }

    // Color según el porcentaje (switch con rangos ⚠️).
    var colorPresupuesto: Color {
        switch porcentajeUsado {
        case 0..<70:
            return paleta.bien
        case 70..<100:
            return paleta.cuidado
        default:
            return paleta.peligro
        }
    }

    var mensajePresupuesto: String {
        switch porcentajeUsado {
        case 0..<70:
            return "Vas muy bien 👌"
        case 70..<100:
            return "Cuidado, ya casi llegas al límite"
        default:
            return "Te pasaste del presupuesto"
        }
    }

    // Los 3 más recientes. ⚠️ sorted ordena: aquí, la fecha más nueva primero.
    var ultimosGastos: Array<GastoApp> {
        let ordenados = gastos.sorted { a, b in
            a.fecha > b.fecha
        }
        var resultado = Array<GastoApp>()
        for gasto in ordenados {
            if resultado.count < 3 {
                resultado.append(gasto)
            }
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

                        // ── 1. Saludo (dato que llegó del login) ───
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Hola, \(nombreUsuario) 👋")
                                .font(.title)
                                .bold()
                                .foregroundStyle(paleta.texto)
                            Text("Este mes llevas gastado")
                                .foregroundStyle(paleta.textoSuave)
                            Text(textoPesosGastos(totalDelMes))
                                .font(.system(size: 40))
                                .bold()
                                .foregroundStyle(paleta.primario)
                        }

                        // ── 2. Presupuesto con color según el % ────
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Presupuesto del mes")
                                    .font(.headline)
                                    .foregroundStyle(paleta.texto)
                                Spacer()
                                Text("\(porcentajeUsado, specifier: "%.0f")%")
                                    .font(.headline)
                                    .foregroundStyle(colorPresupuesto)
                            }
                            // value no puede pasar de total: por eso min(...) ⚠️
                            ProgressView(value: min(totalDelMes, presupuesto), total: presupuesto)
                                .scaleEffect(x: 1, y: 3)
                                .tint(colorPresupuesto)
                                .padding(.vertical, 6)
                            Text("\(textoPesosGastos(totalDelMes)) de \(textoPesosGastos(presupuesto))")
                                .font(.subheadline)
                                .foregroundStyle(paleta.textoSuave)
                            Text(mensajePresupuesto)
                                .bold()
                                .foregroundStyle(colorPresupuesto)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 3. Tres tarjetas del mismo tamaño ──────
                        HStack(spacing: 10) {
                            GastosTarjetaResumen(icono: "number", valor: "\(gastosDelMes.count)", etiqueta: "Gastos del mes")
                            GastosTarjetaResumen(icono: "divide.circle.fill", valor: textoPesosGastos(promedio), etiqueta: "Promedio")
                            GastosTarjetaResumen(icono: "arrow.up.circle.fill", valor: textoPesosGastos(gastoMayor), etiqueta: "Gasto mayor")
                        }

                        // ── 4. Últimos gastos ──────────────────────
                        Text("Últimos gastos")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(paleta.texto)
                        VStack(spacing: 0) {
                            ForEach(ultimosGastos) { gasto in       // ⚠️ ForEach (lista sin List)
                                GastoRow(gasto: gasto)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                Divider()
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(16)
                    }
                    .padding()
                }
            }
            .navigationTitle("Resumen")
        }
    }
}

#Preview {
    GastosResumenView(gastos: cargarGastosApp(), presupuesto: 6000, nombreUsuario: "Alumno")
}
