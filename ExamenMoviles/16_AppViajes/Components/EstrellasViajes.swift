// ═══════════════════════════════════════════════════════════════
//  EstrellasViajes.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Muestra la calificación (1 a 5) con estrellas llenas y
//              vacías de SF Symbols.
//  ÚSALO PARA: rating de lugares, películas, restaurantes…
//  BUSCA:      estrellas, rating, calificacion, star.fill, star
//
//  CÓMO COPIARLO:
//   1. Components/EstrellasViajes.swift → pega esto.
//   2. Úsalo así:  EstrellasViajes(calificacion: 4)
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: ForEach(1...5, id: \.self) repite la estrella 5
//     veces. Alternativa de clase: Text(String(repeating: "⭐️", count: n)).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EstrellasViajes: View {

    var calificacion: Int               // ✏️ de 1 a 5

    var body: some View {
        HStack(spacing: 3) {
            // ⚠️ ForEach: numero va de 1 a 5. Si numero <= calificación → llena.
            ForEach(1...5, id: \.self) { numero in
                Image(systemName: numero <= calificacion ? "star.fill" : "star")
                    .foregroundStyle(Color.orange)
            }
            Text("\(calificacion) de 5")
                .font(.caption)
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    EstrellasViajes(calificacion: 4)
}
