// ═══════════════════════════════════════════════════════════════
//  PaletaOceanoAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Océano (azul · turquesa · verde agua)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Viajes, playa, clima, salud.
//  BUSCA:      paleta, colores, palette, oceano, mar, ocean, azul turquesa, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          13.9 : 1
//              textoSuave / fondo     6.8 : 1
//              texto del botón / primario 5.9 : 1
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
// instancia en cada vista con  let paleta = PaletaOceanoAnaloga()
struct PaletaOceanoAnaloga {
    let fondo = Color(red: 240/255, green: 249/255, blue: 255/255)            // fondo de toda la pantalla
    let superficie = Color(red: 223/255, green: 243/255, blue: 251/255)       // tarjetas, renglones, campos
    let primario = Color(red: 3/255, green: 105/255, blue: 161/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 13/255, green: 148/255, blue: 136/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 12/255, green: 42/255, blue: 62/255)               // títulos y texto principal
    let textoSuave = Color(red: 54/255, green: 91/255, blue: 112/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 30/255, green: 64/255, blue: 175/255),
        Color(red: 3/255, green: 105/255, blue: 161/255),
        Color(red: 8/255, green: 145/255, blue: 178/255),
        Color(red: 13/255, green: 148/255, blue: 136/255),
        Color(red: 52/255, green: 211/255, blue: 153/255)
    ]
}

#Preview {
    let paleta = PaletaOceanoAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Océano (azul · turquesa · verde agua)")
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
