// ═══════════════════════════════════════════════════════════════
//  FilaDatoViajes.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Renglón "ícono · Etiqueta ……… Valor".
//  ÚSALO PARA: datos del detalle (fechas, precio, personas, clima…).
//  BUSCA:      fila, renglon, etiqueta valor, dato, componente
//
//  CÓMO COPIARLO:
//   1. Components/FilaDatoViajes.swift → pega esto.
//   2. FilaDatoViajes(icono: "calendar", etiqueta: "Ida", valor: "15 oct")
//  NECESITA:   Utils/PaletaViajes.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FilaDatoViajes: View {

    var icono: String
    var etiqueta: String
    var valor: String

    let paleta = PaletaViajes()

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icono)
                .foregroundStyle(paleta.secundario)
                .frame(width: 24)
            Text(etiqueta)
                .foregroundStyle(paleta.textoSuave)
            Spacer()                                 // empuja el valor a la derecha
            Text(valor)
                .bold()
                .foregroundStyle(paleta.texto)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    FilaDatoViajes(icono: "thermometer.medium", etiqueta: "Clima", valor: "Cálido")
        .padding()
}
