// ═══════════════════════════════════════════════════════════════
//  AgendaAgregarView.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Formulario (en una sheet) para agregar un evento:
//              título, descripción, categoría (Picker con opción vacía),
//              prioridad (segmented) y FECHA Y HORA con un DatePicker que
//              no deja elegir el pasado. Valida con alertas de mensaje
//              específico, hace append a la lista real y se cierra.
//  ÚSALO PARA: cualquier formulario que pida una fecha.
//  BUSCA:      agregar, formulario, DatePicker, elegir fecha, fecha futura,
//              no permitir pasado, validar fecha, comparar fechas, append,
//              id nuevo, sheet, dismiss, alerta
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Views/ → New File → SwiftUI View.
//   2. Pega el archivo. Desde la lista:
//        .sheet(isPresented: $mostrarAgregar) { AgendaAgregarView(eventos: $eventos) }
//  NECESITA:   Model/EventoAgenda.swift, Model/ModelDataAgenda.swift
//              (categoriasAgenda), Utils/FechasAgenda.swift, Utils/PaletaAgenda.swift.
//  DE CLASE: alertas en 3 pasos con toggle (3), TextField + @FocusState +
//     .onTapGesture en el Stack principal (4), Picker (4), @Binding (6B),
//     dismiss (6A), .sheet (17).
//  ⚠️ NO VISTO EN CLASE: DatePicker con in: Date()... (solo fechas de
//     ahora en adelante), ForEach en el Picker, sort.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AgendaAgregarView: View {

    @Binding var eventos: Array<EventoAgenda>
    @Environment(\.dismiss) private var dismiss

    // ── Campos ──────────────────────────────────────────────────
    @State private var titulo = ""
    @State private var descripcion = ""
    @State private var categoria = ""                     // "" = no ha elegido
    @State private var prioridad = "Media"
    // Valor inicial: mañana a las 9:00 (fecha relativa, forma de clase)
    @State private var fecha = fechaAgenda(dias: 1, horas: 9)

    // ── Alerta (Clase 3: 3 pasos) ───────────────────────────────
    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool

    let paleta = PaletaAgenda()

    // Cómo va a quedar la fecha elegida (se actualiza solo al moverla)
    var resumenFecha: String {
        let texto = formatearFechaAgenda(fecha: fecha, formato: "EEEE d 'de' MMMM, h:mm a")
        let dias = diasEntreAgenda(desde: Date(), hasta: fecha)
        if dias == 0 {
            return texto + " (hoy)"
        } else if dias == 1 {
            return texto + " (mañana)"
        }
        return texto + " (en \(dias) días)"
    }

    func guardar() {
        campoEnFoco = false

        // Validación en orden: el PRIMER error que encuentre es el que avisa.
        if titulo.isEmpty {
            alertMessage = "Escribe el título del evento."
            showAlert.toggle()
        } else if titulo.count < 3 {
            alertMessage = "El título debe tener al menos 3 letras."
            showAlert.toggle()
        } else if categoria.isEmpty {
            alertMessage = "Elige una categoría."
            showAlert.toggle()
        } else if fecha < Date() {
            // Las fechas se comparan con < y > como los números.
            alertMessage = "Esa fecha y hora ya pasaron. Elige una fecha futura."
            showAlert.toggle()
        } else {
            // id nuevo = el mayor + 1 (así nunca se repite aunque borres)
            var mayor = 0
            for evento in eventos {
                if evento.id > mayor {
                    mayor = evento.id
                }
            }
            let nuevo = EventoAgenda(id: mayor + 1, titulo: titulo, descripcion: descripcion,
                                     categoria: categoria, prioridad: prioridad,
                                     fecha: fecha, completado: false)
            eventos.append(nuevo)
            eventos.sort { $0.fecha < $1.fecha }          // ⚠️ queda en orden de fecha
            dismiss()
        }
    }

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    Text("Nuevo evento")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(paleta.texto)
                        .padding(.top, 20)

                    // ── 1. Textos ───────────────────────────────────
                    Text("Título")
                        .font(.headline)
                        .foregroundStyle(paleta.texto)
                    TextField("Ej. Entregar tarea de gráficas", text: $titulo)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Descripción (opcional)")
                        .font(.headline)
                        .foregroundStyle(paleta.texto)
                    TextField("Ej. Subirla a Canvas en PDF", text: $descripcion)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    // ── 2. Picker con opción vacía ──────────────────
                    HStack {
                        Text("Categoría")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        Spacer()
                        Picker(selection: $categoria, label: Text("Categoría")) {
                            Text("Selecciona…").tag("")
                            // ⚠️ ForEach: las opciones salen del arreglo de ModelData
                            ForEach(categoriasAgenda, id: \.self) { opcion in
                                Text(opcion).tag(opcion)
                            }
                        }
                        .pickerStyle(.menu)
                    }

                    // ── 3. Picker segmented ─────────────────────────
                    Text("Prioridad")
                        .font(.headline)
                        .foregroundStyle(paleta.texto)
                    Picker(selection: $prioridad, label: Text("Prioridad")) {
                        Text("Alta").tag("Alta")
                        Text("Media").tag("Media")
                        Text("Baja").tag("Baja")
                    }
                    .pickerStyle(.segmented)

                    // ── 4. DatePicker: fecha y hora ⚠️ ───────────────
                    // in: Date()...  = rango "desde ahorita en adelante":
                    // el calendario ni siquiera deja tocar días pasados.
                    DatePicker("Fecha y hora", selection: $fecha, in: Date()...,
                               displayedComponents: [.date, .hourAndMinute])
                        .font(.headline)
                        .foregroundStyle(paleta.texto)
                        .environment(\.locale, Locale(identifier: "es_MX"))

                    // La fecha elegida, en texto (se actualiza sola)
                    Label(resumenFecha, systemImage: "calendar.badge.clock")
                        .font(.subheadline)
                        .foregroundStyle(paleta.primario)

                    // ── 5. Botones del mismo ancho ──────────────────
                    HStack(spacing: 12) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancelar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.bordered)

                        Button {
                            guardar()
                        } label: {
                            Text("Guardar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .controlSize(.large)
                    .padding(.top, 8)
                }
                .padding()
                .tint(paleta.primario)
            }
        }
        // Clase 4: tocar fuera esconde el teclado (en el Stack PRINCIPAL)
        .onTapGesture {
            campoEnFoco = false
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }
}

#Preview {
    AgendaAgregarView(eventos: .constant(cargarEventosAgenda()))
}
