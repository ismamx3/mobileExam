// ═══════════════════════════════════════════════════════════════
//  PaletaTaqueriaAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Taquería (chile · naranja · maíz)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Antojos de Monterrey, tacos, comida mexicana.
//  BUSCA:      paleta, colores, palette, taqueria, tacos, comida mexicana, antojos, chile, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          15.4 : 1
//              textoSuave / fondo     8.1 : 1
//              texto del botón / primario 6.6 : 1
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
// instancia en cada vista con  let paleta = PaletaTaqueriaAnaloga()
struct PaletaTaqueriaAnaloga {
    let fondo = Color(red: 255/255, green: 249/255, blue: 240/255)            // fondo de toda la pantalla
    let superficie = Color(red: 253/255, green: 235/255, blue: 211/255)       // tarjetas, renglones, campos
    let primario = Color(red: 180/255, green: 35/255, blue: 24/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 194/255, green: 65/255, blue: 12/255)         // acentos, detalles, segundo botón
    let texto = Color(red: 61/255, green: 20/255, blue: 7/255)                // títulos y texto principal
    let textoSuave = Color(red: 115/255, green: 64/255, blue: 38/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 138/255, green: 28/255, blue: 18/255),
        Color(red: 180/255, green: 35/255, blue: 24/255),
        Color(red: 217/255, green: 72/255, blue: 15/255),
        Color(red: 224/255, green: 122/255, blue: 16/255),
        Color(red: 242/255, green: 177/255, blue: 52/255)
    ]
}

#Preview {
    let paleta = PaletaTaqueriaAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Taquería (chile · naranja · maíz)")
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
