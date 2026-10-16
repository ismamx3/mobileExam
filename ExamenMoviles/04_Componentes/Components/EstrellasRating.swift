// ═══════════════════════════════════════════════════════════════
//  EstrellasRating.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Fila de estrellas llenas, medias y vacías según una
//              calificación (ej. 3.5 de 5 → ★★★⯨☆) y el número al lado.
//  ÚSALO PARA: rating de canciones, películas, restaurantes, jugadores.
//  BUSCA:      estrellas, rating, calificacion, star, puntuacion, componente
//
//  CÓMO SE CREA (en tu proyecto):
//   (pasos de clase) File → New → File from Template... → sección
//   "User Interface" → "SwiftUI View" → Next → nómbralo EstrellasRating.swift
//   → Create (en la carpeta Components/). Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista:
//       EstrellasRating(calificacion: 4.5)
//       EstrellasRating(calificacion: cancion.rating, color: .purple)
//       EstrellasRating(calificacion: Double(miInt))      // si tu dato es Int
//
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: ForEach(1...maximo, id: \.self) para repetir la estrella.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EstrellasRating: View {

    var calificacion: Double   // ✏️ de 0 a maximo (acepta medios: 3.5)
    var maximo: Int = 5
    var color: Color = .orange

    var body: some View {
        HStack(spacing: 4) {
            // ⚠️ NO VISTO EN CLASE: ForEach repite la vista de adentro una vez
            // por cada número del 1 al máximo (aquí, 5 estrellas).
            // id: \.self porque los números 1, 2, 3… ya son únicos.
            ForEach(1...maximo, id: \.self) { numero in
                Image(systemName: nombreEstrella(numero: numero))
                    .foregroundStyle(color)
            }

            Text("\(calificacion, specifier: "%.1f")")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.leading, 4)
        }
    }

    // Decide qué ícono le toca a la estrella número "numero".
    func nombreEstrella(numero: Int) -> String {
        if Double(numero) <= calificacion {
            return "star.fill"                  // llena
        } else if Double(numero) - 0.5 <= calificacion {
            return "star.leadinghalf.filled"    // media
        } else {
            return "star"                       // vacía
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 12) {
        EstrellasRating(calificacion: 5)
        EstrellasRating(calificacion: 3.5)
        EstrellasRating(calificacion: 2, color: .purple)
    }
    .padding()
}
