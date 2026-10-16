// ═══════════════════════════════════════════════════════════════
//  PaletaNocheAzulOscura.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Noche azul" (mismo color (mismo tono) en distintas claridades).
//              Modo oscuro.
//  IDEAL PARA: Watchlist, música, apps de noche, tecnología.
//  BUSCA:      paleta, colores, palette, oscuro, dark, noche, azul marino, navy, monocromatica, oscuro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          17.2 : 1
//              textoSuave / fondo     9.4 : 1
//              texto del botón / primario 7.4 : 1
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
// instancia en cada vista con  let paleta = PaletaNocheAzulOscura()
struct PaletaNocheAzulOscura {
    let fondo = Color(red: 11/255, green: 18/255, blue: 32/255)               // fondo de toda la pantalla
    let superficie = Color(red: 22/255, green: 33/255, blue: 58/255)          // tarjetas, renglones, campos
    let primario = Color(red: 96/255, green: 165/255, blue: 250/255)          // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 147/255, green: 197/255, blue: 253/255)       // acentos, detalles, segundo botón
    let texto = Color(red: 241/255, green: 245/255, blue: 255/255)            // títulos y texto principal
    let textoSuave = Color(red: 169/255, green: 184/255, blue: 214/255)       // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 11/255, green: 18/255, blue: 32/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 29/255, green: 78/255, blue: 216/255),
        Color(red: 59/255, green: 130/255, blue: 246/255),
        Color(red: 96/255, green: 165/255, blue: 250/255),
        Color(red: 147/255, green: 197/255, blue: 253/255),
        Color(red: 191/255, green: 219/255, blue: 254/255)
    ]
}

#Preview {
    let paleta = PaletaNocheAzulOscura()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Noche azul")
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
