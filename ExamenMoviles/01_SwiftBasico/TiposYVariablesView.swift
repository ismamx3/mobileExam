// ═══════════════════════════════════════════════════════════════
//  TiposYVariablesView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     var y let, tipos de datos, strings, operaciones,
//              conversiones entre tipos, el operador ternario y print.
//              Bloques 1–3 y 8 siguen la Clase 2 (Conceptos Básicos
//              de Swift) con los mismos ejemplos de las láminas.
//  ÚSALO PARA: repasar la sintaxis base o copiar una conversión
//              (por ejemplo, de texto a número).
//  BUSCA:      var, let, constante, variable, Int, Double, Float, Bool,
//              String, Character, interpolacion, concatenar, operadores,
//              division, modulo, residuo, %, convertir, conversion, cast,
//              ternario, ? :, and, or, &&, ||, tipos de datos, print,
//              consola, Playground, tipo explicito, sin valor inicial,
//              infiere el tipo, diagonal invertida, option + ', emoji
//
//  CÓMO COPIARLO:
//   1. Copia solo la FUNCIÓN del bloque que necesites (están abajo
//      del body). Cada función es independiente.
//   2. Pégala dentro de tu View y llámala desde un Text(...).
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TiposYVariablesView: View {

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. var y let ─────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. var (cambia) y let (no cambia)")
                            .font(.headline)
                        Text(ejemploVarLet())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 2. Tipos de datos ────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Tipos de datos")
                            .font(.headline)
                        Text(ejemploTipos())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 3. Strings: interpolación y concatenación ─
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. Strings")
                            .font(.headline)
                        Text(ejemploStrings())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 4. Operaciones matemáticas ───────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. Operaciones (+ - * / %)")
                            .font(.headline)
                        Text(ejemploOperaciones())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 5. Conversiones entre tipos ──────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("5. Convertir entre tipos")
                            .font(.headline)
                        Text(ejemploConversiones())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 6. Comparaciones y operadores lógicos ────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("6. Comparar y operadores lógicos")
                            .font(.headline)
                        Text(ejemploLogicos())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 7. Operador ternario ─────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("7. Ternario: condición ? siVerdad : siFalso")
                            .font(.headline)
                        Text(ejemploTernario(calificacion: 85, esFavorito: true))   // ✏️
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 8. print en la consola ───────────────────
                    // Lámina "Playground": usa print para mostrar valores en la consola.
                    // Playground = File → New → Playground (⌥⇧⌘N), sirve para probar código Swift.
                    // En una app, print también sale en la consola de Xcode (abajo): útil para revisar valores.
                    VStack(alignment: .leading, spacing: 8) {
                        Text("8. print (mira la consola de Xcode)")
                            .font(.headline)
                        Button("Imprimir en consola") {
                            var greeting = "Hello, playground"
                            print(greeting)
                            greeting = "Bye"
                            print(greeting)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.purple)
                        .controlSize(.large)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Tipos y variables")
    }

    // ── 1. var y let ─────────────────────────────────
    // Mismos ejemplos de las láminas "Variables" y "Constantes" (Clase 2).
    func ejemploVarLet() -> String {
        // var = VARIABLE. Swift infiere el tipo de dato.
        var cantidad = 38              // infiere el tipo Int
        cantidad = 20                  // cambia el valor de la variable

        var numeroPaginas: Int         // declara la variable de tipo Int SIN valor inicial
        numeroPaginas = 238            // (antes de usarla hay que darle un valor)
        numeroPaginas = numeroPaginas + 2

        var paginasLeidas: Int = 238   // declara la variable de tipo Int CON valor inicial
        paginasLeidas = 100

        var titulo = "Mensaje inicial" // infiere el tipo String
        titulo = "Nuevo mensaje"

        // let = CONSTANTE. Solo se le puede asignar valor UNA vez.
        let precio: Double = 60.45     // se define explícitamente el tipo
        // precio = 70                 // ERROR: es constante

        // El valor de una constante no se tiene que conocer al compilar,
        // pero solamente se le puede asignar valor una vez:
        let hora: Int
        hora = Int.random(in: 1...12)  // se decide al correr la app
        // hora = 5                    // ERROR: ya tenía valor

        return """
        cantidad = \(cantidad)
        numeroPaginas = \(numeroPaginas)
        paginasLeidas = \(paginasLeidas)
        titulo = \(titulo)
        precio = \(precio)
        hora = \(hora)
        """
    }

    // ── 2. Tipos de datos ────────────────────────────
    // Int = enteros · Double, Float = punto decimal · Bool = booleanos
    // String = cadena de caracteres (texto) · Character = 1 caracter solamente
    func ejemploTipos() -> String {
        let entero: Int = 25               // ✏️ números sin decimales
        let decimal: Double = 3.1416       // ✏️ números con decimales
        let decimalCorto: Float = 2.5      // también decimal, menos precisión
        let activo: Bool = true            // true o false
        let nombre: String = "Ana"         // texto
        let inicial: Character = "A"       // un solo carácter

        return """
        Int: \(entero)
        Double: \(decimal)
        Float: \(decimalCorto)
        Bool: \(activo)
        String: \(nombre)
        Character: \(inicial)
        """
    }

    // ── 3. Strings ───────────────────────────────────
    func ejemploStrings() -> String {
        // Un String es texto entre comillas. Acepta emojis.
        let conEmojis = "Este es otro 😎😬🤓🤪 string"

        // Interpolación: usa \( ) para incluir el valor de una variable.
        // La diagonal invertida \ se escribe con option + ' en el Mac.
        let paginas = 78
        let mensaje = "El libro tiene \(paginas) páginas"

        // Concatenación: usa + o += para unir textos.
        // (En la lámina signo es var; aquí es let porque nunca cambia y Xcode lo marca.)
        var saludo = "Hola"
        let signo = "!!!"
        saludo += " Daniel" + signo

        // Saber si está vacío y cuántas letras tiene
        let vacio = ""
        let estaVacio = vacio.isEmpty           // true
        let letras = saludo.count               // número de caracteres

        return "\(conEmojis)\n\(mensaje)\n\(saludo)\n¿vacío? \(estaVacio)\nletras de saludo: \(letras)"
    }

    // ── 4. Operaciones ───────────────────────────────
    func ejemploOperaciones() -> String {
        let a = 7
        let b = 2

        let suma = a + b                 // 9
        let resta = a - b                // 5
        let multiplicacion = a * b       // 14
        let divisionEntera = a / b       // 3  (Int / Int corta los decimales)
        let residuo = a % b              // 1  (lo que sobra de la división)

        // Para tener decimales, convierte a Double ANTES de dividir
        let divisionDecimal = Double(a) / Double(b)   // 3.5

        var contador = 10
        contador += 5                    // contador = contador + 5
        contador -= 3                    // contador = contador - 3

        return """
        7 + 2 = \(suma)
        7 - 2 = \(resta)
        7 * 2 = \(multiplicacion)
        7 / 2 = \(divisionEntera)   (entera)
        7 % 2 = \(residuo)   (residuo)
        7.0 / 2.0 = \(divisionDecimal)
        contador = \(contador)
        """
    }

    // ── 5. Conversiones ──────────────────────────────
    func ejemploConversiones() -> String {
        let numero = 42
        let texto = String(numero)              // Int → String: "42"
        let comoDecimal = Double(numero)        // Int → Double: 42.0
        let truncado = Int(9.99)                // Double → Int: 9 (corta, no redondea)

        // String → Int regresa un OPCIONAL (puede fallar si no es número).
        // Por eso se abre con if let (ver OpcionalesView.swift).
        var resultado = ""
        if let convertido = Int("123") {        // ✏️ el texto a convertir
            resultado = "Int(\"123\") = \(convertido)"
        } else {
            resultado = "No era un número"
        }

        return "String(42) = \"\(texto)\"\nDouble(42) = \(comoDecimal)\nInt(9.99) = \(truncado)\n\(resultado)"
    }

    // ── 6. Comparaciones y lógicos ───────────────────
    func ejemploLogicos() -> String {
        let edad = 20
        let tieneINE = true

        let esMayor = edad >= 18                 // >= <= > < == !=
        let esIgual = edad == 20
        let esDistinto = edad != 30

        let puedeVotar = esMayor && tieneINE     // && = Y (las dos)
        let algunaVerdad = esMayor || false      // || = O (al menos una)
        let negacion = !tieneINE                 // !  = lo contrario

        return """
        edad >= 18 → \(esMayor)
        edad == 20 → \(esIgual)
        edad != 30 → \(esDistinto)
        esMayor && tieneINE → \(puedeVotar)
        esMayor || false → \(algunaVerdad)
        !tieneINE → \(negacion)
        """
    }

    // ── 7. Ternario ──────────────────────────────────
    // Recibe los datos como parámetros: así el ternario sí tiene que decidir.
    func ejemploTernario(calificacion: Int, esFavorito: Bool) -> String {
        let estado = calificacion >= 70 ? "Aprobado" : "Reprobado"
        let icono = esFavorito ? "heart.fill" : "heart"           // muy usado en vistas

        return "Calificación \(calificacion): \(estado)\nÍcono: \(icono)"
    }
}

#Preview {
    NavigationStack {
        TiposYVariablesView()
    }
}
