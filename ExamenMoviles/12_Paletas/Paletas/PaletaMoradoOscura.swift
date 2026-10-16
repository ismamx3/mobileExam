// ═══════════════════════════════════════════════════════════════
//  PaletaMoradoOscura.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Morado oscuro" (mismo color (mismo tono) en distintas claridades).
//              Modo oscuro.
//  IDEAL PARA: Videojuegos, música, fiestas, cine.
//  BUSCA:      paleta, colores, palette, oscuro, dark, morado, purple, monocromatica, oscuro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          17.4 : 1
//              textoSuave / fondo     9.1 : 1
//              texto del botón / primario 7.0 : 1
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
//  ⚠️ PALETA OSCURA: agrega .preferredColorScheme(.dark) a tu vista
//              raíz (la del TabView). Así los textos que pinta el sistema
//              (ejes de gráficas, barra de estado, teclado) también salen
//              claros. preferredColorScheme no se vio en clase.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Un struct con puras constantes de color. No lleva static: se crea una
// instancia en cada vista con  let paleta = PaletaMoradoOscura()
struct PaletaMoradoOscura {
    let fondo = Color(red: 20/255, green: 11/255, blue: 36/255)               // fondo de toda la pantalla
    let superficie = Color(red: 34/255, green: 21/255, blue: 58/255)          // tarjetas, renglones, campos
    let primario = Color(red: 167/255, green: 139/255, blue: 250/255)         // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 196/255, green: 181/255, blue: 253/255)       // acentos, detalles, segundo botón
    let texto = Color(red: 245/255, green: 243/255, blue: 255/255)            // títulos y texto principal
    let textoSuave = Color(red: 184/255, green: 174/255, blue: 214/255)       // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 20/255, green: 11/255, blue: 36/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 109/255, green: 40/255, blue: 217/255),
        Color(red: 139/255, green: 92/255, blue: 246/255),
        Color(red: 167/255, green: 139/255, blue: 250/255),
        Color(red: 196/255, green: 181/255, blue: 253/255),
        Color(red: 221/255, green: 214/255, blue: 254/255)
    ]
}

#Preview {
    let paleta = PaletaMoradoOscura()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Morado oscuro")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(paleta.texto)
            Text("Monocromática · modo oscuro")
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
    .preferredColorScheme(.dark)
}
