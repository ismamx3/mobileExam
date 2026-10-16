// ═══════════════════════════════════════════════════════════════
//  GastoRow.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El renglón de un gasto en la lista: ícono de la categoría
//              en un círculo + concepto + fecha y método + monto en pesos.
//  ÚSALO PARA: cualquier renglón con dinero (gastos, ventas, pedidos).
//  BUSCA:      row, renglon, celda, componente, gasto, monto, pesos,
//              icono en circulo, HStack, Spacer
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/GastoRow.swift (SwiftUI View).
//   2. Pega el archivo y cambia lo marcado con ✏️.
//  NECESITA:   Model/GastoApp.swift, Utils/PaletaGastos.swift
//  DE CLASE (Clase 10): el renglón recibe el elemento con `var` (sin
//     @State ni private) porque SOLO lo muestra. Y la regla de la lámina:
//     "No agregues padding al stack" del renglón (la List ya pone su margen).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastoRow: View {

    var gasto: GastoApp            // lo recibe de la lista: solo lo muestra

    let paleta = PaletaGastos()

    var body: some View {
        HStack(spacing: 12) {

            // ── 1. Ícono de la categoría en un círculo ──────────
            Image(systemName: gasto.iconoCategoria)
                .font(.headline)
                .foregroundStyle(paleta.primario)
                .frame(width: 42, height: 42)
                .background(paleta.superficie)
                .clipShape(.circle)

            // ── 2. Concepto, fecha y método ─────────────────────
            VStack(alignment: .leading, spacing: 2) {
                Text(gasto.concepto)
                    .font(.headline)
                    .foregroundStyle(paleta.texto)
                Text(gasto.fechaTexto + " · " + gasto.metodoPago)
                    .font(.subheadline)
                    .foregroundStyle(paleta.textoSuave)
            }

            Spacer()

            // ── 3. Monto en pesos ───────────────────────────────
            Text(gasto.montoTexto)
                .font(.headline)
                .foregroundStyle(paleta.texto)
        }
    }
}

#Preview {
    List {
        GastoRow(gasto: cargarGastosApp()[0])
        GastoRow(gasto: cargarGastosApp()[3])
    }
}
