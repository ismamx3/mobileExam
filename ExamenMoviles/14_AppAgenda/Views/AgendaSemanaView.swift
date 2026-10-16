// ═══════════════════════════════════════════════════════════════
//  AgendaSemanaView.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Semana": los próximos 7 días como botones del
//              mismo ancho (jue 15, vie 16, sáb 17…), cada uno con
//              cuántos eventos tiene. Al tocar un día se ven sus eventos.
//  ÚSALO PARA: calendarios semanales, horarios, "próximos días".
//  BUSCA:      semana, 7 dias, proximos dias, calendario, generar fechas,
//              sumar dias con for, filtrar por dia, dia seleccionado
//
//  CÓMO SE GENERAN LOS 7 DÍAS:
//   Un for de 0 a 6 que llama fechaAgenda(dias: i, horas: 0) → hoy + i
//   días (DateComponents + Calendar, Clase 3B). Para saber qué eventos
//   son de cada día comparo claveDiaAgenda (el texto "dd/MM/yyyy").
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Views/ → New File → SwiftUI View.
//   2. Pega el archivo (incluye el struct DiaSemanaAgenda).
//  NECESITA:   Model/EventoAgenda.swift, Utils/FechasAgenda.swift,
//              Utils/PaletaAgenda.swift, Components/EventoAgendaRow.swift.
//  ⚠️ NO VISTO EN CLASE: ForEach para los 7 botones y la lista del día.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct DiaSemanaAgenda: Identifiable {
    var id: Int             // 0 = hoy, 1 = mañana, … 6
    var fecha: Date
}

struct AgendaSemanaView: View {

    var eventos: Array<EventoAgenda>                 // solo lee

    @State private var diaElegido = 0                // 0 = hoy

    let paleta = PaletaAgenda()

    // Los próximos 7 días, generados con un for
    var diasSemana: Array<DiaSemanaAgenda> {
        var resultado = Array<DiaSemanaAgenda>()
        for i in 0..<7 {
            resultado.append(DiaSemanaAgenda(id: i, fecha: fechaAgenda(dias: i, horas: 0)))
        }
        return resultado
    }

    // La fecha del día elegido
    var fechaElegida: Date {
        return fechaAgenda(dias: diaElegido, horas: 0)
    }

    // Cuántos eventos hay en un día (comparando la clave "dd/MM/yyyy")
    func cuantosEventos(fecha: Date) -> Int {
        let clave = claveDiaAgenda(fecha: fecha)
        var cuenta = 0
        for evento in eventos {
            if claveDiaAgenda(fecha: evento.fecha) == clave {
                cuenta += 1
            }
        }
        return cuenta
    }

    // Los eventos del día elegido, ordenados por hora
    var eventosDelDia: Array<EventoAgenda> {
        let clave = claveDiaAgenda(fecha: fechaElegida)
        var resultado = Array<EventoAgenda>()
        for evento in eventos {
            if claveDiaAgenda(fecha: evento.fecha) == clave {
                resultado.append(evento)
            }
        }
        return resultado.sorted { $0.fecha < $1.fecha }      // ⚠️ sorted
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        // ── 1. Mes y año ("octubre de 2026") ────────────
                        Text(formatearFechaAgenda(fecha: Date(), formato: "MMMM 'de' yyyy"))
                            .font(.title3)
                            .bold()
                            .foregroundStyle(paleta.textoSuave)

                        // ── 2. Siete botones del MISMO ancho ────────────
                        HStack(spacing: 6) {
                            ForEach(diasSemana) { dia in
                                Button {
                                    diaElegido = dia.id
                                } label: {
                                    VStack(spacing: 4) {
                                        // EEE = día corto ("jue"), d = número del día
                                        Text(formatearFechaAgenda(fecha: dia.fecha, formato: "EEE"))
                                            .font(.caption)
                                        Text(formatearFechaAgenda(fecha: dia.fecha, formato: "d"))
                                            .font(.title3)
                                            .bold()
                                        Text("\(cuantosEventos(fecha: dia.fecha))")
                                            .font(.caption2)
                                            .bold()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .foregroundStyle(diaElegido == dia.id ? paleta.textoSobrePrimario : paleta.texto)
                                    .background(diaElegido == dia.id ? paleta.primario : paleta.superficie)
                                    .cornerRadius(12)
                                }
                            }
                        }

                        // ── 3. Título del día elegido ───────────────────
                        Text(fechaConEstiloAgenda(fecha: fechaElegida, estiloFecha: .full, estiloHora: .none))
                            .font(.title2)
                            .bold()
                            .foregroundStyle(paleta.texto)

                        // ── 4. Eventos de ese día ───────────────────────
                        if eventosDelDia.isEmpty {
                            Text("No tienes nada este día 🎉")
                                .foregroundStyle(paleta.textoSuave)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 30)
                                .background(paleta.superficie)
                                .cornerRadius(16)
                        } else {
                            VStack(spacing: 14) {
                                ForEach(eventosDelDia) { evento in
                                    EventoAgendaRow(evento: evento)
                                }
                            }
                            .padding()
                            .background(paleta.superficie)
                            .cornerRadius(16)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Esta semana")
        }
    }
}

#Preview {
    AgendaSemanaView(eventos: cargarEventosAgenda())
}
