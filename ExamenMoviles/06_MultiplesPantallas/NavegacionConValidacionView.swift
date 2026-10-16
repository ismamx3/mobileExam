// ═══════════════════════════════════════════════════════════════
//  NavegacionConValidacionView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Navegar SOLO si los datos son válidos (clase 6C:
//              "Cambio de NavigationLink por Botón"). En vez de
//              NavigationLink se usa un Button + .navigationDestination.
//              Si falta un dato sale una alerta y NO navega.
//              Bloque 1 = código IDÉNTICO a la lámina.
//              Bloque 2 = varios campos con mensaje específico por error.
//  ÚSALO PARA: formularios, registro, "no avanzar si está vacío".
//  BUSCA:      validar, validacion, navigationDestination, isPresented,
//              isValid, navegar con boton, cambio de navigationlink por boton,
//              alerta, campo vacio, isEmpty, no avanzar, username
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/NavegacionConValidacionView.swift
//      (o pega solo el bloque 1 o el 2 con sus @State).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   06_MultiplesPantallas/PantallaDestinoView.swift
//              (o cambia PantallaDestinoView(...) por tu pantalla;
//              en la clase era DetalleView()).
//  ⚠️ NO VISTO EN CLASE: .contains("@") (solo en el bloque 2)
//
//  LOS 3 PASOS DE LA CLASE (6C):
//   1. Generar una variable para decidir si la validación pasa o no:
//          @State private var isValid = false
//   2. Poner un Button en lugar de un NavigationLink (pero SÍ debe estar
//      dentro de un NavigationStack). Dentro de la lógica del botón,
//      hacer las validaciones y modificar la variable booleana (isValid).
//   3. Poner un modificador AL BOTÓN para que, si la variable es true
//      (válida), se vaya a otra pantalla:
//          .navigationDestination(isPresented: $isValid) { DetalleView() }
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct NavegacionConValidacionView: View {

    // ── Variables del bloque 1 (mismos nombres que la lámina) ──
    @State private var username = ""                 // ✏️
    @State private var isValid = false               // paso 1
    @State private var showAlert = false

    // ── Variables del bloque 2 ──
    @State private var nombre = ""                   // ✏️ tus campos
    @State private var correo = ""                   // ✏️
    @State private var formularioValido = false      // mismo papel que isValid
    @State private var showAlertFormulario = false
    @State private var alertMessage = ""             // mensaje según el dato que falta

    var body: some View {
        NavigationStack {
            ZStack {
                Color.orange.opacity(0.1)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        // ── 1. Forma EXACTA de la clase (lámina 6C) ─────────
                        Text("1. Igual que la lámina")
                            .font(.headline)

                        TextField("username", text: $username)
                            .textFieldStyle(.roundedBorder)

                        // Paso 2: Button en lugar de NavigationLink
                        Button("Ir a detalle") {
                            if username.isEmpty {
                                isValid = false
                                showAlert.toggle()
                            } else {
                                isValid = true
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .alert("Introduce un username", isPresented: $showAlert) {
                            Button("OK") {}
                        }
                        // Paso 3: modificador AL BOTÓN que navega cuando isValid es true.
                        // Al regresar, SwiftUI lo pone otra vez en false solito.
                        .navigationDestination(isPresented: $isValid) {
                            PantallaDestinoView(titulo: "Hola, \(username)", color: .orange, icono: "checkmark.seal.fill")  // ✏️ en clase: DetalleView()
                        }

                        Divider()

                        // ── 2. Varios campos con mensaje específico ─────────
                        // Mismo patrón; solo cambia que la validación revisa
                        // cada campo en orden y dice EXACTAMENTE qué falta.
                        Text("2. Varios campos")
                            .font(.headline)

                        Text("Nombre")
                            .font(.subheadline)
                        TextField("Escribe tu nombre", text: $nombre)
                            .textFieldStyle(.roundedBorder)

                        Text("Correo")
                            .font(.subheadline)
                        TextField("ejemplo@correo.com", text: $correo)
                            .textFieldStyle(.roundedBorder)

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
                        .alert(alertMessage, isPresented: $showAlertFormulario) {
                            Button("OK") {}
                        }
                        .navigationDestination(isPresented: $formularioValido) {
                            PantallaDestinoView(titulo: "Hola, \(nombre)", color: .orange, icono: "checkmark.seal.fill")  // ✏️
                        }
                    }
                    .padding(30)
                }
            }
            .navigationTitle("Validación")
        }
    }

    // Revisa cada campo en orden y avisa EXACTAMENTE qué falta.
    func validar() {
        if nombre.isEmpty {
            alertMessage = "Escribe tu nombre"                  // ✏️
            formularioValido = false
            showAlertFormulario.toggle()
        } else if correo.isEmpty {
            alertMessage = "Escribe tu correo"
            formularioValido = false
            showAlertFormulario.toggle()
        } else if !correo.contains("@") {
            // ⚠️ NO VISTO EN CLASE: .contains("@") revisa si el texto incluye ese carácter.
            alertMessage = "El correo debe llevar @"
            formularioValido = false
            showAlertFormulario.toggle()
        } else {
            formularioValido = true
        }
    }
}

#Preview {
    NavegacionConValidacionView()
}
