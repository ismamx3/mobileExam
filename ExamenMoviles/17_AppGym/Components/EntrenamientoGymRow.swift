// ═══════════════════════════════════════════════════════════════
//  EntrenamientoGymRow.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Componente: renglón de un entrenamiento (ícono en círculo,
//              nombre, fecha y minutos, calorías y trofeo si fue récord).
//  ÚSALO PARA: el renglón de cualquier List (Clase 10: componente Row).
//  BUSCA:      row, renglon, celda, componente lista, icono en circulo, record
//
//  CÓMO COPIARLO:
//   1. Components/ → New File from Template → SwiftUI View.
//   2. Pega el archivo y cambia los campos con ✏️.
//  NECESITA:   Model/EntrenamientoGym.swift, Utils/PaletaGym.swift.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EntrenamientoGymRow: View {

    var entrenamiento: EntrenamientoGym        // solo lo muestra → var simple

    let paleta = PaletaGym()

    var body: some View {
        // Clase 10: "No agregues padding al stack" del renglón: la List
        // ya le pone su espacio.
        HStack(spacing: 12) {
            Image(systemName: entrenamiento.icono)
                .font(.title3)
                .foregroundStyle(paleta.textoSobrePrimario)
                .frame(width: 44, height: 44)
                .background(paleta.primario)
                .clipShape(.circle)

            VStack(alignment: .leading, spacing: 3) {
                Text(entrenamiento.ejercicio)                                   // ✏️
                    .font(.headline)
                    .foregroundStyle(paleta.texto)
                Text("\(entrenamiento.fechaTexto) · \(entrenamiento.minutos) min")
                    .font(.subheadline)
                    .foregroundStyle(paleta.textoSuave)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 3) {
                Text("\(entrenamiento.calorias, specifier: "%.0f") kcal")
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(paleta.primario)
                if entrenamiento.esRecord {
                    Image(systemName: "trophy.fill")
                        .foregroundStyle(paleta.secundario)
                }
            }
        }
    }
}

#Preview {
    List {
        EntrenamientoGymRow(entrenamiento: cargarEntrenamientosEjemploGym()[1])
            .listRowBackground(PaletaGym().superficie)
    }
    .scrollContentBackground(.hidden)
    .background(PaletaGym().fondo)
    .preferredColorScheme(.dark)
}
