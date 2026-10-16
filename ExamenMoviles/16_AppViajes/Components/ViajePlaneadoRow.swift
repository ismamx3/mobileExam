// ═══════════════════════════════════════════════════════════════
//  ViajePlaneadoRow.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Renglón de "Mis viajes": portada chica, destino, fechas
//              cortas y cuánto falta ("Faltan 10 días").
//  ÚSALO PARA: renglones de lista con fechas.
//  BUSCA:      row, renglon, viaje, faltan dias, fechas en lista
//
//  CÓMO COPIARLO:
//   1. Components/ViajePlaneadoRow.swift → pega esto.
//  NECESITA:   Model/ViajePlaneado.swift (+ Utils/FechasViajes.swift),
//              Utils/PaletaViajes.swift
//  DE CLASE (Clase 10): variable NO privada y sin @State (solo muestra) y
//     "No agregues padding al stack" del renglón.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ViajePlaneadoRow: View {

    var viaje: ViajePlaneado

    let paleta = PaletaViajes()

    var body: some View {
        HStack(spacing: 12) {
            Image(viaje.imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 64)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 3) {
                Text(viaje.destinoNombre)
                    .font(.headline)
                    .foregroundStyle(paleta.texto)
                Text(viaje.textoFechas)                       // "15 oct – 18 oct"
                    .font(.subheadline)
                    .foregroundStyle(paleta.textoSuave)
                if !viaje.fotos.isEmpty {
                    Label("\(viaje.fotos.count) fotos", systemImage: "photo")
                        .font(.caption)
                        .foregroundStyle(paleta.textoSuave)
                }
            }

            Spacer()

            Text(viaje.estadoTexto)                           // "Faltan 10 días"
                .font(.caption)
                .bold()
                .foregroundStyle(viaje.yaFui ? paleta.secundario : paleta.primario)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    List {
        ViajePlaneadoRow(viaje: viajesDeEjemploViajes()[0])
        ViajePlaneadoRow(viaje: viajesDeEjemploViajes()[1])
    }
}
