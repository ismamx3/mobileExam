// ═══════════════════════════════════════════════════════════════
//  ModelDataGym.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Los DATOS fijos de la app: el catálogo de ejercicios
//              (clases del protocolo), los grupos musculares, funciones
//              para buscar un ejercicio, y entrenamientos de ejemplo
//              con fechas DISTINTAS (hoy, ayer, hace 3 días…).
//  ÚSALO PARA: ModelData de tu app; fechas de ejemplo que no sean todas
//              "hoy"; opciones de un Picker que dependen de otro.
//  BUSCA:      ModelData, datos fijos, catalogo, fechaHaceDias, DateComponents,
//              Calendar, sumar dias, restar dias, opciones picker, buscar por nombre
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/ModelDataGym.swift.
//   2. Pega el archivo y cambia los datos marcados con ✏️.
//  NECESITA:   Model/EjercicioGym.swift y Model/EntrenamientoGym.swift.
//  ⚠️ NO VISTO EN CLASE: ninguno (las fechas usan DateComponents +
//     Calendar como en la Clase 3B).
// ═══════════════════════════════════════════════════════════════

import Foundation

// ── 1. Grupos musculares (opciones del primer Picker) ──────────────
let gruposMuscularesGym = ["Piernas", "Pecho", "Espalda", "Brazos", "Cardio", "Flexibilidad"]   // ✏️

// ── 2. El catálogo: una lista del tipo del PROTOCOLO ───────────────
// Caben las 3 clases mezcladas porque todas cumplen EjercicioGym.
func cargarEjerciciosGym() -> [EjercicioGym] {
    return [
        CardioGym(nombre: "Correr", grupoMuscular: "Cardio", icono: "figure.run", met: 9.8),                  // ✏️
        CardioGym(nombre: "Bicicleta", grupoMuscular: "Cardio", icono: "bicycle", met: 7.5),
        CardioGym(nombre: "Saltar la cuerda", grupoMuscular: "Cardio", icono: "figure.jumprope", met: 11.0),
        CardioGym(nombre: "Natación", grupoMuscular: "Cardio", icono: "figure.pool.swim", met: 8.0),
        FuerzaGym(nombre: "Sentadilla", grupoMuscular: "Piernas", icono: "figure.strengthtraining.functional", seriesSugeridas: 4, repeticionesSugeridas: 10),
        FuerzaGym(nombre: "Zancadas", grupoMuscular: "Piernas", icono: "figure.step.training", seriesSugeridas: 3, repeticionesSugeridas: 12),
        FuerzaGym(nombre: "Press de banca", grupoMuscular: "Pecho", icono: "dumbbell.fill", seriesSugeridas: 4, repeticionesSugeridas: 8),
        FuerzaGym(nombre: "Lagartijas", grupoMuscular: "Pecho", icono: "figure.core.training", seriesSugeridas: 3, repeticionesSugeridas: 15),
        FuerzaGym(nombre: "Dominadas", grupoMuscular: "Espalda", icono: "figure.climbing", seriesSugeridas: 3, repeticionesSugeridas: 8),
        FuerzaGym(nombre: "Remo con mancuerna", grupoMuscular: "Espalda", icono: "dumbbell.fill", seriesSugeridas: 4, repeticionesSugeridas: 10),
        FuerzaGym(nombre: "Curl de bíceps", grupoMuscular: "Brazos", icono: "dumbbell.fill", seriesSugeridas: 3, repeticionesSugeridas: 12),
        FuerzaGym(nombre: "Fondos de tríceps", grupoMuscular: "Brazos", icono: "figure.arms.open", seriesSugeridas: 3, repeticionesSugeridas: 10),
        FlexibilidadGym(nombre: "Yoga", icono: "figure.yoga"),
        FlexibilidadGym(nombre: "Estiramientos", icono: "figure.flexibility"),
        FlexibilidadGym(nombre: "Pilates", icono: "figure.pilates")
    ]
}

// ── 3. Opciones del segundo Picker según el grupo elegido ──────────
// El Picker de ejercicio usa esta lista: cambia cuando cambia el grupo.
func ejerciciosDelGrupoGym(grupo: String) -> [String] {
    var nombres: [String] = []
    for ejercicio in cargarEjerciciosGym() {
        if ejercicio.grupoMuscular == grupo {
            nombres.append(ejercicio.nombre)
        }
    }
    return nombres
}

// ── 4. Buscar un ejercicio por su nombre (regresa opcional) ────────
// Opcional: si no existe ese nombre regresa nil (se usa con if let).
func buscarEjercicioGym(nombre: String) -> EjercicioGym? {
    for ejercicio in cargarEjerciciosGym() {
        if ejercicio.nombre == nombre {
            return ejercicio
        }
    }
    return nil
}

