// ═══════════════════════════════════════════════════════════════
//  DetallesView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña 2 del ejemplo de clase (Charmander): encabezado,
//              título "Detalles", datos separados con Divider y
//              etiquetas de color para Tipo y Debilidades.
//  ÚSALO PARA: ficha / detalle con datos y etiquetas de color.
//  BUSCA:      DetallesView, detalles, ficha, datos, divider, etiquetas,
//              chips, tipo, debilidades, charmander
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/DetallesView.swift (New File > SwiftUI View).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   07_TabView/PokemonEncabezado.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct DetallesView: View {
    var body: some View {
        VStack(spacing: 0) {

            // ── 1. Encabezado (componente reutilizable) ─────────────
            PokemonEncabezado(nombre: "Charmander", icono: "flame.fill")   // ✏️

            VStack(alignment: .leading, spacing: 16) {

                // ── 2. Título ───────────────────────────────────────
                Text("Detalles")
                    .font(.largeTitle)

                Divider()

                // ── 3. Datos ────────────────────────────────────────
                VStack(alignment: .leading, spacing: 4) {
                    Text("Altura: 0.6 m")                          // ✏️
                    Text("Peso: 8.5 kg")
                    Text("Categoría: Lagartija")
                    Text("Habilidad: Mar Llamas")
                }
                .font(.title3)

                Divider()

                // ── 4. Etiquetas de color ───────────────────────────
                HStack {
                    Text("Tipo:")
                    Text("Fuego")                                  // ✏️
                        .bold()
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(Color.orange)
                }

                HStack {
                    Text("Debilidades:")
                    Text("Agua")                                   // ✏️
                        .bold()
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(Color.cyan)
                    Text("Tierra")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(Color.yellow)
                    Text("Roca")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(Color.gray)
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    DetallesView()
}
