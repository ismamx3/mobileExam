// ═══════════════════════════════════════════════════════════════
//  ViajePlaneado.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El MODELO de un viaje que planeaste (fechas, personas,
//              presupuesto, si ya fuiste y las FOTOS del viaje) + los
//              viajes de ejemplo con los que arranca la app.
//  ÚSALO PARA: un modelo con fechas y propiedades calculadas de fechas
//              ("faltan 5 días", "¡Es mañana!", días que dura el viaje).
//  BUSCA:      viaje, modelo con fechas, Date en struct, faltan dias,
//              propiedad calculada, fotos en el modelo, UIImage, id nuevo
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/ViajePlaneado.swift y pega esto.
//   2. Copia también Utils/FechasViajes.swift (las funciones de fechas).
//  NECESITA:   16_AppViajes/Utils/FechasViajes.swift
//  ⚠️ NO VISTO EN CLASE: guardar fotos (UIImage) dentro del modelo.
//     En clase la foto vivía en un @State de la vista; aquí cada viaje
//     guarda SUS fotos para que no se mezclen entre viajes.
// ═══════════════════════════════════════════════════════════════

import Foundation
import UIKit            // ⚠️ para UIImage (las fotos de la cámara/galería)

struct ViajePlaneado: Identifiable {
    var id: Int
    var destinoNombre: String
    var estado: String
    var imagen: String                  // portada (nombre del asset del destino)
    var fechaIda: Date
    var fechaRegreso: Date
    var personas: Int
    var presupuesto: Double             // se calcula al planear y se guarda
    var yaFui: Bool
    var fotos: Array<UIImage>           // ⚠️ fotos tomadas o elegidas

    // ── Propiedades calculadas (se recalculan solas, no llevan @State) ──

    // Días que dura el viaje: del día de ida al de regreso.
    var dias: Int {
        return diasEntreFechasViajes(desde: fechaIda, hasta: fechaRegreso)
    }

    // Días que faltan para irse (negativo si ya pasó).
    var diasQueFaltan: Int {
        return diasEntreFechasViajes(desde: Date(), hasta: fechaIda)
    }

    // "15 oct – 18 oct"
    var textoFechas: String {
        return textoFechaCortaViajes(fecha: fechaIda) + " – " + textoFechaCortaViajes(fecha: fechaRegreso)
    }

    // Texto según cuánto falta (if / else if, como en clase).
    var estadoTexto: String {
        if yaFui {
            return "Ya fuiste"
        } else if diasQueFaltan > 1 {
            return "Faltan \(diasQueFaltan) días"
        } else if diasQueFaltan == 1 {
            return "¡Es mañana!"
        } else if diasQueFaltan == 0 {
            return "¡Es hoy!"
        } else if diasEntreFechasViajes(desde: Date(), hasta: fechaRegreso) >= 0 {
            return "En curso"
        } else {
            return "Ya pasó"
        }
    }
}

// Viajes con los que arranca la app. Las fechas se calculan a partir de
// HOY (fechaDentroDeDiasViajes), así nunca quedan "viejas".
func viajesDeEjemploViajes() -> Array<ViajePlaneado> {
    var lista = Array<ViajePlaneado>()

    lista.append(ViajePlaneado(
        id: 1,
        destinoNombre: "Chipinque",
        estado: "Nuevo León",
        imagen: "destino_montana",
        fechaIda: fechaDentroDeDiasViajes(dias: 10),        // dentro de 10 días
        fechaRegreso: fechaDentroDeDiasViajes(dias: 12),
        personas: 3,
        presupuesto: 600 * 3 * 2,
        yaFui: false,
        fotos: []))

    lista.append(ViajePlaneado(
        id: 2,
        destinoNombre: "San Miguel de Allende",
        estado: "Guanajuato",
        imagen: "destino_pueblo",
        fechaIda: fechaDentroDeDiasViajes(dias: -40),       // hace 40 días
        fechaRegreso: fechaDentroDeDiasViajes(dias: -37),
        personas: 2,
        presupuesto: 1700 * 2 * 3,
        yaFui: true,
        fotos: []))

    return lista
}

// id nuevo = el mayor que ya existe + 1 (así nunca se repite).
func siguienteIdViajes(viajes: Array<ViajePlaneado>) -> Int {
    var mayor = 0
    for viaje in viajes {
        if viaje.id > mayor {
            mayor = viaje.id
        }
    }
    return mayor + 1
}
