// ═══════════════════════════════════════════════════════════════
//  AppStorageView.swift  ·  11 Extras (persistencia)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de ajustes que se GUARDAN aunque cierres la
//              app: nombre, color de fondo, sonido y volumen.
//              Usa @AppStorage (es un @State que se guarda solo
//              en UserDefaults).
//  ÚSALO PARA: preferencias, "recordar el nombre del usuario",
//              tema / color, volumen, modo oscuro, contador.
//  BUSCA:      AppStorage, persistencia, guardar, recordar, ajustes,
//              settings, preferencias, UserDefaults, persistence
//
//  QUÉ GUARDAR DÓNDE (pregunta típica):
//   @State        → dato temporal de la pantalla. Se pierde al cerrar.
//   @AppStorage /
//   UserDefaults  → preferencias simples (Bool, String, Int, Double).
//                   Sobrevive al cerrar la app. NO para contraseñas.
//   Keychain      → contraseñas y tokens (cifrado).
//   SwiftData     → muchos datos con estructura (tipo base de datos).
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/AppStorageView.swift.
//   2. Pega el archivo completo (o solo las líneas @AppStorage).
//   3. Cambia lo marcado con ✏️
//   Ojo: dos pantallas con la MISMA llave ("ajustesNombre")
//   comparten el mismo valor. Así se pasa un dato entre pantallas.
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AppStorageView: View {

    // ── @AppStorage("llave") var nombre = valorPorDefecto ──────
    // 1. Busca la llave en UserDefaults.
    // 2. Si existe, usa lo guardado. Si no, usa el valor de aquí.
    // 3. Cada cambio se guarda solo.
    @AppStorage("ajustesNombre") private var nombreGuardado = ""          // ✏️ llave y valor inicial
    @AppStorage("ajustesColorFondo") private var colorGuardado = "Verde"
    @AppStorage("ajustesSonido") private var sonidoActivo = true
    @AppStorage("ajustesVolumen") private var volumen = 0.5
    @AppStorage("ajustesVisitas") private var visitas = 0

    @FocusState private var campoEnFoco: Bool

    var body: some View {
        ZStack {
            // El fondo usa el color guardado
            colorDeFondoAjustes(colorGuardado)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Saludo con el dato guardado ────────────
                    if nombreGuardado.isEmpty {
                        Text("Hola 👋")
                            .font(.largeTitle)
                            .bold()
                    } else {
                        Text("Hola, \(nombreGuardado) 👋")
                            .font(.largeTitle)
                            .bold()
                    }

                    Text("Veces que has abierto esta pantalla: \(visitas)")
                        .foregroundStyle(.secondary)

                    // ── 2. Texto guardado ─────────────────────────
                    Text("Nombre del usuario")
                        .font(.headline)
                    // Se liga DIRECTO al @AppStorage: se guarda mientras escribes
                    TextField("Escribe tu nombre", text: $nombreGuardado)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    // ── 3. Picker guardado ────────────────────────
                    Text("Color de fondo")
                        .font(.headline)
                    Picker(selection: $colorGuardado, label: Text("Color de fondo")) {
                        Text("Verde").tag("Verde")                                 // ✏️ opciones
                        Text("Amarillo").tag("Amarillo")
                        Text("Azul").tag("Azul")
                    }
                    .pickerStyle(.segmented)

                    // ── 4. Toggle guardado ────────────────────────
                    Toggle("Sonido activo", isOn: $sonidoActivo)
                        .font(.headline)
                        .tint(.green)

                    // ── 5. Slider guardado ────────────────────────
                    Text("Volumen: \(Int(volumen * 100))%")
                        .font(.headline)
                    Slider(value: $volumen, in: 0 ... 1)
                        .tint(.green)
                        .disabled(!sonidoActivo)        // sin sonido no se mueve

                    // ── 6. Regresar a los valores iniciales ───────
                    Button {
                        nombreGuardado = ""
                        colorGuardado = "Verde"
                        sonidoActivo = true
                        volumen = 0.5
                        visitas = 0
                    } label: {
                        Text("Restablecer")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)

                    Text("Prueba: cierra la app por completo y vuelve a abrirla. Todo sigue aquí.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
        }
        .onTapGesture {
            campoEnFoco = false
        }
        .onAppear {
            visitas += 1              // también se guarda solo
        }
        .navigationTitle("@AppStorage")
    }

    // Convierte el nombre guardado (String) en un Color
    func colorDeFondoAjustes(_ nombre: String) -> Color {
        switch nombre {
        case "Amarillo":
            return Color.yellow.opacity(0.2)
        case "Azul":
            return Color.blue.opacity(0.2)
        default:
            return Color.green.opacity(0.2)
        }
    }
}

#Preview {
    NavigationStack {
        AppStorageView()
    }
}
