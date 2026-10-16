// ═══════════════════════════════════════════════════════════════
//  AgendaHoyView.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Hoy": saludo según la HORA (switch), la fecha
//              de hoy en 3 formatos, 3 tarjetas iguales (pendientes
//              hoy / esta semana / vencidos), lo de hoy y lo que sigue.
//  ÚSALO PARA: pantallas de inicio con fecha, conteos y "próximos".
//  BUSCA:      inicio, hoy, saludo, buenos dias, buenas tardes, hora,
//              fecha de hoy, contar, filtrar por fecha, proximos,
//              ordenar por fecha, sorted, propiedad calculada
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Views/ → New File → SwiftUI View.
//   2. Pega el archivo. Recibe la lista como var (solo LEE).
//  NECESITA:   Model/EventoAgenda.swift, Utils/FechasAgenda.swift,
//              Utils/PaletaAgenda.swift, Components/TarjetaAgenda.swift,
//              Components/EventoAgendaRow.swift.
//  ⚠️ NO VISTO EN CLASE: sorted { $0.fecha < $1.fecha } (ordenar),
//     .prefix(3) (los primeros 3), ForEach fuera de un List.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AgendaHoyView: View {

    // Solo lee la lista: var sin @State ni private (Clase 6B, paso de
    // valores de ida). La dueña es AgendaAppView.
    var eventos: Array<EventoAgenda>

    let paleta = PaletaAgenda()

    // ── Propiedades calculadas: se recalculan solas cuando cambia la lista ──

    // Saludo según la hora: saco la hora como texto "HH" (0-23) con un
    // DateFormatter y la convierto a Int con if let (Int(texto) es opcional).
    var saludo: String {
        let horaTexto = formatearFechaAgenda(fecha: Date(), formato: "HH")
        if let hora = Int(horaTexto) {
            switch hora {
            case 5...11:
                return "Buenos días"
            case 12...18:
                return "Buenas tardes"
            default:
                return "Buenas noches"
            }
        }
        return "Hola"
    }

    // Pendientes de hoy: es hoy y no está completado
    var pendientesHoy: Int {
        var cuenta = 0
        for evento in eventos {
            if evento.esHoy && !evento.completado {
                cuenta += 1
            }
        }
        return cuenta
    }

    // Esta semana: faltan de 0 a 6 días y no está completado
    var pendientesSemana: Int {
        var cuenta = 0
        for evento in eventos {
            if evento.diasRestantes >= 0 && evento.diasRestantes <= 6 && !evento.completado {
                cuenta += 1
            }
        }
        return cuenta
    }

    var vencidos: Int {
        var cuenta = 0
        for evento in eventos {
            if evento.estaVencido {
                cuenta += 1
            }
        }
        return cuenta
    }

    // Los eventos de hoy, ordenados por hora.
    // ⚠️ NO VISTO EN CLASE: sorted regresa una COPIA ordenada (no cambia
    // la original). $0 y $1 son dos eventos que compara; con < quedan
    // de la fecha más temprana a la más tardía. Las fechas se comparan
    // con < y > igual que los números.
    var eventosDeHoy: Array<EventoAgenda> {
        var resultado = Array<EventoAgenda>()
        for evento in eventos {
            if evento.esHoy {
                resultado.append(evento)
            }
        }
        return resultado.sorted { $0.fecha < $1.fecha }
    }

    // Los próximos 3 pendientes DESPUÉS de hoy
    var proximos: Array<EventoAgenda> {
        var resultado = Array<EventoAgenda>()
        for evento in eventos {
            if evento.diasRestantes > 0 && !evento.completado {
                resultado.append(evento)
            }
        }
        let ordenados = resultado.sorted { $0.fecha < $1.fecha }
        return Array(ordenados.prefix(3))      // ⚠️ prefix(3) = los primeros 3
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {

                        // ── 1. Saludo + fecha de hoy en 3 formatos ──────
                        VStack(alignment: .leading, spacing: 6) {
                            Text("\(saludo) 👋")
                                .font(.title)
                                .bold()
                                .foregroundStyle(paleta.texto)
                            // Estilo predefinido .full (Clase 3B)
                            Text(fechaConEstiloAgenda(fecha: Date(), estiloFecha: .full, estiloHora: .none))
                                .font(.headline)
                                .foregroundStyle(paleta.primario)
                            // Formato a la medida con dateFormat (Clase 3B)
                            Text("Hoy es \(formatearFechaAgenda(fecha: Date(), formato: "EEEE")) · \(formatearFechaAgenda(fecha: Date(), formato: "dd/MM/yyyy")) · \(formatearFechaAgenda(fecha: Date(), formato: "h:mm a"))")
                                .font(.subheadline)
                                .foregroundStyle(paleta.textoSuave)
                        }

                        // ── 2. Tres tarjetas del MISMO ancho ────────────
                        HStack(spacing: 12) {
                            TarjetaAgenda(numero: pendientesHoy, etiqueta: "Pendientes hoy",
                                          icono: "sun.max.fill", color: paleta.primario)
                            TarjetaAgenda(numero: pendientesSemana, etiqueta: "Esta semana",
                                          icono: "calendar", color: paleta.secundario)
                            TarjetaAgenda(numero: vencidos, etiqueta: "Vencidos",
                                          icono: "exclamationmark.triangle.fill", color: paleta.alerta)
                        }

                        // ── 3. Lo de hoy ────────────────────────────────
                        Text("Para hoy")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(paleta.texto)

                        if eventosDeHoy.isEmpty {
                            Text("No tienes nada para hoy 🎉")
                                .foregroundStyle(paleta.textoSuave)
                        } else {
                            VStack(spacing: 14) {
                                ForEach(eventosDeHoy) { evento in       // ⚠️ ForEach (fuera de List)
                                    EventoAgendaRow(evento: evento)
                                }
                            }
                            .padding()
                            .background(paleta.superficie)
                            .cornerRadius(16)
                        }

                        // ── 4. Lo que sigue ─────────────────────────────
                        Text("Lo que sigue")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(paleta.texto)

                        VStack(spacing: 14) {
                            ForEach(proximos) { evento in
                                EventoAgendaRow(evento: evento)
                            }
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        Text("Tip: en la pestaña Fechas puedes ver cómo funciona cada formato de fecha.")
                            .font(.footnote)
                            .foregroundStyle(paleta.textoSuave)
                    }
                    .padding()
                }
            }
            .navigationTitle("Mi Agenda")
        }
    }
}

#Preview {
    AgendaHoyView(eventos: cargarEventosAgenda())
}
