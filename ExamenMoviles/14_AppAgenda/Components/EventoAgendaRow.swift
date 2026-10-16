// ═══════════════════════════════════════════════════════════════
//  EventoAgendaRow.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El renglón de cada evento en las listas: ícono de la
//              categoría, título, hora y una etiqueta con "Hoy",
//              "Mañana", "En 3 días" o "Vencido".
//  ÚSALO PARA: renglones de cualquier lista que tenga fechas.
//  BUSCA:      row, renglon, componente, fila evento, etiqueta fecha,
//              hoy manana, vencido, completado, check
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Components/ → New File → SwiftUI View.
//   2. Pega el struct. Recibe el evento como var (solo lo MUESTRA:
//      sin @State ni private, forma de clase 10).
//  NECESITA:   Model/EventoAgenda.swift, Utils/PaletaAgenda.swift.
//  DE CLASE (Clase 10): "no agregues padding al stack" del renglón:
//     el List ya le pone su espacio.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EventoAgendaRow: View {

    var evento: EventoAgenda
    let paleta = PaletaAgenda()

    // Color de la etiqueta según el estado (propiedad calculada)
    var colorEtiqueta: Color {
        if evento.completado {
            return paleta.exito
        } else if evento.estaVencido {
            return paleta.alerta
        } else if evento.esHoy {
            return paleta.primario
        }
        return paleta.textoSuave
    }

    var textoEtiqueta: String {
        if evento.completado {
            return "Hecho"
        } else if evento.estaVencido {
            return "Vencido"
        }
        return evento.textoCuandoFalta
    }

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: evento.icono)
                .font(.headline)
                .foregroundStyle(paleta.textoSobrePrimario)
                .frame(width: 38, height: 38)
                .background(evento.completado ? paleta.exito : paleta.primario)
                .clipShape(.circle)

            VStack(alignment: .leading, spacing: 3) {
                Text(evento.titulo)
                    .font(.headline)
                    .foregroundStyle(evento.completado ? paleta.textoSuave : paleta.texto)
                    .lineLimit(1)
                // horaTexto y diaSemana son propiedades calculadas del modelo
                Text("\(evento.diaSemana) · \(evento.horaTexto)")
                    .font(.subheadline)
                    .foregroundStyle(paleta.textoSuave)
            }

            Spacer()

            Text(textoEtiqueta)
                .font(.caption)
                .bold()
                .foregroundStyle(colorEtiqueta)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(colorEtiqueta.opacity(0.12))
                .cornerRadius(8)
        }
    }
}

#Preview {
    List {
        EventoAgendaRow(evento: cargarEventosAgenda()[0])
        EventoAgendaRow(evento: cargarEventosAgenda()[3])
        EventoAgendaRow(evento: cargarEventosAgenda()[13])
    }
}
