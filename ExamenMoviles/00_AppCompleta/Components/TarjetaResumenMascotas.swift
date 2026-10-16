// ═══════════════════════════════════════════════════════════════
//  TarjetaResumenMascotas.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Tarjeta chica con ícono, un número grande y una etiqueta.
//              Ocupa todo el ancho que le den, así que 3 en un HStack
//              quedan del MISMO tamaño (pantalla dividida en 3 iguales).
//  ÚSALO PARA: totales, resúmenes, dashboard, "stat tile", KPIs.
//  BUSCA:      tarjeta, card, tile, resumen, total, estadistica, numero
//              grande, dividir en 3, columnas iguales, maxWidth infinity
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/TarjetaResumenMascotas.swift.
//   2. Pega el archivo completo.
//   3. Úsalo así:
//        HStack(spacing: 12) {
//            TarjetaResumenMascotas(numero: "6", etiqueta: "Total", icono: "pawprint.fill")
//            TarjetaResumenMascotas(numero: "4", etiqueta: "Vacunadas", icono: "checkmark.seal.fill")
//            TarjetaResumenMascotas(numero: "6.5", etiqueta: "Kg prom.", icono: "scalemass.fill")
//        }
//  NECESITA:   Utils/PaletaMascotas.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TarjetaResumenMascotas: View {

    var numero: String
    var etiqueta: String
    var icono: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundStyle(paletaPrimario)

            Text(numero)
                .font(.title)
                .bold()
                .foregroundStyle(paletaTexto)

            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(paletaTextoSuave)
                .multilineTextAlignment(.center)
        }
        // Este frame es el truco de las columnas iguales:
        // cada tarjeta pide "todo el ancho posible" y el HStack
        // reparte el espacio en partes iguales.
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(paletaSuperficie)
        .cornerRadius(16)
        .shadow(color: paletaPrimario.opacity(0.12), radius: 6)     // forma de clase 5A
    }
}

#Preview {
    HStack(spacing: 12) {
        TarjetaResumenMascotas(numero: "6", etiqueta: "Total", icono: "pawprint.fill")
        TarjetaResumenMascotas(numero: "4", etiqueta: "Vacunadas", icono: "checkmark.seal.fill")
        TarjetaResumenMascotas(numero: "6.5", etiqueta: "Kg promedio", icono: "scalemass.fill")
    }
    .padding()
    .background(paletaFondo)
}
