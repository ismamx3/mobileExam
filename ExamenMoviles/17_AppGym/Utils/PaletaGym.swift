// ═══════════════════════════════════════════════════════════════
//  PaletaGym.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La paleta de colores de la app (MONOCROMÁTICA verde neón,
//              modo OSCURO). Es una copia de
//              12_Paletas/Paletas/PaletaGymNeonOscura.swift con el
//              struct renombrado a PaletaGym. Así se usa una paleta del repo.
//  ÚSALO PARA: todos los colores de la app en UN solo lugar (rúbrica:
//              "paleta adecuada y armónica, monocromática o análoga").
//  BUSCA:      paleta, colores, palette, oscuro, dark, verde, neon, monocromatica
//  CONTRASTE (WCAG, revisado): texto/fondo 18.3:1 · textoSuave/fondo 9.3:1 ·
//              texto del botón/primario 11.1:1  (mínimo 4.5:1).
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Utils/ → New File → Swift File → "Paleta".
//   2. Pega el struct (puedes cambiarle el nombre a Paleta).
//   3. En cada vista:  let paleta = PaletaGym()   y usa paleta.fondo, …
//  NECESITA:   import SwiftUI.
//  ⚠️ PALETA OSCURA: la vista raíz (GymAppView) pone
//     .preferredColorScheme(.dark) (no visto en clase) para que los textos
//     del sistema —ejes de las gráficas, barra de estado, teclado— también
//     salgan claros. Sin eso, los números de los ejes salen negros sobre
//     el fondo negro y no se leen.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Struct con puras constantes de color. Sin static: en cada vista se
// crea con  let paleta = PaletaGym()  (sin @State porque no cambia).
struct PaletaGym {
    let fondo = Color(red: 10/255, green: 15/255, blue: 11/255)               // fondo de toda la pantalla
    let superficie = Color(red: 20/255, green: 28/255, blue: 22/255)          // tarjetas, renglones, campos
    let primario = Color(red: 74/255, green: 222/255, blue: 128/255)          // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 134/255, green: 239/255, blue: 172/255)       // acentos, detalles, segundo botón
    let texto = Color(red: 236/255, green: 253/255, blue: 243/255)            // títulos y texto principal
    let textoSuave = Color(red: 157/255, green: 187/255, blue: 166/255)       // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 10/255, green: 15/255, blue: 11/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 21/255, green: 128/255, blue: 61/255),
        Color(red: 34/255, green: 197/255, blue: 94/255),
        Color(red: 74/255, green: 222/255, blue: 128/255),
        Color(red: 134/255, green: 239/255, blue: 172/255),
        Color(red: 187/255, green: 247/255, blue: 208/255)
    ]
}

#Preview {
    let paleta = PaletaGym()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Mi Gym")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(paleta.texto)
            Text("Paleta monocromática · modo oscuro")
                .foregroundStyle(paleta.textoSuave)

            HStack(spacing: 8) {
                paleta.graficas[0]
                paleta.graficas[1]
                paleta.graficas[2]
                paleta.graficas[3]
                paleta.graficas[4]
            }
            .frame(height: 40)
            .cornerRadius(8)

            Spacer()
        }
        .padding()
    }
    .preferredColorScheme(.dark)
}
