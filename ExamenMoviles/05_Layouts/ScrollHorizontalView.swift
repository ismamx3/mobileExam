// ═══════════════════════════════════════════════════════════════
//  ScrollHorizontalView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Scroll de lado (carrusel de tarjetas y fila de categorías)
//              y scroll vertical normal.
//  ÚSALO PARA: "destacados" estilo Netflix/App Store, chips de categorías
//              para filtrar, cualquier contenido que no quepa.
//  BUSCA:      scroll horizontal, carrusel, carousel, deslizar, tarjetas de lado,
//              ScrollView horizontal, categorias, chips, scroll vertical
//
//  CÓMO COPIARLO:
//   1. Copia SOLO el bloque que quieras (entre las líneas  // ── N. ──).
//   2. Copia también los arreglos de arriba que use ese bloque y cambia
//      sus datos (mismo orden en fotos y títulos).
//  NECESITA:   imágenes "foto1"…"foto4" para el bloque 1.
//  ⚠️ NO VISTO EN CLASE: ScrollView(.horizontal) (en clase no hay ejemplo
//     de ScrollView; la rúbrica sí pide scroll si no cabe) y
//     ForEach(…, id: \.self) para repetir las tarjetas.
//
//  CLAVE:  ScrollView(.horizontal) + HStack adentro = scroll de lado.
//          ScrollView normal (vertical) + VStack adentro = scroll hacia abajo.
//  (Para un carrusel que avanza de una en una con puntitos, ve el
//   carrusel con TabView en 07_TabView).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ScrollHorizontalView: View {

    let fotosCarrusel = ["foto1", "foto2", "foto3", "foto4"]               // ✏️
    let titulosCarrusel = ["Montaña", "Playa", "Pizza", "Cohete"]          // ✏️
    let categoriasScroll = ["Todas", "Comida", "Viajes", "Deportes", "Música", "Cine", "Juegos"] // ✏️

    @State private var categoriaElegida = "Todas"

    var body: some View {
        // El ScrollView de afuera es VERTICAL (toda la pantalla).
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. Carrusel horizontal de tarjetas ──────────────────
                Text("1. Carrusel de tarjetas")
                    .font(.headline)

                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(0..<fotosCarrusel.count, id: \.self) { indice in
                            VStack(alignment: .leading, spacing: 8) {
                                Image(fotosCarrusel[indice])
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 220)               // ✏️ ancho de cada tarjeta
                                    .cornerRadius(14)
                                Text(titulosCarrusel[indice])
                                    .font(.headline)
                                Text("Desliza a la izquierda →")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(10)
                            .background(Color.purple.opacity(0.08))
                            .cornerRadius(18)
                        }
                    }
                    .padding(.horizontal, 2)
                }

                // ── 2. Fila de categorías (chips) que se pueden elegir ──
                // Al tocar un chip se guarda en @State y se pinta distinto.
                Text("2. Categorías (elige una)")
                    .font(.headline)

                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(categoriasScroll, id: \.self) { categoria in
                            Button(categoria) {
                                categoriaElegida = categoria
                            }
                            .font(.subheadline)
                            .bold()
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .foregroundStyle(categoria == categoriaElegida ? Color.white : Color.purple)
                            .background(categoria == categoriaElegida ? Color.purple : Color.purple.opacity(0.12))
                            .cornerRadius(50)   // radio grande = forma de cápsula
                        }
                    }
                }

                Text("Elegiste: \(categoriaElegida)")
                    .foregroundStyle(.secondary)

                // ── 3. Scroll vertical normal ───────────────────────────
                // Esta misma pantalla ya es un ScrollView vertical: todo lo
                // que pongas en el VStack se puede bajar con el dedo.
                Text("3. Scroll vertical (baja con el dedo)")
                    .font(.headline)

                VStack(spacing: 8) {
                    ForEach(1...15, id: \.self) { numero in
                        HStack {
                            Text("Renglón \(numero)")                // ✏️
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ScrollHorizontalView()
}
