// ═══════════════════════════════════════════════════════════════
//  PaletaAgenda.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Los colores de la app Agenda en UN solo lugar.
//              Es la paleta "Lavanda" ANÁLOGA de 12_Paletas
//              (azul periwinkle · lavanda · lila = colores vecinos).
//  ÚSALO PARA: pintar toda la app. En cada vista:
//                  let paleta = PaletaAgenda()
//              y luego paleta.fondo, paleta.primario, paleta.texto…
//  BUSCA:      paleta agenda, colores, utils, lavanda, analoga
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Utils/ → New File → Swift File → "Paleta".
//   2. Pega el struct y cámbiale el nombre (ej. struct Paleta).
//   3. En cada vista:  let paleta = Paleta()
//  NECESITA:   nada más.
//  CONTRASTE (WCAG): texto/fondo 14.1:1 · textoSuave/fondo 6.7:1 ·
//              texto del botón/primario 6.3:1 (mínimo 4.5:1).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Un struct con puras constantes (let). No lleva static (no se vio en
// clase) ni @State (los colores no cambian): cada vista crea una
// instancia con  let paleta = PaletaAgenda()
struct PaletaAgenda {
    let fondo = Color(red: 248/255, green: 247/255, blue: 255/255)            // fondo de toda la pantalla
    let superficie = Color(red: 236/255, green: 235/255, blue: 253/255)       // tarjetas, renglones
    let primario = Color(red: 79/255, green: 70/255, blue: 229/255)           // botones, íconos, .tint
    let secundario = Color(red: 139/255, green: 92/255, blue: 246/255)        // acentos
    let texto = Color(red: 35/255, green: 33/255, blue: 79/255)               // títulos y texto principal
    let textoSuave = Color(red: 85/255, green: 83/255, blue: 127/255)         // subtítulos, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto encima del botón primario
    let alerta = Color(red: 185/255, green: 28/255, blue: 28/255)             // vencidos / prioridad alta
    let exito = Color(red: 21/255, green: 128/255, blue: 61/255)              // completados
    let graficas = [                                                          // colores para gráficas, en orden
        Color(red: 55/255, green: 48/255, blue: 163/255),
        Color(red: 79/255, green: 70/255, blue: 229/255),
        Color(red: 99/255, green: 102/255, blue: 241/255),
        Color(red: 139/255, green: 92/255, blue: 246/255),
        Color(red: 192/255, green: 132/255, blue: 252/255)
    ]
}

#Preview {
    let paleta = PaletaAgenda()
    VStack(spacing: 12) {
        Text("Paleta de la Agenda")
            .font(.title)
            .bold()
            .foregroundStyle(paleta.texto)
        HStack(spacing: 0) {
            paleta.fondo
            paleta.superficie
            paleta.primario
            paleta.secundario
            paleta.texto
            paleta.textoSuave
            paleta.alerta
            paleta.exito
        }
        .frame(height: 50)
        .cornerRadius(10)
    }
    .padding()
}
