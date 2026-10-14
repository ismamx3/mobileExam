// ═══════════════════════════════════════════════════════════════
//  TarjetaInfo.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Tarjeta con un ícono de color, un título y un subtítulo.
//  ÚSALO PARA: menús, opciones, avisos, resúmenes ("Tareas · 3 pendientes").
//  BUSCA:      tarjeta, card, componente, reutilizable, icono, titulo, subtitulo
//
//  CÓMO SE CREA (en tu proyecto):
//   File → New → File from Template → "SwiftUI View" → nómbralo TarjetaInfo
//   → guárdalo en la carpeta Components/. Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista (como si fuera un Text o un Image):
//       TarjetaInfo(icono: "book.fill",
//                   titulo: "Tareas",
//                   subtitulo: "3 pendientes",
//                   color: .purple)
//
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TarjetaInfo: View {

    // Parámetros: sin @State y sin private, porque los manda la vista que lo usa.
    // El componente solo los MUESTRA.
    var icono: String          // ✏️ nombre de un SF Symbol
    var titulo: String
    var subtitulo: String
    var color: Color = .purple // Si no lo mandas, usa morado.

    var body: some View {
        HStack(spacing: 16) {

            Image(systemName: icono)
                .font(.system(size: 26))
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(titulo)
                    .font(.headline)
                Text(subtitulo)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(color.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    VStack(spacing: 12) {
        TarjetaInfo(icono: "book.fill", titulo: "Tareas", subtitulo: "3 pendientes", color: .purple)
        TarjetaInfo(icono: "calendar", titulo: "Examen", subtitulo: "Viernes 16 de octubre", color: .indigo)
        TarjetaInfo(icono: "star.fill", titulo: "Favoritos", subtitulo: "Sin color: usa el de default")
    }
    .padding()
}
