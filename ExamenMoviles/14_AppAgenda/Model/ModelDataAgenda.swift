// ═══════════════════════════════════════════════════════════════
//  ModelDataAgenda.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Los datos fijos de arranque: 19 eventos con fechas
//              DISTINTAS. Así se ven "Hoy", "Mañana", "En 5 días",
//              "Hace 2 días", vencidos y completados.
//  ÚSALO PARA: tu ModelData cuando el modelo tiene una fecha.
//  BUSCA:      ModelData, datos fijos, cargar, fechas distintas, fecha
//              relativa, fecha exacta, append, lista de eventos
//
//  LAS 2 FORMAS DE PONER UNA FECHA EN TUS DATOS:
//   A) Relativa a hoy (forma de clase, la recomendada):
//        fecha: fechaAgenda(dias: 3, horas: 16)    → en 3 días, 4:00 p.m.
//        fecha: fechaAgenda(dias: -2, horas: 9)    → hace 2 días, 9:00 a.m.
//      Ventaja: siempre se ve bien, abras la app el día que la abras.
//   B) Exacta, escrita como texto (⚠️ date(from:) no se vio en clase):
//        if let fecha = fechaExactaAgenda(texto: "24/12/2026 20:00") { … }
//      Ventaja: una fecha real (cumpleaños, examen).
//   ❌ fecha: Date() en todos → TODOS quedan con la misma fecha (ahorita).
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Model/ → New File → Swift File → "ModelData".
//   2. Pega la función y cambia los datos marcados con ✏️
//  NECESITA:   Model/EventoAgenda.swift y Utils/FechasAgenda.swift.
//  ⚠️ NO VISTO EN CLASE: fechaExactaAgenda (date(from:)).
// ═══════════════════════════════════════════════════════════════

import Foundation

// Opciones fijas de los Picker (se usan en el formulario y en la gráfica)
let categoriasAgenda = ["Escuela", "Trabajo", "Personal", "Salud"]    // ✏️
let prioridadesAgenda = ["Alta", "Media", "Baja"]                      // ✏️

