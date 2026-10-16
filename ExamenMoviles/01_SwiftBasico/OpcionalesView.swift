// ═══════════════════════════════════════════════════════════════
//  OpcionalesView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Opcionales (valores que pueden ser nil) y cómo
//              abrirlos: con ! (unwrapping) y con if let (optional
//              binding, el recomendado por Swift). Mismos ejemplos de
//              la Clase 2. Incluye el caso de la lámina: un campo de
//              texto donde el usuario debe teclear un número.
//  ÚSALO PARA: validar que un texto sea número, manejar datos que
//              pueden no existir (nil).
//  BUSCA:      opcional, optional, nil, if let, unwrap, desempacar,
//              force unwrap, !, convertir texto a numero, Int(texto),
//              Double(texto), validar numero, ??, guard let, unwrapping,
//              optional binding, numero != nil, cantidadPesos,
//              tipoDeCambio, campo vacio, nil no es cero
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

                    // ── 2. Sacar el valor con ! (unwrapping) ─────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Sacar el valor con ! (unwrapping)")
                            .font(.headline)
                        Text(ejemploUnwrapping())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("Si haces unwrap de una variable opcional que tiene nulo, el programa truena. Por eso con ! se tiene que incluir la comparación != nil, o mejor usar if let.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 3. if let (optional binding, el recomendado) ─
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. if let (optional binding)")
                            .font(.headline)
                        Text(ejemploIfLet())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
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
    // Un opcional puede contener un valor del tipo especificado, o bien,
    // nulo (nil). nil NO es 0 ni "" (texto vacío): es "no hay valor".
    // Usa ? para declararlo (ejemplos de la lámina):
    func ejemploDeclarar() -> String {
        var segundoNombre: String?           // empieza en nil
        var edad: Int?
        var estatura: Float?

        edad = 20                            // ahora sí tiene valor, pero "envuelto"
        estatura = 1.75
        segundoNombre = nil                  // puede seguir (o volver a) nil

        // Comparar contra nil es seguro
        return """
        ¿segundoNombre es nil? \(segundoNombre == nil)
        ¿edad es nil? \(edad == nil)
        ¿estatura es nil? \(estatura == nil)
        """
    }

    // ── 2. Unwrapping con ! ──────────────────────────
    // Lámina: "Usa ! para SACAR un valor de una variable opcional…
    // un valor nulo no se puede convertir (SACAR)". Se le llama unwrapping.
    func ejemploUnwrapping() -> String {
        let datoTxt: String? = "42"          // ✏️ en la lámina: DatoTxt (texto de un campo)
        let numero = Int(datoTxt!)           // Int(...) también regresa un opcional

        var respuesta = "numero es nil"
        if numero != nil {                   // se tiene que incluir la comparación
            respuesta = "El valor numérico es \(numero!)."
        }
        return respuesta
    }

    // ── 3. if let ────────────────────────────────────
    // Optional binding: "verifica si un valor no es nulo". Recomendado por Swift.
    // Dentro del if se escribe solamente el nombre de la constante (sin !).
    func ejemploIfLet() -> String {
        var respuesta = ""

        // Ejemplo de la lámina: pesos → dólares
        let cantidadPesosTxt: String? = "1800"   // ✏️
        let tipoDeCambio = 18
        if let cantidadPesos = Int(cantidadPesosTxt!) {
            let cantidadDolares = cantidadPesos / tipoDeCambio
            respuesta = "\(cantidadPesos) pesos = \(cantidadDolares) dólares"
        } else {
            // si la variable opcional es nula se va aquí
            respuesta = "No se pudo convertir"
        }

        // En la lámina el texto lleva ! porque en UIKit el texto de un campo es
        // opcional. En SwiftUI el @State del TextField es un String normal, así
        // que va SIN !: if let numero = Int(textoNumero) (ver bloque 4).
        if let numero = Int("21") {          // "21" sí se puede convertir
            respuesta += "\nInt(\"21\") → \(numero). Dentro del if ya NO es opcional: \(numero) + 1 = \(numero + 1)"
        } else {
            respuesta += "\nNo se pudo convertir"
        }

        if let otro = Int("hola") {          // "hola" NO se puede convertir
            respuesta += "\nInt(\"hola\") → \(otro)"
        } else {
            respuesta += "\nInt(\"hola\") → nil, entra al else sin tronar"
        }

        return respuesta
    }

    // ── 4. Convertir el TextField ────────────────────
    // Caso de la lámina: "Hay un campo de texto donde el usuario debe teclear
    // un valor numérico… ¿qué pasa si se deja vacío el campo?" → Double("")
    // es nil. Por eso primero se revisa vacío y luego se usa if let.
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
