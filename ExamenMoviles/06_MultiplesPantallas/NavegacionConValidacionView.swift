// ═══════════════════════════════════════════════════════════════
//  NavegacionConValidacionView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Navegar SOLO si los datos son válidos. En vez de
//              NavigationLink se usa un Button + .navigationDestination.
//              Si falta un dato sale una alerta con un mensaje
//              específico y NO navega.
//  ÚSALO PARA: formularios, registro, "no avanzar si está vacío".
//  BUSCA:      validar, validacion, navigationDestination, isPresented,
//              navegar con boton, alerta, campo vacio, isEmpty, no avanzar
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/NavegacionConValidacionView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   06_MultiplesPantallas/PantallaDestinoView.swift
//              (o cambia PantallaDestinoView(...) por tu pantalla).
//
//  LOS 3 PASOS DE LA CLASE:
//   1. Una variable booleana que dice si la validación pasó (isValid).
//   2. Un Button en lugar del NavigationLink (DENTRO de un NavigationStack).
//   3. .navigationDestination(isPresented:) que navega cuando isValid = true.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct NavegacionConValidacionView: View {

    @State private var nombre = ""              // ✏️ tus campos
    @State private var correo = ""              // ✏️

    @State private var isValid = false          // paso 1
    @State private var showAlert = false
    @State private var alertMessage = ""        // mensaje según el dato que falta

    var body: some View {
        NavigationStack {
            ZStack {
                Color.orange.opacity(0.1)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {

                    Text("Nombre")
                        .font(.headline)
                    TextField("Escribe tu nombre", text: $nombre)
                        .textFieldStyle(.roundedBorder)

                    Text("Correo")
                        .font(.headline)
                    TextField("ejemplo@correo.com", text: $correo)
                        .textFieldStyle(.roundedBorder)

                    Spacer()

                    // Paso 2: Button en vez de NavigationLink
                    Button {
                        validar()
                    } label: {
                        Text("Continuar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .alert(alertMessage, isPresented: $showAlert) {
                        Button("OK") {}
                    }
                    // Paso 3: navega cuando isValid se vuelve true.
                    // Al regresar, SwiftUI lo pone otra vez en false solito.
                    .navigationDestination(isPresented: $isValid) {
                        PantallaDestinoView(titulo: "Hola, \(nombre)", color: .orange, icono: "checkmark.seal.fill")  // ✏️
                    }
                }
                .padding(30)
            }
            .navigationTitle("Validación")
        }
    }

    // Revisa cada campo en orden y avisa EXACTAMENTE qué falta.
    func validar() {
        if nombre.isEmpty {
            alertMessage = "Escribe tu nombre"                  // ✏️
            isValid = false
            showAlert.toggle()
        } else if correo.isEmpty {
            alertMessage = "Escribe tu correo"
            isValid = false
            showAlert.toggle()
        } else if !correo.contains("@") {
            alertMessage = "El correo debe llevar @"
            isValid = false
            showAlert.toggle()
        } else {
            isValid = true
        }
    }
}

#Preview {
    NavegacionConValidacionView()
}
