// ═══════════════════════════════════════════════════════════════
//  PokeImagenView.swift  ·  04 Componentes (ejemplo Pokémon de clase 5A)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La vista de la clase 5A tal cual: SOLO el diseño de la
//              imagen del Pokémon (circular, con borde y sombra).
//              Luego se mete en la pantalla principal con un ZStack.
//  ÚSALO PARA: cualquier "foto circular encima de una portada".
//              Si quieres pasarle la imagen como parámetro, usa
//              04_Componentes/Components/ImagenCircular.swift.
//  BUSCA:      PokeImagenView, PokeFotoView, pokemon, imagen circular, circulo, borde,
//              sombra, clipShape, overlay, Circle stroke, shadow, componente, clase 5A
//
//  CÓMO SE CREA (pasos de clase, Paso 2.1):
//   1. File → New → File from Template...
//   2. Sección "User Interface" → "SwiftUI View" → Next.
//   3. Nómbralo "PokeImagenView.swift" → Create.
//   4. Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA (Paso 2.3), en la pantalla principal, después de la
//  imagen de fondo y las dos dentro de un ZStack:
//       ZStack {
//           Image("portada") ...
//           PokeImagenView()
//               .frame(width: 150)
//               .offset(y: 120)
//       }
//   Ejemplo completo: 04_Componentes/PokemonEjemploView.swift
//
//  NECESITA:   imagen "mascota" en Assets (✏️ cámbiala por la tuya).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PokeImagenView: View {
    var body: some View {
        // Paso 2.2: Mode: Stretch · Aspect ratio: fit · circular · sombra.
        Image("mascota")                                   // ✏️ tu imagen
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            // Hacerla circular:
            .clipShape(.circle)
            .overlay {
                Circle().stroke(.orange, lineWidth: 5)     // ✏️ color del borde
            }
            // Poner sombra:
            .shadow(color: .orange, radius: 5)             // ✏️ color de la sombra
    }
}

#Preview {
    PokeImagenView()
        .frame(width: 150)
}
