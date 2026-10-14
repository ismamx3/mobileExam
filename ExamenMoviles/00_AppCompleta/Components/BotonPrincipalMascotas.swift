// ═══════════════════════════════════════════════════════════════
//  BotonPrincipalMascotas.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Botón grande de ancho completo, con ícono, que recibe
//              QUÉ HACER como parámetro. Así todos los botones de la
//              app se ven igual y se cambian en un solo lugar.
//  ÚSALO PARA: Guardar, Agregar, Continuar, Ver más…
//  BUSCA:      boton reutilizable, button component, ancho completo,
//              full width, accion como parametro, closure
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/BotonPrincipalMascotas.swift.
//   2. Pega el archivo completo.
//   3. Úsalo así:
//        BotonPrincipalMascotas(titulo: "Guardar", icono: "checkmark") {
//            // lo que hace al tocarlo
//        }
//  NECESITA:   Utils/PaletaMascotas.swift
//  ⚠️ NO VISTO EN CLASE: recibir la acción como parámetro (`() -> Void`).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct BotonPrincipalMascotas: View {

    var titulo: String
    var icono: String

    // ⚠️ NO VISTO EN CLASE: una variable que guarda una FUNCIÓN.
    // `() -> Void` = "función que no recibe nada y no regresa nada".
    // Es lo mismo que Button("Aceptar", action: CalcularValor) de clase,
    // solo que la función nos la pasa la vista que usa el botón.
    var accion: () -> Void

    var body: some View {
        Button(action: accion) {
            Label(titulo, systemImage: icono)
                .font(.headline)
                // El frame va DENTRO del label para que el fondo
                // del botón ocupe todo el ancho.
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .tint(paletaPrimario)
        .controlSize(.large)     // más alto = área táctil cómoda (≥ 44 pt)
    }
}

#Preview {
    VStack {
        BotonPrincipalMascotas(titulo: "Agregar mascota", icono: "plus.circle.fill") {
            print("Tocado")
        }
    }
    .padding()
}
