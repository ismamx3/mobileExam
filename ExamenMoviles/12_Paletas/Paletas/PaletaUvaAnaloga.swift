// ═══════════════════════════════════════════════════════════════
//  PaletaUvaAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Uva (índigo · morado · magenta)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Música, fiestas, videojuegos, arte.
//  BUSCA:      paleta, colores, palette, uva, grape, morado magenta, indigo, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.0 : 1
//              textoSuave / fondo     6.6 : 1
//              texto del botón / primario 7.0 : 1
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
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Un struct con puras constantes de color. No lleva static: se crea una
// instancia en cada vista con  let paleta = PaletaUvaAnaloga()
struct PaletaUvaAnaloga {
    let fondo = Color(red: 250/255, green: 245/255, blue: 255/255)            // fondo de toda la pantalla
    let superficie = Color(red: 241/255, green: 228/255, blue: 251/255)       // tarjetas, renglones, campos
    let primario = Color(red: 126/255, green: 34/255, blue: 206/255)          // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 192/255, green: 38/255, blue: 211/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 59/255, green: 7/255, blue: 100/255)               // títulos y texto principal
    let textoSuave = Color(red: 107/255, green: 74/255, blue: 133/255)        // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 67/255, green: 56/255, blue: 202/255),
        Color(red: 109/255, green: 40/255, blue: 217/255),
        Color(red: 126/255, green: 34/255, blue: 206/255),
        Color(red: 162/255, green: 28/255, blue: 175/255),
        Color(red: 219/255, green: 39/255, blue: 119/255)
    ]
}

#Preview {
    let paleta = PaletaUvaAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Uva (índigo · morado · magenta)")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(paleta.texto)
            Text("Análoga · modo claro")
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
}
