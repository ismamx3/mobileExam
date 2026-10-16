// ═══════════════════════════════════════════════════════════════
//  GastosTarjetaResumen.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Tarjeta chiquita con ícono + número grande + etiqueta.
//              Se usa 3 veces en un HStack y las 3 quedan del MISMO ancho.
//  ÚSALO PARA: tableros/resúmenes ("Total", "Promedio", "Mayor").
//  BUSCA:      tarjeta, tile, componente, resumen, 3 tarjetas iguales,
//              mismo ancho, maxWidth infinity, parametros
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/TarjetaResumen.swift (SwiftUI View).
//   2. Pega el archivo. Úsala así dentro de un HStack:
//        GastosTarjetaResumen(icono: "sum", valor: "$1,200", etiqueta: "Total")
//  NECESITA:   Utils/PaletaGastos.swift
//  DE CLASE (Clase 5A): componente con parámetros (var sin @State ni
//     private). El truco del MISMO ancho: .frame(maxWidth: .infinity) en
//     cada tarjeta → el HStack reparte el espacio en partes iguales.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosTarjetaResumen: View {

    var icono: String           // ✏️ SF Symbol
    var valor: String           // ✏️ ya formateado ("$1,200.00", "8")
    var etiqueta: String        // ✏️ "Total del mes"

    let paleta = PaletaGastos()

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .font(.title3)
                .foregroundStyle(paleta.secundario)
            Text(valor)
                .font(.headline)
                .bold()
                .foregroundStyle(paleta.texto)
                .minimumScaleFactor(0.6)      // ⚠️ NO VISTO EN CLASE: achica el texto si no cabe
                .lineLimit(1)
            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(paleta.textoSuave)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 6)
        .frame(maxWidth: .infinity)           // ← las 3 tarjetas del mismo ancho
        .background(paleta.superficie)
        .cornerRadius(16)
    }
}

#Preview {
    HStack(spacing: 10) {
        GastosTarjetaResumen(icono: "sum", valor: "$2,450.00", etiqueta: "Total del mes")
        GastosTarjetaResumen(icono: "divide", valor: "$175.00", etiqueta: "Promedio")
        GastosTarjetaResumen(icono: "arrow.up.circle.fill", valor: "$950.00", etiqueta: "Gasto mayor")
    }
    .padding()
}
