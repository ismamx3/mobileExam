// ═══════════════════════════════════════════════════════════════
//  PaletaRosaMonocromatica.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Rosa" (mismo color (mismo tono) en distintas claridades).
//              Modo claro.
//  IDEAL PARA: Postres, belleza, regalos, música pop.
//  BUSCA:      paleta, colores, palette, rosa, pink, fucsia, monocromatica, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.1 : 1
//              textoSuave / fondo     6.9 : 1
//              texto del botón / primario 6.0 : 1
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
// instancia en cada vista con  let paleta = PaletaRosaMonocromatica()
struct PaletaRosaMonocromatica {
    let fondo = Color(red: 255/255, green: 245/255, blue: 249/255)            // fondo de toda la pantalla
    let superficie = Color(red: 252/255, green: 228/255, blue: 239/255)       // tarjetas, renglones, campos
    let primario = Color(red: 190/255, green: 24/255, blue: 93/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 244/255, green: 114/255, blue: 182/255)       // acentos, detalles, segundo botón
    let texto = Color(red: 80/255, green: 7/255, blue: 36/255)                // títulos y texto principal
    let textoSuave = Color(red: 131/255, green: 64/255, blue: 94/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 131/255, green: 24/255, blue: 67/255),
        Color(red: 190/255, green: 24/255, blue: 93/255),
        Color(red: 236/255, green: 72/255, blue: 153/255),
        Color(red: 244/255, green: 114/255, blue: 182/255),
        Color(red: 249/255, green: 168/255, blue: 212/255)
    ]
}

#Preview {
    let paleta = PaletaRosaMonocromatica()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Rosa")
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
