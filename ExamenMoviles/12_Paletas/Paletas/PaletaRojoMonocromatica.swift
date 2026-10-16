// ═══════════════════════════════════════════════════════════════
//  PaletaRojoMonocromatica.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Rojo" (mismo color (mismo tono) en distintas claridades).
//              Modo claro.
//  IDEAL PARA: Comida, deportes, películas, alertas.
//  BUSCA:      paleta, colores, palette, rojo, red, carmesi, monocromatica, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.4 : 1
//              textoSuave / fondo     7.6 : 1
//              texto del botón / primario 6.5 : 1
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
// instancia en cada vista con  let paleta = PaletaRojoMonocromatica()
struct PaletaRojoMonocromatica {
    let fondo = Color(red: 255/255, green: 245/255, blue: 245/255)            // fondo de toda la pantalla
    let superficie = Color(red: 255/255, green: 228/255, blue: 228/255)       // tarjetas, renglones, campos
    let primario = Color(red: 185/255, green: 28/255, blue: 28/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 248/255, green: 113/255, blue: 113/255)       // acentos, detalles, segundo botón
    let texto = Color(red: 76/255, green: 11/255, blue: 11/255)               // títulos y texto principal
    let textoSuave = Color(red: 127/255, green: 59/255, blue: 59/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 127/255, green: 29/255, blue: 29/255),
        Color(red: 185/255, green: 28/255, blue: 28/255),
        Color(red: 239/255, green: 68/255, blue: 68/255),
        Color(red: 248/255, green: 113/255, blue: 113/255),
        Color(red: 252/255, green: 165/255, blue: 165/255)
    ]
}

#Preview {
    let paleta = PaletaRojoMonocromatica()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Rojo")
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
