// ═══════════════════════════════════════════════════════════════
//  FuncionesYCondicionesView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Funciones (con y sin parámetros, con y sin return),
//              if / else if / else, switch con rangos y con textos,
//              y propiedades calculadas que regresan una imagen o un
//              color según un valor.
//  ÚSALO PARA: clasificar algo (calificación, edad, nivel), cambiar
//              la imagen o el color según un Slider o un Picker.
//  BUSCA:      func, funcion, function, parametros, return, if, else,
//              else if, switch, case, default, rango, condicion,
//              propiedad calculada, computed property, var { },
//              imagen segun valor, color segun valor, nivel, clasificar
//
//  CÓMO COPIARLO:
//   1. Imagen/color según un valor: copia @State energia, las dos
//      propiedades calculadas (iconoBateria, colorNivel) y el bloque 4.
//   2. Funciones sueltas: copia la que quieras (están abajo del body).
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FuncionesYCondicionesView: View {

    @State private var energia = 50.0            // valor del Slider (Double)
    @State private var colorElegido = "Morado"   // valor del Picker (String)
    @State private var edadTexto = "20"
    @State private var resultadoSuma = 0

    // ── Propiedad calculada: regresa un nombre de imagen según energia ──
    // Se recalcula sola cada vez que cambia energia (como gokuImage).
    var iconoBateria: String {
        if energia > 89 {
            return "battery.100percent"          // ✏️ aquí puede ir el nombre de tu asset
        } else if energia >= 60 {
            return "battery.75percent"
        } else if energia >= 30 {
            return "battery.50percent"
        } else if energia > 0 {
            return "battery.25percent"
        } else {
            return "battery.0percent"
        }
    }

    // ── Propiedad calculada: regresa un Color según energia ──
    var colorNivel: Color {
        switch energia {
        case 0..<30:
            return .red
        case 30..<60:
            return .orange
        default:
            return .green
        }
    }

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Funciones ─────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Funciones")
                            .font(.headline)
                        Text("""
                        saludar() → \(saludar())
                        saludarA(nombre: "Ana") → \(saludarA(nombre: "Ana"))
                        sumar(a: 3, b: 4) → \(sumar(a: 3, b: 4))
                        areaRectangulo(base: 5, altura: 2.5) → \(areaRectangulo(base: 5, altura: 2.5))
                        """)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                        // Función sin return que cambia un @State (como CalcularValor de clase)
                        HStack {
                            Button("Sumar 10 + 5", action: calcularSuma)
                                .buttonStyle(.borderedProminent)
                                .tint(.purple)
                            Text("Resultado: \(resultadoSuma)")
                        }
                    }

                    // ── 2. if / else if / else ───────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. if / else if / else")
                            .font(.headline)
                        Text("""
                        letraCalificacion(95) → \(letraCalificacion(calificacion: 95))
                        letraCalificacion(82) → \(letraCalificacion(calificacion: 82))
                        letraCalificacion(50) → \(letraCalificacion(calificacion: 50))
                        """)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 3. switch con rangos ─────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. switch con rangos")
                            .font(.headline)
                        TextField("Edad", text: $edadTexto)
                            .textFieldStyle(.roundedBorder)
                        if let edad = Int(edadTexto) {
                            Text("Edad \(edad): \(clasificarEdad(edad: edad))")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.purple.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            Text("Escribe una edad válida")
                                .foregroundStyle(.red)
                        }
                    }

                    // ── 4. Imagen y color según un valor ─────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. Imagen y color según el Slider")
                            .font(.headline)

                        Text("Energía: \(Int(energia))")
                        Slider(value: $energia, in: 0...100, step: 1)
                            .tint(colorNivel)

                        Image(systemName: iconoBateria)        // con un asset: Image(iconoBateria)
                            .font(.system(size: 80))
                            .foregroundStyle(colorNivel)
                            .frame(maxWidth: .infinity)
                    }

                    // ── 5. switch con textos (Picker) ────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("5. switch con textos")
                            .font(.headline)

                        Picker(selection: $colorElegido, label: Text("Color")) {
                            Text("Morado").tag("Morado")       // ✏️ opciones
                            Text("Verde").tag("Verde")
                            Text("Naranja").tag("Naranja")
                        }
                        .pickerStyle(.segmented)

                        RoundedRectangle(cornerRadius: 12)
                            .fill(colorDesdeNombre(nombre: colorElegido))
                            .frame(height: 60)
                            .overlay(
                                Text(colorElegido)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            )
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Funciones y condiciones")
    }

    // ── 1. Funciones ─────────────────────────────────

    // Sin parámetros, con return
    func saludar() -> String {
        return "¡Hola!"
    }

    // Con un parámetro
    func saludarA(nombre: String) -> String {
        return "¡Hola, \(nombre)!"
    }

    // Con dos parámetros, regresa Int
    func sumar(a: Int, b: Int) -> Int {
        return a + b
    }

    // Con parámetros Double
    func areaRectangulo(base: Double, altura: Double) -> Double {
        return base * altura
    }

    // Sin return: cambia una variable @State (se usa en Button(action:))
    func calcularSuma() {
        resultadoSuma = sumar(a: 10, b: 5)
    }

    // ── 2. if / else if / else ───────────────────────
    func letraCalificacion(calificacion: Int) -> String {
        if calificacion >= 90 {               // ✏️ tus límites
            return "A"
        } else if calificacion >= 80 {
            return "B"
        } else if calificacion >= 70 {
            return "C"
        } else {
            return "Reprobado"
        }
    }

    // ── 3. switch con rangos ─────────────────────────
    func clasificarEdad(edad: Int) -> String {
        switch edad {
        case 0...12:                          // 0 a 12, incluye el 12
            return "Niño"
        case 13...17:
            return "Adolescente"
        case 18...64:
            return "Adulto"
        default:                              // el switch debe cubrir TODOS los casos
            return "Adulto mayor"
        }
    }

    // ── 5. switch con textos (como colorDeFondo de DefaultsApp) ──
    func colorDesdeNombre(nombre: String) -> Color {
        switch nombre {
        case "Verde":
            return .green
        case "Naranja":
            return .orange
        default:
            return .purple
        }
    }
}

#Preview {
    NavigationStack {
        FuncionesYCondicionesView()
    }
}
