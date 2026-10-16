// ═══════════════════════════════════════════════════════════════
//  PaletaGrafitoOscura.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Grafito" (mismo color (mismo tono) en distintas claridades).
//              Modo oscuro.
//  IDEAL PARA: Minimalista, herramientas, fotografía.
//  BUSCA:      paleta, colores, palette, oscuro, dark, gris, grafito, negro, monocromatica, oscuro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          17.8 : 1
//              textoSuave / fondo     7.7 : 1
//              texto del botón / primario 15.0 : 1
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
// instancia en cada vista con  let paleta = PaletaGrafitoOscura()
struct PaletaGrafitoOscura {
    let fondo = Color(red: 17/255, green: 19/255, blue: 23/255)               // fondo de toda la pantalla
    let superficie = Color(red: 30/255, green: 33/255, blue: 40/255)          // tarjetas, renglones, campos
    let primario = Color(red: 229/255, green: 231/255, blue: 235/255)         // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 156/255, green: 163/255, blue: 175/255)       // acentos, detalles, segundo botón
    let texto = Color(red: 249/255, green: 250/255, blue: 251/255)            // títulos y texto principal
    let textoSuave = Color(red: 161/255, green: 167/255, blue: 179/255)       // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 17/255, green: 19/255, blue: 23/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 75/255, green: 85/255, blue: 99/255),
        Color(red: 107/255, green: 114/255, blue: 128/255),
        Color(red: 156/255, green: 163/255, blue: 175/255),
        Color(red: 209/255, green: 213/255, blue: 219/255),
        Color(red: 243/255, green: 244/255, blue: 246/255)
    ]
}

#Preview {
    let paleta = PaletaGrafitoOscura()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Grafito")
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
