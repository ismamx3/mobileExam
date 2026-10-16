// ═══════════════════════════════════════════════════════════════
//  ExplorarViajesView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Explorar": chips de categorías que se deslizan
//              de lado, buscador y una CUADRÍCULA de 2 columnas con los
//              destinos (que vienen del JSON). Cada tarjeta lleva al detalle.
//  ÚSALO PARA: catálogos (productos, lugares, películas) con filtro.
//  BUSCA:      cuadricula, grid, LazyVGrid, filtro por categoria, chips,
//              buscador, searchable, buscar, ScrollView horizontal,
//              NavigationLink a detalle, binding de un elemento
//
//  CÓMO COPIARLO:
//   1. Views/ExplorarViajesView.swift → pega esto.
//   2. Cambia categorías y modelo (✏️).
//  NECESITA:   Model/DestinoViajes.swift, Components/TarjetaDestinoViajes,
//              Components/ChipCategoriaViajes, Views/DetalleDestinoViajesView
//  ⚠️ NO VISTO EN CLASE: ScrollView(.horizontal), LazyVGrid + GridItem,
//     .searchable, ForEach, .lowercased().contains(). Cómo explicarlo:
//     "LazyVGrid acomoda las tarjetas en columnas; searchable agrega la
//     barra de búsqueda y guarda lo escrito en un @State".
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ExplorarViajesView: View {

    // Permiso para modificar (el detalle cambia el favorito y agrega viajes).
    @Binding var destinos: Array<DestinoViajes>
    @Binding var viajes: Array<ViajePlaneado>

    @State private var categoriaElegida = "Todos"
    @State private var textoBusqueda = ""

    let paleta = PaletaViajes()
    let categorias = ["Todos", "Playa", "Montaña", "Ciudad", "Pueblo Mágico", "Naturaleza"]   // ✏️

    // ⚠️ 2 columnas del mismo ancho (flexible = se reparten el espacio).
    let columnas = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]

    // Propiedad calculada: las POSICIONES (índices) de los destinos que
    // pasan el filtro. Se guardan posiciones y no destinos porque con la
    // posición podemos mandar al detalle un @Binding: $destinos[indice].
    // Es el filtro de clase: for + if + append.
    var indicesFiltrados: Array<Int> {
        var resultado = Array<Int>()
        for indice in 0..<destinos.count {
            let destino = destinos[indice]

            let pasaCategoria = categoriaElegida == "Todos" || destino.categoria == categoriaElegida

            // ⚠️ lowercased() = todo a minúsculas, para que "tulum" encuentre "Tulum".
            let texto = textoBusqueda.lowercased()
            let pasaBusqueda = textoBusqueda.isEmpty
                || destino.nombre.lowercased().contains(texto)
                || destino.estado.lowercased().contains(texto)

            if pasaCategoria && pasaBusqueda {
                resultado.append(indice)
            }
        }
        return resultado
    }

    func iconoDeCategoria(categoria: String) -> String {
        switch categoria {
        case "Playa":
            return "beach.umbrella.fill"
        case "Montaña":
            return "mountain.2.fill"
        case "Ciudad":
            return "building.2.fill"
        case "Pueblo Mágico":
            return "sparkles"
        case "Naturaleza":
            return "leaf.fill"
        default:
            return "square.grid.2x2.fill"
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {

                        // ── 1. Encabezado ─────────────────────────
                        Text("¿A dónde vamos?")                                     // ✏️
                            .font(.title2)
                            .bold()
                            .foregroundStyle(paleta.texto)

                        // ── 2. Chips de categorías (se deslizan de lado) ──
                        // ⚠️ ScrollView(.horizontal): scroll de izquierda a derecha.
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                // ⚠️ ForEach recorre el arreglo de Strings.
                                ForEach(categorias, id: \.self) { categoria in
                                    Button {
                                        categoriaElegida = categoria
                                    } label: {
                                        ChipCategoriaViajes(titulo: categoria,
                                                            icono: iconoDeCategoria(categoria: categoria),
                                                            seleccionado: categoriaElegida == categoria)
                                    }
                                }
                            }
                        }

                        // ── 3. Cuadrícula de destinos ─────────────
                        if indicesFiltrados.isEmpty {
                            VStack(spacing: 10) {
                                Image(systemName: "binoculars.fill")
                                    .font(.system(size: 50))
                                Text("No encontramos destinos con esa búsqueda.")
                                    .multilineTextAlignment(.center)
                            }
                            .foregroundStyle(paleta.textoSuave)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 60)
                        } else {
                            LazyVGrid(columns: columnas, spacing: 14) {
                                ForEach(indicesFiltrados, id: \.self) { indice in
                                    // $destinos[indice] = binding a ESE destino:
                                    // si el detalle cambia el favorito, cambia aquí también.
                                    NavigationLink {
                                        DetalleDestinoViajesView(destino: $destinos[indice], viajes: $viajes)
                                    } label: {
                                        TarjetaDestinoViajes(destino: destinos[indice])
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Explorar")
            // ⚠️ .searchable: barra de búsqueda; lo escrito se guarda en textoBusqueda.
            .searchable(text: $textoBusqueda, prompt: "Destino o estado")
        }
    }
}

#Preview {
    ExplorarViajesView(destinos: .constant(cargarDestinosViajes()), viajes: .constant(viajesDeEjemploViajes()))
}
