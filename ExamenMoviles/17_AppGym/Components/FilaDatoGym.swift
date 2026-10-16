// ═══════════════════════════════════════════════════════════════
//  FilaDatoGym.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Componente: renglón "ícono  Etiqueta ……… Valor".
//  ÚSALO PARA: los datos de una pantalla de detalle.
//  BUSCA:      fila, renglon, etiqueta valor, label value, detalle, Spacer
//
//  CÓMO COPIARLO:
//   1. Components/ → New File from Template → SwiftUI View.
//   2. Úsalo:  FilaDatoGym(icono: "timer", etiqueta: "Minutos", valor: "30")
//  NECESITA:   Utils/PaletaGym.swift.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FilaDatoGym: View {

    var icono: String
    var etiqueta: String
    var valor: String

    let paleta = PaletaGym()

    var body: some View {
        HStack(spacing: 12) {
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
        FilaDatoGym(icono: "timer", etiqueta: "Minutos", valor: "30")
        FilaDatoGym(icono: "bolt.fill", etiqueta: "Calorías", valor: "343 kcal")
    }
    .padding()
    .background(PaletaGym().fondo)
    .preferredColorScheme(.dark)
}
