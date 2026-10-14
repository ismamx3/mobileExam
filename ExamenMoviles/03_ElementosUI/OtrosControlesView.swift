// ═══════════════════════════════════════════════════════════════
//  OtrosControlesView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Controles extra: Stepper (+/-), DatePicker (fecha) en
//              formato es_MX, ColorPicker, ProgressView ligado a un
//              Slider y Link para abrir una página web.
//  ÚSALO PARA: cantidad de productos, fecha de nacimiento o de cita,
//              elegir un color, mostrar avance, abrir un enlace.
//  BUSCA:      stepper, mas menos, cantidad, contador, datepicker, fecha,
//              calendario, date, dateformatter, es_MX, colorpicker, color,
//              progressview, progreso, avance, porcentaje, link, enlace, url
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/OtrosControlesView.swift (o pega solo un bloque).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: Stepper, DatePicker, ColorPicker, Link,
//                        .environment(\.locale, ...). (ProgressView sí se vio en Gráficas.)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct OtrosControlesView: View {

    @State private var cantidad = 1
    let precioUnitario = 35.5                       // ✏️ precio de ejemplo

    @State private var fecha = Date()
    @State private var fechaCita = Date()

    @State private var colorElegido = Color.purple

    @State private var avance = 40.0

    // Convierte una fecha a texto en español (DateFormatter, como en clase)
    func fechaEnTexto(fecha: Date) -> String {
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.long      // ✏️ .short, .medium, .long, .full
        formato.timeStyle = DateFormatter.Style.none
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: fecha)
    }

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. Stepper (botones + y -) ──────────────
                    Text("1. Stepper")
                        .font(.headline)

                    // ⚠️ NO VISTO EN CLASE: Stepper suma o resta 1 al tocar + o -. "in:" pone el mínimo y máximo.
                    Stepper("Cantidad: \(cantidad)", value: $cantidad, in: 1 ... 10)   // ✏️ rango

                    Text("Total: \(Double(cantidad) * precioUnitario, format: .currency(code: "MXN"))")
                        .foregroundStyle(.purple)

                    // ── 2. DatePicker compacto ──────────────────
                    Text("2. DatePicker compacto")
                        .font(.headline)

                    // ⚠️ NO VISTO EN CLASE: DatePicker elige una fecha. displayedComponents: .date = solo fecha (sin hora).
                    DatePicker("Fecha de nacimiento", selection: $fecha, displayedComponents: .date)
                        // ⚠️ NO VISTO EN CLASE: .environment(\.locale, ...) muestra el calendario en español.
                        .environment(\.locale, Locale(identifier: "es_MX"))

                    Text("Elegiste: \(fechaEnTexto(fecha: fecha))")

                    // ── 3. DatePicker gráfico (calendario) ──────
                    Text("3. DatePicker de calendario")
                        .font(.headline)

                    // "in: Date()..." = solo deja elegir de hoy en adelante
                    DatePicker("Cita", selection: $fechaCita, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .tint(.purple)
                        .environment(\.locale, Locale(identifier: "es_MX"))
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(12)

                    Text("Tu cita: \(fechaEnTexto(fecha: fechaCita))")

                    // ── 4. ColorPicker ──────────────────────────
                    Text("4. ColorPicker")
                        .font(.headline)

                    // ⚠️ NO VISTO EN CLASE: ColorPicker abre una paleta para elegir un color.
                    ColorPicker("Elige un color", selection: $colorElegido)

                    RoundedRectangle(cornerRadius: 12)
                        .fill(colorElegido)
                        .frame(height: 50)

                    // ── 5. ProgressView ligado a un Slider ──────
                    Text("5. ProgressView con Slider")
                        .font(.headline)

                    Slider(value: $avance, in: 0 ... 100, step: 1)
                        .tint(.purple)

                    ProgressView(value: avance, total: 100)
                        .scaleEffect(x: 1, y: 3)            // y: 3 = barra más gruesa
                        .tint(.purple)
                        .padding(.vertical, 6)

                    Text("Avance: \(Int(avance))%")

                    // ── 6. Link a una página web ────────────────
                    Text("6. Link")
                        .font(.headline)

                    // ⚠️ NO VISTO EN CLASE: Link abre la URL en Safari. Se usa if let para no usar "!".
                    if let url = URL(string: "https://developer.apple.com/sf-symbols/") {   // ✏️ tu URL
                        Link(destination: url) {
                            Label("Abrir catálogo de SF Symbols", systemImage: "safari")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Otros controles")
    }
}

#Preview {
    NavigationStack {
        OtrosControlesView()
    }
}
