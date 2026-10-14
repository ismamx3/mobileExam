// ═══════════════════════════════════════════════════════════════
//  LoginView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Login completo tipo examen: usuario + contraseña,
//              valida que no estén vacíos y que coincidan con unos
//              datos fijos. Si todo está bien navega a BienvenidaView
//              y le manda el nombre del usuario.
//  ÚSALO PARA: pantalla de inicio de sesión, "acceso", "entrar".
//  BUSCA:      login, iniciar sesion, usuario, contraseña, contrasena, password,
//              securefield, validar, credenciales, entrar, navigationDestination,
//              ocultar teclado, focusstate
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/LoginView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (sobre todo usuario y contraseña correctos)
//  NECESITA:   06_MultiplesPantallas/BienvenidaView.swift
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
    @State private var entrar = false       // true = ya pasó la validación

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
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK") {}
            }
            // Navega cuando entrar = true. Le manda el usuario a la otra pantalla.
            .navigationDestination(isPresented: $entrar) {
                BienvenidaView(usuario: usuario)              // ✏️ tu pantalla de inicio
            }
        }
    }

    // Revisa en orden y avisa EXACTAMENTE qué está mal.
    func validar() {
        campoEnFoco = false

        if usuario.isEmpty {
            alertMessage = "Escribe tu usuario"
            showAlert.toggle()
        } else if contrasena.isEmpty {
            alertMessage = "Escribe tu contraseña"
            showAlert.toggle()
        } else if usuario != usuarioCorrecto || contrasena != contrasenaCorrecta {
            alertMessage = "Usuario o contraseña incorrectos"
            showAlert.toggle()
        } else {
            contrasena = ""     // al cerrar sesión el campo ya sale vacío
            entrar = true
        }
    }
}

#Preview {
    LoginView()
}
