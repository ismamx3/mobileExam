// ═══════════════════════════════════════════════════════════════
//  PaletaGymNeonOscura.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Gym neón" (mismo color (mismo tono) en distintas claridades).
//              Modo oscuro.
//  IDEAL PARA: Gimnasio, deportes, rutinas, hábitos.
//  BUSCA:      paleta, colores, palette, oscuro, dark, gym, neon, verde, monocromatica, oscuro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          18.3 : 1
//              textoSuave / fondo     9.3 : 1
//              texto del botón / primario 11.1 : 1
//              (mínimo recomendado: 4.5 : 1 para texto)
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: carpeta Utils/ → New File → Swift File → "Paleta".
//   2. Pega este struct (sin el #Preview si quieres) y cámbiale el
//      nombre a:  struct Paleta {
//   3. En cada vista agrega:  let paleta = Paleta()
//      y usa paleta.fondo, paleta.primario, paleta.texto, …
//      Ejemplo completo: 12_Paletas/ComoUsarPaletaView.swift
//  NECESITA:   import SwiftUI (Color viene de SwiftUI).
//  ⚠️ PALETA OSCURA: agrega .preferredColorScheme(.dark) a tu vista
//              raíz (la del TabView). Así los textos que pinta el sistema
//              (ejes de gráficas, barra de estado, teclado) también salen
//              claros. preferredColorScheme no se vio en clase.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Un struct con puras constantes de color. No lleva static: se crea una
// instancia en cada vista con  let paleta = PaletaGymNeonOscura()
struct PaletaGymNeonOscura {
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
    let paleta = PaletaGymNeonOscura()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Gym neón")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(paleta.texto)
            Text("Monocromática · modo oscuro")
                .foregroundStyle(paleta.textoSuave)

            VStack(alignment: .leading, spacing: 6) {
                Text("Tarjeta")
                    .font(.headline)
                    .foregroundStyle(paleta.texto)
                Text("Texto suave dentro de una tarjeta")
                    .foregroundStyle(paleta.textoSuave)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(paleta.superficie)
            .cornerRadius(16)

            Button {
            } label: {
                Text("Botón principal")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(paleta.textoSobrePrimario)
                    .background(paleta.primario)
                    .cornerRadius(14)
            }

            Text("Acento con el color secundario")
                .bold()
                .foregroundStyle(paleta.secundario)

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
