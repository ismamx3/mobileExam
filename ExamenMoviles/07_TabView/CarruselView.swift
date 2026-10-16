// ═══════════════════════════════════════════════════════════════
//  CarruselView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Carrusel de fotos que se desliza de lado, con puntitos
//              abajo. Es un TabView con estilo .page (Clase 7).
//              Bloque 1 = código EXACTO de la clase (SF Symbols de
//              deportes). Bloque 2 = con fotos de Assets y texto encima.
//  ÚSALO PARA: galería de fotos, banners, destacados, portada.
//  BUSCA:      carrusel, carrusel de fotos, carousel, galeria, deslizar
//              fotos, swipe, page, tabViewStyle, indexViewStyle,
//              backgroundDisplayMode, puntitos, figure.baseball
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/CarruselView.swift (o pega solo el TabView
//      del bloque que quieras).
//   2. Pega el archivo completo (trae CarruselPagina al final).
//   3. Cambia lo marcado con ✏️ (nombres de tus imágenes y textos)
//  NECESITA:   bloque 1: nada. Bloque 2: imágenes "foto1"…"foto4" en
//              Assets.xcassets (arrastra cualquier imagen y ponle ese nombre).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct CarruselView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // ── 1. Carrusel de la clase (código exacto) ─────────
                Text("1. Carrusel de la clase")
                    .font(.headline)

                // Cada vista dentro del TabView es una "página".
                TabView {
                    //Poner imágenes con alto de 300
                    Image(systemName: "figure.baseball")                 // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    Image(systemName: "figure.bowling")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    Image(systemName: "figure.american.football")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    Image(systemName: "figure.volleyball")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                }
                .tabViewStyle(.page)                                     // páginas que se deslizan
                .indexViewStyle(.page(backgroundDisplayMode: .always))   // fondo detrás de los puntitos
                .frame(height: 430)                                      // alto total del carrusel

                // ── 2. Con fotos de Assets y texto encima ───────────
                Text("2. Con tus fotos y texto encima")
                    .font(.headline)

                TabView {
                    CarruselPagina(imagen: "foto1", texto: "Montaña")    // ✏️
                    CarruselPagina(imagen: "foto2", texto: "Playa")      // ✏️
                    CarruselPagina(imagen: "foto3", texto: "Comida")     // ✏️
                    CarruselPagina(imagen: "foto4", texto: "Espacio")    // ✏️
                }
                .tabViewStyle(.page)                                     // páginas que se deslizan
                .indexViewStyle(.page(backgroundDisplayMode: .always))   // fondo detrás de los puntitos
                .frame(height: 430)                                      // ✏️ alto del carrusel

                Text("Cada página es una vista. Los puntitos salen solos.")
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle("Carrusel")
    }
}

// ═══════════════════════════════════════════════════════════════
//  CarruselPagina — una foto con su texto encima. Componente para no
//  repetir el mismo código en cada página.
// ═══════════════════════════════════════════════════════════════
struct CarruselPagina: View {

    var imagen: String
    var texto: String

    var body: some View {
        // ZStack con alineación abajo: el texto queda sobre la foto
        ZStack(alignment: .bottom) {
            Image(imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            Text(texto)
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.black.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.bottom, 16)
        }
        .padding(.bottom, 50)       // deja espacio para los puntitos
    }
}

#Preview {
    NavigationStack {
        CarruselView()
    }
}
