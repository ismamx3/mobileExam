// ═══════════════════════════════════════════════════════════════
//  FechasYNumerosView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Fechas (Date, DateFormatter, sumar días/meses) y
//              formato de números (decimales, moneda, porcentaje,
//              años sin coma). Sigue la Clase 3B (Manejo de Fechas y
//              Formatos) con los mismos nombres de las láminas.
//  ÚSALO PARA: mostrar la fecha de hoy en español, una fecha futura,
//              precios en pesos, promedios con 2 decimales.
//  BUSCA:      fecha, date, hoy, DateFormatter, formato fecha, dateStyle,
//              dateFormat, dd/MM/yyyy, sumar dias, sumar meses, Calendar,
//              DateComponents, edad, dias entre fechas, numero, decimales,
//              moneda, pesos, currency, MXN, precio, porcentaje, percent,
//              specifier, %.2f, formatted, grouping, año sin coma,
//              timeStyle, hora, Locale, es_MX, numeroBase, precioBase,
//              NumberFormatter, spellOut, ordinal, numero con letra,
//              fractionLength, currentDate, futureDate
//
//  CÓMO COPIARLO:
//   1. Copia la función del bloque que necesites (están abajo).
//   2. Para números en pantalla copia el Text del bloque 6, 7 u 8.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: Calendar.current.date(from:) y
//              Calendar.current.dateComponents (bloque 5: fecha fija,
//              edad, días entre fechas). format: .percent y el código
//              con NumberFormatter() del bloque 10 no se escribieron en
//              clase, pero sus estilos SÍ vienen en la tabla
//              "Formatos predefinidos (Número)" de la Clase 3B.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FechasYNumerosView: View {

    let numeroBase = 1234567.891      // ✏️ tus números (nombres de la lámina)
    let precioBase = 1234.5
    let promedio = 87.6666
    let anio = 2026
    let rating = 4.25
    let avance = 0.75                 // 0.75 = 75 %

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Fecha de hoy ──────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Fecha de hoy")
                            .font(.headline)
                        Text(fechaDeHoy())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 2. Estilos de DateFormatter ──────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Estilos (.short .medium .long .full)")
                            .font(.headline)
                        Text("""
                        dateStyle .short → \(fechaConEstilo(estilo: DateFormatter.Style.short))
                        dateStyle .medium → \(fechaConEstilo(estilo: DateFormatter.Style.medium))
                        dateStyle .long → \(fechaConEstilo(estilo: DateFormatter.Style.long))
                        dateStyle .full → \(fechaConEstilo(estilo: DateFormatter.Style.full))

                        timeStyle .short → \(horaConEstilo(estilo: DateFormatter.Style.short))
                        timeStyle .medium → \(horaConEstilo(estilo: DateFormatter.Style.medium))
                        timeStyle .long → \(horaConEstilo(estilo: DateFormatter.Style.long))
                        timeStyle .full → \(horaConEstilo(estilo: DateFormatter.Style.full))
                        """)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 3. Formato a la medida ───────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. Formato a la medida")
                            .font(.headline)
                        Text("""
                        dd/MM/yyyy → \(fechaConFormato(formato: "dd/MM/yyyy"))
                        dd/MMMM/yyyy → \(fechaConFormato(formato: "dd/MMMM/yyyy"))
                        EEE, dd 'de' MMMM → \(fechaConFormato(formato: "EEE, dd 'de' MMMM"))
                        EEEE → \(fechaConFormato(formato: "EEEE"))
                        HH:mm (hora 24 h) → \(fechaConFormato(formato: "HH:mm"))
                        """)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 4. Sumar a una fecha ─────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. Sumar meses o días")
                            .font(.headline)
                        Text(fechaFutura())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 5. Días entre fechas / edad ──────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("5. Días entre fechas y edad")
                            .font(.headline)
                        Text(diferenciaDeFechas())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 6. Números dentro de un Text ─────────────
                    VStack(alignment: .leading, spacing: 8) {
                        // Lámina "Formatear Número": para un número que va en un elemento Text()
                        Text("6. Números con format:")
                            .font(.headline)
                        VStack(alignment: .leading, spacing: 6) {
                            Text(numeroBase, format: .number)
                            Text(promedio, format: .number.precision(.fractionLength(2)))
                            Text(precioBase, format: .currency(code: "MXN"))
                            // ⚠️ NO VISTO EN CLASE: format: .percent (el estilo percent sí está en la tabla de la Clase 3B)
                            Text(avance, format: .percent)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 7. Número dentro de un texto más largo ───
                    VStack(alignment: .leading, spacing: 8) {
                        Text("7. Interpolar con decimales fijos")
                            .font(.headline)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Calificación: \(rating, specifier: "%.1f") ⭐️")
                            Text("Promedio: \(promedio, specifier: "%.2f")")
                            Text("Total: \(precioBase.formatted(.currency(code: "MXN")))")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 8. Años sin coma ─────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("8. Años sin separador de miles")
                            .font(.headline)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Mal: \(anio)")                                     // sale "2,026"
                            Text("Bien: \(anio, format: .number.grouping(.never))")   // sale "2026"
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 9. Convertir número a String ─────────────
                    VStack(alignment: .leading, spacing: 8) {
                        // Lámina: "para convertir a un texto formateado para asignar a un String"
                        Text("9. Número → String con formato")
                            .font(.headline)
                        Text(numerosComoTexto())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 10. Otros estilos predefinidos (NumberFormatter.Style) ──
                    VStack(alignment: .leading, spacing: 8) {
                        Text("10. Número con letra, ordinal, científico")
                            .font(.headline)
                        Text("""
                        .spellOut → \(numeroConEstilo(numero: 123, estilo: NumberFormatter.Style.spellOut))
                        .ordinal → \(numeroConEstilo(numero: 3, estilo: NumberFormatter.Style.ordinal))
                        .decimal → \(numeroConEstilo(numero: 1234.568, estilo: NumberFormatter.Style.decimal))
                        .percent → \(numeroConEstilo(numero: 0.12, estilo: NumberFormatter.Style.percent))
                        .scientific → \(numeroConEstilo(numero: 1234.5678, estilo: NumberFormatter.Style.scientific))
                        """)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Fechas y números")
    }

    // ── 1. Fecha de hoy ──────────────────────────────
    // Los 3 pasos de la lámina "La clase DateFormatter":
    func fechaDeHoy() -> String {
        let fechaActual = Date()                         // constructor vacío = fecha y hora actual

        let formato = DateFormatter()                    // 1. generar el formateador
        formato.dateStyle = DateFormatter.Style.long     // 2. elegir el estilo predefinido
        formato.timeStyle = DateFormatter.Style.none     //    no muestra hora
        formato.locale = Locale(identifier: "es_MX")     //    español de México

        return formato.string(from: fechaActual)         // 3. obtener el string formateado
    }

    // ── 2. Estilos ───────────────────────────────────
    // Sin locale salen en inglés como en la tabla de la lámina (Jan 20, 2016 · 9:54 PM).
    func fechaConEstilo(estilo: DateFormatter.Style) -> String {
        let formato = DateFormatter()
        formato.dateStyle = estilo
        formato.timeStyle = DateFormatter.Style.none
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: Date())
    }

    // Igual, pero solo la HORA (timeStyle) y sin fecha
    func horaConEstilo(estilo: DateFormatter.Style) -> String {
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.none
        formato.timeStyle = estilo
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: Date())
    }

    // ── 3. Formato a la medida ───────────────────────
    // Para un formato diferente a los predefinidos se usa el atributo dateFormat.
    // dd = día, MM = mes en número, MMMM = mes con letra,
    // yyyy = año, EEE = día corto, EEEE = día completo, HH:mm = hora
    // Lámina: "EEE, dd 'de' MMMM" → Wed, 20 de January (en inglés sin locale)
    func fechaConFormato(formato: String) -> String {
        let formateador = DateFormatter()
        formateador.dateFormat = formato                  // ✏️ ej. "dd/MM/yyyy"
        formateador.locale = Locale(identifier: "es_MX")
        return formateador.string(from: Date())
    }

    // ── 4. Sumar a una fecha ─────────────────────────
    func fechaFutura() -> String {
        let currentDate = Date()

        var dateComponent = DateComponents()
        dateComponent.month = 2                           // ✏️ meses a sumar
        dateComponent.day = 10                            // ✏️ días a sumar

        // date(byAdding:) regresa OPCIONAL ("Solo aguas… esta constante es OPCIONAL") → if let
        if let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate) {
            return "Hoy + 2 meses y 10 días = \(fechaComoTexto(fecha: futureDate))"
        } else {
            return "No se pudo calcular la fecha"
        }
    }

    // ── 5. Días entre fechas y edad ──────────────────
    func diferenciaDeFechas() -> String {
        // ⚠️ NO VISTO EN CLASE: Calendar.current.date(from:) crea una fecha específica
        // a partir de año/mes/día. También regresa opcional → if let.
        var componentes = DateComponents()
        componentes.year = 2004                           // ✏️ fecha de nacimiento
        componentes.month = 5
        componentes.day = 17

        if let nacimiento = Calendar.current.date(from: componentes) {
            // ⚠️ NO VISTO EN CLASE: dateComponents calcula la diferencia entre dos fechas
            let diferencia = Calendar.current.dateComponents([.year, .day], from: nacimiento, to: Date())

            var texto = "Nacimiento: \(fechaComoTexto(fecha: nacimiento))"
            if let anios = diferencia.year {
                texto += "\nEdad: \(anios) años"
            }

            let soloDias = Calendar.current.dateComponents([.day], from: nacimiento, to: Date())
            if let dias = soloDias.day {
                texto += "\nDías vividos: \(dias)"
            }
            return texto
        } else {
            return "Fecha inválida"
        }
    }

    // Ayudante: convierte cualquier Date a texto corto en español
    func fechaComoTexto(fecha: Date) -> String {
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.medium
        formato.timeStyle = DateFormatter.Style.none
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: fecha)
    }

    // ── 9. Número → String ───────────────────────────
    // a) .number   b) .number.precision(.fractionLength(2))   c) .currency(code: "MXN")
    func numerosComoTexto() -> String {
        let numeroStr = numeroBase.formatted(.number)
        let decimalesStr = promedio.formatted(.number.precision(.fractionLength(2)))
        let precioStr = precioBase.formatted(.currency(code: "MXN"))
        return "\(numeroStr)\n\(decimalesStr)\n\(precioStr)"
    }

    // ── 10. Estilos de la tabla "Formatos predefinidos (Número)" ──
    // ⚠️ NO VISTO EN CLASE: el código con NumberFormatter(). Los pasos son
    // iguales a DateFormatter: generar el formateador, elegir estilo,
    // pedir el string. string(from:) regresa OPCIONAL → if let.
    func numeroConEstilo(numero: Double, estilo: NumberFormatter.Style) -> String {
        let formateador = NumberFormatter()
        formateador.numberStyle = estilo
        formateador.locale = Locale(identifier: "es_MX")
        if let texto = formateador.string(from: NSNumber(value: numero)) {
            return texto
        } else {
            return "Sin formato"
        }
    }
}

#Preview {
    NavigationStack {
        FechasYNumerosView()
    }
}