// ── 5. Fechas distintas: "hace X días" (Clase 3B: sumar a una fecha) ─
// Date() = AHORA. Para otra fecha se le SUMA un DateComponents.
// Un número negativo va hacia atrás. date(byAdding:to:) regresa un
// OPCIONAL (la lámina lo dice), por eso el if let.
func fechaHaceDiasGym(dias: Int) -> Date {
    var dateComponent = DateComponents()
    dateComponent.day = -dias
    if let fecha = Calendar.current.date(byAdding: dateComponent, to: Date()) {
        return fecha
    }
    return Date()
}

// ── 6. Convertir una fecha a texto con el formato que quieras ──────
// formato: "dd/MM/yyyy" → 15/10/2026 · "EEE" → jue · "d MMM" → 15 oct
func textoFechaGym(fecha: Date, formato: String) -> String {
    let formateador = DateFormatter()
    formateador.dateFormat = formato          // propiedad: lleva  =  (no paréntesis)
    formateador.locale = Locale(identifier: "es_MX")
    return formateador.string(from: fecha)
}

// ── 7. Entrenamientos de ejemplo (la primera vez que abres la app) ─
// Fechas: hoy, ayer, hace 2 y 3 días → racha de 4 días seguidos.
func cargarEntrenamientosEjemploGym() -> [EntrenamientoGym] {
    var lista: [EntrenamientoGym] = []
    lista.append(EntrenamientoGym(id: 1, ejercicio: "Correr", grupo: "Cardio", tipo: "Cardio", icono: "figure.run",
                                  minutos: 30, series: 0, repeticiones: 0, peso: 0, calorias: 343,
                                  intensidad: "Media", esRecord: false, fecha: fechaHaceDiasGym(dias: 0)))
    lista.append(EntrenamientoGym(id: 2, ejercicio: "Sentadilla", grupo: "Piernas", tipo: "Fuerza", icono: "figure.strengthtraining.functional",
                                  minutos: 40, series: 4, repeticiones: 10, peso: 60, calorias: 163,
                                  intensidad: "Intensa", esRecord: true, fecha: fechaHaceDiasGym(dias: 1)))
    lista.append(EntrenamientoGym(id: 3, ejercicio: "Yoga", grupo: "Flexibilidad", tipo: "Flexibilidad", icono: "figure.yoga",
                                  minutos: 45, series: 0, repeticiones: 0, peso: 0, calorias: 113,
                                  intensidad: "Ligera", esRecord: false, fecha: fechaHaceDiasGym(dias: 2)))
    lista.append(EntrenamientoGym(id: 4, ejercicio: "Press de banca", grupo: "Pecho", tipo: "Fuerza", icono: "dumbbell.fill",
                                  minutos: 35, series: 4, repeticiones: 8, peso: 50, calorias: 143,
                                  intensidad: "Media", esRecord: false, fecha: fechaHaceDiasGym(dias: 3)))
    lista.append(EntrenamientoGym(id: 5, ejercicio: "Bicicleta", grupo: "Cardio", tipo: "Cardio", icono: "bicycle",
                                  minutos: 60, series: 0, repeticiones: 0, peso: 0, calorias: 525,
                                  intensidad: "Media", esRecord: true, fecha: fechaHaceDiasGym(dias: 5)))
    lista.append(EntrenamientoGym(id: 6, ejercicio: "Dominadas", grupo: "Espalda", tipo: "Fuerza", icono: "figure.climbing",
                                  minutos: 25, series: 3, repeticiones: 8, peso: 0, calorias: 102,
                                  intensidad: "Intensa", esRecord: false, fecha: fechaHaceDiasGym(dias: 6)))
    lista.append(EntrenamientoGym(id: 7, ejercicio: "Curl de bíceps", grupo: "Brazos", tipo: "Fuerza", icono: "dumbbell.fill",
                                  minutos: 20, series: 3, repeticiones: 12, peso: 12, calorias: 82,
                                  intensidad: "Ligera", esRecord: false, fecha: fechaHaceDiasGym(dias: 8)))
    lista.append(EntrenamientoGym(id: 8, ejercicio: "Saltar la cuerda", grupo: "Cardio", tipo: "Cardio", icono: "figure.jumprope",
                                  minutos: 15, series: 0, repeticiones: 0, peso: 0, calorias: 193,
                                  intensidad: "Intensa", esRecord: false, fecha: fechaHaceDiasGym(dias: 10)))
    return lista
}
