// ═══════════════════════════════════════════════════════════════
//  PaletaCafeMonocromatica.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Café" (mismo color (mismo tono) en distintas claridades).
//              Modo claro.
//  IDEAL PARA: Cafeterías, libros, recetas, madera.
//  BUSCA:      paleta, colores, palette, cafe, brown, marron, chocolate, monocromatica, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          13.6 : 1
//              textoSuave / fondo     7.1 : 1
//              texto del botón / primario 7.3 : 1
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
// instancia en cada vista con  let paleta = PaletaCafeMonocromatica()
struct PaletaCafeMonocromatica {
    let fondo = Color(red: 251/255, green: 247/255, blue: 243/255)            // fondo de toda la pantalla
    let superficie = Color(red: 241/255, green: 230/255, blue: 218/255)       // tarjetas, renglones, campos
    let primario = Color(red: 124/255, green: 74/255, blue: 33/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 192/255, green: 138/255, blue: 90/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 59/255, green: 36/255, blue: 18/255)               // títulos y texto principal
    let textoSuave = Color(red: 107/255, green: 78/255, blue: 54/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 74/255, green: 44/255, blue: 20/255),
        Color(red: 124/255, green: 74/255, blue: 33/255),
        Color(red: 160/255, green: 103/255, blue: 58/255),
        Color(red: 192/255, green: 138/255, blue: 90/255),
        Color(red: 221/255, green: 187/255, blue: 152/255)
    ]
}

#Preview {
    let paleta = PaletaCafeMonocromatica()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Café")
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
