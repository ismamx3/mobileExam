// ═══════════════════════════════════════════════════════════════
//  ArreglosYCiclosView.swift  ·  01 Swift básico
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Arreglos (listas de valores) y ciclos for.
//              Agregar, quitar, contar, recorrer, sumar, promedio,
//              máximo, elemento al azar y mostrar un arreglo en
//              pantalla con ForEach.
//  ÚSALO PARA: calcular promedio/total de una lista, agregar cosas
//              que escribe el usuario, elegir algo al azar.
//  BUSCA:      arreglo, array, lista, append, agregar, remove, quitar,
//              borrar, count, contar, isEmpty, vacio, for, ciclo, loop,
//              rango, 1...5, 0..<n, suma, promedio, maximo, mayor,
//              ForEach, randomElement, random, aleatorio, azar,
//              diccionario, dictionary, filter, filtrar, sorted, ordenar
//
//  CÓMO COPIARLO:
//   1. Para la lista interactiva: copia las @State, el bloque 6 y
//      las funciones agregarFruta() y quitarUltima().
//   2. Para cálculos: copia la función del bloque que quieras.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: ForEach (bloque 6), diccionarios, .filter, .sorted, .contains
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ArreglosYCiclosView: View {

    @State private var frutas = ["Manzana", "Plátano", "Uva"]    // ✏️ tu arreglo inicial
    @State private var nuevaFruta = ""
    @State private var recomendacion = ""
    @State private var numeroAlAzar = 0
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Crear, agregar y quitar ───────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Crear, agregar y quitar")
                            .font(.headline)
                        Text(ejemploCrear())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 2. Acceso por índice SEGURO ──────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Leer una posición sin tronar")
                            .font(.headline)
                        Text(ejemploIndiceSeguro(indice: 1) + "\n" + ejemploIndiceSeguro(indice: 10))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 3. Ciclos for y rangos ───────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. for-in y rangos")
                            .font(.headline)
                        Text(ejemploCiclos())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 4. Suma, promedio y máximo ───────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. Suma, promedio y máximo")
                            .font(.headline)
                        Text(ejemploCalculos())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // ── 5. Al azar ───────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("5. Elemento y número al azar")
                            .font(.headline)

                        HStack(spacing: 12) {
                            Button("Fruta al azar") {
                                // randomElement() regresa OPCIONAL (el arreglo podría estar vacío)
                                if let fruta = frutas.randomElement() {
                                    recomendacion = fruta
                                } else {
                                    recomendacion = "No hay frutas"
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.purple)

                            Button("Número 1 a 100") {
                                numeroAlAzar = Int.random(in: 1...100)     // ✏️ rango
                            }
                            .buttonStyle(.bordered)
                            .tint(.purple)
                        }

                        if !recomendacion.isEmpty {
                            Text("Fruta: \(recomendacion)")
                        }
                        if numeroAlAzar != 0 {
                            Text("Número: \(numeroAlAzar)")
                        }
                    }

                    // ── 6. Lista interactiva con ForEach ─────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("6. Agregar y mostrar con ForEach")
                            .font(.headline)

                        HStack {
                            TextField("Nueva fruta", text: $nuevaFruta)     // ✏️ placeholder
                                .textFieldStyle(.roundedBorder)
                            Button("Agregar") {
                                agregarFruta()
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.purple)
                        }

                        Text("Total: \(frutas.count) frutas")
                            .foregroundStyle(.secondary)

                        // ⚠️ NO VISTO EN CLASE: ForEach no viene en las láminas.
                        // id: \.self sirve para arreglos SIMPLES de String/Int.
                        // Para modelos (structs) usa Identifiable + List (tema 08, forma de clase).
                        ForEach(frutas, id: \.self) { fruta in
                            HStack {
                                Image(systemName: "leaf.fill")
                                    .foregroundStyle(.green)
                                Text(fruta)
                                Spacer()
                            }
                            .padding(10)
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }

                        Button("Quitar la última") {
                            quitarUltima()
                        }
                        .buttonStyle(.bordered)
                        .tint(.red)
                    }

                    // ── 7. Diccionarios, filter y sorted ─────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("7. Diccionario, filter y sorted")
                            .font(.headline)
                        Text(ejemploAvanzado())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Arreglos y ciclos")
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }

    // ── 1. Crear, agregar y quitar ───────────────────
    func ejemploCrear() -> String {
        var numeros = [4, 8, 15]              // arreglo de Int
        let vacio: [String] = []              // arreglo vacío (hay que decir el tipo)

        numeros.append(16)                    // agrega al final → [4, 8, 15, 16]
        numeros.remove(at: 0)                 // quita la posición 0 → [8, 15, 16]

        return """
        numeros = \(numeros)
        numeros.count = \(numeros.count)
        numeros[0] = \(numeros[0])
        vacio.isEmpty = \(vacio.isEmpty)
        """
    }

    // ── 2. Índice seguro ─────────────────────────────
    func ejemploIndiceSeguro(indice: Int) -> String {
        let colores = ["Rojo", "Verde", "Azul"]
        // Leer una posición que no existe TRUENA la app.
        // Por eso primero se revisa que el índice esté dentro del arreglo.
        if indice >= 0 && indice < colores.count {
            return "colores[\(indice)] = \(colores[indice])"
        } else {
            return "La posición \(indice) no existe (solo hay \(colores.count))"
        }
    }

    // ── 3. Ciclos ────────────────────────────────────
    func ejemploCiclos() -> String {
        var texto = ""

        // Recorrer cada elemento
        let nombres = ["Ana", "Luis", "Sofía"]     // ✏️
        for nombre in nombres {
            texto += "Hola \(nombre). "
        }

        // Rango cerrado: 1...5 incluye el 5
        texto += "\n1...5 →"
        for i in 1...5 {
            texto += " \(i)"
        }

        // Rango abierto: 0..<n NO incluye n (ideal para índices)
        texto += "\n0..<nombres.count →"
        for i in 0..<nombres.count {
            texto += " [\(i)]\(nombres[i])"
        }

        return texto
    }

    // ── 4. Suma, promedio y máximo ───────────────────
    func ejemploCalculos() -> String {
        let calificaciones = [85.0, 92.5, 78.0, 100.0]     // ✏️ tus datos

        if calificaciones.isEmpty {
            return "No hay calificaciones"                   // evita dividir entre 0
        }

        var suma = 0.0
        var maximo = calificaciones[0]
        var minimo = calificaciones[0]

        for calificacion in calificaciones {
            suma += calificacion
            if calificacion > maximo {
                maximo = calificacion
            }
            if calificacion < minimo {
                minimo = calificacion
            }
        }

        let promedio = suma / Double(calificaciones.count)

        return """
        Suma: \(suma)
        Promedio: \(promedio.formatted(.number.precision(.fractionLength(2))))
        Máximo: \(maximo)
        Mínimo: \(minimo)
        """
    }

    // ── 6. Agregar y quitar desde la interfaz ────────
    func agregarFruta() {
        if nuevaFruta.isEmpty {
            alertMessage = "Escribe el nombre de una fruta"
            showAlert.toggle()
        } else if frutas.contains(nuevaFruta) {     // ⚠️ NO VISTO EN CLASE: .contains revisa si ya existe
            // Con ForEach(id: \.self) no conviene repetir valores
            alertMessage = "\(nuevaFruta) ya está en la lista"
            showAlert.toggle()
        } else {
            frutas.append(nuevaFruta)
            nuevaFruta = ""                          // limpia el campo
        }
    }

    func quitarUltima() {
        if frutas.isEmpty {
            alertMessage = "La lista ya está vacía"
            showAlert.toggle()
        } else {
            frutas.remove(at: frutas.count - 1)
        }
    }

    // ── 7. Diccionario, filter y sorted ──────────────
    func ejemploAvanzado() -> String {
        // ⚠️ NO VISTO EN CLASE: diccionario = pares llave: valor
        let precios = ["Taco": 25, "Torta": 60, "Agua": 15]     // ✏️
        var textoPrecio = ""
        if let precioTaco = precios["Taco"] {                   // leer regresa opcional
            textoPrecio = "Taco cuesta \(precioTaco)"
        }

        // ⚠️ NO VISTO EN CLASE: filter se queda con los que cumplen la condición
        let calificaciones = [85, 92, 60, 100, 70]
        let aprobadas = calificaciones.filter { calificacion in
            calificacion >= 70
        }

        // ⚠️ NO VISTO EN CLASE: sorted() ordena de menor a mayor
        let ordenadas = calificaciones.sorted()

        return "\(textoPrecio)\nAprobadas (>= 70): \(aprobadas)\nOrdenadas: \(ordenadas)"
    }
}

#Preview {
    NavigationStack {
        ArreglosYCiclosView()
    }
}
