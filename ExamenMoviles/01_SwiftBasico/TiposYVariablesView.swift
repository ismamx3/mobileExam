// ═══════════════════════════════════════════════════════════════
//  TiposYVariablesView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     var y let, tipos de datos, strings, operaciones,
//              conversiones entre tipos y el operador ternario.
//  ÚSALO PARA: repasar la sintaxis base o copiar una conversión
//              (por ejemplo, de texto a número).
//  BUSCA:      var, let, constante, variable, Int, Double, Float, Bool,
//              String, Character, interpolacion, concatenar, operadores,
//              division, modulo, residuo, %, convertir, conversion, cast,
//              ternario, ? :, and, or, &&, ||, tipos de datos
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
                }
                .padding()
            }
        }
        .navigationTitle("Tipos y variables")
    }

    // ── 1. var y let ─────────────────────────────────
    func ejemploVarLet() -> String {
        var cantidad = 38              // Swift infiere que es Int
        cantidad = 20                  // var SÍ se puede cambiar

        let precio: Double = 60.45     // let NO se puede cambiar
        // precio = 70                 // ERROR: es constante

        var titulo = "Mensaje"         // infiere String
        titulo = "Nuevo mensaje"

        return "cantidad = \(cantidad)\nprecio = \(precio)\ntitulo = \(titulo)"
    }

    // ── 2. Tipos de datos ────────────────────────────
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
        // Interpolación: meter una variable dentro del texto con \( )
        let paginas = 78
        let mensaje = "El libro tiene \(paginas) páginas"

        // Concatenación: unir textos con + y +=
        var saludo = "Hola"
        let signo = "!!!"
        saludo += " Daniel" + signo

        // Saber si está vacío y cuántas letras tiene
        let vacio = ""
        let estaVacio = vacio.isEmpty           // true
        let letras = saludo.count               // número de caracteres

        return "\(mensaje)\n\(saludo)\n¿vacío? \(estaVacio)\nletras de saludo: \(letras)"
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
