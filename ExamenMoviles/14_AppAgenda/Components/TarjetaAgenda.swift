// ═══════════════════════════════════════════════════════════════
//  TarjetaAgenda.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Tarjeta chica con ícono + número grande + etiqueta.
//              En Hoy se ponen 3 en un HStack y quedan del MISMO
//              ancho porque cada una lleva .frame(maxWidth: .infinity).
//  ÚSALO PARA: resúmenes ("3 pendientes", "2 vencidos").
//  BUSCA:      tarjeta, tile, resumen, numero grande, 3 iguales, componente
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Components/ → New File → SwiftUI View.
//   2. Pega el struct y úsalo:  TarjetaAgenda(numero: 3, etiqueta: "Hoy",
//      icono: "sun.max.fill", color: .orange)
//  NECESITA:   Utils/PaletaAgenda.swift.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TarjetaAgenda: View {

    // Parámetros (Clase 5A): var sin @State ni private
    var numero: Int
    var etiqueta: String
    var icono: String
    var color: Color

    let paleta = PaletaAgenda()

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .font(.title3)
                .foregroundStyle(color)
            Text("\(numero)")
                .font(.title)
                .bold()
                .foregroundStyle(paleta.texto)
            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(paleta.textoSuave)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)          // ← así las 3 miden lo mismo
        .padding(.vertical, 14)
        .background(paleta.superficie)
        .cornerRadius(16)
    }
}

#Preview {
    HStack(spacing: 12) {
        TarjetaAgenda(numero: 3, etiqueta: "Pendientes hoy", icono: "sun.max.fill", color: .orange)
        TarjetaAgenda(numero: 7, etiqueta: "Esta semana", icono: "calendar", color: .indigo)
        TarjetaAgenda(numero: 1, etiqueta: "Vencidos", icono: "exclamationmark.triangle.fill", color: .red)
    }
    .padding()
}
