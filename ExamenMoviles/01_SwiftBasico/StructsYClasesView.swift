// ═══════════════════════════════════════════════════════════════
//  StructsYClasesView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Un struct (Libro) y una class (CuentaBancaria) con
//              propiedades, init, métodos y propiedad calculada.
//              Botones que los modifican y muestran el resultado.
//              Explica la diferencia COPIA (struct) vs REFERENCIA (class).
//  ÚSALO PARA: crear tu propio tipo de dato con lógica (ej. una
//              cuenta con depositar/retirar, un producto con total).
//  BUSCA:      struct, class, clase, init, inicializador, metodo,
//              propiedad, propiedad calculada, self, copia, referencia,
//              mutating, depositar, retirar, saldo, modelo
//
//  CÓMO COPIARLO:
//   1. El struct Libro y la class CuentaBancaria están arriba del
//      archivo. En tu proyecto ponlos en Model/Libro.swift, etc.
//   2. Para usarlos en una vista copia las @State y el bloque que quieras.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// ── Struct: tipo de VALOR (al asignarlo se hace una COPIA) ──
struct Libro {
    var titulo: String              // ✏️ tus propiedades
    var autor: String
    var paginas: Int
    var leido: Bool

    // Propiedad calculada: no se guarda, se calcula cada vez que se lee
    var tipo: String {
        if paginas > 300 {
            return "Libro largo"
        } else {
            return "Libro corto"
        }
    }

    // Método: una función que vive dentro del struct
    func descripcion() -> String {
        return "\(titulo) de \(autor) (\(paginas) páginas)"
    }
}

// ── Class: tipo de REFERENCIA (al asignarla, las dos variables apuntan al MISMO objeto) ──
class CuentaBancaria {
    var titular: String
    var saldo: Double

    // Las clases NO traen init automático: hay que escribirlo
    init(titular: String, saldo: Double) {
        self.titular = titular      // self.titular = la propiedad; titular = el parámetro
        self.saldo = saldo
    }

    func depositar(cantidad: Double) -> String {
        if cantidad <= 0 {
            return "La cantidad debe ser mayor a 0"
        }
        saldo += cantidad
        return "Depositaste \(cantidad.formatted(.currency(code: "MXN")))"
    }

    func retirar(cantidad: Double) -> String {
        if cantidad <= 0 {
            return "La cantidad debe ser mayor a 0"
        } else if cantidad > saldo {
            return "Saldo insuficiente"
        }
        saldo -= cantidad
        return "Retiraste \(cantidad.formatted(.currency(code: "MXN")))"
    }
}

struct StructsYClasesView: View {

    // Un struct dentro de @State: al cambiar una propiedad, la pantalla se actualiza sola
    @State private var libro = Libro(titulo: "Cien años de soledad", autor: "Gabriel García Márquez", paginas: 471, leido: false)   // ✏️

    // Una class dentro de @State: SwiftUI NO se entera cuando cambia por dentro,
    // por eso copiamos el saldo a otro @State después de cada operación.
    @State private var cuenta = CuentaBancaria(titular: "Ana", saldo: 1000)     // ✏️
    @State private var saldoMostrado = 1000.0
    @State private var mensajeCuenta = ""

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Struct en pantalla ────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Struct Libro")
                            .font(.headline)

                        VStack(alignment: .leading, spacing: 6) {
                            Text(libro.descripcion())
                                .bold()
                            Text("Tipo: \(libro.tipo)")
                            Text("Leído: \(libro.leido ? "Sí" : "No")")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                        Toggle("Ya lo leí", isOn: $libro.leido)     // $libro.leido = binding a UNA propiedad
                            .tint(.purple)

                        HStack {
                            Button("+ 50 páginas") {
                                libro.paginas += 50
                            }
                            .buttonStyle(.bordered)
                            .tint(.purple)

                            Button("- 50 páginas") {
                                if libro.paginas > 50 {
                                    libro.paginas -= 50
                                }
                            }
                            .buttonStyle(.bordered)
                            .tint(.purple)
                        }
                    }

                    // ── 2. Class en pantalla ─────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Class CuentaBancaria")
                            .font(.headline)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Titular: \(cuenta.titular)")
                            Text("Saldo: \(saldoMostrado.formatted(.currency(code: "MXN")))")
                                .font(.title2)
                                .bold()
                            if !mensajeCuenta.isEmpty {
                                Text(mensajeCuenta)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                        HStack {
                            Button("Depositar $200") {
                                mensajeCuenta = cuenta.depositar(cantidad: 200)
                                saldoMostrado = cuenta.saldo
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.green)

                            Button("Retirar $500") {
                                mensajeCuenta = cuenta.retirar(cantidad: 500)
                                saldoMostrado = cuenta.saldo
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.red)
                        }
                    }

                    // ── 3. Copia vs referencia ───────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. Copia (struct) vs referencia (class)")
                            .font(.headline)
                        Text(ejemploCopia() + "\n\n" + ejemploReferencia())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Structs y clases")
    }

    // ── 3. Copia vs referencia ───────────────────────
    func ejemploCopia() -> String {
        let libro1 = Libro(titulo: "Original", autor: "Ana", paginas: 100, leido: false)
        var libro2 = libro1             // struct: libro2 es una COPIA independiente
        libro2.titulo = "Cambiado"
        return "STRUCT: libro1.titulo = \(libro1.titulo), libro2.titulo = \(libro2.titulo)\n→ cambiar la copia no cambia el original."
    }

    func ejemploReferencia() -> String {
        let cuenta1 = CuentaBancaria(titular: "Luis", saldo: 100)
        let cuenta2 = cuenta1           // class: las dos apuntan al MISMO objeto
        cuenta2.saldo = 500
        return "CLASS: cuenta1.saldo = \(cuenta1.saldo), cuenta2.saldo = \(cuenta2.saldo)\n→ cambiar una cambia la otra."
    }
}

#Preview {
    NavigationStack {
        StructsYClasesView()
    }
}
