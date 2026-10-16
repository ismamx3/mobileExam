// ═══════════════════════════════════════════════════════════════
//  AgendaDetalleView.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Detalle de un evento. Muestra LA MISMA FECHA en 7
//              formatos distintos (para que veas qué hace cada uno) y
//              permite cambiarla con un DatePicker, marcar completado y
//              cambiar la prioridad. Todo con @Binding: al regresar, la
//              lista, Hoy y Progreso ya tienen el cambio.
//  ÚSALO PARA: detalles que editan un elemento con fecha.
//  BUSCA:      detalle, binding, editar fecha, DatePicker, cambiar fecha,
//              formatos de fecha, completado, toggle, dismiss, regresar
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Views/ → New File → SwiftUI View.
//   2. Pega el archivo. Desde la lista: AgendaDetalleView(evento: $evento)
//  NECESITA:   Model/EventoAgenda.swift, Utils/FechasAgenda.swift,
//              Utils/PaletaAgenda.swift, Components/FilaDatoAgenda.swift.
//  DE CLASE: @Binding (6B), dismiss() (6A), Toggle (4), Picker .segmented (4).
//  ⚠️ NO VISTO EN CLASE: DatePicker y .environment(\.locale, …) para
//     que el DatePicker salga en español, .lowercased() (texto en
//     minúsculas) y .navigationBarTitleDisplayMode(.inline).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AgendaDetalleView: View {

    // @Binding: modifica el evento REAL de la lista (Clase 6B, ida y vuelta)
    @Binding var evento: EventoAgenda

    @Environment(\.dismiss) private var dismiss

    let paleta = PaletaAgenda()

    // Texto grande de arriba ("Hoy", "En 3 días", "Vencido"…)
    var cuando: String {
        if evento.completado {
            return "¡Hecho! ✅"
        } else if evento.estaVencido {
            return "Vencido · " + evento.textoCuandoFalta.lowercased()
        }
        return evento.textoCuandoFalta
    }

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Encabezado ───────────────────────────────
                    HStack(spacing: 14) {
                        Image(systemName: evento.icono)
                            .font(.title)
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .frame(width: 64, height: 64)
                            .background(paleta.primario)
                            .clipShape(.circle)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(evento.titulo)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(paleta.texto)
                            Text("\(evento.categoria) · prioridad \(evento.prioridad.lowercased())")
                                .foregroundStyle(paleta.textoSuave)
                        }
                    }

                    // ── 2. ¿Cuándo? (propiedades calculadas del modelo) ─
                    Text(cuando)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(evento.estaVencido ? paleta.alerta : paleta.primario)

                    Text(evento.descripcion)
                        .foregroundStyle(paleta.texto)

                    // ── 3. La MISMA fecha en 7 formatos ─────────────
                    // Todos salen del mismo campo evento.fecha; lo único que
                    // cambia es el estilo o el dateFormat del DateFormatter.
                    VStack(alignment: .leading, spacing: 2) {
                        Text("La misma fecha, 7 formatos")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                            .padding(.bottom, 4)
                        FilaDatoAgenda(icono: "calendar", etiqueta: ".long",
                                       valor: evento.fechaTexto)
                        FilaDatoAgenda(icono: "calendar", etiqueta: ".full",
                                       valor: fechaConEstiloAgenda(fecha: evento.fecha, estiloFecha: .full, estiloHora: .none))
                        FilaDatoAgenda(icono: "calendar", etiqueta: ".short",
                                       valor: fechaConEstiloAgenda(fecha: evento.fecha, estiloFecha: .short, estiloHora: .none))
                        FilaDatoAgenda(icono: "textformat", etiqueta: "\"EEEE d 'de' MMMM\"",
                                       valor: formatearFechaAgenda(fecha: evento.fecha, formato: "EEEE d 'de' MMMM"))
                        FilaDatoAgenda(icono: "number", etiqueta: "\"dd/MM/yyyy\"",
                                       valor: formatearFechaAgenda(fecha: evento.fecha, formato: "dd/MM/yyyy"))
                        FilaDatoAgenda(icono: "clock", etiqueta: "\"h:mm a\"",
                                       valor: evento.horaTexto)
                        FilaDatoAgenda(icono: "clock", etiqueta: "\"HH:mm\"",
                                       valor: formatearFechaAgenda(fecha: evento.fecha, formato: "HH:mm"))
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 4. Editar (con @Binding → se refleja en la lista) ─
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Editar")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)

                        Toggle("Completado", isOn: $evento.completado)
                            .foregroundStyle(paleta.texto)

                        // ⚠️ NO VISTO EN CLASE: DatePicker. selection va con $ porque
                        // CAMBIA la fecha. displayedComponents: qué deja elegir
                        // (.date = día, .hourAndMinute = hora).
                        DatePicker("Fecha y hora", selection: $evento.fecha,
                                   displayedComponents: [.date, .hourAndMinute])
                            .foregroundStyle(paleta.texto)
                            // ⚠️ NO VISTO EN CLASE: así el calendario sale en español
                            .environment(\.locale, Locale(identifier: "es_MX"))

                        Text("Prioridad")
                            .foregroundStyle(paleta.texto)
                        Picker(selection: $evento.prioridad, label: Text("Prioridad")) {
                            Text("Alta").tag("Alta")
                            Text("Media").tag("Media")
                            Text("Baja").tag("Baja")
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)
                    .tint(paleta.primario)

                    // ── 5. Regresar por código (Clase 6A) ───────────
                    Button {
                        dismiss()
                    } label: {
                        Text("Listo, regresar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .background(paleta.primario)
                            .cornerRadius(14)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)          // ⚠️ título chico
    }
}

#Preview {
    NavigationStack {
        AgendaDetalleView(evento: .constant(cargarEventosAgenda()[4]))
    }
}
