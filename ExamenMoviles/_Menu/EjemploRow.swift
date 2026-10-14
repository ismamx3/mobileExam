// ═══════════════════════════════════════════════════════════════
//  EjemploRow.swift  ·  _Menu (infraestructura del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo dibuja cada renglón del menú.
//  Muestra el título del ejemplo y el ARCHIVO donde está el código,
//  para que lo encuentres rápido con ⌘⇧O (Open Quickly).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EjemploRow: View {

    var titulo: String
    var archivo: String
    var icono: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icono)
                .font(.title3)
                .foregroundStyle(.purple)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 2) {
                Text(titulo)
                    .font(.headline)
                Text(archivo)
                    .font(.caption)
                    .monospaced()
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    List {
        EjemploRow(titulo: "Botones", archivo: "03_ElementosUI/BotonesView.swift", icono: "hand.tap")
    }
}