// Forma de clase (Clase 10): una función que regresa el arreglo.
// TODO va dentro de la función: aquí sí se puede crear formateadores,
// usar if let, hacer append… (afuera daría "top level").
func cargarEventosAgenda() -> Array<EventoAgenda> {

    var lista = Array<EventoAgenda>()

    // ── Fechas EXACTAS (forma B ⚠️) ─────────────────────────────
    // Empiezo con una fecha relativa por si el texto viniera mal
    // (date(from:) regresaría nil) y la reemplazo si se pudo leer.
    var fechaExamen = fechaAgenda(dias: 1, horas: 7)
    if let fecha = fechaExactaAgenda(texto: "16/10/2026 07:30") {          // ✏️
        fechaExamen = fecha
    }
    var fechaCumpleMama = fechaAgenda(dias: 60, horas: 20)
    if let fecha = fechaExactaAgenda(texto: "24/12/2026 20:00") {          // ✏️
        fechaCumpleMama = fecha
    }
    var fechaInscripcion = fechaAgenda(dias: 80, horas: 9)
    if let fecha = fechaExactaAgenda(texto: "05/01/2027 09:00") {          // ✏️
        fechaInscripcion = fecha
    }

    // ── Próximos (forma A: relativos a hoy) ─────────────────────
    lista.append(EventoAgenda(id: 1, titulo: "Examen final de Móviles", descripcion: "Llegar 7:10, examen de 7:30 a 10:30 y subir a Canvas.",
                              categoria: "Escuela", prioridad: "Alta", fecha: fechaExamen, completado: false))
    lista.append(EventoAgenda(id: 2, titulo: "Repasar fechas y DateFormatter", descripcion: "Abrir la pestaña Fechas de esta app y probar todos los formatos.",
                              categoria: "Escuela", prioridad: "Alta", fecha: fechaAgenda(dias: 0, horas: 20), completado: false))
    lista.append(EventoAgenda(id: 3, titulo: "Ir al gym", descripcion: "Pierna y abdomen.",
                              categoria: "Salud", prioridad: "Media", fecha: fechaAgenda(dias: 0, horas: 7), completado: true))
    lista.append(EventoAgenda(id: 4, titulo: "Comprar despensa", descripcion: "Leche, huevo, pan y fruta.",
                              categoria: "Personal", prioridad: "Media", fecha: fechaAgenda(dias: 0, horas: 18), completado: false))
    lista.append(EventoAgenda(id: 5, titulo: "Junta de equipo", descripcion: "Revisar avances del proyecto con el equipo.",
                              categoria: "Trabajo", prioridad: "Alta", fecha: fechaAgenda(dias: 1, horas: 10), completado: false))
    lista.append(EventoAgenda(id: 6, titulo: "Cita con el dentista", descripcion: "Limpieza dental. Llevar credencial del seguro.",
                              categoria: "Salud", prioridad: "Media", fecha: fechaAgenda(dias: 3, horas: 16), completado: false))
    lista.append(EventoAgenda(id: 7, titulo: "Entregar reporte", descripcion: "Reporte mensual en PDF.",
                              categoria: "Trabajo", prioridad: "Alta", fecha: fechaAgenda(dias: 5, horas: 23), completado: false))
    lista.append(EventoAgenda(id: 8, titulo: "Cumpleaños de Ana", descripcion: "Comprar regalo antes.",
                              categoria: "Personal", prioridad: "Baja", fecha: fechaAgenda(dias: 9, horas: 20), completado: false))
    lista.append(EventoAgenda(id: 9, titulo: "Cumpleaños de mamá", descripcion: "Cena familiar.",
                              categoria: "Personal", prioridad: "Media", fecha: fechaCumpleMama, completado: false))
    lista.append(EventoAgenda(id: 10, titulo: "Inscripción de materias", descripcion: "Revisar horario antes de inscribir.",
                              categoria: "Escuela", prioridad: "Alta", fecha: fechaInscripcion, completado: false))

    // ── Pasados (para la gráfica de progreso y los vencidos) ────
    lista.append(EventoAgenda(id: 11, titulo: "Tarea de gráficas", descripcion: "Barras, líneas y pastel.",
                              categoria: "Escuela", prioridad: "Alta", fecha: fechaAgenda(dias: -1, horas: 9), completado: true))
    lista.append(EventoAgenda(id: 12, titulo: "Correr 5 km", descripcion: "En el parque.",
                              categoria: "Salud", prioridad: "Baja", fecha: fechaAgenda(dias: -1, horas: 7), completado: true))
    lista.append(EventoAgenda(id: 13, titulo: "Lavar ropa", descripcion: "Ropa blanca y de color.",
                              categoria: "Personal", prioridad: "Baja", fecha: fechaAgenda(dias: -2, horas: 11), completado: true))
    lista.append(EventoAgenda(id: 14, titulo: "Pagar el celular", descripcion: "Antes de que corten la línea.",
                              categoria: "Personal", prioridad: "Alta", fecha: fechaAgenda(dias: -2, horas: 12), completado: false))
    lista.append(EventoAgenda(id: 15, titulo: "Leer capítulo 3", descripcion: "Libro de la materia de redes.",
                              categoria: "Escuela", prioridad: "Media", fecha: fechaAgenda(dias: -3, horas: 21), completado: true))
    lista.append(EventoAgenda(id: 16, titulo: "Revisar correos", descripcion: "Contestar pendientes.",
                              categoria: "Trabajo", prioridad: "Baja", fecha: fechaAgenda(dias: -4, horas: 9), completado: true))
    lista.append(EventoAgenda(id: 17, titulo: "Llamar al doctor", descripcion: "Pedir resultados.",
                              categoria: "Salud", prioridad: "Media", fecha: fechaAgenda(dias: -5, horas: 10), completado: true))
    lista.append(EventoAgenda(id: 18, titulo: "Proyecto de redes", descripcion: "Configurar el router del laboratorio.",
                              categoria: "Escuela", prioridad: "Alta", fecha: fechaAgenda(dias: -6, horas: 15), completado: true))
    lista.append(EventoAgenda(id: 19, titulo: "Estudiar SwiftUI", descripcion: "NavigationStack y TabView.",
                              categoria: "Escuela", prioridad: "Media", fecha: fechaAgenda(dias: -6, horas: 19), completado: true))

    return lista
}
