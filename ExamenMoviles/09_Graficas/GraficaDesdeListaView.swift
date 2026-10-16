// ═══════════════════════════════════════════════════════════════
//  GraficaDesdeListaView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Grafica los datos de TU LISTA: cuenta con un for cuántos
//              registros hay por categoría (y suma un campo numérico)
//              y lo muestra en barras y en pastel.
//  ÚSALO PARA: "en otra pestaña muestra una gráfica con los datos de
//              la lista" (mascotas por especie, alumnos por carrera,
//              gasto por categoría).
//  BUSCA:      grafica de la lista, contar por categoria, agrupar,
//              conteo, sumar por categoria, for, contains, resumen,
//              datos de la lista, TabView grafica, barras, pastel, gráfica
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GraficaDesdeListaView.swift.
//   2. Pega el archivo completo.
//   3. Cambia RegistroGraficaLista por TU modelo (el de tu lista) y
//      .categoria / .costo por los campos que quieras agrupar y sumar. ✏️
//   4. Llámala pasándole tu arreglo:  GraficaDesdeListaView(registros: miLista)
//      Si miLista es @State en el padre (por ejemplo el que tiene el
//      TabView), la gráfica se actualiza sola cuando agregas o editas.
//  NECESITA:   import Charts (ya viene arriba). Pastel pide iOS 17 o más.
//  ⚠️ NO VISTO EN CLASE: ForEach (bloque 1; como List pero sin formato
//              de lista) y .contains (¿ya está en el arreglo?).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

// ✏️ Esto sería el modelo de TU lista. Aquí solo es de ejemplo.
struct RegistroGraficaLista: Identifiable {
    let id: Int
    let nombre: String
    let categoria: String    // ✏️ el campo por el que se agrupa
    let costo: Double        // ✏️ el campo que se suma
}

// ✏️ datos de ejemplo (en tu app vienen de tu ModelData o de un @State)
let datosRegistrosGrafica: [RegistroGraficaLista] = [
    RegistroGraficaLista(id: 1, nombre: "Firulais", categoria: "Perro", costo: 450),
    RegistroGraficaLista(id: 2, nombre: "Michi", categoria: "Gato", costo: 300),
    RegistroGraficaLista(id: 3, nombre: "Rocky", categoria: "Perro", costo: 600),
    RegistroGraficaLista(id: 4, nombre: "Piolín", categoria: "Ave", costo: 150),
    RegistroGraficaLista(id: 5, nombre: "Luna", categoria: "Gato", costo: 350),
    RegistroGraficaLista(id: 6, nombre: "Max", categoria: "Perro", costo: 500)
]

// El resultado ya agrupado: una categoría y su número.
// El id es una propiedad calculada, igual que el struct Punto de la lámina
// (var id: Int {return x}): la categoría ya es única.
struct ResumenCategoriaGrafica: Identifiable {
    var id: String { return categoria }
    let categoria: String
    let valor: Double
}

struct GraficaDesdeListaView: View {

    // Recibe la lista desde fuera (solo la lee, por eso no lleva @Binding).
    var registros: [RegistroGraficaLista]

    // Paso 1: las categorías distintas, en el orden en que aparecen.
    var categorias: [String] {
        var resultado: [String] = []
        for registro in registros {
            if !resultado.contains(registro.categoria) {
                resultado.append(registro.categoria)
            }
        }
        return resultado
    }

    // Paso 2a: cuántos registros hay de cada categoría.
    var conteos: [ResumenCategoriaGrafica] {
        var resultado: [ResumenCategoriaGrafica] = []
        for categoria in categorias {
            var cuenta = 0
            for registro in registros {
                if registro.categoria == categoria {
                    cuenta += 1
                }
            }
            resultado.append(ResumenCategoriaGrafica(categoria: categoria, valor: Double(cuenta)))
        }
        return resultado
    }

    // Paso 2b: la suma de un campo numérico por categoría.
    var sumas: [ResumenCategoriaGrafica] {
        var resultado: [ResumenCategoriaGrafica] = []
        for categoria in categorias {
            var suma = 0.0
            for registro in registros {
                if registro.categoria == categoria {
                    suma += registro.costo
                }
            }
            resultado.append(ResumenCategoriaGrafica(categoria: categoria, valor: suma))
        }
        return resultado
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Los datos de origen (tu lista) ─────────────────
                Text("1. Datos de la lista (\(registros.count) registros)")
                    .font(.headline)

                VStack(spacing: 6) {
                    ForEach(registros) { registro in
                        HStack {
                            Text(registro.nombre)
                            Spacer()
                            Text(registro.categoria)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

                Divider()

                // ── 2. Barras: cuántos hay por categoría ──────────────
                Text("2. Cuántos hay por categoría")
                    .font(.headline)

                Chart(conteos) { item in
                    BarMark(
                        x: .value("Categoría", item.categoria),
                        y: .value("Cantidad", item.valor)
                    )
                    .foregroundStyle(by: .value("Categoría", item.categoria))
                }
                .frame(height: 220)

                Divider()

                // ── 3. Pastel: el mismo conteo en proporción ──────────
                Text("3. Mismo conteo en pastel")
                    .font(.headline)

                Chart(conteos) { item in
                    SectorMark(
                        angle: .value("Cantidad", item.valor)
                    )
                    .foregroundStyle(by: .value("Categoría", item.categoria))
                }
                .chartLegend(position: .bottom, alignment: .center)
                .frame(height: 240)

                Divider()

                // ── 4. Barras: suma de un campo por categoría ─────────
                Text("4. Costo total por categoría")
                    .font(.headline)

                Chart(sumas) { item in
                    BarMark(
                        x: .value("Categoría", item.categoria),
                        y: .value("Costo", item.valor)
                    )
                    .foregroundStyle(.indigo)
                }
                .frame(height: 220)
            }
            .padding()
        }
        .navigationTitle("Gráfica de la lista")
    }
}

#Preview {
    NavigationStack {
        GraficaDesdeListaView(registros: datosRegistrosGrafica)
    }
}
