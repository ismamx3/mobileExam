// ═══════════════════════════════════════════════════════════════
//  PaletaMoradoMonocromatica.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Morado" (mismo color (mismo tono) en distintas claridades).
//              Modo claro.
//  IDEAL PARA: Apps de estudio, música, tareas, cualquier tema.
//  BUSCA:      paleta, colores, palette, morado, purple, violeta, lila, monocromatica, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          14.1 : 1
//              textoSuave / fondo     6.9 : 1
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
// instancia en cada vista con  let paleta = PaletaMoradoMonocromatica()
struct PaletaMoradoMonocromatica {
    let fondo = Color(red: 247/255, green: 245/255, blue: 255/255)            // fondo de toda la pantalla
    let superficie = Color(red: 237/255, green: 231/255, blue: 255/255)       // tarjetas, renglones, campos
    let primario = Color(red: 109/255, green: 40/255, blue: 217/255)          // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 167/255, green: 139/255, blue: 250/255)       // acentos, detalles, segundo botón
    let texto = Color(red: 46/255, green: 16/255, blue: 101/255)              // títulos y texto principal
    let textoSuave = Color(red: 91/255, green: 75/255, blue: 138/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 76/255, green: 29/255, blue: 149/255),
        Color(red: 109/255, green: 40/255, blue: 217/255),
        Color(red: 139/255, green: 92/255, blue: 246/255),
        Color(red: 167/255, green: 139/255, blue: 250/255),
        Color(red: 196/255, green: 181/255, blue: 253/255)
    ]
}

#Preview {
    let paleta = PaletaMoradoMonocromatica()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Morado")
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
