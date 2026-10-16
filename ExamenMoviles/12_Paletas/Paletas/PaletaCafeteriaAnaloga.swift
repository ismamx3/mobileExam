// ═══════════════════════════════════════════════════════════════
//  PaletaCafeteriaAnaloga.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta ANÁLOGA "Cafetería (café · caramelo · naranja tostado)" (colores vecinos en el círculo cromático).
//              Modo claro.
//  IDEAL PARA: Cafés, panaderías, libros, lugares para estudiar.
//  BUSCA:      paleta, colores, palette, cafeteria, coffee, caramelo, pan, analoga, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          15.0 : 1
//              textoSuave / fondo     7.1 : 1
//              texto del botón / primario 8.3 : 1
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
// instancia en cada vista con  let paleta = PaletaCafeteriaAnaloga()
struct PaletaCafeteriaAnaloga {
    let fondo = Color(red: 250/255, green: 246/255, blue: 241/255)            // fondo de toda la pantalla
    let superficie = Color(red: 239/255, green: 227/255, blue: 211/255)       // tarjetas, renglones, campos
    let primario = Color(red: 111/255, green: 69/255, blue: 24/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 160/255, green: 82/255, blue: 45/255)         // acentos, detalles, segundo botón
    let texto = Color(red: 46/255, green: 29/255, blue: 14/255)               // títulos y texto principal
    let textoSuave = Color(red: 101/255, green: 80/255, blue: 60/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 78/255, green: 47/255, blue: 18/255),
        Color(red: 111/255, green: 69/255, blue: 24/255),
        Color(red: 147/255, green: 89/255, blue: 31/255),
        Color(red: 180/255, green: 101/255, blue: 42/255),
        Color(red: 210/255, green: 154/255, blue: 92/255)
    ]
}

#Preview {
    let paleta = PaletaCafeteriaAnaloga()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Cafetería (café · caramelo · naranja tostado)")
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
