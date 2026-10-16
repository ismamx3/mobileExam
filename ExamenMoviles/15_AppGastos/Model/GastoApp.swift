// ═══════════════════════════════════════════════════════════════
//  GastoApp.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El MODELO (el "molde") de un gasto. El struct solo dice
//              qué datos tiene cada gasto; los gastos de verdad están en
//              Model/ModelDataGastos.swift.
//  ÚSALO PARA: cualquier registro con dinero y fecha (gastos, ventas,
//              pedidos, pagos, propinas…).
//  BUSCA:      modelo gasto, struct, Identifiable, monto, Double, dinero,
//              currency, MXN, pesos, fecha, Date, DateFormatter,
//              propiedad calculada, switch icono
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/GastoApp.swift (Swift File).
//   2. Pega el archivo y cambia los campos marcados con ✏️.
//  NECESITA:   import Foundation (Date, DateFormatter).
//  DE CLASE:   struct + Identifiable (Clase 10), propiedades calculadas,
//              DateFormatter con locale es_MX (Clase 3B), formato de
//              número .currency(code: "MXN") (Clase 3B).
//  ⚠️ NO VISTO EN CLASE: .locale(Locale(identifier: "es_MX")) dentro del
//              formato de moneda (ver textoPesosGastos, abajo).
// ═══════════════════════════════════════════════════════════════

import Foundation

struct GastoApp: Identifiable {
    var id: Int                       // único por gasto. NUNCA se muestra en pantalla
    var concepto: String              // ✏️ "Tacos con amigos"
    var monto: Double                 // ✏️ Double porque el dinero lleva centavos
    var categoria: String             // ✏️ una de categoriasGastos
    var fecha: Date                   // cuándo se gastó
    var metodoPago: String            // ✏️ "Efectivo" o "Tarjeta"

    // ── Propiedades calculadas ─────────────────────────────────
    // No guardan nada: se calculan cada vez que las usas, a partir de
    // los campos de arriba. Por eso no van en el init.

    // "$1,250.50"
    var montoTexto: String {
        return textoPesosGastos(monto)
    }

    // "15 de octubre"  (Clase 3B: los 3 pasos de DateFormatter)
    var fechaTexto: String {
        let formato = DateFormatter()                       // 1. el formateador
        formato.dateFormat = "d 'de' MMMM"                  // 2. el formato (con = : es una propiedad)
        formato.locale = Locale(identifier: "es_MX")        //    en español
        return formato.string(from: fecha)                  // 3. Date → String
    }

    // "10/2026": sirve para saber si dos fechas son del MISMO mes.
    // Truco sencillo: si el texto "MM/yyyy" es igual, es el mismo mes.
    var mesTexto: String {
        let formato = DateFormatter()
        formato.dateFormat = "MM/yyyy"
        return formato.string(from: fecha)
    }

    // Ícono de SF Symbols según la categoría (switch con Strings).
    var iconoCategoria: String {
        switch categoria {
        case "Comida":
            return "fork.knife"
        case "Transporte":
            return "bus.fill"
        case "Escuela":
            return "book.fill"
        case "Diversión":
            return "gamecontroller.fill"
        default:
            return "ellipsis.circle.fill"
        }
    }
}

// ── Dinero a texto ──────────────────────────────────────────────
// Forma de clase (3B):  cantidad.formatted(.currency(code: "MXN"))
// Problema: si el iPhone/simulador está en inglés, sale "MX$1,250.00".
// ⚠️ NO VISTO EN CLASE: .locale(...) obliga el formato de México → "$1,250.00".
func textoPesosGastos(_ cantidad: Double) -> String {
    return cantidad.formatted(.currency(code: "MXN").locale(Locale(identifier: "es_MX")))
}
