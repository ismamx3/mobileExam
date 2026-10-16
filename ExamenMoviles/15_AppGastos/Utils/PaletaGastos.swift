// ═══════════════════════════════════════════════════════════════
//  PaletaGastos.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Los colores de la app "Mis Gastos". Es la paleta
//              "Menta" (ANÁLOGA: esmeralda · verde agua · azul petróleo)
//              copiada de 12_Paletas/Paletas/PaletaMentaAnaloga.swift y
//              renombrada a PaletaGastos. Verde = dinero / finanzas.
//              Cambios: reordené `graficas` y cambié el último color para
//              que las 5 categorías se distingan en la dona, y agregué
//              3 colores de "semáforo" (bien / cuidado / peligro).
//  ÚSALO PARA: ver cómo se usa una paleta de 12_Paletas en una app real.
//  BUSCA:      paleta gastos, colores, palette, analoga, menta, verde,
//              let paleta = PaletaGastos()
//  CONTRASTE (WCAG, ya revisado en 12_Paletas):
//              texto / fondo 13.1 : 1 · textoSuave / fondo 7.1 : 1 ·
//              texto del botón / primario 5.5 : 1
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Utils/ → New File → Swift File → "Paleta".
//   2. Pega el struct y cámbiale el nombre a  struct Paleta {
//   3. En cada vista:  let paleta = Paleta()  y usa paleta.fondo, …
//  NECESITA:   import SwiftUI.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Un struct con puras constantes de color. No lleva static (no se vio en
// clase): cada vista crea su instancia con  let paleta = PaletaGastos()
// y NO lleva @State porque los colores nunca cambian.
struct PaletaGastos {
    let fondo = Color(red: 240/255, green: 253/255, blue: 246/255)            // fondo de toda la pantalla
    let superficie = Color(red: 217/255, green: 247/255, blue: 232/255)       // tarjetas, renglones, campos
    let primario = Color(red: 4/255, green: 120/255, blue: 87/255)            // botones, íconos, pestaña seleccionada (.tint)
    let secundario = Color(red: 14/255, green: 116/255, blue: 144/255)        // acentos, detalles, segundo botón
    let texto = Color(red: 6/255, green: 52/255, blue: 42/255)                // títulos y texto principal
    let textoSuave = Color(red: 47/255, green: 94/255, blue: 82/255)          // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 6/255, green: 95/255, blue: 70/255),
        Color(red: 5/255, green: 150/255, blue: 105/255),
        Color(red: 14/255, green: 116/255, blue: 144/255),
        Color(red: 8/255, green: 145/255, blue: 178/255),
        Color(red: 110/255, green: 231/255, blue: 183/255)
    ]

    // Colores de "semáforo" para el presupuesto. Más oscuros que los del
    // sistema (.green, .orange, .red) para que se lean sobre el fondo claro.
    let bien = Color(red: 4/255, green: 120/255, blue: 87/255)                // verde: vas bien
    let cuidado = Color(red: 194/255, green: 65/255, blue: 12/255)            // naranja: ya casi
    let peligro = Color(red: 185/255, green: 28/255, blue: 28/255)            // rojo: te pasaste
}

#Preview {
    let paleta = PaletaGastos()
    VStack(spacing: 12) {
        HStack(spacing: 0) {
            paleta.fondo
            paleta.superficie
            paleta.primario
            paleta.secundario
            paleta.texto
            paleta.textoSuave
        }
        .frame(height: 60)
        HStack(spacing: 0) {
            paleta.bien
            paleta.cuidado
            paleta.peligro
        }
        .frame(height: 40)
    }
    .padding()
}
