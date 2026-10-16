// ═══════════════════════════════════════════════════════════════
//  GymRegistrarView.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Registrar": formulario para guardar un
//              entrenamiento. Tiene un PICKER DEPENDIENTE (el grupo
//              muscular cambia las opciones de ejercicio), Picker .wheel,
//              Picker .segmented, Stepper, Slider de clase, Toggle y
//              DatePicker. Calcula las calorías llamando al método del
//              PROTOCOLO (cada clase con su fórmula) y valida con alertas.
//  ÚSALO PARA: formularios con opciones que dependen de otra opción
//              (país → ciudad, categoría → producto, grupo → ejercicio).
//  BUSCA:      picker dependiente, onChange, oldValue newValue, resetear picker,
//              wheel, segmented, menu, Stepper, Slider onEditingChanged, Toggle,
//              DatePicker, formulario, validar, alerta, append, id nuevo
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GymRegistrarView.swift.
//   2. Pega el archivo y cambia lo marcado con ✏️.
//   3. Desde la vista del TabView:  GymRegistrarView(entrenamientos: $lista)  (CON $)
//  NECESITA:   Model/ (EjercicioGym, EntrenamientoGym, ModelDataGym),
//              Utils/PaletaGym.swift.
//  DE CLASE (Clase 4): Picker(selection:label:) .wheel/.segmented con
//     .tag, .onChange(of:) { oldValue, newValue in }, Slider con
//     in: 0 ... 200 y onEditingChanged, .tint, Toggle. Alerta en 3 pasos (Clase 3).
//  ⚠️ NO VISTO EN CLASE: Stepper (bloque 5), DatePicker (bloque 7),
//     ForEach dentro del Picker dependiente (bloque 2; sus opciones cambian,
//     no se pueden escribir a mano), .environment(\.locale, …) (bloque 7).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GymRegistrarView: View {

    // AGREGA a la lista del dueño (GymAppView) → @Binding.
    @Binding var entrenamientos: [EntrenamientoGym]

    // Peso de la persona: se usa en la fórmula de calorías.
    @AppStorage("pesoPersonaGym") private var pesoPersona = 70.0

    // ── Datos del formulario (temporales → @State) ──────────────────
    @State private var grupo = ""                 // "" = no ha elegido
    @State private var ejercicio = ""
    @State private var minutos = 30
    @State private var intensidad = "Media"
    @State private var series = 3
    @State private var repeticiones = 10
    @State private var pesoLevantado = 20.0
    @State private var ajustandoPeso = false
    @State private var esRecord = false
    @State private var fecha = Date()             // por default: ahora

    // ── Alerta (3 pasos de la Clase 3) ──────────────────────────────
    @State private var showAlert = false
    @State private var alertMessage = ""

    let paleta = PaletaGym()

    // ── Cálculos (propiedades calculadas: se recalculan solas) ──────
    // El ejercicio elegido como objeto del PROTOCOLO (opcional: puede no
    // haber ninguno elegido todavía).
    var ejercicioElegido: EjercicioGym? {
        return buscarEjercicioGym(nombre: ejercicio)
    }

    var esFuerza: Bool {
        if let elegido = ejercicioElegido {
            return elegido.tipo == "Fuerza"
        }
        return false
    }

    var factorIntensidad: Double {
        switch intensidad {
        case "Ligera":
            return 0.8
        case "Intensa":
            return 1.2
        default:
            return 1.0
        }
    }

    // Aquí se ve el protocolo: NO importa si es Cardio, Fuerza o
    // Flexibilidad, se llama IGUAL y cada clase usa su propia fórmula.
    var caloriasCalculadas: Double {
        if let elegido = ejercicioElegido {
            return elegido.caloriasQuemadas(minutos: minutos, pesoPersona: pesoPersona) * factorIntensidad
        }
        return 0
    }

    // ── Validar y guardar ───────────────────────────────────────────
    // Revisa en orden; en cuanto encuentra un error, prepara SU mensaje.
    func guardar() {
        if grupo.isEmpty {
            alertMessage = "Elige un grupo muscular."
            showAlert.toggle()
        } else if ejercicio.isEmpty {
            alertMessage = "Elige el ejercicio que hiciste."
            showAlert.toggle()
        } else if esRecord && esFuerza && pesoLevantado == 0 {
            alertMessage = "Para guardar un récord de fuerza indica cuánto peso levantaste."
            showAlert.toggle()
        } else if let elegido = ejercicioElegido {
            // id nuevo = el mayor que exista + 1 (así nunca se repite).
            var mayorId = 0
            for entrenamiento in entrenamientos {
                if entrenamiento.id > mayorId {
                    mayorId = entrenamiento.id
                }
            }

            let nuevo = EntrenamientoGym(id: mayorId + 1,
                                         ejercicio: elegido.nombre,
                                         grupo: grupo,
                                         tipo: elegido.tipo,
                                         icono: elegido.icono,
                                         minutos: minutos,
                                         series: esFuerza ? series : 0,
                                         repeticiones: esFuerza ? repeticiones : 0,
                                         peso: esFuerza ? pesoLevantado : 0,
                                         calorias: caloriasCalculadas,
                                         intensidad: intensidad,
                                         esRecord: esRecord,
                                         fecha: fecha)
            // Al cambiar la lista, GymAppView la guarda solita (.onChange).
            entrenamientos.append(nuevo)

            alertMessage = "¡Guardado! \(elegido.nombre): \(minutos) min, \(Int(caloriasCalculadas)) kcal."
            showAlert.toggle()
            limpiar()
        }
    }

    func limpiar() {
        grupo = ""
        ejercicio = ""
        minutos = 30
        intensidad = "Media"
        series = 3
        repeticiones = 10
        pesoLevantado = 20.0
        esRecord = false
        fecha = Date()
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {

                        // ── 1. Picker de grupo muscular (opciones fijas) ──
                        VStack(alignment: .leading, spacing: 8) {
                            Text("1. Grupo muscular")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Picker(selection: $grupo, label: Text("Grupo muscular")) {
                                Text("Selecciona…").tag("")                       // opción vacía
                                Text("Piernas").tag("Piernas")                    // ✏️ tus opciones
                                Text("Pecho").tag("Pecho")
                                Text("Espalda").tag("Espalda")
                                Text("Brazos").tag("Brazos")
                                Text("Cardio").tag("Cardio")
                                Text("Flexibilidad").tag("Flexibilidad")
                            }
                            .pickerStyle(.menu)
                            // Clase 4: hacer algo cuando cambia el valor.
                            // Si cambia el grupo, el ejercicio anterior ya no es
                            // de este grupo → se RESETEA para que el segundo
                            // Picker no apunte a un tag que ya no existe.
                            .onChange(of: grupo) { oldValue, newValue in
                                ejercicio = ""
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 2. Picker DEPENDIENTE: sus opciones dependen del grupo ─
                        VStack(alignment: .leading, spacing: 8) {
                            Text("2. Ejercicio")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            if grupo.isEmpty {
                                Text("Primero elige un grupo muscular.")
                                    .foregroundStyle(paleta.textoSuave)
                            } else {
                                Picker(selection: $ejercicio, label: Text("Ejercicio")) {
                                    Text("Selecciona…").tag("")
                                    // ⚠️ NO VISTO EN CLASE: ForEach crea un Text().tag()
                                    // por cada nombre de la lista (la lista cambia con el grupo).
                                    ForEach(ejerciciosDelGrupoGym(grupo: grupo), id: \.self) { nombre in
                                        Text(nombre).tag(nombre)
                                    }
                                }
                                .pickerStyle(.menu)
                            }
                            if let elegido = ejercicioElegido {
                                Label("\(elegido.tipo): \(elegido.descripcionRutina())", systemImage: elegido.icono)
                                    .font(.footnote)
                                    .foregroundStyle(paleta.textoSuave)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 3. Minutos con Picker .wheel (forma de clase) ──
                        VStack(alignment: .leading, spacing: 8) {
                            Text("3. Minutos: \(minutos)")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Picker(selection: $minutos, label: Text("Minutos")) {
                                Text("10 min").tag(10)                            // ✏️
                                Text("15 min").tag(15)
                                Text("20 min").tag(20)
                                Text("30 min").tag(30)
                                Text("45 min").tag(45)
                                Text("60 min").tag(60)
                                Text("75 min").tag(75)
                                Text("90 min").tag(90)
                            }
                            .pickerStyle(.wheel)
                            .frame(height: 120)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 4. Intensidad con Picker .segmented (3 opciones) ──
                        VStack(alignment: .leading, spacing: 8) {
                            Text("4. Intensidad")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Picker(selection: $intensidad, label: Text("Intensidad")) {
                                Text("Ligera").tag("Ligera")
                                Text("Media").tag("Media")
                                Text("Intensa").tag("Intensa")
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 5. Solo si es de FUERZA: Stepper y Slider ──
                        // Un if dentro del body muestra u oculta controles.
                        if esFuerza {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("5. Series, repeticiones y peso")
                                    .font(.headline)
                                    .foregroundStyle(paleta.texto)
                                // ⚠️ NO VISTO EN CLASE: Stepper = botones − y + para
                                // un número. in: = mínimo...máximo.
                                Stepper("Series: \(series)", value: $series, in: 1...10)
                                    .foregroundStyle(paleta.texto)
                                Stepper("Repeticiones: \(repeticiones)", value: $repeticiones, in: 1...30)
                                    .foregroundStyle(paleta.texto)

                                // Slider con la forma EXACTA de la Clase 4.
                                Text("Peso levantado: \(Int(pesoLevantado)) kg")
                                    .foregroundStyle(paleta.texto)
                                Slider(value: $pesoLevantado, in: 0 ... 200,
                                       onEditingChanged: { editing in
                                           // editing = true mientras el dedo arrastra.
                                           ajustandoPeso = editing
                                       })
                                .tint(paleta.primario)
                                if ajustandoPeso {
                                    Text("Ajustando…")
                                        .font(.caption)
                                        .foregroundStyle(paleta.secundario)
                                }
                            }
                            .padding()
                            .background(paleta.superficie)
                            .cornerRadius(16)
                        }

                        // ── 6. Toggle ──────────────────────────────
                        Toggle("¿Fue tu récord personal? 🏆", isOn: $esRecord)
                            .foregroundStyle(paleta.texto)
                            .tint(paleta.primario)
                            .padding()
                            .background(paleta.superficie)
                            .cornerRadius(16)

                        // ── 7. Fecha con DatePicker ⚠️ ─────────────
                        // ⚠️ NO VISTO EN CLASE: DatePicker deja elegir fecha y hora.
                        // in: ...Date() = solo hasta HOY (no se puede entrenar en el futuro).
                        DatePicker("Fecha", selection: $fecha, in: ...Date(),
                                   displayedComponents: [.date, .hourAndMinute])
                            .foregroundStyle(paleta.texto)
                            .tint(paleta.primario)
                            .environment(\.locale, Locale(identifier: "es_MX"))   // ⚠️ en español
                            .padding()
                            .background(paleta.superficie)
                            .cornerRadius(16)

                        // ── 8. Calorías calculadas por el PROTOCOLO ──
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Calorías estimadas")
                                .font(.caption)
                                .foregroundStyle(paleta.textoSuave)
                            Text("\(caloriasCalculadas, specifier: "%.0f") kcal")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(paleta.primario)
                            Text("Con tu peso de \(Int(pesoPersona)) kg (cámbialo en la pestaña Ejercicios).")
                                .font(.caption)
                                .foregroundStyle(paleta.textoSuave)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 9. Guardar ─────────────────────────────
                        Button {
                            guardar()
                        } label: {
                            Text("Guardar entrenamiento")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(paleta.textoSobrePrimario)
                                .background(paleta.primario)
                                .cornerRadius(14)
                        }
                        .alert(alertMessage, isPresented: $showAlert) {
                            Button("OK") {}
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Registrar")
        }
    }
}

#Preview {
    GymRegistrarView(entrenamientos: .constant(cargarEntrenamientosEjemploGym()))
        .preferredColorScheme(.dark)
}
