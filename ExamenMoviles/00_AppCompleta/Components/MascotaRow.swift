// ═══════════════════════════════════════════════════════════════
//  MascotaRow.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El RENGLÓN de la lista: foto, nombre, especie/edad
//              y un ícono a la derecha según si está vacunada.
//  ÚSALO PARA: cada celda de un List o de un ForEach.
//  BUSCA:      renglon, row, celda, cell, componente lista, HStack,
//              Spacer, icono derecha
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/MascotaRow.swift.
//   2. Pega el archivo completo.
//   3. Cambia los textos marcados con ✏️
//  NECESITA:   Model/Mascota.swift, Components/FotoMascotaView.swift,
//              Utils/PaletaMascotas.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct MascotaRow: View {

    // Variable NO privada y sin @State (Clase 10): el renglón solo MUESTRA.
    var mascota: Mascota

    var body: some View {
        HStack(spacing: 14) {

            FotoMascotaView(mascota: mascota, tamano: 56)

            VStack(alignment: .leading, spacing: 4) {
                Text(mascota.nombre)                                  // ✏️
                    .font(.headline)
                    .foregroundStyle(paletaTexto)

                Text("\(mascota.especie) · \(mascota.textoEdad)")     // ✏️
                    .font(.subheadline)
                    .foregroundStyle(paletaTextoSuave)
            }

            Spacer()

            // Operador ternario: condición ? siVerdadero : siFalso
            Image(systemName: mascota.vacunada ? "checkmark.seal.fill" : "exclamationmark.triangle.fill")
                .font(.title3)
                .foregroundStyle(mascota.vacunada ? paletaPrimario : .orange)
        }
        // Sin .padding al HStack: regla de la Clase 10 ("No agregues padding
        // al stack" del renglón). El List ya le da su espacio a cada renglón.
    }
}

#Preview {
    List {
        MascotaRow(mascota: cargarMascotas()[0])
        MascotaRow(mascota: cargarMascotas()[2])
    }
}
