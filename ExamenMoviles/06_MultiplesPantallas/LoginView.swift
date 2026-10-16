// ═══════════════════════════════════════════════════════════════
//  LoginView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Login completo tipo examen: usuario + contraseña,
//              valida que no estén vacíos y que coincidan con unos
//              datos fijos. Si todo está bien navega a BienvenidaView
//              y le manda el nombre del usuario.
//  ÚSALO PARA: pantalla de inicio de sesión, "acceso", "entrar".
//  BUSCA:      login, iniciar sesion, usuario, contraseña, contrasena, password,
//              securefield, validar, credenciales, entrar, navigationDestination, isValid,
//              ocultar teclado, focusstate
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/LoginView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (sobre todo usuario y contraseña correctos)
//  NECESITA:   06_MultiplesPantallas/BienvenidaView.swift
//  PATRÓN DE LA CLASE 6C: isValid + Button (no NavigationLink) +
//  .alert y .navigationDestination(isPresented: $isValid) puestos AL BOTÓN.
//  ⚠️ NO VISTO EN CLASE: SecureField, .textInputAutocapitalization,
//                       .autocorrectionDisabled
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct LoginView: View {

    // Datos correctos (fijos, sin base de datos)
    let usuarioCorrecto = "admin"          // ✏️
    let contrasenaCorrecta = "1234"        // ✏️

    @State private var usuario = ""
    @State private var contrasena = ""

    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isValid = false      // paso 1 de la clase 6C: true = ya pasó la validación

    // Para esconder el teclado
    @FocusState private var campoEnFoco: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo.opacity(0.12)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {

                        // ── 1. Encabezado ───────────────────────────────
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 90))
                            .foregroundStyle(.indigo)
                            .padding(.top, 30)

                        Text("Iniciar sesión")                  // ✏️
                            .font(.largeTitle)
                            .bold()

                        // ── 2. Campo de usuario ─────────────────────────
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Usuario")
                                .font(.headline)
                            TextField("Escribe tu usuario", text: $usuario)
                                .textFieldStyle(.roundedBorder)
                                // ⚠️ NO VISTO EN CLASE: evita que la primera letra salga en mayúscula
                                .textInputAutocapitalization(.never)
                                // ⚠️ NO VISTO EN CLASE: evita que el autocorrector cambie el usuario
                                .autocorrectionDisabled()
                                .focused($campoEnFoco)
                        }

                        // ── 3. Campo de contraseña ──────────────────────
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Contraseña")
                                .font(.headline)
                            // ⚠️ NO VISTO EN CLASE: SecureField es un TextField que muestra puntitos
                            SecureField("Escribe tu contraseña", text: $contrasena)
                                .textFieldStyle(.roundedBorder)
                                .focused($campoEnFoco)
                        }

                        // ── 4. Botón que valida ─────────────────────────
                        // Paso 2 de la clase 6C: Button en lugar de NavigationLink.
                        Button {
                            validar()
                        } label: {
                            Text("Entrar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.indigo)
                        .padding(.top, 10)
                        .alert(alertMessage, isPresented: $showAlert) {
                            Button("OK") {}
                        }
                        // Paso 3: modificador AL BOTÓN. Navega cuando isValid = true
                        // y le manda el usuario a la otra pantalla.
                        .navigationDestination(isPresented: $isValid) {
                            BienvenidaView(usuario: usuario)      // ✏️ tu pantalla de inicio
                        }

                        Text("Prueba con usuario admin y contraseña 1234")  // ✏️ bórralo en tu app
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    .padding(30)
                }
            }
            // Tocar cualquier parte esconde el teclado
            .onTapGesture {
                campoEnFoco = false
            }
        }
    }

    // Revisa en orden y avisa EXACTAMENTE qué está mal.
    func validar() {
        campoEnFoco = false

        if usuario.isEmpty {
            alertMessage = "Escribe tu usuario"
            isValid = false
            showAlert.toggle()
        } else if contrasena.isEmpty {
            alertMessage = "Escribe tu contraseña"
            isValid = false
            showAlert.toggle()
        } else if usuario != usuarioCorrecto || contrasena != contrasenaCorrecta {
            alertMessage = "Usuario o contraseña incorrectos"
            isValid = false
            showAlert.toggle()
        } else {
            contrasena = ""     // al cerrar sesión el campo ya sale vacío
            isValid = true
        }
    }
}

#Preview {
    LoginView()
}
