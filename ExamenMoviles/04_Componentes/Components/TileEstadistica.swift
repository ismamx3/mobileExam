// ═══════════════════════════════════════════════════════════════
//  TileEstadistica.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Cuadro con un número grande, un ícono y una etiqueta.
//  ÚSALO PARA: dashboards / resúmenes ("12 Jugadores", "4.5 Rating").
//              Pon 2 o 3 en un HStack y se reparten el ancho en partes iguales.
//  BUSCA:      tile, estadistica, dashboard, resumen, numero grande, kpi, tarjeta, componente
//
//  CÓMO SE CREA (en tu proyecto):
//   (pasos de clase) File → New → File from Template... → sección
//   "User Interface" → "SwiftUI View" → Next → nómbralo TileEstadistica.swift
//   → Create (en la carpeta Components/). Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista:
//       HStack(spacing: 12) {
//           TileEstadistica(valor: "12", etiqueta: "Jugadores", icono: "person.3.fill")
//           TileEstadistica(valor: "\(lista.count)", etiqueta: "Total", icono: "number", color: .orange)
//       }
//
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TileEstadistica: View {

    var valor: String          // ✏️ el número, ya como texto: "\(miNumero)"
    var etiqueta: String       // ✏️
    var icono: String          // ✏️ SF Symbol
    var color: Color = .purple

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundStyle(color)

            Text(valor)
                .font(.system(size: 30))
                .bold()

            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        // maxWidth: .infinity → cada tile pide todo el ancho posible.
        // Si hay 3 en un HStack, los 3 piden lo mismo y quedan iguales.
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.12))
        .cornerRadius(16)
    }
}

#Preview {
    HStack(spacing: 12) {
        TileEstadistica(valor: "12", etiqueta: "Jugadores", icono: "person.3.fill")
        TileEstadistica(valor: "4.5", etiqueta: "Rating", icono: "star.fill", color: .orange)
        TileEstadistica(valor: "8", etiqueta: "Fotos", icono: "photo.fill", color: .blue)
    }
    .padding()
}
