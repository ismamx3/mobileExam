// ═══════════════════════════════════════════════════════════════
//  AgregarJugadorView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Formulario (en sheet) que VALIDA y AGREGA un elemento a la lista.
//  ÚSALO PARA: "registrar un nuevo ___" con campos obligatorios y alertas.
//  BUSCA:      formulario, form, agregar, append, validar, validacion, alerta, sheet, nuevo id, Int(texto)
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/AgregarJugadorView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift (solo para el #Preview)
//              Quien la abre:  .sheet(isPresented: $mostrar) { AgregarJugadorView(jugadores: $jugadores) }
//  ⚠️ NO VISTO EN CLASE: .keyboardType(.numberPad)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AgregarJugadorView: View {

    // Binding a TODA la lista: así este formulario puede hacer append.
    @Binding var jugadores: [Jugador]                         // ✏️ tu modelo

    @Environment(\.dismiss) private var dismiss

    // Lo que escribe el usuario. Todo empieza vacío.
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var numeroTexto = ""          // TextField siempre da String
    @State private var posicion = ""             // "" = no ha elegido
    @State private var esFavorito = false

    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool

    // El id NO se repite: se busca el mayor y se le suma 1.
    // (Con jugadores.count + 1 se repetiría después de borrar alguno).
    func siguienteId() -> Int {
        var mayor = 0
        for jugador in jugadores {
            if jugador.id > mayor {
                mayor = jugador.id
            }
        }
        return mayor + 1
    }

    func guardar() {
        // ── Validación: un mensaje específico por cada dato que falta ──
        if nombre.isEmpty {
            alertMessage = "Escribe el nombre."               // ✏️
            showAlert.toggle()
        } else if apellido.isEmpty {
            alertMessage = "Escribe el apellido."
            showAlert.toggle()
        } else if posicion.isEmpty {
            alertMessage = "Elige una posición."
            showAlert.toggle()
        } else if let numero = Int(numeroTexto) {
            // if let: solo entra si el texto SÍ era un número.
            if numero < 0 || numero > 99 {
                alertMessage = "El número debe estar entre 0 y 99."
                showAlert.toggle()
            } else {
                let nuevo = Jugador(id: siguienteId(), nombre: nombre, apellido: apellido,
                                    numero: numero, estatura: 2.00, posicion: posicion,
                                    imagen: "foto1", esFavorito: esFavorito)    // ✏️
                jugadores.append(nuevo)
                dismiss()
            }
        } else {
            alertMessage = "El número debe ser un entero (ej. 23)."
            showAlert.toggle()
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {

                Text("Nuevo jugador")                          // ✏️
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 8)

                // ── 1. Campos de texto ───────────────────────────────
                Text("Nombre")
                    .font(.headline)
                TextField("Ej. Michael", text: $nombre)
                    .textFieldStyle(.roundedBorder)
                    .focused($campoEnFoco)

                Text("Apellido")
                    .font(.headline)
                TextField("Ej. Jordan", text: $apellido)
                    .textFieldStyle(.roundedBorder)
                    .focused($campoEnFoco)

                Text("Número")
                    .font(.headline)
                TextField("Ej. 23", text: $numeroTexto)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)    // ⚠️ NO VISTO EN CLASE: teclado solo de números
                    .focused($campoEnFoco)

                // ── 2. Picker con opción "sin elegir" ────────────────
                Text("Posición")
                    .font(.headline)
                Picker(selection: $posicion, label: Text("Posición")) {
                    Text("Elige…").tag("")
                    Text("Base").tag("Base")                   // ✏️ tus opciones
                    Text("Alero").tag("Alero")
                    Text("Pívot").tag("Pívot")
                }
                .pickerStyle(.segmented)

                Toggle("Favorito", isOn: $esFavorito)
                    .tint(.purple)

                // ── 3. Botones ───────────────────────────────────────
                Button {
                    guardar()
                } label: {
                    Text("Guardar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .padding(.top, 8)

                Button {
                    dismiss()
                } label: {
                    Text("Cancelar")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.bordered)
                .tint(.gray)
            }
            .padding()
        }
        // Tocar fuera de los campos esconde el teclado.
        .onTapGesture {
            campoEnFoco = false
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }
}

#Preview {
    AgregarJugadorView(jugadores: .constant(cargarJugadores()))
}
