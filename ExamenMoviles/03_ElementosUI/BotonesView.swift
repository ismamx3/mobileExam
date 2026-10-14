// ═══════════════════════════════════════════════════════════════
//  BotonesView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Botones en todas sus formas y estilos.
//  ÚSALO PARA: cualquier acción (guardar, calcular, borrar, navegar).
//  BUSCA:      boton, botón, button, borderedProminent, bordered, borderless,
//              tint, controlSize, ancho completo, full width, icono, label,
//              fondo, disabled, deshabilitar, destructive, borrar, accion
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/BotonesView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: .buttonStyle(.borderless), .disabled(...), role: .destructive
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct BotonesView: View {

    @State private var contador = 0
    @State private var mensaje = "Toca algún botón"
    @State private var nombre = ""

    // Función que usan los bloques 2 y 3
    func saludar() {
        mensaje = "¡Hola desde una función!"     // ✏️ lo que hace el botón
    }

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // Resultado de los botones
                    VStack(spacing: 6) {
                        Text(mensaje)
                            .font(.title3)
                            .bold()
                        Text("Contador: \(contador)")
                            .font(.title2)
                            .foregroundStyle(.purple)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)

                    // ── 1. Forma 1: texto + código directo ──────
                    Text("1. Texto + código directo")
                        .font(.headline)

                    Button("Sumar 1") {                  // ✏️ texto
                        contador += 1                    // ✏️ acción
                    }

                    // ── 2. Forma 2: llama una función ───────────
                    Text("2. Llama una función")
                        .font(.headline)

                    Button("Saludar", action: saludar)   // sin () : se pasa la función, no se ejecuta aquí

                    // ── 3. Forma 3: action + label con ícono ────
                    Text("3. Con ícono (Label)")
                        .font(.headline)

                    Button(action: saludar) {
                        Label("Saludar", systemImage: "hand.wave.fill")   // ✏️ texto e ícono SF Symbol
                    }

                    // ── 4. Estilos ──────────────────────────────
                    Text("4. Estilos")
                        .font(.headline)

                    HStack(spacing: 12) {
                        Button("Prominent") { contador += 1 }
                            .buttonStyle(.borderedProminent)

                        Button("Bordered") { contador += 1 }
                            .buttonStyle(.bordered)

                        // ⚠️ NO VISTO EN CLASE: .borderless = solo texto, sin fondo.
                        Button("Borderless") { contador += 1 }
                            .buttonStyle(.borderless)
                    }

                    // ── 5. Color (.tint) y tamaño (.controlSize) ─
                    Text("5. Color y tamaño")
                        .font(.headline)

                    Button("Botón grande y naranja") {
                        contador += 1
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)                       // ✏️ color
                    .controlSize(.large)                 // más alto = más fácil de tocar

                    // ── 6. Botón de ancho completo ──────────────
                    Text("6. Ancho completo")
                        .font(.headline)

                    Button {
                        contador += 1
                    } label: {
                        // El .frame va DENTRO del label; si va afuera, el fondo no se estira
                        Text("Guardar")                  // ✏️ texto
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)

                    // ── 7. Botón con fondo personalizado ────────
                    Text("7. Fondo personalizado")
                        .font(.headline)

                    Button {
                        mensaje = "Botón personalizado"
                    } label: {
                        Label("Me gusta", systemImage: "star.fill")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.indigo)    // ✏️ color de fondo
                            .cornerRadius(12)
                    }

                    // ── 8. Botón que es solo un ícono ───────────
                    Text("8. Solo ícono")
                        .font(.headline)

                    HStack(spacing: 20) {
                        Button {
                            contador -= 1
                        } label: {
                            Image(systemName: "minus.circle.fill")
                                .font(.system(size: 44))
                        }

                        Button {
                            contador += 1
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 44))
                        }
                    }
                    .tint(.purple)

                    // ── 9. Botón deshabilitado según condición ──
                    Text("9. Deshabilitado si falta un dato")
                        .font(.headline)

                    TextField("Escribe tu nombre", text: $nombre)
                        .textFieldStyle(.roundedBorder)

                    Button("Continuar") {
                        mensaje = "Bienvenido, \(nombre)"
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    // ⚠️ NO VISTO EN CLASE: .disabled(true) apaga el botón (se ve gris y no responde).
                    .disabled(nombre.isEmpty)

                    // ── 10. Botón destructivo (rojo) ────────────
                    Text("10. Destructivo")
                        .font(.headline)

                    // ⚠️ NO VISTO EN CLASE: role: .destructive pinta el botón de rojo (acción peligrosa).
                    Button("Reiniciar contador", role: .destructive) {
                        contador = 0
                        mensaje = "Contador reiniciado"
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }
                .padding()
            }
        }
        .navigationTitle("Botones")
    }
}

#Preview {
    NavigationStack {
        BotonesView()
    }
}
