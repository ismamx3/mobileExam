// ═══════════════════════════════════════════════════════════════
//  AgendaGuiaFechasView.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Un LABORATORIO DE FECHAS. Eliges una fecha arriba y
//              ves EN VIVO qué sale con cada estilo (dateStyle,
//              timeStyle), con cada dateFormat, al sumar/restar días y
//              meses, al comparar, ordenar y convertir texto → fecha.
//              Abajo, los errores típicos demostrados.
//  ÚSALO PARA: entender las fechas y copiar el formato que necesites.
//              Al lado de cada resultado está el código que lo produce.
//  BUSCA:      fechas, laboratorio, date, dateStyle, timeStyle, dateFormat,
//              simbolos fecha, dd MM yyyy, EEEE, HH mm, sumar dias, sumar
//              meses, restar, comparar fechas, ordenar fechas, texto a fecha,
//              date(from:), MM vs mm, hh vs HH, yyyy vs YYYY
//
//  CÓMO COPIARLO:
//   No es para copiar entera: copia el código que aparece junto al
//   resultado que quieres (va escrito en gris en cada fila).
//  NECESITA:   Utils/FechasAgenda.swift, Utils/PaletaAgenda.swift.
//  ⚠️ NO VISTO EN CLASE: DatePicker, ForEach, sorted, date(from:),
//     dateComponents(_:from:to:), .description. Lo demás es de la Clase 3B.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Un renglón de la tabla de dateFormat
struct FormatoFechaAgenda: Identifiable {
    var id: Int
    var formato: String
    var explicacion: String
}

struct AgendaGuiaFechasView: View {

    @State private var fechaBase = Date()            // la fecha que se analiza
    @State private var diasASumar = 0
    @State private var mesesASumar = 0
    @State private var textoFecha = "15/04/2024 18:30"

    let paleta = PaletaAgenda()

    // ✏️ Tabla de formatos: agrega los que quieras probar
    let formatos: Array<FormatoFechaAgenda> = [
        FormatoFechaAgenda(id: 1, formato: "dd/MM/yyyy", explicacion: "día/mes/año con números"),
        FormatoFechaAgenda(id: 2, formato: "d 'de' MMMM 'de' yyyy", explicacion: "lo de 'comillas' sale tal cual"),
        FormatoFechaAgenda(id: 3, formato: "EEEE d 'de' MMMM", explicacion: "día de la semana completo"),
        FormatoFechaAgenda(id: 4, formato: "EEE, dd 'de' MMMM", explicacion: "el de la lámina (Clase 3B)"),
        FormatoFechaAgenda(id: 5, formato: "dd/MMMM/yyyy", explicacion: "el otro de la lámina"),
        FormatoFechaAgenda(id: 6, formato: "MMM yyyy", explicacion: "mes corto + año"),
        FormatoFechaAgenda(id: 7, formato: "MMMM", explicacion: "solo el mes"),
        FormatoFechaAgenda(id: 8, formato: "EEEE", explicacion: "solo el día de la semana"),
        FormatoFechaAgenda(id: 9, formato: "h:mm a", explicacion: "hora 1-12 con a.m./p.m."),
        FormatoFechaAgenda(id: 10, formato: "HH:mm", explicacion: "hora 0-23 (formato 24 h)"),
        FormatoFechaAgenda(id: 11, formato: "HH:mm:ss", explicacion: "con segundos"),
        FormatoFechaAgenda(id: 12, formato: "yy", explicacion: "año con 2 cifras"),
        FormatoFechaAgenda(id: 13, formato: "dd/MM/yyyy HH:mm", explicacion: "fecha y hora juntas")
    ]

    // fechaBase + días + meses (forma de la Clase 3B, con if let)
    var fechaCalculada: Date {
        var dateComponent = DateComponents()
        dateComponent.day = diasASumar
        dateComponent.month = mesesASumar
        if let futureDate = Calendar.current.date(byAdding: dateComponent, to: fechaBase) {
            return futureDate
        }
        return fechaBase
    }

    // ¿La fecha base es pasado, hoy o futuro? (comparar fechas)
    var comparacion: String {
        if claveDiaAgenda(fecha: fechaBase) == claveDiaAgenda(fecha: Date()) {
            return "Es HOY (mismas claves \"dd/MM/yyyy\")"
        } else if fechaBase < Date() {
            return "Ya pasó (fechaBase < Date() es true)"
        }
        return "Es en el futuro (fechaBase > Date() es true)"
    }

