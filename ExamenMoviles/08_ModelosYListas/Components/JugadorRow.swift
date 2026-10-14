// ═══════════════════════════════════════════════════════════════
//  JugadorRow.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El RENGLÓN (celda) de la lista, como componente aparte.
//  ÚSALO PARA: el diseño de cada fila de tu List.
//  BUSCA:      row, renglon, celda, cell, fila, componente de lista, corazon favorito
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/JugadorRow.swift (cámbiale el nombre).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift (solo para el #Preview)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct JugadorRow: View {

    // Propiedad simple, sin @State ni private: el renglón solo MUESTRA.
    var jugador: Jugador                         // ✏️ tu modelo

    var body: some View {
        HStack(spacing: 12) {

            // ── 1. Imagen chica con esquinas redondeadas ─────────────
            Image(jugador.imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            // ── 2. Textos uno debajo del otro ────────────────────────
            VStack(alignment: .leading, spacing: 4) {
                Text(jugador.nombreCompleto)             // ✏️ tu campo principal
                    .font(.headline)
                Text("#\(jugador.numero) · \(jugador.posicion)")   // ✏️ tu campo secundario
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            // Spacer empuja lo que sigue hasta la derecha.
            Spacer()

            // ── 3. Ícono que cambia según un Bool ────────────────────
            Image(systemName: jugador.esFavorito ? "heart.fill" : "heart")
                .foregroundStyle(.red)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    List {
        JugadorRow(jugador: cargarJugadores()[0])
        JugadorRow(jugador: cargarJugadores()[1])
    }
}
