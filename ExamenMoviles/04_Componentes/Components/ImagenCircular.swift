// ═══════════════════════════════════════════════════════════════
//  ImagenCircular.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Imagen recortada en círculo, con borde de color y sombra
//              (el mismo patrón que PokeImagenView de clase).
//  ÚSALO PARA: foto de perfil, avatar, foto de un jugador o mascota.
//  BUSCA:      imagen circular, circulo, avatar, perfil, borde, sombra, clipShape, componente
//
//  CÓMO SE CREA (en tu proyecto):
//   File → New → File from Template → "SwiftUI View" → nómbralo ImagenCircular
//   → carpeta Components/. Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista:
//       ImagenCircular(nombreImagen: "perfil")                          // tamaño y color de default
//       ImagenCircular(nombreImagen: "mascota", tamano: 80, colorBorde: .purple)
//
//  NECESITA:   una imagen en Assets con ese nombre (arrastra la imagen a
//              Assets.xcassets y usa el nombre que le quede).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ImagenCircular: View {

    var nombreImagen: String        // ✏️ nombre del asset
    var tamano: Double = 150        // ancho y alto del círculo
    var colorBorde: Color = .orange

    var body: some View {
        Image(nombreImagen)
            .resizable(resizingMode: .stretch)
            // .fill (en vez de .fit) llena todo el cuadro sin deformar;
            // lo que sobra se corta con el círculo. Así nunca quedan huecos.
            .aspectRatio(contentMode: .fill)
            .frame(width: tamano, height: tamano)
            .clipShape(.circle)
            .overlay {
                Circle().stroke(colorBorde, lineWidth: 4)
            }
            .shadow(color: colorBorde, radius: 5)
    }
}

#Preview {
    HStack(spacing: 20) {
        ImagenCircular(nombreImagen: "perfil")
        ImagenCircular(nombreImagen: "mascota", tamano: 80, colorBorde: .purple)
    }
    .padding()
}
