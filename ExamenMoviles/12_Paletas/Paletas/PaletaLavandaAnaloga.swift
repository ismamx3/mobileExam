// ═══════════════════════════════════════════════════════════════
//  PaletaLavandaAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Lavanda (azul periwinkle · lavanda · lila)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Bienestar, meditación, diarios, notas.
//  BUSCA:      paleta, colores, palette, lavanda, lavender, periwinkle, lila suave, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.1 : 1
//              textoSuave / fondo     6.7 : 1
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
// instancia en cada vista con  let paleta = PaletaLavandaAnaloga()
struct PaletaLavandaAnaloga {
    let fondo = Color(red: 248/255, green: 247/255, blue: 255/255)            // fondo de toda la pantalla
    let superficie = Color(red: 236/255, green: 235/255, blue: 253/255)       // tarjetas, renglones, campos
    let primario = Color(red: 79/255, green: 70/255, blue: 229/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 139/255, green: 92/255, blue: 246/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 35/255, green: 33/255, blue: 79/255)               // títulos y texto principal
    let textoSuave = Color(red: 85/255, green: 83/255, blue: 127/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 55/255, green: 48/255, blue: 163/255),
        Color(red: 79/255, green: 70/255, blue: 229/255),
        Color(red: 99/255, green: 102/255, blue: 241/255),
        Color(red: 139/255, green: 92/255, blue: 246/255),
        Color(red: 192/255, green: 132/255, blue: 252/255)
    ]
}

#Preview {
    let paleta = PaletaLavandaAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Lavanda (azul periwinkle · lavanda · lila)")
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
