// ═══════════════════════════════════════════════════════════════
//  PickersView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Picker en sus 3 estilos (.wheel = "select", .segmented =
//              "segment control", .menu), con tags Int y String,
//              .onChange para "hacer algo" cuando cambia, opciones desde
//              un arreglo y opción "Selecciona…" con validación.
//              (Clase 4 · Elementos interactuables de UI)
//  ÚSALO PARA: elegir color, carrera, semestre, tamaño, categoría.
//  BUSCA:      picker, select, selector, opciones, ruleta, wheel, segmented,
//              segment control, segmentos, menu, dropdown, desplegable, tag,
//              onchange, oldValue, newValue, hacer algo cuando cambie,
//              selectedColor, foreach, arreglo, seleccionar, validar seleccion,
//              opcion vacia
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PickersView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: ForEach(arreglo, id: \.self) en los bloques 3 y 4
//                        (no viene en las láminas; lo usaste en actSwift).
//                        Versión 100% de clase: escribir cada
//                        Text("...").tag(...) a mano, como en los bloques 1 y 2.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PickersView: View {

    // Bloque 1: tag Int (en la lámina: @State private var selectedColor: Int = 1)
    @State private var colorElegido: Int = 1
    @State private var cambioDeColor: String = ""

    // Bloque 2: tag String
    @State private var tamano: String = "Mediano"

    // Bloque 3 y 4: opciones desde un arreglo
    let semestres = ["1er semestre", "2do semestre", "3er semestre", "4to semestre",
                     "5to semestre", "6to semestre", "7mo semestre", "8vo semestre"]   // ✏️ tus opciones
    @State private var semestre: String = "1er semestre"

    let carreras = ["ITC", "IMT", "IBT", "LAD", "ARQ"]                                 // ✏️ tus opciones
    @State private var carrera: String = ""      // "" = todavía no elige

    @State private var showAlert = false
    @State private var alertMessage = ""

    // Convierte el número guardado en un color para mostrarlo
    var colorDelPicker: Color {
        if colorElegido == 1 {
            return Color.red
        } else if colorElegido == 2 {
            return Color.yellow
        } else {
            return Color.blue
        }
    }

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. Picker .wheel ("select") con tag Int + .onChange ───
                    Text("1. Ruleta (.wheel) con tag Int y .onChange")
                        .font(.headline)

                    // El Picker nos permite seleccionar valores de una lista.
                    // El más utilizado es el conocido como "select" (.wheel).
                    // El Text es lo que se VE; el .tag es lo que se GUARDA en la variable.
                    Picker(selection: $colorElegido, label: Text("Color")) {
                        Text("Rojo").tag(1)              // ✏️ opciones
                        Text("Amarillo").tag(2)
                        Text("Azul").tag(3)
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 130)
                    // Para "hacer algo" cuando cambie el valor seleccionado: .onChange
                    .onChange(of: colorElegido) { oldValue, newValue in
                        cambioDeColor = "Cambió de \(oldValue) a \(newValue)"   // ✏️ lo que quieras hacer
                    }

                    RoundedRectangle(cornerRadius: 12)
                        .fill(colorDelPicker)
                        .frame(height: 40)

                    if cambioDeColor != "" {
                        Text(cambioDeColor)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                    // ── 2. Picker .segmented ("segment control") con tag String ─────
                    Text("2. Segmentos (.segmented) con tag String")
                        .font(.headline)

                    // Pequeña variación del Picker que deja ver las opciones abiertas.
                    // No se recomienda con muchas opciones (3-4 máximo recomendado).
                    Picker(selection: $tamano, label: Text("Tamaño")) {
                        Text("Chico").tag("Chico")
                        Text("Mediano").tag("Mediano")
                        Text("Grande").tag("Grande")
                    }
                    .pickerStyle(.segmented)

                    Text("Tamaño elegido: \(tamano)")

                    // ── 3. Picker .menu con opciones de un arreglo ─
                    Text("3. Menú desplegable (.menu) desde un arreglo")
                        .font(.headline)

                    HStack {
                        Text("Semestre:")
                        Spacer()
                        // ⚠️ NO VISTO EN CLASE: ForEach recorre el arreglo y crea un Text por opción.
                        // id: \.self porque los textos no se repiten.
                        Picker(selection: $semestre, label: Text("Semestre")) {
                            ForEach(semestres, id: \.self) { opcion in
                                Text(opcion).tag(opcion)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(.purple)
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)

                    // ── 4. Opción "Selecciona…" + validación ────
                    Text("4. Con opción vacía y validación")
                        .font(.headline)

                    HStack {
                        Text("Carrera:")
                        Spacer()
                        Picker(selection: $carrera, label: Text("Carrera")) {
                            Text("Selecciona…").tag("")          // opción "no ha elegido"
                            // ⚠️ NO VISTO EN CLASE: ForEach (ver bloque 3)
                            ForEach(carreras, id: \.self) { opcion in
                                Text(opcion).tag(opcion)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(.purple)
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)

                    Button {
                        if carrera == "" {
                            alertMessage = "Selecciona una carrera"
                        } else {
                            alertMessage = "Elegiste \(carrera), \(semestre)"
                        }
                        showAlert.toggle()
                    } label: {
                        Text("Validar selección")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .alert(alertMessage, isPresented: $showAlert) {
                        Button("OK") {}
                    }

                    // ── 5. Mostrar todo lo elegido ──────────────
                    Text("5. Resumen de lo elegido")
                        .font(.headline)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Color: \(colorElegido)")
                        Text("Tamaño: \(tamano)")
                        Text("Semestre: \(semestre)")
                        Text("Carrera: \(carrera == "" ? "Sin elegir" : carrera)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Picker")
    }
}

#Preview {
    NavigationStack {
        PickersView()
    }
}
