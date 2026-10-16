// ═══════════════════════════════════════════════════════════════
//  ImagenCircular.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Imagen recortada en círculo, con borde de color y sombra.
//              Es el PokeImagenView de la clase 5A, pero recibe el nombre
//              de la imagen, el ancho y el color como parámetros.
//  ÚSALO PARA: foto de perfil, avatar, foto de un jugador o mascota.
//  BUSCA:      imagen circular, circulo, avatar, perfil, borde, sombra, clipShape,
//              componente, PokeImagenView, overlay, Circle stroke, shadow
//
//  CÓMO SE CREA (en tu proyecto):
//   (pasos de clase) File → New → File from Template... → sección
//   "User Interface" → "SwiftUI View" → Next → nómbralo ImagenCircular.swift
//   → Create (en la carpeta Components/). Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista:
//       ImagenCircular(nombreImagen: "perfil")                          // ancho y color de default
//       ImagenCircular(nombreImagen: "mascota", ancho: 80, colorBorde: .purple)
//
//  NECESITA:   una imagen en Assets con ese nombre (arrastra la imagen a
//              Assets.xcassets y usa el nombre que le quede).
//              Usa una foto CUADRADA: con .fit una foto rectangular deja
//              el círculo más chico que el ancho.
//  La versión idéntica a la clase (sin parámetros) está en
//  04_Componentes/Components/PokeImagenView.swift.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ImagenCircular: View {

    var nombreImagen: String        // ✏️ nombre del asset
    var ancho: Double = 150         // en clase: .frame(width: 150)
    var colorBorde: Color = .orange

    var body: some View {
        // Mismo orden y modificadores que la clase 5A (Paso 2.2):
        // Mode: Stretch · Aspect ratio: fit · circular · borde · sombra.
        Image(nombreImagen)
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .clipShape(.circle)
            .overlay {
                Circle().stroke(colorBorde, lineWidth: 5)
            }
            .shadow(color: colorBorde, radius: 5)
            .frame(width: ancho)
    }
}

#Preview {
    HStack(spacing: 20) {
        ImagenCircular(nombreImagen: "perfil")
        ImagenCircular(nombreImagen: "mascota", ancho: 80, colorBorde: .purple)
    }
    .padding()
}
