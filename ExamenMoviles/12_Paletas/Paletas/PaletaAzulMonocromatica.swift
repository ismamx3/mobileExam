// ═══════════════════════════════════════════════════════════════
//  PaletaAzulMonocromatica.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paleta MONOCROMÁTICA "Azul" (mismo color (mismo tono) en distintas claridades).
//              Modo claro.
//  IDEAL PARA: Viajes, clima, finanzas, salud, apps serias.
//  BUSCA:      paleta, colores, palette, azul, blue, celeste, monocromatica, claro
//  CONTRASTE (WCAG, ya revisado):
//              texto / fondo          13.8 : 1
//              textoSuave / fondo     6.5 : 1
//              texto del botón / primario 6.7 : 1
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
// instancia en cada vista con  let paleta = PaletaAzulMonocromatica()
struct PaletaAzulMonocromatica {
    let fondo = Color(red: 243/255, green: 248/255, blue: 255/255)            // fondo de toda la pantalla
    let superficie = Color(red: 225/255, green: 238/255, blue: 255/255)       // tarjetas, renglones, campos
    let primario = Color(red: 29/255, green: 78/255, blue: 216/255)           // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 96/255, green: 165/255, blue: 250/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 11/255, green: 37/255, blue: 89/255)               // títulos y texto principal
    let textoSuave = Color(red: 58/255, green: 90/255, blue: 140/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 30/255, green: 58/255, blue: 138/255),
        Color(red: 29/255, green: 78/255, blue: 216/255),
        Color(red: 59/255, green: 130/255, blue: 246/255),
        Color(red: 96/255, green: 165/255, blue: 250/255),
        Color(red: 147/255, green: 197/255, blue: 253/255)
    ]
}

#Preview {
    let paleta = PaletaAzulMonocromatica()
    ZStack {
        paleta.fondo
            .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 16) {
            Text("Azul")
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
