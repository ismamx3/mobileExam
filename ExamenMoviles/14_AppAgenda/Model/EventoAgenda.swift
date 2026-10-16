// ═══════════════════════════════════════════════════════════════
//  EventoAgenda.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El MODELO: el "molde" de cada pendiente o evento.
//              El struct por sí solo no hace nada; solo dice qué datos
//              tiene cada evento. Los eventos de verdad están en
//              ModelDataAgenda.swift.
//              Lo importante aquí: el campo  fecha: Date  y las
//              PROPIEDADES CALCULADAS que convierten esa fecha en textos
//              ("15 de octubre de 2026", "6:00 p.m.", "Mañana"…).
//  ÚSALO PARA: cualquier modelo que tenga una fecha.
//  BUSCA:      modelo, struct, Identifiable, fecha, Date, propiedad
//              calculada, fechaTexto, horaTexto, dias restantes, vencido
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Model/ → New File → Swift File.
//   2. Pega el struct y cambia los campos marcados con ✏️
//  NECESITA:   14_AppAgenda/Utils/FechasAgenda.swift (las funciones de
//              fechas que usan las propiedades calculadas).
//  ⚠️ NO VISTO EN CLASE: diasRestantes usa diasEntreAgenda (Calendar).
// ═══════════════════════════════════════════════════════════════

import Foundation

struct EventoAgenda: Identifiable {
    var id: Int                     // único; NUNCA se muestra en pantalla
    var titulo: String              // ✏️
    var descripcion: String         // ✏️
    var categoria: String           // "Escuela", "Trabajo", "Personal" o "Salud"
    var prioridad: String           // "Alta", "Media" o "Baja"
    var fecha: Date                 // UN instante: día + hora juntos
    var completado: Bool

    // ── Propiedades calculadas ──────────────────────────────────
    // No guardan nada: se calculan cada vez que se usan. Por eso no
    // llevan @State y siempre están al día con "fecha".

    // "15 de octubre de 2026"  (estilo .long, Clase 3B)
    var fechaTexto: String {
        return fechaConEstiloAgenda(fecha: fecha, estiloFecha: .long, estiloHora: .none)
    }

    // "6:00 p.m."  (dateFormat: h = hora 1-12, mm = minutos, a = a.m./p.m.)
    var horaTexto: String {
        return formatearFechaAgenda(fecha: fecha, formato: "h:mm a")
    }

    // "jueves"  (EEEE = día de la semana completo)
    var diaSemana: String {
        return formatearFechaAgenda(fecha: fecha, formato: "EEEE")
    }

    // 0 = hoy, 1 = mañana, -2 = hace dos días  ⚠️ (usa Calendar)
    var diasRestantes: Int {
        return diasEntreAgenda(desde: Date(), hasta: fecha)
    }

    // Texto amigable según los días que faltan (switch con casos)
    var textoCuandoFalta: String {
        let dias = diasRestantes
        switch dias {
        case 0:
            return "Hoy"
        case 1:
            return "Mañana"
        case -1:
            return "Ayer"
        default:
            if dias > 0 {
                return "En \(dias) días"
            } else {
                return "Hace \(-dias) días"     // -(-2) = 2
            }
        }
    }

    // ¿Es HOY? Solo con lo de clase: comparo los textos "dd/MM/yyyy"
    var esHoy: Bool {
        return claveDiaAgenda(fecha: fecha) == claveDiaAgenda(fecha: Date())
    }

    // Vencido = no está completado y su fecha ya pasó.
    // Las fechas se comparan con < y > como si fueran números.
    var estaVencido: Bool {
        return !completado && fecha < Date()
    }

    // Ícono SF Symbol según la categoría (switch con Strings)
    var icono: String {
        switch categoria {
        case "Escuela":
            return "graduationcap.fill"
        case "Trabajo":
            return "briefcase.fill"
        case "Salud":
            return "cross.case.fill"
        default:
            return "person.fill"
        }
    }
}
