// ═══════════════════════════════════════════════════════════════
//  MisViajesView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Mis viajes": lista de los viajes planeados con
//              cuánto falta para cada uno. Se borran deslizando a la
//              izquierda y cada uno abre su detalle (con fotos).
//  ÚSALO PARA: listas que se modifican (borrar, editar en el detalle).
//  BUSCA:      lista editable, List binding, ForEach binding, onDelete,
//              borrar deslizando, swipe, lista vacia, fondo de lista
//
//  CÓMO COPIARLO:
//   1. Views/MisViajesView.swift → pega esto.
//  NECESITA:   Model/ViajePlaneado.swift, Components/ViajePlaneadoRow.swift,
//              Views/DetalleViajeViajesView.swift
//  DE CLASE:   NavigationStack + NavigationLink { } label: { Row } (Clase 10),
//              @Binding a cada elemento con $ (Clase 6B), .listStyle(.inset).
//  ⚠️ NO VISTO EN CLASE: ForEach($viajes) + .onDelete (borrar deslizando),
//     .listRowBackground / .scrollContentBackground(.hidden) (fondo propio).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct MisViajesView: View {

    @Binding var viajes: Array<ViajePlaneado>

    let paleta = PaletaViajes()

    // .onDelete manda las POSICIONES a borrar (IndexSet).
    func borrarViaje(posiciones: IndexSet) {
        viajes.remove(atOffsets: posiciones)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                // ── 1. Lista vacía: mensaje en lugar de una lista en blanco ──
                if viajes.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "suitcase")
                            .font(.system(size: 60))
                        Text("Todavía no tienes viajes.")
                            .font(.headline)
                        Text("Ve a Explorar, elige un destino y toca \"Planear viaje\".")
                            .multilineTextAlignment(.center)
                    }
                    .foregroundStyle(paleta.textoSuave)
                    .padding()
                } else {
                    // ── 2. Lista de viajes ───────────────────────
                    List {
                        // ⚠️ ForEach($viajes) { $viaje in }: cada renglón recibe
                        // un BINDING a su viaje → el detalle lo puede modificar.
                        // Va ForEach dentro de List porque .onDelete solo existe en ForEach.
                        ForEach($viajes) { $viaje in
                            NavigationLink {
                                DetalleViajeViajesView(viaje: $viaje)         // con $: modifica
                            } label: {
                                ViajePlaneadoRow(viaje: viaje)                // sin $: muestra
                            }
                            .listRowBackground(paleta.superficie)
                        }
                        .onDelete(perform: borrarViaje)                       // ⚠️ deslizar para borrar
                    }
                    .listStyle(.inset)
                    .scrollContentBackground(.hidden)                         // ⚠️ quita el fondo gris
                }
            }
            .navigationTitle("Mis viajes")
        }
    }
}

#Preview {
    MisViajesView(viajes: .constant(viajesDeEjemploViajes()))
}
