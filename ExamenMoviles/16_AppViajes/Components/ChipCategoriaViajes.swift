// ═══════════════════════════════════════════════════════════════
//  ChipCategoriaViajes.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Un "chip" (botoncito redondeado) de categoría que se pinta
//              distinto cuando está seleccionado.
//  ÚSALO PARA: filtros de categorías arriba de una lista o cuadrícula.
//  BUSCA:      chip, filtro, categoria, seleccionado, boton redondeado,
//              ternario color
//
//  CÓMO COPIARLO:
//   1. Components/ChipCategoriaViajes.swift → pega esto.
//   2. Úsalo como LABEL de un Button (el Button cambia la selección):
//        Button { categoriaElegida = "Playa" } label: {
//            ChipCategoriaViajes(titulo: "Playa", icono: "beach.umbrella.fill",
//                                seleccionado: categoriaElegida == "Playa")
//        }
//  NECESITA:   Utils/PaletaViajes.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ChipCategoriaViajes: View {

    var titulo: String
    var icono: String
    var seleccionado: Bool

    let paleta = PaletaViajes()

    var body: some View {
        // Ternario: si está seleccionado → relleno primario y letra blanca.
        Label(titulo, systemImage: icono)
            .font(.subheadline)
            .padding(.horizontal, 14)
            .padding(.vertical, 9)
            .foregroundStyle(seleccionado ? paleta.textoSobrePrimario : paleta.primario)
            .background(seleccionado ? paleta.primario : paleta.superficie)
            .cornerRadius(20)
    }
}

#Preview {
    HStack {
        ChipCategoriaViajes(titulo: "Todos", icono: "square.grid.2x2.fill", seleccionado: true)
        ChipCategoriaViajes(titulo: "Playa", icono: "beach.umbrella.fill", seleccionado: false)
    }
}
