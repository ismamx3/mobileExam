// ═══════════════════════════════════════════════════════════════
//  OpcionalesView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Opcionales (valores que pueden ser nil) y cómo
//              abrirlos sin que truene la app con if let.
//              Incluye el caso típico de examen: convertir lo que
//              escribe el usuario en un TextField a número.
//  ÚSALO PARA: validar que un texto sea número, manejar datos que
//              pueden no existir (nil).
//  BUSCA:      opcional, optional, nil, if let, unwrap, desempacar,
//              force unwrap, !, convertir texto a numero, Int(texto),
//              Double(texto), validar numero, ??, guard let
//
//  CÓMO COPIARLO:
//   1. Para validar un número: copia las 4 variables @State, el
//      bloque 4 del body, la función convertirNumero() y el .alert.
//   2. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: ?? (valor por defecto), guard let,
//              .keyboardType(.decimalPad)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct OpcionalesView: View {

    @State private var textoNumero = ""        // lo que escribe el usuario
    @State private var resultado = ""          // lo que mostramos al convertir
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Declarar opcionales ───────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Declarar un opcional (con ?)")
                            .font(.headline)
                        Text(ejemploDeclarar())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 2. Abrir con if let (la forma recomendada) ─
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Abrir con if let")
                            .font(.headline)
                        Text(ejemploIfLet())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 3. Por qué NO usar ! ─────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. Por qué NO usar !")
                            .font(.headline)
                        Text("Int(\"hola\")! truena la app porque Int(\"hola\") es nil. Con if let, si es nil, simplemente entra al else.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 4. TextField → número (caso de examen) ────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. Convertir lo que escribe el usuario")
                            .font(.headline)

                        TextField("Escribe un número", text: $textoNumero)     // ✏️ placeholder
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)   // ⚠️ NO VISTO EN CLASE: muestra el teclado de números

                        Button {
                            convertirNumero()
                        } label: {
                            Text("Convertir")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.purple)

                        if !resultado.isEmpty {
                            Text(resultado)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.green.opacity(0.15))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }

                    // ── 5. ?? valor por defecto ──────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("5. ?? valor por defecto")
                            .font(.headline)
                        Text(ejemploValorPorDefecto())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 6. guard let ─────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("6. guard let (salir temprano)")
                            .font(.headline)
                        Text(ejemploGuard(texto: "25") + "\n" + ejemploGuard(texto: "abc"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Opcionales")
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }

    // ── 1. Declarar ──────────────────────────────────
    func ejemploDeclarar() -> String {
        let segundoNombre: String? = nil     // no tiene valor
        let edad: Int? = 20                  // sí tiene valor, pero "envuelto"

        // Comparar contra nil es seguro
        return "¿segundoNombre es nil? \(segundoNombre == nil)\n¿edad es nil? \(edad == nil)"
    }

    // ── 2. if let ────────────────────────────────────
    func ejemploIfLet() -> String {
        var respuesta = ""

        if let numero = Int("21") {          // "21" sí se puede convertir
            respuesta = "Int(\"21\") → \(numero). Dentro del if ya NO es opcional: \(numero) + 1 = \(numero + 1)"
        } else {
            respuesta = "No se pudo convertir"
        }

        if let otro = Int("hola") {          // "hola" NO se puede convertir
            respuesta += "\nInt(\"hola\") → \(otro)"
        } else {
            respuesta += "\nInt(\"hola\") → nil, entra al else sin tronar"
        }

        return respuesta
    }

    // ── 4. Convertir el TextField ────────────────────
    func convertirNumero() {
        if textoNumero.isEmpty {
            alertMessage = "Escribe un número primero"                 // ✏️ mensaje
            showAlert.toggle()
        } else if let numero = Double(textoNumero) {
            // Aquí "numero" ya es Double normal, se puede operar
            resultado = "El doble de \(numero) es \(numero * 2)"      // ✏️ tu operación
        } else {
            // Double("3,5") también falla: el decimal va con punto
            alertMessage = "\"\(textoNumero)\" no es un número válido"
            showAlert.toggle()
        }
    }

    // ── 5. ?? ────────────────────────────────────────
    func ejemploValorPorDefecto() -> String {
        // ⚠️ NO VISTO EN CLASE: ?? usa el valor de la derecha si lo de la izquierda es nil
        let edad = Int("abc") ?? 0
        let cantidad = Int("15") ?? 0
        return "Int(\"abc\") ?? 0 → \(edad)\nInt(\"15\") ?? 0 → \(cantidad)"
    }

    // ── 6. guard let ─────────────────────────────────
    func ejemploGuard(texto: String) -> String {
        // ⚠️ NO VISTO EN CLASE: guard sale de la función si el opcional es nil.
        // Hace lo mismo que if let pero deja el "camino feliz" sin anidar.
        guard let numero = Int(texto) else {
            return "\"\(texto)\" no es número"
        }
        return "\"\(texto)\" es el número \(numero)"
    }
}

#Preview {
    NavigationStack {
        OpcionalesView()
    }
}
