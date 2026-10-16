// ═══════════════════════════════════════════════════════════════
//  TarjetaDestinoViajes.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Tarjeta de un destino: foto con el nombre ENCIMA
//              (ZStack) sobre una franja oscura para que se lea.
//  ÚSALO PARA: cuadrículas de productos, lugares, películas…
//  BUSCA:      tarjeta, card, texto sobre imagen, ZStack, foto con texto,
//              franja oscura, componente
//
//  CÓMO COPIARLO:
//   1. Components/TarjetaDestinoViajes.swift → pega esto.
//   2. Cambia el tipo DestinoViajes por tu modelo (✏️).
//  NECESITA:   Model/DestinoViajes.swift, Utils/PaletaViajes.swift
//  ⚠️ NO VISTO EN CLASE: ZStack(alignment: .bottomLeading) (acomoda las
//     capas abajo a la izquierda) y .lineLimit(1).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TarjetaDestinoViajes: View {

    var destino: DestinoViajes          // ✏️ tu modelo (sin @State: solo muestra)

    var body: some View {
        // ⚠️ ZStack(alignment:): lo que está encima se pega abajo a la izquierda.
        ZStack(alignment: .bottomLeading) {

            // Capa 1 (abajo): la foto, con el orden de modificadores de clase.
            Image(destino.imagenPrincipal)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)

            // Capa 2 (encima): franja oscura semitransparente + textos blancos.
            // Sin la franja, el texto blanco no se leería sobre una foto clara.
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(destino.nombre)
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .lineLimit(1)
                    Text(destino.estado)
                        .font(.caption)
                        .foregroundStyle(Color.white.opacity(0.9))
                        .lineLimit(1)
                }
                Spacer()
                if destino.favorito {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(Color.white)
                }
            }
            .padding(8)
            .background(Color.black.opacity(0.45))
        }
        .cornerRadius(14)
    }
}

#Preview {
    TarjetaDestinoViajes(destino: destinoDePruebaViajes())
        .frame(width: 180)
}
