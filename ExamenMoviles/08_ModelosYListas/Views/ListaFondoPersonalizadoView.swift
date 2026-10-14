// ═══════════════════════════════════════════════════════════════
//  ListaFondoPersonalizadoView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista con TU color de fondo y TU color en cada renglón.
//  ÚSALO PARA: que la lista combine con la paleta de tu app (se califica).
//  BUSCA:      fondo lista, list background, color renglon, listRowBackground, scrollContentBackground, paleta
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaFondoPersonalizadoView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (los colores).
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Components/JugadorRow.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaFondoPersonalizadoView: View {

    @State private var jugadores = cargarJugadores()               // ✏️ tus datos

    // Colores de la pantalla (monocromático morado). En tu app ponlos en Utils/.
    let colorFondo  = Color(red: 237/255, green: 231/255, blue: 246/255)   // ✏️
    let colorFila   = Color(red: 250/255, green: 248/255, blue: 255/255)   // ✏️
    let colorTexto  = Color(red:  49/255, green:  27/255, blue:  90/255)   // ✏️

    var body: some View {
        // List dibuja su PROPIO fondo encima del tuyo. Por eso son 3 pasos:
        List(jugadores) { jugadorItem in
            JugadorRow(jugador: jugadorItem)
                .foregroundStyle(colorTexto)          // color del texto del renglón
                .listRowBackground(colorFila)         // 1. color de CADA renglón (va dentro)
        }
        .scrollContentBackground(.hidden)             // 2. apaga el fondo propio del List
        .background(colorFondo)                       // 3. ahora sí se ve el tuyo
        .navigationTitle("Lista con fondo")           // ✏️
    }
}

#Preview {
    NavigationStack {
        ListaFondoPersonalizadoView()
    }
}
