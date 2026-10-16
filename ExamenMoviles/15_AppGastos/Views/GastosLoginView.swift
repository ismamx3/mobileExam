// ═══════════════════════════════════════════════════════════════
//  GastosLoginView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de inicio de sesión: usuario + contraseña,
//              valida con una alerta que dice EXACTAMENTE qué está mal y,
//              si todo está bien, entra a la app y le pasa el nombre.
//  ÚSALO PARA: cualquier login con credenciales fijas.
//  BUSCA:      login, iniciar sesion, usuario, contraseña, password,
//              SecureField, validar, credenciales, alerta, Binding,
//              entrar, sign in
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/LoginView.swift (SwiftUI View).
//   2. Pega el archivo y cambia usuario/contraseña correctos (✏️).
//   3. En tu vista raíz:
//        @State private var sesionIniciada = false
//        if sesionIniciada { TuTabView } else { GastosLoginView(sesionIniciada: $sesionIniciada, nombreUsuario: $nombre) }
//  NECESITA:   Utils/PaletaGastos.swift
//
//  RELACIÓN CON LA CLASE 6C (botón con validación):
//   Es la MISMA lógica: un Button (no NavigationLink) que valida, y si
//   algo falla prende la alerta con showAlert.toggle(); la .alert va
//   pegada AL BOTÓN. La diferencia: en la 6C, si todo está bien se pone
//   isValid = true y .navigationDestination(isPresented:) EMPUJA otra
//   pantalla. Aquí, si todo está bien se pone sesionIniciada = true y la
//   vista RAÍZ cambia el login por el TabView (ver GastosAppView: así no
//   se anidan dos NavigationStack). El patrón 6C EXACTO, con
//   navigationDestination, está en Views/GastosCalculadoraView.swift.
//
//  DE CLASE: alerta en 3 pasos con .toggle() (Clase 3), @Binding ida y
//     vuelta (Clase 6B), @FocusState + .onTapGesture en el Stack principal
//     para esconder el teclado (Clase 4).
//  ⚠️ NO VISTO EN CLASE: SecureField (campo que oculta lo que escribes),
//     .textInputAutocapitalization(.never) y .autocorrectionDisabled()
//     (que no ponga mayúscula ni corrija el usuario).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosLoginView: View {

    // Permiso para cambiar datos de la vista raíz (6B ida y vuelta).
    @Binding var sesionIniciada: Bool
    @Binding var nombreUsuario: String

    @State private var usuario = ""
    @State private var contrasena = ""

    @State private var showAlert = false
    @State private var mensajeAlerta = ""

    @FocusState private var tecladoActivo: Bool

    let usuarioCorrecto = "alumno"          // ✏️
    let contrasenaCorrecta = "1234"         // ✏️

    let paleta = PaletaGastos()

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 22) {

                    // ── 1. Encabezado ────────────────────────────
                    Image(systemName: "banknote.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(paleta.textoSobrePrimario)
                        .frame(width: 110, height: 110)
                        .background(paleta.primario)
                        .clipShape(.circle)
                        .padding(.top, 50)

                    Text("Mis Gastos")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(paleta.texto)
                    Text("Inicia sesión para ver tus gastos")
                        .foregroundStyle(paleta.textoSuave)

                    // ── 2. Campos ────────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Usuario")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        TextField("Escribe tu usuario", text: $usuario)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)   // ⚠️
                            .autocorrectionDisabled()              // ⚠️
                            .focused($tecladoActivo)

                        Text("Contraseña")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                            .padding(.top, 8)
                        // ⚠️ NO VISTO EN CLASE: SecureField = TextField que muestra puntitos.
                        SecureField("Escribe tu contraseña", text: $contrasena)
                            .textFieldStyle(.roundedBorder)
                            .focused($tecladoActivo)
                    }

                    // ── 3. Botón que valida (misma lógica que la 6C) ──
                    Button {
                        iniciarSesion()
                    } label: {
                        Text("Entrar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .background(paleta.primario)
                            .cornerRadius(14)
                    }
                    .alert(mensajeAlerta, isPresented: $showAlert) {
                        Button("OK") {}
                    }

                    Text("Prueba con usuario \(usuarioCorrecto) y contraseña \(contrasenaCorrecta)")
                        .font(.footnote)
                        .foregroundStyle(paleta.textoSuave)
                }
                .padding(24)
            }
        }
        // Clase 4: tocar cualquier parte del Stack principal esconde el teclado.
        .onTapGesture {
            tecladoActivo = false
        }
    }

    // Valida en orden: en cuanto encuentra un error, prepara SU mensaje,
    // prende la alerta y ya no sigue (por eso es una cadena de else if).
    func iniciarSesion() {
        tecladoActivo = false

        if usuario.isEmpty {
            mensajeAlerta = "Escribe tu usuario."
            showAlert.toggle()
        } else if contrasena.isEmpty {
            mensajeAlerta = "Escribe tu contraseña."
            showAlert.toggle()
        } else if contrasena.count < 4 {
            mensajeAlerta = "La contraseña debe tener al menos 4 caracteres."
            showAlert.toggle()
        } else if usuario != usuarioCorrecto || contrasena != contrasenaCorrecta {
            mensajeAlerta = "Usuario o contraseña incorrectos."
            showAlert.toggle()
        } else {
            // Todo bien: le paso el nombre a la raíz y entro a la app.
            nombreUsuario = usuario.capitalized       // ⚠️ .capitalized: "alumno" → "Alumno"
            sesionIniciada = true                     // la raíz cambia al TabView
        }
    }
}

#Preview {
    // Un @Binding necesita un valor de prueba en el preview (Clase 6B).
    GastosLoginView(sesionIniciada: .constant(false), nombreUsuario: .constant(""))
}
