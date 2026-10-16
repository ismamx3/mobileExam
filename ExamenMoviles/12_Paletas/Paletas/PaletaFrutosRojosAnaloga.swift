// ═══════════════════════════════════════════════════════════════
//  PaletaFrutosRojosAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Frutos rojos (rojo · frambuesa · rosa)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Postres, cafeterías, San Valentín, belleza.
//  BUSCA:      paleta, colores, palette, frutos rojos, berry, frambuesa, rojo rosa, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.2 : 1
//              textoSuave / fondo     7.4 : 1
//              texto del botón / primario 6.3 : 1
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
// instancia en cada vista con  let paleta = PaletaFrutosRojosAnaloga()
struct PaletaFrutosRojosAnaloga {
    let fondo = Color(red: 255/255, green: 241/255, blue: 242/255)            // fondo de toda la pantalla
    let superficie = Color(red: 255/255, green: 228/255, blue: 230/255)       // tarjetas, renglones, campos
    let primario = Color(red: 190/255, green: 18/255, blue: 60/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 219/255, green: 39/255, blue: 119/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 76/255, green: 5/255, blue: 25/255)                // títulos y texto principal
    let textoSuave = Color(red: 128/255, green: 55/255, blue: 79/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 159/255, green: 18/255, blue: 57/255),
        Color(red: 190/255, green: 18/255, blue: 60/255),
        Color(red: 225/255, green: 29/255, blue: 72/255),
        Color(red: 219/255, green: 39/255, blue: 119/255),
        Color(red: 244/255, green: 114/255, blue: 182/255)
    ]
}

#Preview {
    let paleta = PaletaFrutosRojosAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Frutos rojos (rojo · frambuesa · rosa)")
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
