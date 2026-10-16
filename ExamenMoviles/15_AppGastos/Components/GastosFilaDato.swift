// ═══════════════════════════════════════════════════════════════
//  GastosFilaDato.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Renglón "ícono  Etiqueta ……… Valor" para pantallas de
//              detalle y perfil.
//  ÚSALO PARA: mostrar los datos de un elemento uno debajo de otro.
//  BUSCA:      fila dato, etiqueta valor, label value, renglon detalle,
//              HStack Spacer, componente
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/FilaDato.swift (SwiftUI View).
//   2. Pega el archivo. Úsalo:  GastosFilaDato(icono: "tag", etiqueta: "Categoría", valor: "Comida")
//  NECESITA:   Utils/PaletaGastos.swift
//  DE CLASE (Clase 5A): componente con parámetros. Spacer() empuja el
//     valor a la derecha.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosFilaDato: View {

    var icono: String
    var etiqueta: String
    var valor: String

    let paleta = PaletaGastos()

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icono)
                .foregroundStyle(paleta.primario)
                .frame(width: 26)
            Text(etiqueta)
                .foregroundStyle(paleta.textoSuave)
            Spacer()
            Text(valor)
                .bold()
                .foregroundStyle(paleta.texto)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    VStack {
        GastosFilaDato(icono: "tag.fill", etiqueta: "Categoría", valor: "Comida")
        GastosFilaDato(icono: "calendar", etiqueta: "Fecha", valor: "15 de octubre")
    }
    .padding()
}
