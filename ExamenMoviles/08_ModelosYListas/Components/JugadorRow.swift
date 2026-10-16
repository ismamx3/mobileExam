// ═══════════════════════════════════════════════════════════════
//  JugadorRow.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El RENGLÓN (celda) de la lista, como componente aparte.
//              Es el JugadorRow de clase: número grande en rojo, nombre y
//              "Mide: 2.00 mts" a la derecha. Vive en la carpeta Components.
//              Abajo viene otra versión con foto (JugadorConImagenRow).
//  ÚSALO PARA: el diseño de cada fila de tu List.
//  BUSCA:      row, renglon, celda, cell, fila, componente, Components, JugadorRow,
//              componente de lista, numero grande, corazon favorito, renglon con foto
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea la carpeta Components y adentro
//      Components/JugadorRow.swift (cámbiale el nombre).
//   2. Pega el archivo completo (o solo el struct que quieras).
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift (solo para el #Preview)
//              JugadorConImagenRow: imágenes "foto1"…"foto4" en Assets.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct JugadorRow: View {

    // Variable NO privada y sin @State: quien usa el renglón le pasa el jugador.
    // JugadorRow(jugador: jugadorItem)
    var jugador: Jugador                         // ✏️ tu modelo

    var body: some View {
        // Regla de clase: un HStack y SIN padding al stack.
        // El List ya le da su espacio a cada renglón.
        HStack {

            // ── 1. Número grande ─────────────────────────────────────
            Text("\(jugador.numero)")                    // ✏️ tu dato principal
                .font(.system(size: 36))
                .bold()
                .foregroundStyle(.red)

            // ── 2. Nombre ────────────────────────────────────────────
            Text("\(jugador.nombre) \(jugador.apellido)")   // ✏️

            // Spacer empuja lo que sigue hasta la derecha.
            Spacer()

            // ── 3. Dato chico a la derecha ───────────────────────────
            Text("Mide: \(jugador.estatura, specifier: "%.2f") mts")   // ✏️
                .font(.caption)
                .foregroundStyle(.gray)

            // ── 4. (Extra) Ícono que cambia según un Bool ────────────
            Image(systemName: jugador.esFavorito ? "heart.fill" : "heart")
                .foregroundStyle(.red)
        }
    }
}

// ── Otra versión: renglón con foto ──────────────────────────────
// Igual que JugadorRow, pero con la imagen del asset a la izquierda.
struct JugadorConImagenRow: View {

    var jugador: Jugador                         // ✏️ tu modelo

    var body: some View {
        HStack(spacing: 12) {
            Image(jugador.imagen)                        // ✏️ campo con el nombre del asset
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 4) {
                Text(jugador.nombreCompleto)             // ✏️
                    .font(.headline)
                Text("#\(jugador.numero) · \(jugador.posicion)")   // ✏️
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: jugador.esFavorito ? "heart.fill" : "heart")
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    List {
        JugadorRow(jugador: cargarJugadores()[0])
        JugadorRow(jugador: cargarJugadores()[3])
        JugadorConImagenRow(jugador: cargarJugadores()[1])
    }
    .listStyle(.inset)
}
