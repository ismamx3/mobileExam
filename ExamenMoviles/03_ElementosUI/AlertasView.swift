// ═══════════════════════════════════════════════════════════════
//  AlertasView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Alertas (.alert): básica en 3 pasos, con mensaje que
//              cambia, con texto de varias líneas, con botón cancelar
//              y borrar, dos alertas en el mismo botón, alerta con
//              campo de texto y menú de opciones (confirmationDialog).
//  ÚSALO PARA: avisar errores de validación, confirmar antes de borrar,
//              mostrar un resumen, pedir un dato rápido.
//  BUSCA:      alert, alerta, mensaje, aviso, popup, ventana emergente,
//              showAlert, toggle, message, cancel, destructive, confirmar,
//              borrar, confirmationDialog, action sheet, hoja de opciones
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/AlertasView.swift (o pega solo el bloque que quieras).
//   2. Cada alerta necesita: (1) su @State Bool, (2) el .alert, (3) el toggle() en un botón.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: role: .cancel / .destructive, TextField dentro de un
//                        .alert, .confirmationDialog. (El bloque message: va
//                        un poco más allá de la clase, pero lo usaste en actSwift.)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AlertasView: View {

    // Bloque 1
    @State private var showAlert = false

    // Bloque 2
    @State private var showAlertDinamica = false
    @State private var alertMessage = ""

    // Bloque 3
    @State private var showPerfil = false
    let nombre = "Ana López"                  // ✏️
    let carrera = "ITC"                       // ✏️
    let semestre = 5                          // ✏️

    // Bloque 4
    @State private var showBorrar = false
    @State private var puntos = 120

    // Bloque 5
    @State private var codigo = ""
    @State private var showError = false
    @State private var showExito = false

    // Bloque 6
    @State private var showCampo = false
    @State private var nombreNuevo = ""
    @State private var apodo = "Sin apodo"

    // Bloque 7
    @State private var showDialogo = false
    @State private var colorDialogo = Color.purple

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // ── 1. Alerta básica (3 pasos de clase) ─────
                    Text("1. Alerta básica")
                        .font(.headline)

                    Button("Mostrar alerta") {
                        showAlert.toggle()                         // paso 3: prenderla
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .alert("Este es un mensaje de alerta", isPresented: $showAlert) {   // paso 2 ✏️ título
                        Button("OK") {}
                    }

                    // ── 2. Mensaje que cambia según el caso ─────
                    Text("2. Mensaje dinámico")
                        .font(.headline)

                    HStack {
                        Button("Error de nombre") {
                            alertMessage = "Escribe tu nombre"        // ✏️
                            showAlertDinamica.toggle()
                        }
                        .buttonStyle(.bordered)

                        Button("Error de edad") {
                            alertMessage = "La edad debe ser un número"   // ✏️
                            showAlertDinamica.toggle()
                        }
                        .buttonStyle(.bordered)
                    }
                    .tint(.purple)
                    .alert(alertMessage, isPresented: $showAlertDinamica) {
                        Button("OK") {}
                    }

                    // ── 3. Título + mensaje de varias líneas ────
                    Text("3. Con mensaje de varias líneas")
                        .font(.headline)

                    Button("Ver mi perfil") {
                        showPerfil.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .alert("Tu Perfil", isPresented: $showPerfil) {
                        Button("Cerrar") {}
                    } message: {
                        // """ permite escribir texto de varias líneas
                        Text("""
                        Nombre: \(nombre)
                        Carrera: \(carrera)
                        Semestre: \(semestre)
                        """)
                    }

                    // ── 4. Cancelar / Borrar (confirmar acción) ──
                    Text("4. Confirmar antes de borrar")
                        .font(.headline)

                    Text("Puntos: \(puntos)")
                        .font(.title3)

                    Button("Borrar puntos") {
                        showBorrar.toggle()
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                    .alert("¿Seguro que quieres borrar?", isPresented: $showBorrar) {
                        // ⚠️ NO VISTO EN CLASE: role: .cancel (estilo de cancelar) y .destructive (rojo).
                        Button("Cancelar", role: .cancel) {}
                        Button("Borrar", role: .destructive) {
                            puntos = 0                                 // ✏️ lo que se borra
                        }
                    } message: {
                        Text("Esta acción no se puede deshacer.")
                    }

                    Button("Devolver puntos") {
                        puntos = 120
                    }
                    .font(.caption)

                    // ── 5. Dos alertas en el mismo botón ────────
                    Text("5. Dos alertas: error o éxito")
                        .font(.headline)

                    TextField("Escribe el código (es 1234)", text: $codigo)
                        .textFieldStyle(.roundedBorder)

                    // Cada alerta escucha su propia variable Bool
                    Button("Validar código") {
                        if codigo == "1234" {                      // ✏️ condición
                            showExito.toggle()
                        } else {
                            showError.toggle()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .alert("Código incorrecto", isPresented: $showError) {
                        Button("Reintentar") {
                            codigo = ""
                        }
                    }
                    .alert("¡Código correcto!", isPresented: $showExito) {
                        Button("OK") {}
                    }

                    // ── 6. Alerta que pide un dato (TextField) ───
                    Text("6. Alerta con campo de texto")
                        .font(.headline)

                    Text("Apodo: \(apodo)")

                    Button("Cambiar apodo") {
                        nombreNuevo = ""
                        showCampo.toggle()
                    }
                    .buttonStyle(.bordered)
                    .tint(.purple)
                    // ⚠️ NO VISTO EN CLASE: un TextField dentro del .alert para pedir un dato rápido.
                    .alert("Nuevo apodo", isPresented: $showCampo) {
                        TextField("Apodo", text: $nombreNuevo)
                        Button("Guardar") {
                            if !nombreNuevo.isEmpty {
                                apodo = nombreNuevo
                            }
                        }
                        Button("Cancelar", role: .cancel) {}
                    }

                    // ── 7. Menú de opciones (confirmationDialog) ─
                    Text("7. Menú de opciones desde abajo")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 12)
                        .fill(colorDialogo)
                        .frame(height: 50)

                    Button("Elegir color") {
                        showDialogo.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    // ⚠️ NO VISTO EN CLASE: confirmationDialog muestra opciones desde abajo de la pantalla.
                    .confirmationDialog("Elige un color", isPresented: $showDialogo, titleVisibility: .visible) {
                        Button("Rojo") { colorDialogo = Color.red }          // ✏️ opciones
                        Button("Verde") { colorDialogo = Color.green }
                        Button("Azul") { colorDialogo = Color.blue }
                        Button("Cancelar", role: .cancel) {}
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Alertas")
    }
}

#Preview {
    NavigationStack {
        AlertasView()
    }
}
