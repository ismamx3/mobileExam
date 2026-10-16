// ═══════════════════════════════════════════════════════════════
//  PartesIgualesView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Dividir en 3 o 4 partes iguales: columnas, renglones, y
//              renglones que adentro tienen columnas. Más 3 botones del
//              mismo ancho en una fila.
//  ÚSALO PARA: "divide la pantalla en 3 secciones", menús de 3 opciones,
//              barras de botones iguales, tableros.
//  BUSCA:      partes iguales, tercios, columnas iguales, renglones iguales, filas iguales,
//              dividir pantalla, 3 columnas, 4 columnas, botones mismo ancho, equal width
//
//  CÓMO COPIARLO:
//   1. Copia SOLO el bloque que quieras (entre las líneas  // ── N. ──).
//   2. Pégalo en el body de tu vista.
//   3. Borra el  .frame(height: …)  marcado con ✏️ DEMO para que use
//      toda la pantalla.
//   4. ¿Quieres 5 partes? Copia y pega otra zona igual. Todas las que
//      lleven maxWidth/maxHeight: .infinity se reparten igual.
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PartesIgualesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. 3 columnas iguales ───────────────────────────────
                // HStack + cada hijo con maxWidth: .infinity → mismo ancho.
                Text("1. 3 columnas iguales")
                    .font(.headline)

                HStack(spacing: 0) {
                    Text("Col 1")                    // ✏️
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.purple.opacity(0.3))
                    Text("Col 2")                    // ✏️
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange.opacity(0.3))
                    Text("Col 3")                    // ✏️
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue.opacity(0.3))
                }
                .frame(height: 120)   // ✏️ DEMO: bórralo para usar toda la pantalla

                // ── 2. 4 columnas iguales con espacio entre ellas ───────
                Text("2. 4 columnas con separación")
                    .font(.headline)

                HStack(spacing: 8) {
                    Text("1")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.purple.opacity(0.3))
                        .cornerRadius(10)
                    Text("2")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange.opacity(0.3))
                        .cornerRadius(10)
                    Text("3")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                    Text("4")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(10)
                }
                .frame(height: 90)    // ✏️ DEMO

                // ── 3. 3 renglones iguales ──────────────────────────────
                // VStack + cada hijo con maxHeight: .infinity → mismo alto.
                Text("3. 3 renglones iguales")
                    .font(.headline)

                VStack(spacing: 0) {
                    Text("Renglón 1")                // ✏️
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.purple.opacity(0.3))
                    Text("Renglón 2")                // ✏️
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange.opacity(0.3))
                    Text("Renglón 3")                // ✏️
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue.opacity(0.3))
                }
                .frame(height: 300)   // ✏️ DEMO: bórralo para usar toda la pantalla

                // ── 4. Renglones iguales con columnas adentro ───────────
                // Renglón 1: 2 columnas · Renglón 2: 3 columnas · Renglón 3: completo.
                // Los 3 renglones miden lo mismo porque los 3 HStack piden maxHeight: .infinity.
                Text("4. Renglones con columnas adentro")
                    .font(.headline)

                VStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Text("A")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.purple.opacity(0.3))
                        Text("B")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.purple.opacity(0.5))
                    }
                    .frame(maxHeight: .infinity)

                    HStack(spacing: 4) {
                        Text("C")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.orange.opacity(0.3))
                        Text("D")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.orange.opacity(0.5))
                        Text("E")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.orange.opacity(0.7))
                    }
                    .frame(maxHeight: .infinity)

                    Text("F (renglón completo)")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue.opacity(0.3))
                }
                .bold()
                .frame(height: 300)   // ✏️ DEMO

                // ── 5. 3 botones del mismo ancho en una fila ────────────
                // El .frame(maxWidth: .infinity) va DENTRO del label; si lo
                // pones afuera, el botón se estira pero su fondo no.
                Text("5. Botones del mismo ancho")
                    .font(.headline)

                HStack(spacing: 10) {
                    Button {
                        // ✏️ acción
                    } label: {
                        Text("Uno")
                            .frame(maxWidth: .infinity)
                    }
                    Button {
                        // ✏️ acción
                    } label: {
                        Text("Dos")
                            .frame(maxWidth: .infinity)
                    }
                    Button {
                        // ✏️ acción
                    } label: {
                        Text("Tres")
                            .frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(.borderedProminent)   // Aplica a los 3 botones de un jalón.
                .tint(.purple)
                .controlSize(.large)
            }
            .padding()
        }
    }
}

#Preview {
    PartesIgualesView()
}
