// ═══════════════════════════════════════════════════════════════
//  PlanearViajeViajesView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La hoja (sheet) para planear un viaje: fecha de ida y de
//              regreso con DatePicker, número de personas con Stepper,
//              presupuesto calculado en vivo y validación con alerta.
//  ÚSALO PARA: cualquier formulario con FECHAS (reservaciones, citas,
//              préstamos, eventos) y cálculos con lo que elige el usuario.
//  BUSCA:      DatePicker, elegir fecha, fecha de ida, fecha de regreso,
//              validar fechas, Stepper, personas, presupuesto, calcular,
//              dias entre fechas, onChange fecha, sheet formulario, dismiss
//
//  CÓMO COPIARLO:
//   1. Views/PlanearViajeViajesView.swift → pega esto.
//   2. Ábrelo con:  .sheet(isPresented: $mostrarPlanear) {
//          PlanearViajeViajesView(destino: destino, viajes: $viajes) }
//  NECESITA:   Model (DestinoViajes, ViajePlaneado), Utils/FechasViajes.swift
//  DE CLASE:   alerta en 3 pasos con toggle (Clase 3), .onChange con
//              oldValue/newValue (Clase 4), dismiss (Clase 6A), @Binding +
//              append (Clase 6B/10), .currency(code: "MXN") (Clase 3B).
//  ⚠️ NO VISTO EN CLASE: DatePicker, Stepper y
//     .environment(\.locale, …) (pone el DatePicker en español).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PlanearViajeViajesView: View {

    var destino: DestinoViajes                      // solo se LEE (sin $)
    @Binding var viajes: Array<ViajePlaneado>       // se MODIFICA (append)

    @Environment(\.dismiss) private var dismiss     // para cerrar la sheet

    // Fechas iniciales: dentro de 7 y de 10 días (Date() = ahora + días).
    @State private var fechaIda = fechaDentroDeDiasViajes(dias: 7)          // ✏️
    @State private var fechaRegreso = fechaDentroDeDiasViajes(dias: 10)     // ✏️
    @State private var personas = 2

    @State private var showAlert = false
    @State private var alertMessage = ""

    let paleta = PaletaViajes()

    // ── Propiedades calculadas: se recalculan SOLAS cada vez que el
    //    usuario cambia una fecha o el número de personas ──────────
    var dias: Int {
        return diasEntreFechasViajes(desde: fechaIda, hasta: fechaRegreso)
    }

    var presupuesto: Double {
        if dias <= 0 {
            return 0
        }
        return destino.costoAproximado * Double(personas) * Double(dias)
    }

    // Valida EN ORDEN y con un mensaje específico por error.
    func guardarViaje() {
        if dias <= 0 {
            alertMessage = "La fecha de regreso debe ser DESPUÉS de la fecha de ida."
            showAlert.toggle()
        } else if dias > 30 {
            alertMessage = "El viaje no puede durar más de 30 días."               // ✏️
            showAlert.toggle()
        } else {
            let nuevoViaje = ViajePlaneado(
                id: siguienteIdViajes(viajes: viajes),
                destinoNombre: destino.nombre,
                estado: destino.estado,
                imagen: destino.imagenPrincipal,
                fechaIda: fechaIda,
                fechaRegreso: fechaRegreso,
                personas: personas,
                presupuesto: presupuesto,
                yaFui: false,
                fotos: [])
            viajes.append(nuevoViaje)       // se ve al instante en "Mis viajes"
            dismiss()
        }
    }

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Encabezado ─────────────────────────────
                    HStack(spacing: 14) {
                        Image(destino.imagenPrincipal)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                            .cornerRadius(12)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Planear viaje")
                                .font(.subheadline)
                                .foregroundStyle(paleta.textoSuave)
                            Text(destino.nombre)
                                .font(.title)
                                .bold()
                                .foregroundStyle(paleta.texto)
                        }
                    }

                    // ── 2. Fechas con DatePicker ⚠️ ──────────────
                    // in: Date()... = no deja elegir días que ya pasaron.
                    // displayedComponents: .date = solo fecha, sin hora.
                    VStack(alignment: .leading, spacing: 12) {
                        DatePicker("Ida", selection: $fechaIda, in: Date()..., displayedComponents: .date)
                        Divider()
                        DatePicker("Regreso", selection: $fechaRegreso, in: Date()..., displayedComponents: .date)
                    }
                    .environment(\.locale, Locale(identifier: "es_MX"))       // ⚠️ meses en español
                    .foregroundStyle(paleta.texto)
                    .tint(paleta.primario)
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // La misma fecha escrita completa en español (Clase 3B).
                    Text("Sales el \(textoFechaViajes(fecha: fechaIda)) y regresas el \(textoFechaViajes(fecha: fechaRegreso)).")
                        .font(.footnote)
                        .foregroundStyle(paleta.textoSuave)

                    // ── 3. Personas con Stepper ⚠️ ───────────────
                    // Stepper = botones − y + que cambian un número entre 1 y 10.
                    Stepper("Personas: \(personas)", value: $personas, in: 1...10)     // ✏️ rango
                        .foregroundStyle(paleta.texto)
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                    // ── 4. Presupuesto calculado en vivo ─────────
                    VStack(spacing: 12) {
                        FilaDatoViajes(icono: "calendar", etiqueta: "Días de viaje", valor: dias > 0 ? "\(dias)" : "—")
                        FilaDatoViajes(icono: "person.2.fill", etiqueta: "Personas", valor: "\(personas)")
                        FilaDatoViajes(icono: "dollarsign.circle.fill",
                                       etiqueta: "Costo por persona al día",
                                       valor: destino.costoAproximado.formatted(.currency(code: "MXN")))
                        Divider()
                        HStack {
                            Text("Presupuesto")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Spacer()
                            Text(presupuesto, format: .currency(code: "MXN"))
                                .font(.title2)
                                .bold()
                                .foregroundStyle(paleta.primario)
                        }
                        Text("Presupuesto = costo × personas × días")
                            .font(.caption)
                            .foregroundStyle(paleta.textoSuave)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 5. Botones ───────────────────────────────
                    Button {
                        guardarViaje()
                    } label: {
                        Text("Guardar viaje")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .background(paleta.primario)
                            .cornerRadius(14)
                    }

                    Button("Cancelar") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(paleta.primario)
                }
                .padding()
            }
        }
        // Alerta con mensaje dinámico (3 pasos de la Clase 3).
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
        // Si mueven la ida después del regreso, el regreso se recorre a
        // un día después de la ida (Clase 4: onChange con oldValue y newValue).
        .onChange(of: fechaIda) { oldValue, newValue in
            if fechaRegreso <= newValue {
                fechaRegreso = sumarDiasViajes(fecha: newValue, dias: 1)
            }
        }
    }
}

#Preview {
    PlanearViajeViajesView(destino: destinoDePruebaViajes(), viajes: .constant(viajesDeEjemploViajes()))
}
