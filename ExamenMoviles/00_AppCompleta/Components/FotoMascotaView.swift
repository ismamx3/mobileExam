// ═══════════════════════════════════════════════════════════════
//  FotoMascotaView.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Foto circular de la mascota con borde y sombra.
//              Decide sola qué mostrar:
//                1) la foto que eligió el usuario (UIImage)
//                2) si no hay, la imagen del asset
//                3) si tampoco hay, el ícono (SF Symbol) de su especie
//  ÚSALO PARA: avatar en renglones, foto grande en el detalle.
//  BUSCA:      foto circular, imagen redonda, avatar, clipShape circle,
//              Image(uiImage:), placeholder, sombra, borde
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/FotoMascotaView.swift.
//   2. Pega el archivo completo.
//   3. Úsalo así:  FotoMascotaView(mascota: mascota, tamano: 60)
//  NECESITA:   Model/Mascota.swift, Utils/PaletaMascotas.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FotoMascotaView: View {

    var mascota: Mascota
    var tamano: CGFloat          // ancho y alto del círculo

    var body: some View {
        ZStack {
            // ── 1. Foto elegida con PhotosPicker ──────────────────
            if let fotoBien = mascota.foto {
                Image(uiImage: fotoBien)
                    .resizable(resizingMode: .stretch)
                    // .fill (no .fit) para que la foto LLENE el círculo;
                    // lo que sobra lo recorta el clipShape de abajo.
                    .aspectRatio(contentMode: .fill)

            // ── 2. Imagen del asset ───────────────────────────────
            } else if mascota.imagen != "" {
                Image(mascota.imagen)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)

            // ── 3. Sin imagen: ícono de la especie ────────────────
            } else {
                paletaPrimarioClaro
                Image(systemName: mascota.iconoEspecie)
                    .font(.system(size: tamano * 0.45))
                    .foregroundStyle(paletaPrimario)
            }
        }
        .frame(width: tamano, height: tamano)
        .clipShape(.circle)
        .overlay {
            Circle().stroke(paletaPrimario, lineWidth: tamano > 100 ? 4 : 2)
        }
        .shadow(color: paletaPrimario.opacity(0.3), radius: tamano > 100 ? 8 : 3)
    }
}

#Preview {
    HStack(spacing: 20) {
        FotoMascotaView(mascota: cargarMascotas()[0], tamano: 120)
        FotoMascotaView(mascota: cargarMascotas()[1], tamano: 60)
    }
}
