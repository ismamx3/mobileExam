// ═══════════════════════════════════════════════════════════════
//  TextFieldsView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Campos de texto: básico, con ancho, con estilo propio,
//              contraseña, teclado numérico, esconder teclado,
//              texto en vivo y contador de caracteres con límite.
//  ÚSALO PARA: pedir nombre, edad, precio, contraseña, comentarios.
//  BUSCA:      textfield, campo de texto, input, roundedBorder, securefield,
//              contrasena, password, teclado, keyboard, numberPad, decimalPad,
//              focusstate, esconder teclado, ocultar teclado, contador, limite
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TextFieldsView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: SecureField, .keyboardType(...)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TextFieldsView: View {

    @State private var nombre: String = ""
    @State private var apellido: String = ""
    @State private var ciudad: String = ""
    @State private var contrasena: String = ""
    @State private var edadTexto: String = ""
    @State private var precioTexto: String = ""
    @State private var comentario: String = ""

    // Para esconder el teclado (3 pasos de clase):
    // 1) esta variable  2) .focused($campoEnFoco) en cada campo  3) campoEnFoco = false
    @FocusState private var campoEnFoco: Bool

    let limiteCaracteres = 40        // ✏️ máximo de letras del bloque 7

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. TextField básico ─────────────────────
                    Text("1. TextField básico")
                        .font(.headline)

                    TextField("Nombre", text: $nombre)          // ✏️ texto gris y variable
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    // ── 2. TextField con ancho fijo ─────────────
                    Text("2. Con ancho fijo")
                        .font(.headline)

                    TextField("Apellido", text: $apellido)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)                       // ✏️ ancho
                        .focused($campoEnFoco)

                    // ── 3. TextField con estilo propio ──────────
                    Text("3. Con estilo propio")
                        .font(.headline)

                    TextField("Ciudad", text: $ciudad)
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)   // mismo radio que .cornerRadius
                                .stroke(.purple.opacity(0.5), lineWidth: 1)
                        )
                        .focused($campoEnFoco)

                    // ── 4. Contraseña (SecureField) ─────────────
                    Text("4. Contraseña")
                        .font(.headline)

                    // ⚠️ NO VISTO EN CLASE: SecureField es igual a TextField pero oculta lo que escribes con puntitos.
                    SecureField("Contraseña", text: $contrasena)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Tiene \(contrasena.count) caracteres")
                        .font(.caption)
                        .foregroundStyle(.gray)

                    // ── 5. Teclado numérico + convertir a número ─
                    Text("5. Teclado numérico")
                        .font(.headline)

                    // ⚠️ NO VISTO EN CLASE: .keyboardType cambia el teclado que aparece (solo números).
                    TextField("Edad", text: $edadTexto)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .focused($campoEnFoco)

                    // Lo escrito siempre es String. Para usarlo como número se convierte con if let.
                    if let edad = Int(edadTexto) {
                        Text("El próximo año tendrás \(edad + 1) años")
                    } else if !edadTexto.isEmpty {
                        Text("Eso no es un número entero")
                            .foregroundStyle(.red)
                    }

                    // ⚠️ NO VISTO EN CLASE: .decimalPad = teclado con punto decimal.
                    TextField("Precio sin IVA", text: $precioTexto)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .focused($campoEnFoco)

                    if let precio = Double(precioTexto) {
                        Text(precio * 1.16, format: .currency(code: "MXN"))
                    }

                    // ── 6. Mostrar en vivo lo que se escribe ────
                    Text("6. Texto en vivo")
                        .font(.headline)

                    if nombre.isEmpty {
                        Text("Escribe tu nombre en el bloque 1…")
                            .foregroundStyle(.gray)
                    } else {
                        Text("Hola, \(nombre) \(apellido) 👋")
                            .font(.title3)
                            .bold()
                    }

                    // ── 7. Contador de caracteres con límite ────
                    Text("7. Contador de caracteres")
                        .font(.headline)

                    TextField("Comentario", text: $comentario)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)
                        .onChange(of: comentario) { oldValue, newValue in
                            // Si se pasa del límite, regresa al texto anterior
                            if newValue.count > limiteCaracteres {
                                comentario = oldValue
                            }
                        }

                    HStack {
                        Spacer()
                        Text("\(comentario.count)/\(limiteCaracteres)")
                            .font(.caption)
                            .foregroundStyle(comentario.count == limiteCaracteres ? .red : .gray)
                    }

                    // ── 8. Botón para esconder el teclado ───────
                    Text("8. Esconder el teclado")
                        .font(.headline)

                    Button("Esconder teclado") {
                        campoEnFoco = false
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)

                    Text("También se esconde al tocar cualquier parte vacía de la pantalla.")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                .padding()
            }
            // Tocar cualquier parte de la pantalla esconde el teclado
            .onTapGesture {
                campoEnFoco = false
            }
        }
        .navigationTitle("TextField")
    }
}

#Preview {
    NavigationStack {
        TextFieldsView()
    }
}
