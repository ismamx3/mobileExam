// ═══════════════════════════════════════════════════════════════
//  PaletaCineOscuraAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Cine (rojo · coral · naranja)" (colores vecinos en el círculo cromático).
//              Modo oscuro.
//  IDEAL PARA: Películas, series, watchlist, eventos.
//  BUSCA:      paleta, colores, palette, oscuro, dark, cine, movies, rojo naranja, analoga, oscuro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          17.8 : 1
//              textoSuave / fondo     9.1 : 1
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
//  ⚠️ PALETA OSCURA: agrega .preferredColorScheme(.dark) a tu vista
//              raíz (la del TabView). Así los textos que pinta el sistema
//              (ejes de gráficas, barra de estado, teclado) también salen
//              claros. preferredColorScheme no se vio en clase.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Un struct con puras constantes de color. No lleva static: se crea una
// instancia en cada vista con  let paleta = PaletaCineOscuraAnaloga()
struct PaletaCineOscuraAnaloga {
    let fondo = Color(red: 18/255, green: 10/255, blue: 10/255)               // fondo de toda la pantalla
    let superficie = Color(red: 34/255, green: 19/255, blue: 19/255)          // tarjetas, renglones, campos
    let primario = Color(red: 248/255, green: 113/255, blue: 113/255)         // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 251/255, green: 146/255, blue: 60/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 253/255, green: 242/255, blue: 242/255)            // títulos y texto principal
    let textoSuave = Color(red: 201/255, green: 169/255, blue: 169/255)       // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 18/255, green: 10/255, blue: 10/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 220/255, green: 38/255, blue: 38/255),
        Color(red: 239/255, green: 68/255, blue: 68/255),
        Color(red: 248/255, green: 113/255, blue: 113/255),
        Color(red: 249/255, green: 115/255, blue: 22/255),
        Color(red: 251/255, green: 191/255, blue: 36/255)
    ]
}

#Preview {
    let paleta = PaletaCineOscuraAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Cine (rojo · coral · naranja)")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(paleta.texto)
            Text("Análoga · modo oscuro")
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
