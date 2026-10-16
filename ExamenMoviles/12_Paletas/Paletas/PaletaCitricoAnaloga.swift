// ═══════════════════════════════════════════════════════════════
//  PaletaCitricoAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Cítrico (verde lima · olivo · mostaza)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Jugos, comida saludable, gym, primavera.
//  BUSCA:      paleta, colores, palette, citrico, lima, limon, verde amarillo, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.2 : 1
//              textoSuave / fondo     6.8 : 1
//              texto del botón / primario 5.0 : 1
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
// instancia en cada vista con  let paleta = PaletaCitricoAnaloga()
struct PaletaCitricoAnaloga {
    let fondo = Color(red: 251/255, green: 253/255, blue: 235/255)            // fondo de toda la pantalla
    let superficie = Color(red: 240/255, green: 247/255, blue: 204/255)       // tarjetas, renglones, campos
    let primario = Color(red: 77/255, green: 124/255, blue: 15/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 161/255, green: 98/255, blue: 7/255)          // acentos, detalles, segundo botón
    let texto = Color(red: 31/255, green: 45/255, blue: 6/255)                // títulos y texto principal
    let textoSuave = Color(red: 81/255, green: 94/255, blue: 42/255)          // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 63/255, green: 98/255, blue: 18/255),
        Color(red: 77/255, green: 124/255, blue: 15/255),
        Color(red: 101/255, green: 163/255, blue: 13/255),
        Color(red: 161/255, green: 98/255, blue: 7/255),
        Color(red: 202/255, green: 138/255, blue: 4/255)
    ]
}

#Preview {
    let paleta = PaletaCitricoAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Cítrico (verde lima · olivo · mostaza)")
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
