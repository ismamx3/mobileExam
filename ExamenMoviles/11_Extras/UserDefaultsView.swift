// ═══════════════════════════════════════════════════════════════
//  UserDefaultsView.swift  ·  11 Extras (persistencia)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Guardar, leer y borrar datos A MANO con
//              UserDefaults.standard (sin @AppStorage).
//              Botones: Guardar / Leer / Borrar.
//  ÚSALO PARA: guardar algo solo cuando el usuario presiona un botón,
//              o leer/guardar desde una función (no desde la vista).
//  BUSCA:      UserDefaults, standard, set forKey, string forKey,
//              bool forKey, integer forKey, removeObject, guardar, leer,
//              borrar, persistencia, clave valor, key value
//
//  ⚠️ IMPORTANTE: UserDefaults se guarda en TEXTO CLARO.
//     NUNCA guardes contraseñas ni tokens aquí → eso va en Keychain.
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/UserDefaultsView.swift.
//   2. Pega el archivo completo, o solo las 3 líneas que necesitas:
//        UserDefaults.standard.set(valor, forKey: "llave")     // guardar
//        UserDefaults.standard.string(forKey: "llave")         // leer (opcional)
//        UserDefaults.standard.removeObject(forKey: "llave")   // borrar
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: .keyboardType(.numberPad)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct UserDefaultsView: View {

    // Lo que el usuario escribe (temporal, @State)
    @State private var nombre: String = ""
    @State private var edadTexto: String = ""
    @State private var notificaciones: Bool = false

    // Lo que se leyó de UserDefaults, para mostrarlo
    @State private var resultado: String = "Todavía no has leído nada."

    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool

    var body: some View {
        ZStack {
            Color.blue.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. Datos a guardar ────────────────────────
                    Text("Nombre (String)")
                        .font(.headline)
                    TextField("Ej. Ana", text: $nombre)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Edad (Int)")
                        .font(.headline)
                    TextField("Ej. 20", text: $edadTexto)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)    // ⚠️ NO VISTO EN CLASE: teclado solo de números
                        .focused($campoEnFoco)

                    Toggle("Notificaciones (Bool)", isOn: $notificaciones)
                        .font(.headline)
                        .tint(.blue)

                    // ── 2. Botones Guardar / Leer / Borrar ────────
                    HStack(spacing: 10) {
                        Button {
                            guardarDatos()
                        } label: {
                            Label("Guardar", systemImage: "square.and.arrow.down")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)

                        Button {
                            leerDatos()
                        } label: {
                            Label("Leer", systemImage: "eye")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)

                        Button {
                            borrarDatos()
                        } label: {
                            Label("Borrar", systemImage: "trash")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .tint(.red)
                    }
                    .controlSize(.large)

                    // ── 3. Lo que se leyó ─────────────────────────
                    Text("Guardado en UserDefaults:")
                        .font(.headline)
                        .padding(.top, 10)
                    Text(resultado)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(12)        // forma de la Clase 17

                    Text("⚠️ No guardes contraseñas aquí: se guarda en texto claro. Para eso es Keychain.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
        }
        // En el Stack PRINCIPAL (el ZStack), como pide la Clase 4.
        .onTapGesture {
            campoEnFoco = false
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
        .navigationTitle("UserDefaults")
    }

    // ── GUARDAR: .set(valor, forKey: "llave") ─────────────────────
    func guardarDatos() {
        if nombre.isEmpty {
            alertMessage = "Escribe un nombre"
            showAlert.toggle()
        } else if let edad = Int(edadTexto) {
            UserDefaults.standard.set(nombre, forKey: "udNombre")                 // ✏️ llaves
            UserDefaults.standard.set(edad, forKey: "udEdad")
            UserDefaults.standard.set(notificaciones, forKey: "udNotificaciones")
            alertMessage = "Datos guardados"
            showAlert.toggle()
        } else {
            alertMessage = "La edad debe ser un número"
            showAlert.toggle()
        }
    }

    // ── LEER: string / integer / bool (forKey:) ───────────────────
    func leerDatos() {
        // string(forKey:) regresa un OPCIONAL (puede no existir) → if let
        if let nombreLeido = UserDefaults.standard.string(forKey: "udNombre") {
            // integer y bool regresan 0 / false si la llave no existe
            let edadLeida = UserDefaults.standard.integer(forKey: "udEdad")
            let notifLeidas = UserDefaults.standard.bool(forKey: "udNotificaciones")
            resultado = """
            Nombre: \(nombreLeido)
            Edad: \(edadLeida)
            Notificaciones: \(notifLeidas ? "Sí" : "No")
            """
        } else {
            resultado = "No hay nada guardado."
        }
    }

    // ── BORRAR: removeObject(forKey:) ─────────────────────────────
    func borrarDatos() {
        UserDefaults.standard.removeObject(forKey: "udNombre")
        UserDefaults.standard.removeObject(forKey: "udEdad")
        UserDefaults.standard.removeObject(forKey: "udNotificaciones")
        resultado = "Datos borrados."
    }
}

#Preview {
    NavigationStack {
        UserDefaultsView()
    }
}
