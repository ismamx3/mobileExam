// ═══════════════════════════════════════════════════════════════
//  EvolucionesView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña 3 del ejemplo de clase (Charmander): encabezado,
//              título "Evoluciones" y dos imágenes lado a lado con su
//              nombre abajo.
//  ÚSALO PARA: mostrar 2 (o más) elementos en columnas iguales.
//  BUSCA:      EvolucionesView, evoluciones, dos imagenes lado a lado,
//              columnas, hstack, charmeleon, charizard
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/EvolucionesView.swift (New File > SwiftUI View).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   07_TabView/PokemonEncabezado.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EvolucionesView: View {
    var body: some View {
        VStack(spacing: 0) {

            // ── 1. Encabezado (componente reutilizable) ─────────────
            PokemonEncabezado(nombre: "Charmander", icono: "flame.fill")   // ✏️

            // ── 2. Título ───────────────────────────────────────────
            Text("Evoluciones")
                .font(.headline)
                .padding()

            Divider()

            // ── 3. Dos imágenes lado a lado ─────────────────────────
            // .frame(maxWidth: .infinity) en cada columna = mismo ancho
            HStack {
                VStack(spacing: 12) {
                    // ✏️ En clase: Image("charmeleon") de Assets
                    Image(systemName: "flame.circle.fill")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                        .foregroundStyle(.red)
                    Text("Charmeleon")                             // ✏️
                }
                .frame(maxWidth: .infinity)

                VStack(spacing: 12) {
                    // ✏️ En clase: Image("charizard") de Assets
                    Image(systemName: "bird.fill")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                        .foregroundStyle(.orange)
                    Text("Charizard")                              // ✏️
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 30)

            Spacer()
        }
    }
}

#Preview {
    EvolucionesView()
}
