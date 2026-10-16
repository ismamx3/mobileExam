// ═══════════════════════════════════════════════════════════════
//  PaletaAtardecerAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Atardecer (rojo · naranja · ámbar)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Antojos, eventos, conciertos, fotos de viajes.
//  BUSCA:      paleta, colores, palette, atardecer, sunset, calido, rojo naranja amarillo, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.7 : 1
//              textoSuave / fondo     7.8 : 1
//              texto del botón / primario 5.2 : 1
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
// instancia en cada vista con  let paleta = PaletaAtardecerAnaloga()
struct PaletaAtardecerAnaloga {
    let fondo = Color(red: 255/255, green: 247/255, blue: 237/255)            // fondo de toda la pantalla
    let superficie = Color(red: 255/255, green: 237/255, blue: 213/255)       // tarjetas, renglones, campos
    let primario = Color(red: 194/255, green: 65/255, blue: 12/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 220/255, green: 38/255, blue: 38/255)         // acentos, detalles, segundo botón
    let texto = Color(red: 67/255, green: 20/255, blue: 7/255)                // títulos y texto principal
    let textoSuave = Color(red: 122/255, green: 62/255, blue: 27/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 185/255, green: 28/255, blue: 28/255),
        Color(red: 220/255, green: 38/255, blue: 38/255),
        Color(red: 234/255, green: 88/255, blue: 12/255),
        Color(red: 245/255, green: 158/255, blue: 11/255),
        Color(red: 251/255, green: 191/255, blue: 36/255)
    ]
}

#Preview {
    let paleta = PaletaAtardecerAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Atardecer (rojo · naranja · ámbar)")
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
