// ═══════════════════════════════════════════════════════════════
//  FechasViajes.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Funciones de fechas que usa la app: sumar días, escribir
//              una fecha en español y contar los días entre dos fechas.
//  ÚSALO PARA: "faltan X días", calcular cuántos días dura un viaje,
//              fechas de ejemplo en ModelData, fechas bonitas en pantalla.
//  BUSCA:      fechas, date, Date(), DateFormatter, DateComponents,
//              Calendar, sumar dias, dias entre fechas, faltan dias, es_MX
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Utils/Fechas.swift (Swift File) y pega esto.
//   2. Cambia el sufijo "Viajes" de los nombres si quieres.
//  NECESITA:   nada (Foundation trae Date, DateFormatter y Calendar).
//  ⚠️ NO VISTO EN CLASE: Calendar.current.startOfDay(for:) y
//     Calendar.current.dateComponents([.day], from:to:) (contar días).
//     Sumar con DateComponents + date(byAdding:to:) y DateFormatter con
//     locale es_MX SÍ son de la Clase 3B.
// ═══════════════════════════════════════════════════════════════

import Foundation

// RECUERDA: todo esto va dentro de funciones. Si escribes
// "formato.dateFormat = …" suelto en el archivo, Xcode marca
// "Expressions are not allowed at the top level".

// ── 1. Sumar (o restar) días a una fecha (Clase 3B) ─────────
// dias positivo = hacia adelante, negativo = hacia atrás.
func sumarDiasViajes(fecha: Date, dias: Int) -> Date {
    var dateComponent = DateComponents()
    dateComponent.day = dias                                       // ✏️ .month, .year, .hour…

    // date(byAdding:to:) regresa un OPCIONAL → if let (nunca !)
    if let nuevaFecha = Calendar.current.date(byAdding: dateComponent, to: fecha) {
        return nuevaFecha
    }
    return fecha
}

// Atajo: la fecha de HOY + X días. Date() = este momento.
func fechaDentroDeDiasViajes(dias: Int) -> Date {
    return sumarDiasViajes(fecha: Date(), dias: dias)
}

// ── 2. Fecha completa en español: "15 de octubre de 2026" ───
// Los 3 pasos de la Clase 3B: crear el formateador, elegir el estilo,
// obtener el String.
func textoFechaViajes(fecha: Date) -> String {
    let formato = DateFormatter()
    formato.dateStyle = DateFormatter.Style.long                    // ✏️ .short .medium .long .full
    formato.timeStyle = DateFormatter.Style.none                    // sin hora
    formato.locale = Locale(identifier: "es_MX")                    // en español
    return formato.string(from: fecha)
}

// ── 3. Fecha corta: "15 oct" ────────────────────────────────
// dateFormat es una PROPIEDAD: se le asigna con =  (no se llama con paréntesis).
func textoFechaCortaViajes(fecha: Date) -> String {
    let formato = DateFormatter()
    formato.dateFormat = "d MMM"                                    // ✏️ d = día, MMM = mes corto
    formato.locale = Locale(identifier: "es_MX")
    return formato.string(from: fecha)
}

// ── 4. ¿Cuántos días hay entre dos fechas? ──────────────────
// ⚠️ NO VISTO EN CLASE.
// startOfDay pasa las dos fechas a las 00:00; así "hoy 11 pm" y
// "mañana 1 am" cuentan como 1 día y no como 0.
func diasEntreFechasViajes(desde: Date, hasta: Date) -> Int {
    let inicio = Calendar.current.startOfDay(for: desde)
    let fin = Calendar.current.startOfDay(for: hasta)

    let componentes = Calendar.current.dateComponents([.day], from: inicio, to: fin)

    // .day es un OPCIONAL (Int?) → if let
    if let dias = componentes.day {
        return dias          // negativo si "hasta" ya pasó
    }
    return 0
}
