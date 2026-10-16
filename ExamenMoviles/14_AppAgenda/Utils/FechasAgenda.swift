// ═══════════════════════════════════════════════════════════════
//  FechasAgenda.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     TODAS las funciones de fechas de la app, en un solo
//              archivo y explicadas paso a paso:
//               1. fechaAgenda(dias:horas:)      → "hoy + N días a tal hora"
//               2. fechaExactaAgenda(texto:)     → "15/04/2024 18:30" → Date  ⚠️
//               3. formatearFechaAgenda(...)     → Date → texto con dateFormat
//               4. fechaConEstiloAgenda(...)     → Date → texto con dateStyle
//               5. claveDiaAgenda(fecha:)        → "15/10/2026" para saber si
//                                                  dos fechas son el MISMO día
//               6. diasEntreAgenda(desde:hasta:) → cuántos días faltan  ⚠️
//  ÚSALO PARA: cualquier app con fechas (agenda, tareas, citas, viajes,
//              cumpleaños, gastos por día…).
//  BUSCA:      fechas, date, DateFormatter, dateFormat, dateStyle, locale,
//              es_MX, DateComponents, Calendar, sumar dias, faltan dias,
//              mismo dia, fecha exacta, date(from:), texto a fecha
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Utils/ → New File → Swift File → "Fechas".
//   2. Pega SOLO las funciones que uses y quítales "Agenda" del nombre
//      si quieres (ej. fechaAgenda → fecha).
//  NECESITA:   import Foundation (Date, DateFormatter, Calendar).
//
//  ⚠️ OJO — EL ERROR QUE TE SALIÓ HOY: todo el código que HACE algo
//  (crear el formateador, asignarle dateFormat…) va DENTRO de una func.
//  Si lo pones suelto en el archivo:
//      let formato = DateFormatter()          ← esto sí se puede (declarar)
//      formato.dateFormat = "dd/MM/yyyy"      ← ❌ "Expressions are not
//                                               allowed at the top level"
//  Y dateFormat es una PROPIEDAD: va con =   (no dateFormat("…")).
//
//  ⚠️ NO VISTO EN CLASE: date(from:) (texto → fecha), startOfDay,
//  dateComponents(_:from:to:) (diferencia en días). Lo de clase (3B):
//  Date(), DateFormatter en 3 pasos, dateStyle/timeStyle, locale,
//  dateFormat y sumar con DateComponents + Calendar.current.date(byAdding:).
// ═══════════════════════════════════════════════════════════════

import Foundation

// ── 1. Una fecha relativa a HOY (forma de la Clase 3B) ─────────────
// "Dentro de 3 días a las 18:00"  →  fechaAgenda(dias: 3, horas: 18)
// "Hace 2 días a las 9:00"        →  fechaAgenda(dias: -2, horas: 9)
func fechaAgenda(dias: Int, horas: Int) -> Date {
    // ⚠️ NO VISTO EN CLASE: startOfDay = la medianoche (00:00) de hoy.
    // Empezamos en las 00:00 para que "horas: 18" sea exactamente 6 p.m.
    let medianocheDeHoy = Calendar.current.startOfDay(for: Date())

    // Igual que la lámina: DateComponents dice CUÁNTO sumar.
    var dateComponent = DateComponents()
    dateComponent.day = dias          // negativo = días hacia atrás
    dateComponent.hour = horas

    // Clase 3B: "Solo aguas… esta constante es OPCIONAL" → se abre con if let.
    // (Calendar podría no poder calcularla; en la práctica casi nunca pasa.)
    if let futureDate = Calendar.current.date(byAdding: dateComponent, to: medianocheDeHoy) {
        return futureDate
    }
    return Date()                     // por si acaso: la fecha de ahorita
}

// ── 2. Una fecha EXACTA escrita como texto ⚠️ ──────────────────────
// fechaExactaAgenda(texto: "15/04/2024 18:30")  →  Date? (opcional)
// ⚠️ NO VISTO EN CLASE: en clase solo se vio fecha → texto
// (string(from:)). date(from:) hace lo contrario: LEE un texto.
// Regresa opcional porque el texto puede venir mal escrito.
func fechaExactaAgenda(texto: String) -> Date? {
    let formato = DateFormatter()
    formato.dateFormat = "dd/MM/yyyy HH:mm"        // el texto DEBE venir así
    formato.locale = Locale(identifier: "es_MX")
    return formato.date(from: texto)               // nil si no coincide
}

// ── 3. Fecha → texto con un formato a la medida (Clase 3B) ─────────
// formatearFechaAgenda(fecha: Date(), formato: "EEEE d 'de' MMMM") → "jueves 15 de octubre"
func formatearFechaAgenda(fecha: Date, formato: String) -> String {
    let formateador = DateFormatter()              // 1. generar el formateador
    formateador.dateFormat = formato               // 2. el formato (PROPIEDAD, con =)
    formateador.locale = Locale(identifier: "es_MX")   //    en español de México
    return formateador.string(from: fecha)         // 3. obtener el String
}

// ── 4. Fecha → texto con un estilo predefinido (Clase 3B) ──────────
// fechaConEstiloAgenda(fecha: f, estiloFecha: .long, estiloHora: .short)
//   → "15 de octubre de 2026, 6:00 p.m."
func fechaConEstiloAgenda(fecha: Date, estiloFecha: DateFormatter.Style, estiloHora: DateFormatter.Style) -> String {
    let formato = DateFormatter()                  // 1. generar el formateador
    formato.dateStyle = estiloFecha                // 2. estilo de la fecha
    formato.timeStyle = estiloHora                 //    estilo de la hora (.none = no la muestra)
    formato.locale = Locale(identifier: "es_MX")
    return formato.string(from: fecha)             // 3. el String
}

// ── 5. ¿Son el mismo día? (solo con lo de clase) ───────────────────
// Dos fechas pueden tener distinta HORA y ser el mismo DÍA.
// Truco: las convierto a texto "dd/MM/yyyy" y comparo los textos.
//   claveDiaAgenda(fecha: hoy a las 9:00)  == "15/10/2026"
//   claveDiaAgenda(fecha: hoy a las 18:00) == "15/10/2026"  → mismo día ✅
func claveDiaAgenda(fecha: Date) -> String {
    return formatearFechaAgenda(fecha: fecha, formato: "dd/MM/yyyy")
}

// ── 6. ¿Cuántos días faltan? ⚠️ ────────────────────────────────────
// diasEntreAgenda(desde: hoy, hasta: pasadoMañana) → 2   (negativo si ya pasó)
// ⚠️ NO VISTO EN CLASE: dateComponents([.day], from:to:) cuenta los días
// entre dos fechas. Uso startOfDay en las dos para contar DÍAS DE
// CALENDARIO (si no, "mañana a las 8" visto hoy a las 22 daría 0 días).
func diasEntreAgenda(desde: Date, hasta: Date) -> Int {
    let inicio = Calendar.current.startOfDay(for: desde)
    let fin = Calendar.current.startOfDay(for: hasta)
    let componentes = Calendar.current.dateComponents([.day], from: inicio, to: fin)
    if let dias = componentes.day {                // .day es opcional
        return dias
    }
    return 0
}
