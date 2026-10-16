// ═══════════════════════════════════════════════════════════════
//  SFSymbolsCatalogoView.swift  ·  13 SF Symbols (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es el catálogo con TODOS los íconos del
//  sistema (más de 7,000), para buscarlos sin internet:
//   - Busca por nombre, por palabra clave en inglés (food, delete…)
//     o en español si el ícono está en la guía (comida, borrar…).
//   - Filtra por categoría con los botones de arriba.
//   - "Solo iOS 17": deja solo los que funcionan en un proyecto iOS 17.
//   - Toca un ícono para verlo grande y COPIAR su nombre.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct SFSymbolsCatalogoView: View {

    @State private var simbolos: [SimboloSF] = []
    @State private var categorias: [CategoriaSF] = []
    @State private var nombresExistentes: Set<String> = []
    @State private var textoBusqueda = ""
    @State private var categoriaElegida = "Todos"
    @State private var soloIOS17 = false
    @State private var simboloElegido: SimboloSF? = nil

    let columnas = [
        GridItem(.adaptive(minimum: 92), spacing: 10)
    ]

    var simbolosFiltrados: [SimboloSF] {
        var resultado: [SimboloSF] = []
        for simbolo in simbolos {
            if soloIOS17 && !simbolo.funcionaEnIOS17 {
                continue
            }
            if categoriaElegida != "Todos" && !simbolo.categorias.contains(categoriaElegida) {
                continue
            }
            if !textoBusqueda.isEmpty && !coincide(simbolo: simbolo, texto: textoBusqueda) {
                continue
            }
            resultado.append(simbolo)
        }
        return resultado
    }

    func coincide(simbolo: SimboloSF, texto: String) -> Bool {
        if simbolo.nombre.localizedStandardContains(texto) || simbolo.uso.localizedStandardContains(texto) {
            return true
        }
        for palabra in simbolo.palabras {
            if palabra.localizedStandardContains(texto) {
                return true
            }
        }
        for categoria in simbolo.categorias {
            if categoria.localizedStandardContains(texto) {
                return true
            }
        }
        return false
    }

    var body: some View {
        let lista = simbolosFiltrados

        ScrollView {
            VStack(alignment: .leading, spacing: 12) {

                // Categorías
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(categorias) { categoria in
                            Button {
                                categoriaElegida = categoria.nombre
                            } label: {
                                Label(categoria.nombre, systemImage: categoria.icono)
                                    .font(.subheadline)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .foregroundStyle(categoriaElegida == categoria.nombre ? Color.white : Color.purple)
                                    .background(categoriaElegida == categoria.nombre ? Color.purple : Color.purple.opacity(0.12))
                                    .cornerRadius(20)
                            }
                        }
                    }
                }

                Toggle("Solo los que funcionan en iOS 17", isOn: $soloIOS17)
                    .tint(.purple)

                Text("Mostrando \(lista.count) de \(simbolos.count) íconos · toca uno para copiar su nombre")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                // Cuadrícula de íconos
                LazyVGrid(columns: columnas, spacing: 14) {
                    ForEach(lista) { simbolo in
                        Button {
                            simboloElegido = simbolo
                        } label: {
                            VStack(spacing: 6) {
                                Image(systemName: simbolo.nombre)
                                    .font(.title2)
                                    .frame(height: 34)
                                    .foregroundStyle(.primary)
                                Text(simbolo.nombre)
                                    .font(.system(size: 10))
                                    .foregroundStyle(.secondary)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                if !simbolo.funcionaEnIOS17 {
                                    Text("iOS " + simbolo.ios)
                                        .font(.system(size: 9))
                                        .bold()
                                        .foregroundStyle(.orange)
                                }
                            }
                            .frame(maxWidth: .infinity, minHeight: 86)
                            .padding(6)
                            .background(Color.gray.opacity(0.08))
                            .cornerRadius(10)
                        }
                        .buttonStyle(.plain)        // sin esto el botón pinta todo de azul
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Todos los íconos")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $textoBusqueda, prompt: "heart, comida, food, flecha…")
        .sheet(item: $simboloElegido) { simbolo in
            SFSymbolDetalleView(nombre: simbolo.nombre, uso: simbolo.uso, ios: simbolo.ios,
                                categorias: simbolo.categorias, palabras: simbolo.palabras,
                                existeRelleno: nombresExistentes.contains(simbolo.nombre + ".fill"))
        }
        .onAppear {
            if simbolos.isEmpty {
                simbolos = cargarSimbolosSF()
                categorias = cargarCategoriasSF()
                var nombres: Set<String> = []
                for simbolo in simbolos {
                    nombres.insert(simbolo.nombre)
                }
                nombresExistentes = nombres
            }
        }
    }
}

#Preview {
    NavigationStack {
        SFSymbolsCatalogoView()
    }
}
