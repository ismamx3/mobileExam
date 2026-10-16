// ═══════════════════════════════════════════════════════════════
//  PaletaGrisMonocromatica.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Gris" (mismo color (mismo tono) en distintas claridades).
//              Modo claro.
//  IDEAL PARA: Apps serias, herramientas, tecnología, minimalista.
//  BUSCA:      paleta, colores, palette, gris, gray, neutro, minimalista, monocromatica, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          16.5 : 1
//              textoSuave / fondo     7.1 : 1
//              texto del botón / primario 10.3 : 1
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
// instancia en cada vista con  let paleta = PaletaGrisMonocromatica()
struct PaletaGrisMonocromatica {
    let fondo = Color(red: 246/255, green: 247/255, blue: 249/255)            // fondo de toda la pantalla
    let superficie = Color(red: 231/255, green: 234/255, blue: 238/255)       // tarjetas, renglones, campos
    let primario = Color(red: 55/255, green: 65/255, blue: 81/255)            // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 156/255, green: 163/255, blue: 175/255)       // acentos, detalles, segundo botón
    let texto = Color(red: 17/255, green: 24/255, blue: 39/255)               // títulos y texto principal
    let textoSuave = Color(red: 75/255, green: 85/255, blue: 99/255)          // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 31/255, green: 41/255, blue: 55/255),
        Color(red: 55/255, green: 65/255, blue: 81/255),
        Color(red: 107/255, green: 114/255, blue: 128/255),
        Color(red: 156/255, green: 163/255, blue: 175/255),
        Color(red: 209/255, green: 213/255, blue: 219/255)
    ]
}

#Preview {
    let paleta = PaletaGrisMonocromatica()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Gris")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(paleta.texto)
            Text("Monocromática · modo claro")
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
