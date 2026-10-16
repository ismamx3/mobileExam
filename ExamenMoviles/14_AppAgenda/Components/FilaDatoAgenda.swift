// ═══════════════════════════════════════════════════════════════
//  FilaDatoAgenda.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Renglón "Etiqueta ……… Valor" con ícono. En el detalle
//              muestra la fecha en varios formatos, una por fila.
//  ÚSALO PARA: pantallas de detalle, perfil, resultados.
//  BUSCA:      fila dato, etiqueta valor, renglon detalle, componente
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Components/ → New File → SwiftUI View.
//   2. Úsalo:  FilaDatoAgenda(icono: "clock", etiqueta: "Hora", valor: "6:00 p.m.")
//  NECESITA:   Utils/PaletaAgenda.swift.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FilaDatoAgenda: View {

    var icono: String
    var etiqueta: String
    var valor: String

    let paleta = PaletaAgenda()

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icono)
                .foregroundStyle(paleta.primario)
                .frame(width: 24)
            Text(etiqueta)
                .foregroundStyle(paleta.textoSuave)
            Spacer()                                  // empuja el valor a la derecha
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
        FilaDatoAgenda(icono: "calendar", etiqueta: "Fecha", valor: "15 de octubre de 2026")
        FilaDatoAgenda(icono: "clock", etiqueta: "Hora", valor: "6:00 p.m.")
    }
    .padding()
}
