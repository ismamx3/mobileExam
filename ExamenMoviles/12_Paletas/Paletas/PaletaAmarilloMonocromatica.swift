// ═══════════════════════════════════════════════════════════════
//  PaletaAmarilloMonocromatica.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Amarillo / mostaza" (mismo color (mismo tono) en distintas claridades).
//              Modo claro.
//  IDEAL PARA: Comida rápida, verano, ideas, niños.
//  BUSCA:      paleta, colores, palette, amarillo, yellow, mostaza, dorado, monocromatica, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.1 : 1
//              textoSuave / fondo     7.0 : 1
//              texto del botón / primario 4.9 : 1
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
// instancia en cada vista con  let paleta = PaletaAmarilloMonocromatica()
struct PaletaAmarilloMonocromatica {
    let fondo = Color(red: 255/255, green: 252/255, blue: 235/255)            // fondo de toda la pantalla
    let superficie = Color(red: 254/255, green: 243/255, blue: 199/255)       // tarjetas, renglones, campos
    let primario = Color(red: 161/255, green: 98/255, blue: 7/255)            // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 250/255, green: 204/255, blue: 21/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 66/255, green: 32/255, blue: 6/255)                // títulos y texto principal
    let textoSuave = Color(red: 107/255, green: 84/255, blue: 24/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 113/255, green: 63/255, blue: 18/255),
        Color(red: 161/255, green: 98/255, blue: 7/255),
        Color(red: 202/255, green: 138/255, blue: 4/255),
        Color(red: 234/255, green: 179/255, blue: 8/255),
        Color(red: 253/255, green: 224/255, blue: 71/255)
    ]
}

#Preview {
    let paleta = PaletaAmarilloMonocromatica()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Amarillo / mostaza")
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
