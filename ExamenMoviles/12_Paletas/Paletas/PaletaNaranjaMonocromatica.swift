// ═══════════════════════════════════════════════════════════════
//  PaletaNaranjaMonocromatica.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Naranja" (mismo color (mismo tono) en distintas claridades).
//              Modo claro.
//  IDEAL PARA: Comida, antojos, mascotas, apps alegres.
//  BUSCA:      paleta, colores, palette, naranja, orange, monocromatica, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          13.6 : 1
//              textoSuave / fondo     6.9 : 1
//              texto del botón / primario 5.2 : 1
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
// instancia en cada vista con  let paleta = PaletaNaranjaMonocromatica()
struct PaletaNaranjaMonocromatica {
    let fondo = Color(red: 255/255, green: 248/255, blue: 241/255)            // fondo de toda la pantalla
    let superficie = Color(red: 255/255, green: 234/255, blue: 213/255)       // tarjetas, renglones, campos
    let primario = Color(red: 194/255, green: 65/255, blue: 12/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 251/255, green: 146/255, blue: 60/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 74/255, green: 29/255, blue: 6/255)                // títulos y texto principal
    let textoSuave = Color(red: 124/255, green: 74/255, blue: 45/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 124/255, green: 45/255, blue: 18/255),
        Color(red: 194/255, green: 65/255, blue: 12/255),
        Color(red: 249/255, green: 115/255, blue: 22/255),
        Color(red: 251/255, green: 146/255, blue: 60/255),
        Color(red: 253/255, green: 186/255, blue: 116/255)
    ]
}

#Preview {
    let paleta = PaletaNaranjaMonocromatica()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Naranja")
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
