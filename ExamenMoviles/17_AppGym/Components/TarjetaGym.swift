// ═══════════════════════════════════════════════════════════════
//  TarjetaGym.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Componente: tarjeta con ícono, número grande y etiqueta.
//              Se usa 3 veces en la pestaña Hoy (racha, minutos, calorías).
//  ÚSALO PARA: los "3 cuadritos iguales" de un dashboard (Clase 5A:
//              componente con parámetros).
//  BUSCA:      tarjeta, tile, card, componente, numero grande, estadistica,
//              dashboard, tres iguales
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Components/ → New File from Template → SwiftUI View.
//   2. Pega el archivo. Úsalo así (las 3 en un HStack quedan iguales):
//        HStack { TarjetaGym(valor: "4", etiqueta: "Días", icono: "flame.fill") … }
//  NECESITA:   Utils/PaletaGym.swift.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TarjetaGym: View {

    // Parámetros: var sin @State ni private (los manda quien la usa).
    var valor: String                    // ✏️
    var etiqueta: String
    var icono: String

    let paleta = PaletaGym()

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundStyle(paleta.primario)
            Text(valor)
                .font(.title2)
                .bold()
                .foregroundStyle(paleta.texto)
            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(paleta.textoSuave)
                .multilineTextAlignment(.center)
        }
        // maxWidth .infinity: cada tarjeta pide todo el ancho → en un
        // HStack las 3 se reparten el espacio en partes iguales.
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(paleta.superficie)
        .cornerRadius(16)
    }
}

#Preview {
    HStack(spacing: 12) {
        TarjetaGym(valor: "4", etiqueta: "Días seguidos", icono: "flame.fill")
        TarjetaGym(valor: "190", etiqueta: "Minutos", icono: "timer")
        TarjetaGym(valor: "1,287", etiqueta: "Calorías", icono: "bolt.fill")
    }
    .padding()
    .background(PaletaGym().fondo)
    .preferredColorScheme(.dark)
}
