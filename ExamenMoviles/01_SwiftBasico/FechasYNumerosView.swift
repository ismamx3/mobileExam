// ═══════════════════════════════════════════════════════════════
//  FechasYNumerosView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Fechas (Date, DateFormatter, sumar días/meses) y
//              formato de números (decimales, moneda, porcentaje,
//              años sin coma).
//  ÚSALO PARA: mostrar la fecha de hoy en español, una fecha futura,
//              precios en pesos, promedios con 2 decimales.
//  BUSCA:      fecha, date, hoy, DateFormatter, formato fecha, dateStyle,
//              dateFormat, dd/MM/yyyy, sumar dias, sumar meses, Calendar,
//              DateComponents, edad, dias entre fechas, numero, decimales,
//              moneda, pesos, currency, MXN, precio, porcentaje, percent,
//              specifier, %.2f, formatted, grouping, año sin coma
//
//  CÓMO COPIARLO:
//   1. Copia la función del bloque que necesites (están abajo).
//   2. Para números en pantalla copia el Text del bloque 6, 7 u 8.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: Calendar.current.dateComponents (días entre
//              fechas / edad), format: .percent
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FechasYNumerosView: View {

    let precio = 1234.5               // ✏️ tus números
    let promedio = 87.6666
    let numeroGrande = 1234567.891
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
                        .short → \(fechaConEstilo(estilo: DateFormatter.Style.short))
                        .medium → \(fechaConEstilo(estilo: DateFormatter.Style.medium))
                        .long → \(fechaConEstilo(estilo: DateFormatter.Style.long))
                        .full → \(fechaConEstilo(estilo: DateFormatter.Style.full))
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
                        Text("6. Números con format:")
                            .font(.headline)
                        VStack(alignment: .leading, spacing: 6) {
                            Text(numeroGrande, format: .number)
                            Text(promedio, format: .number.precision(.fractionLength(2)))
                            Text(precio, format: .currency(code: "MXN"))
                            Text(avance, format: .percent)       // ⚠️ NO VISTO EN CLASE: porcentaje
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
                            Text("Total: \(precio.formatted(.currency(code: "MXN")))")
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
                        Text("9. Número → String con formato")
                            .font(.headline)
                        Text(numerosComoTexto())
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
    func fechaDeHoy() -> String {
        let fechaActual = Date()                         // fecha y hora de este momento

        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.long
        formato.timeStyle = DateFormatter.Style.none     // sin hora
        formato.locale = Locale(identifier: "es_MX")     // en español

        return formato.string(from: fechaActual)
    }

    // ── 2. Estilos ───────────────────────────────────
    func fechaConEstilo(estilo: DateFormatter.Style) -> String {
        let formato = DateFormatter()
        formato.dateStyle = estilo
        formato.timeStyle = DateFormatter.Style.none
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: Date())
    }

    // ── 3. Formato a la medida ───────────────────────
    // dd = día, MM = mes en número, MMMM = mes con letra,
    // yyyy = año, EEE = día corto, EEEE = día completo, HH:mm = hora
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

        // date(byAdding:) regresa OPCIONAL → if let
        if let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate) {
            return "Hoy + 2 meses y 10 días = \(fechaComoTexto(fecha: futureDate))"
        } else {
            return "No se pudo calcular la fecha"
        }
    }

    // ── 5. Días entre fechas y edad ──────────────────
    func diferenciaDeFechas() -> String {
        // Crear una fecha específica: también regresa opcional
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
    func numerosComoTexto() -> String {
        let numeroStr = numeroGrande.formatted(.number)
        let decimalesStr = promedio.formatted(.number.precision(.fractionLength(2)))
        let precioStr = precio.formatted(.currency(code: "MXN"))
        return "\(numeroStr)\n\(decimalesStr)\n\(precioStr)"
    }
}

#Preview {
    NavigationStack {
        FechasYNumerosView()
    }
}
