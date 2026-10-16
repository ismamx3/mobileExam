// ═══════════════════════════════════════════════════════════════
//  GastosResultadoAhorroView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La pantalla a la que navega la calculadora (patrón 6C).
//              RECIBE la meta, los meses y el ingreso (paso de valores de
//              IDA) y calcula cuánto ahorrar por mes, semana y día, qué %
//              de tu ingreso es, y en qué fecha llegarías a la meta.
//  ÚSALO PARA: cualquier pantalla de "resultado" que recibe datos.
//  BUSCA:      resultado, paso de valores, recibir datos, var sin State,
//              calculo, dividir, porcentaje, switch, mensaje segun valor,
//              sumar meses a una fecha, DateComponents month, dismiss
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ResultadoView.swift y pega el archivo.
//   2. Desde la otra pantalla:  ResultadoView(meta: meta, meses: meses, ingreso: ingreso)
//  NECESITA:   Model/GastoApp.swift (textoPesosGastos), Utils/PaletaGastos.swift,
//              Components/GastosFilaDato.swift
//
//  PASO DE VALORES DE IDA (Clase 6B, 2 pasos):
//   1. Aquí: variables que NO son private y NO llevan @State.
//   2. En la pantalla anterior: se asignan al llamar la vista.
//   NO llevan valor inicial: la pantalla anterior está OBLIGADA a dárselos
//   (si se le olvida, Xcode marca "Missing argument for parameter").
//
//  DE CLASE: paso de valores (6B), dismiss (6A), DateComponents + Calendar
//     para sumar a una fecha y DateFormatter (Clase 3B), switch.
//  ⚠️ NO VISTO EN CLASE: switch con rangos de Double (case 0..<10:).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosResultadoAhorroView: View {

    // Llegan de la calculadora (sin private, sin @State, sin valor inicial).
    var meta: Double
    var meses: Int
    var ingreso: Double

    @Environment(\.dismiss) private var dismiss

    let paleta = PaletaGastos()

    // ── Cálculos (propiedades calculadas a partir de lo recibido) ──
    var porMes: Double {
        return meta / Double(meses)          // Int → Double para poder dividir
    }

    var porSemana: Double {
        return porMes / 4.33                 // un mes tiene ~4.33 semanas
    }

    var porDia: Double {
        return porMes / 30
    }

    var porcentajeDelIngreso: Double {
        return porMes / ingreso * 100        // ingreso > 0: ya se validó antes
    }

    var mensaje: String {
        switch porcentajeDelIngreso {
        case 0..<10:
            return "¡Muy alcanzable! Es poco de tu ingreso."
        case 10..<30:
            return "Se puede, pero con disciplina."
        case 30..<100:
            return "Es mucho de tu ingreso. Considera más meses."
        default:
            return "No alcanza: ahorrarías más de lo que ganas."
        }
    }

    var colorMensaje: Color {
        switch porcentajeDelIngreso {
        case 0..<30:
            return paleta.bien
        case 30..<100:
            return paleta.cuidado
        default:
            return paleta.peligro
        }
    }

    // Fecha de hoy + N meses (Clase 3B: "sumar a una fecha").
    var fechaMeta: String {
        var dateComponent = DateComponents()
        dateComponent.month = meses

        if let futureDate = Calendar.current.date(byAdding: dateComponent, to: Date()) {
            let formato = DateFormatter()
            formato.dateStyle = DateFormatter.Style.long
            formato.timeStyle = DateFormatter.Style.none
            formato.locale = Locale(identifier: "es_MX")
            return formato.string(from: futureDate)
        }
        return "—"
    }

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Lo que llegó de la pantalla anterior ──
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Lo que recibí de la calculadora")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        GastosFilaDato(icono: "target", etiqueta: "Meta", valor: textoPesosGastos(meta))
                        GastosFilaDato(icono: "calendar", etiqueta: "Meses", valor: "\(meses)")
                        GastosFilaDato(icono: "banknote.fill", etiqueta: "Ingreso mensual", valor: textoPesosGastos(ingreso))
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 2. Resultado principal ─────────────────
                    VStack(spacing: 6) {
                        Text("Tienes que ahorrar")
                            .foregroundStyle(paleta.textoSuave)
                        Text(textoPesosGastos(porMes))
                            .font(.system(size: 42))
                            .bold()
                            .foregroundStyle(paleta.primario)
                        Text("al mes")
                            .foregroundStyle(paleta.textoSuave)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)

                    // ── 3. Desglose ────────────────────────────
                    HStack(spacing: 10) {
                        GastosTarjetaResumen(icono: "calendar.badge.clock", valor: textoPesosGastos(porSemana), etiqueta: "por semana")
                        GastosTarjetaResumen(icono: "sun.max.fill", valor: textoPesosGastos(porDia), etiqueta: "por día")
                        GastosTarjetaResumen(icono: "percent", valor: "\(Int(porcentajeDelIngreso))%", etiqueta: "de tu ingreso")
                    }

                    // ── 4. Mensaje según el porcentaje (switch) ─
                    Text(mensaje)
                        .font(.headline)
                        .foregroundStyle(colorMensaje)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)

                    // ── 5. Fecha en que llegas a la meta ───────
                    Label("Llegarías a tu meta el \(fechaMeta)", systemImage: "flag.checkered")
                        .foregroundStyle(paleta.texto)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(14)

                    // ── 6. Regresar a ajustar ──────────────────
                    Button {
                        dismiss()
                    } label: {
                        Label("Regresar y ajustar", systemImage: "slider.horizontal.3")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .background(paleta.primario)
                            .cornerRadius(14)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Resultado")
        .navigationBarTitleDisplayMode(.inline)       // ⚠️ título chico
    }
}

#Preview {
    NavigationStack {
        GastosResultadoAhorroView(meta: 12000, meses: 6, ingreso: 8000)
    }
}
