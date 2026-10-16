// ═══════════════════════════════════════════════════════════════
//  PokeDatosView.swift  ·  04 Componentes (ejemplo Pokémon de clase 5A)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La vista de datos del Pokémon (Paso #3 de la clase 5A):
//              nombre, etiqueta de tipo y descripción.
//              En clase se llamó "DatosView".
//  ÚSALO PARA: el bloque de "título + etiqueta + descripción" debajo
//              de una foto (producto, mascota, jugador, platillo…).
//  BUSCA:      DatosView, PokeDatosView, pokemon, datos, nombre tipo descripcion,
//              font system size, etiqueta de color, componente, clase 5A
//
//  CÓMO SE CREA: igual que PokeImagenView (File → New → File from
//   Template... → "User Interface" → "SwiftUI View" → Next → nombre → Create).
//
//  CÓMO SE USA: en la pantalla principal, ABAJO del ZStack:
//       PokeDatosView()
//       PokeDatosView(nombre: "Pikachu", tipo: "Eléctrico",
//                     descripcion: "…", color: .yellow)
//   Las variables tienen valor de default: si no mandas nada, usa
//   los datos de Charmander de la clase.
//
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PokeDatosView: View {

    var nombre: String = "Charmander"                       // ✏️
    var tipo: String = "Fuego"                              // ✏️
    var descripcion: String = "Dicen que cuando llueve le sale vapor de la punta de la cola."  // ✏️
    var color: Color = .orange                              // ✏️

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                // Tip de clase: para cambiar el tamaño del font
                // se puede usar .font(.system(size: 21))
                Text(nombre)
                    .font(.system(size: 21))
                    .bold()
                    .foregroundStyle(color)

                Spacer()

                Text(tipo)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(6)
                    .background(color)
            }

            Text(descripcion)
                .font(.system(size: 15))
        }
    }
}

#Preview {
    PokeDatosView()
        .padding()
}
