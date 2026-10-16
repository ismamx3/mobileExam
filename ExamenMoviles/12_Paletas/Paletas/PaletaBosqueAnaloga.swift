// ═══════════════════════════════════════════════════════════════
//  PaletaBosqueAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Bosque (verde olivo · verde · turquesa)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Naturaleza, plantas, senderismo, ecología.
//  BUSCA:      paleta, colores, palette, bosque, forest, olivo, naturaleza, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          13.8 : 1
//              textoSuave / fondo     6.8 : 1
//              texto del botón / primario 7.1 : 1
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
// instancia en cada vista con  let paleta = PaletaBosqueAnaloga()
struct PaletaBosqueAnaloga {
    let fondo = Color(red: 244/255, green: 250/255, blue: 242/255)            // fondo de toda la pantalla
    let superficie = Color(red: 227/255, green: 241/255, blue: 220/255)       // tarjetas, renglones, campos
    let primario = Color(red: 63/255, green: 98/255, blue: 18/255)            // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 21/255, green: 128/255, blue: 61/255)         // acentos, detalles, segundo botón
    let texto = Color(red: 26/255, green: 46/255, blue: 11/255)               // títulos y texto principal
    let textoSuave = Color(red: 74/255, green: 93/255, blue: 58/255)          // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 54/255, green: 83/255, blue: 20/255),
        Color(red: 77/255, green: 124/255, blue: 15/255),
        Color(red: 101/255, green: 163/255, blue: 13/255),
        Color(red: 21/255, green: 128/255, blue: 61/255),
        Color(red: 15/255, green: 118/255, blue: 110/255)
    ]
}

#Preview {
    let paleta = PaletaBosqueAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Bosque (verde olivo · verde · turquesa)")
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