    // Texto → fecha CON dateFormat (la buena)
    var resultadoTextoAFecha: String {
        if let fecha = fechaExactaAgenda(texto: textoFecha) {
            return "✅ " + fechaConEstiloAgenda(fecha: fecha, estiloFecha: .full, estiloHora: .short)
        }
        return "❌ nil: el texto no coincide con \"dd/MM/yyyy HH:mm\""
    }

    // Texto → fecha SIN dateFormat (la trampa)
    var resultadoSinFormato: String {
        let formato = DateFormatter()                 // le falta formato.dateFormat = …
        if let fecha = formato.date(from: textoFecha) {
            return "Salió: " + fechaConEstiloAgenda(fecha: fecha, estiloFecha: .long, estiloHora: .none)
        }
        return "❌ nil → con ?? Date() quedaría HOY sin avisarte"
    }

    // Tres fechas desordenadas para el ejemplo de ordenar
    var fechasDesordenadas: Array<Date> {
        return [fechaAgenda(dias: 5, horas: 10), fechaAgenda(dias: -2, horas: 9), fechaAgenda(dias: 1, horas: 18)]
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        seccionFechaBase
                        seccionEstilos
                        seccionFormatos
                        seccionSumar
                        seccionComparar
                        seccionTextoAFecha
                        seccionErrores
                    }
                    .padding()
                }
            }
            .navigationTitle("Laboratorio de fechas")
        }
    }

    // ── Renglón: código (gris) arriba y resultado (negritas) abajo ──
    func filaLab(codigo: String, resultado: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(codigo)
                .font(.caption)
                .monospaced()
                .foregroundStyle(paleta.textoSuave)
            Text(resultado)
                .bold()
                .foregroundStyle(paleta.texto)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 4)
    }

    func tarjeta(titulo: String, explicacion: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(titulo)
                .font(.title3)
                .bold()
                .foregroundStyle(paleta.primario)
            Text(explicacion)
                .font(.subheadline)
                .foregroundStyle(paleta.textoSuave)
        }
    }

    // ── 1. La fecha base ────────────────────────────────────────────
    var seccionFechaBase: some View {
        VStack(alignment: .leading, spacing: 10) {
            tarjeta(titulo: "1. Date = un instante",
                    explicacion: "Un Date guarda UN momento exacto (día + hora). No sabe de idiomas ni formatos: para mostrarlo bonito se usa un DateFormatter.")
            // ⚠️ DatePicker para cambiar la fecha que se analiza
            DatePicker("Fecha a analizar", selection: $fechaBase,
                       displayedComponents: [.date, .hourAndMinute])
                .foregroundStyle(paleta.texto)
                .environment(\.locale, Locale(identifier: "es_MX"))
            filaLab(codigo: "let fechaActual = Date()   // constructor vacío = ahorita",
                    resultado: "Así se ve un Date SIN formatear (print):")
            Text(fechaBase.description)
                .font(.caption)
                .monospaced()
                .foregroundStyle(paleta.alerta)
            Text("Sale en inglés y en hora UTC. Por eso SIEMPRE se usa un DateFormatter con locale es_MX.")
                .font(.caption)
                .foregroundStyle(paleta.textoSuave)
            Button("Volver a ahorita") {
                fechaBase = Date()
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(paleta.superficie)
        .cornerRadius(16)
        .tint(paleta.primario)
    }

    // ── 2. Estilos predefinidos (Clase 3B) ──────────────────────────
    var seccionEstilos: some View {
        VStack(alignment: .leading, spacing: 6) {
            tarjeta(titulo: "2. dateStyle y timeStyle",
                    explicacion: "Los 3 pasos de clase: 1) DateFormatter()  2) elegir estilo  3) string(from:). El locale lo pone en español.")
            filaLab(codigo: "formato.dateStyle = DateFormatter.Style.short",
                    resultado: fechaConEstiloAgenda(fecha: fechaBase, estiloFecha: .short, estiloHora: .none))
            filaLab(codigo: "formato.dateStyle = DateFormatter.Style.medium",
                    resultado: fechaConEstiloAgenda(fecha: fechaBase, estiloFecha: .medium, estiloHora: .none))
            filaLab(codigo: "formato.dateStyle = DateFormatter.Style.long",
                    resultado: fechaConEstiloAgenda(fecha: fechaBase, estiloFecha: .long, estiloHora: .none))
            filaLab(codigo: "formato.dateStyle = DateFormatter.Style.full",
                    resultado: fechaConEstiloAgenda(fecha: fechaBase, estiloFecha: .full, estiloHora: .none))
            filaLab(codigo: "formato.timeStyle = DateFormatter.Style.short",
                    resultado: fechaConEstiloAgenda(fecha: fechaBase, estiloFecha: .none, estiloHora: .short))
            filaLab(codigo: "formato.timeStyle = DateFormatter.Style.medium",
                    resultado: fechaConEstiloAgenda(fecha: fechaBase, estiloFecha: .none, estiloHora: .medium))
            filaLab(codigo: "formato.timeStyle = DateFormatter.Style.long",
                    resultado: fechaConEstiloAgenda(fecha: fechaBase, estiloFecha: .none, estiloHora: .long))
            filaLab(codigo: "dateStyle = .long  +  timeStyle = .short",
                    resultado: fechaConEstiloAgenda(fecha: fechaBase, estiloFecha: .long, estiloHora: .short))
            Text(".none = no muestra esa parte (la fecha o la hora).")
                .font(.caption)
                .foregroundStyle(paleta.textoSuave)
        }
        .padding()
        .background(paleta.superficie)
        .cornerRadius(16)
    }

    // ── 3. dateFormat: formato a la medida (Clase 3B) ───────────────
    var seccionFormatos: some View {
        VStack(alignment: .leading, spacing: 6) {
            tarjeta(titulo: "3. dateFormat (a la medida)",
                    explicacion: "formato.dateFormat = \"…\"  ← es una PROPIEDAD, va con =. Cada letra es una parte: d día · M mes · y año · E día de la semana · H/h hora · m minutos · s segundos · a a.m./p.m.")
            ForEach(formatos) { item in                         // ⚠️ ForEach
                filaLab(codigo: "\"\(item.formato)\"  →  \(item.explicacion)",
                        resultado: formatearFechaAgenda(fecha: fechaBase, formato: item.formato))
            }
        }
        .padding()
        .background(paleta.superficie)
        .cornerRadius(16)
    }

    // ── 4. Sumar y restar (Clase 3B: DateComponents) ────────────────
    var seccionSumar: some View {
        VStack(alignment: .leading, spacing: 10) {
            tarjeta(titulo: "4. Sumar y restar",
                    explicacion: "DateComponents dice CUÁNTO sumar (negativo = restar) y Calendar.current.date(byAdding:to:) lo calcula. Regresa OPCIONAL: se abre con if let.")

            HStack(spacing: 8) {
                Button("−1 mes") { mesesASumar -= 1 }
                Button("−1 día") { diasASumar -= 1 }
                Button("+1 día") { diasASumar += 1 }
                Button("+7 días") { diasASumar += 7 }
                Button("+1 mes") { mesesASumar += 1 }
            }
            .buttonStyle(.bordered)
            .font(.caption)

            filaLab(codigo: "dateComponent.day = \(diasASumar)\ndateComponent.month = \(mesesASumar)",
                    resultado: fechaConEstiloAgenda(fecha: fechaCalculada, estiloFecha: .full, estiloHora: .short))

            Button("Reiniciar") {
                diasASumar = 0
                mesesASumar = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(paleta.superficie)
        .cornerRadius(16)
        .tint(paleta.primario)
    }

    // ── 5. Comparar, diferencia y ordenar ⚠️ ─────────────────────────
    var seccionComparar: some View {
        VStack(alignment: .leading, spacing: 6) {
            tarjeta(titulo: "5. Comparar, diferencia y ordenar",
                    explicacion: "Las fechas se comparan con < > == como números (más antigua = más chica).")
            filaLab(codigo: "fechaBase < Date()   /   claves iguales",
                    resultado: comparacion)
            // ⚠️ dateComponents([.day], from:to:)
            filaLab(codigo: "diasEntreAgenda(desde: Date(), hasta: fechaBase)  ⚠️",
                    resultado: "\(diasEntreAgenda(desde: Date(), hasta: fechaBase)) días desde hoy")
            filaLab(codigo: "Desordenadas:",
                    resultado: textoDeFechas(fechasDesordenadas))
            // ⚠️ sorted: < = de la más antigua a la más nueva; > = al revés
            filaLab(codigo: "fechas.sorted { $0 < $1 }   ⚠️",
                    resultado: textoDeFechas(fechasDesordenadas.sorted { $0 < $1 }))
            filaLab(codigo: "fechas.sorted { $0 > $1 }   ⚠️",
                    resultado: textoDeFechas(fechasDesordenadas.sorted { $0 > $1 }))
        }
        .padding()
        .background(paleta.superficie)
        .cornerRadius(16)
    }

    func textoDeFechas(_ fechas: Array<Date>) -> String {
        var texto = ""
        for fecha in fechas {
            if !texto.isEmpty {
                texto += "  ·  "
            }
            texto += formatearFechaAgenda(fecha: fecha, formato: "dd/MM")
        }
        return texto
    }

    // ── 6. Texto → fecha ⚠️ ──────────────────────────────────────────
    var seccionTextoAFecha: some View {
        VStack(alignment: .leading, spacing: 8) {
            tarjeta(titulo: "6. Texto → fecha ⚠️",
                    explicacion: "date(from:) LEE un texto usando el dateFormat. Regresa opcional (nil si el texto no coincide). En clase solo se vio fecha → texto.")
            TextField("dd/MM/yyyy HH:mm", text: $textoFecha)
                .textFieldStyle(.roundedBorder)
            filaLab(codigo: "formato.dateFormat = \"dd/MM/yyyy HH:mm\"\nformato.date(from: texto)",
                    resultado: resultadoTextoAFecha)
            filaLab(codigo: "SIN dateFormat → formato.date(from: texto)",
                    resultado: resultadoSinFormato)
            Text("Prueba escribir \"2024-04-15\" o \"15/4/24\": como no coincide con el formato, sale nil.")
                .font(.caption)
                .foregroundStyle(paleta.textoSuave)
        }
        .padding()
        .background(paleta.superficie)
        .cornerRadius(16)
    }

    // ── 7. Errores típicos, demostrados ─────────────────────────────
    var seccionErrores: some View {
        VStack(alignment: .leading, spacing: 6) {
            tarjeta(titulo: "7. Errores típicos",
                    explicacion: "Mira cómo cambia el resultado con UNA letra.")
            filaLab(codigo: "\"HH:mm\"  (mm = minutos) ✅",
                    resultado: formatearFechaAgenda(fecha: fechaBase, formato: "HH:mm"))
            filaLab(codigo: "\"HH:MM\"  (MM = MES) ❌",
                    resultado: formatearFechaAgenda(fecha: fechaBase, formato: "HH:MM"))
            filaLab(codigo: "\"HH:mm\"  (HH = 0-23)",
                    resultado: formatearFechaAgenda(fecha: fechaBase, formato: "HH:mm"))
            filaLab(codigo: "\"hh:mm\"  (hh = 1-12, sin a.m./p.m. se confunde) ❌",
                    resultado: formatearFechaAgenda(fecha: fechaBase, formato: "hh:mm"))
            filaLab(codigo: "\"dd/MM/yyyy\"  (yyyy = año normal) ✅",
                    resultado: formatearFechaAgenda(fecha: fechaBase, formato: "dd/MM/yyyy"))
            filaLab(codigo: "\"dd/MM/YYYY\"  (YYYY = año de la SEMANA) ❌",
                    resultado: formatearFechaAgenda(fecha: fechaBase, formato: "dd/MM/YYYY"))
            Text("YYYY se ve igual casi todo el año, pero falla en los últimos días de diciembre (pon 30/12 en la fecha de arriba y compara). Usa siempre yyyy.")
                .font(.caption)
                .foregroundStyle(paleta.textoSuave)
            Text("Otros: formato.dateFormat(\"…\") ❌ → va con =.  Configurar el formateador fuera de una func ❌ → \"Expressions are not allowed at the top level\".  Sin locale ❌ → sale en inglés.")
                .font(.caption)
                .foregroundStyle(paleta.alerta)
        }
        .padding()
        .background(paleta.superficie)
        .cornerRadius(16)
    }
}

#Preview {
    AgendaGuiaFechasView()
}
