// ═══════════════════════════════════════════════════════════════
//  FormularioValidacionView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Formulario completo tipo examen: nombre, edad, correo,
//              carrera (Picker con opción vacía), horas (Slider) y
//              "acepto términos" (Toggle). El botón valida EN ORDEN y
//              muestra una alerta con un mensaje ESPECÍFICO por error.
//              Si todo está bien, muestra un resumen de varias líneas.
//  ÚSALO PARA: registro, perfil, captura de datos, cualquier pantalla
//              donde la rúbrica pida "validación con alertas".
//  BUSCA:      formulario, form, registro, validar, validacion, validation,
//              campos vacios, isEmpty, numero, Int(, rango, correo, email, @,
//              terminos, alerta de error, resumen, limpiar, else if
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/FormularioValidacionView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (campos, carreras, rangos, textos).
//   Para quitar un campo: borra su @State, su bloque en el body y su
//   "else if" en validarFormulario().
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: .keyboardType, .textInputAutocapitalization,
//                        .contains("@"), role: .destructive, bloque message:
//                        del .alert (lo usaste en actSwift).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FormularioValidacionView: View {

    // ── Datos del formulario ──
    @State private var nombre: String = ""
    @State private var edadTexto: String = ""        // se captura como texto y luego se convierte
    @State private var correo: String = ""
    @State private var carrera: String = ""          // "" = no ha elegido
    @State private var horasEstudio = 2.0
    @State private var aceptaTerminos: Bool = false

    // ── Alerta ──
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    // ── Resultado ──
    @State private var registroCompleto = false

    @FocusState private var campoEnFoco: Bool

    let carreras = ["ITC", "IMT", "IBT", "LAD", "ARQ"]   // ✏️ opciones
    let edadMinima = 15                                  // ✏️
    let edadMaxima = 99                                  // ✏️

    // Revisa los campos en orden. En cuanto encuentra un error, prepara su
    // mensaje y ya no revisa los demás (por eso es una cadena de else if).
    func validarFormulario() {
        campoEnFoco = false

        // Convierte la edad a número. Si no se puede, se queda en 0.
        var edad = 0
        if let edadConvertida = Int(edadTexto) {
            edad = edadConvertida
        }

        if nombre.isEmpty {
            alertTitle = "Falta tu nombre"
            alertMessage = "Escribe tu nombre completo."
        } else if edadTexto.isEmpty {
            alertTitle = "Falta tu edad"
            alertMessage = "Escribe tu edad."
        } else if Int(edadTexto) == nil {
            alertTitle = "Edad no válida"
            alertMessage = "La edad debe ser un número entero, sin letras ni puntos."
        } else if edad < edadMinima || edad > edadMaxima {
            alertTitle = "Edad fuera de rango"
            alertMessage = "La edad debe estar entre \(edadMinima) y \(edadMaxima) años."
        } else if correo.isEmpty {
            alertTitle = "Falta tu correo"
            alertMessage = "Escribe tu correo electrónico."
        } else if !correo.contains("@") || !correo.contains(".") {
            // ⚠️ NO VISTO EN CLASE: .contains("@") revisa si el texto incluye ese carácter.
            alertTitle = "Correo no válido"
            alertMessage = "El correo debe tener @ y un punto, por ejemplo: ana@tec.mx"
        } else if carrera.isEmpty {
            alertTitle = "Falta tu carrera"
            alertMessage = "Selecciona una carrera de la lista."
        } else if !aceptaTerminos {
            alertTitle = "Términos sin aceptar"
            alertMessage = "Debes aceptar los términos y condiciones para continuar."
        } else {
            // Todo bien: resumen de varias líneas
            alertTitle = "¡Registro exitoso!"
            alertMessage = """
            Nombre: \(nombre)
            Edad: \(edad) años
            Correo: \(correo)
            Carrera: \(carrera)
            Horas de estudio: \(Int(horasEstudio))
            """
            registroCompleto = true
        }

        showAlert.toggle()
    }

    func limpiarFormulario() {
        nombre = ""
        edadTexto = ""
        correo = ""
        carrera = ""
        horasEstudio = 2.0
        aceptaTerminos = false
        registroCompleto = false
    }

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. Encabezado ───────────────────────────
                    VStack(spacing: 6) {
                        Image(systemName: "person.crop.circle.badge.plus")
                            .font(.system(size: 60))
                            .foregroundStyle(.purple)
                        Text("Registro de alumno")           // ✏️ título
                            .font(.title)
                            .bold()
                        Text("Todos los campos son obligatorios")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 8)

                    // ── 2. Nombre (texto) ───────────────────────
                    Text("Nombre")
                        .font(.headline)
                    TextField("Ej. Ana López", text: $nombre)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    // ── 3. Edad (número) ────────────────────────
                    Text("Edad")
                        .font(.headline)
                    // ⚠️ NO VISTO EN CLASE: .keyboardType(.numberPad) muestra solo números.
                    TextField("Ej. 20", text: $edadTexto)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .focused($campoEnFoco)

                    // ── 4. Correo ───────────────────────────────
                    Text("Correo")
                        .font(.headline)
                    TextField("Ej. ana@tec.mx", text: $correo)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)   // ⚠️ NO VISTO EN CLASE: no pone mayúscula al inicio
                        .focused($campoEnFoco)

                    // ── 5. Carrera (Picker con opción vacía) ────
                    HStack {
                        Text("Carrera")
                            .font(.headline)
                        Spacer()
                        Picker(selection: $carrera, label: Text("Carrera")) {
                            Text("Selecciona…").tag("")
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

                    // ── 6. Horas de estudio (Slider) ────────────
                    Text("Horas de estudio al día: \(Int(horasEstudio))")
                        .font(.headline)
                    Slider(value: $horasEstudio, in: 0 ... 12, step: 1)
                        .tint(.purple)

                    // ── 7. Acepto términos (Toggle) ─────────────
                    Toggle("Acepto términos y condiciones", isOn: $aceptaTerminos)
                        .tint(.purple)

                    // ── 8. Botón que valida ─────────────────────
                    Button {
                        validarFormulario()
                    } label: {
                        Text("Registrar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .controlSize(.large)
                    .padding(.top, 8)
                    .alert(alertTitle, isPresented: $showAlert) {
                        Button("OK") {}
                    } message: {
                        Text(alertMessage)
                    }

                    Button("Limpiar formulario", role: .destructive) {   // ⚠️ NO VISTO EN CLASE: role: .destructive
                        limpiarFormulario()
                    }
                    .frame(maxWidth: .infinity)

                    // ── 9. Tarjeta de resultado (solo si pasó) ──
                    if registroCompleto {
                        VStack(alignment: .leading, spacing: 6) {
                            Label("Registrado", systemImage: "checkmark.seal.fill")
                                .font(.headline)
                                .foregroundStyle(.green)
                            Text("\(nombre), \(edadTexto) años")
                            Text(correo)
                            Text("\(carrera) · \(Int(horasEstudio)) h de estudio")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .onTapGesture {
                campoEnFoco = false
            }
        }
        .navigationTitle("Formulario")
    }
}

#Preview {
    NavigationStack {
        FormularioValidacionView()
    }
}
