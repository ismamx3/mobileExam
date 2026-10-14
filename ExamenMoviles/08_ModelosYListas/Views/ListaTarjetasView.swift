// ═══════════════════════════════════════════════════════════════
//  ListaTarjetasView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     "Lista" SIN List: ScrollView + ForEach con tarjetas grandes.
//  ÚSALO PARA: cuando quieres diseño libre (tarjetas, fotos grandes, catálogo).
//  BUSCA:      tarjetas, cards, catalogo, scrollview foreach, lista sin list, galeria, feed
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaTarjetasView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Views/DetalleJugadorView.swift (a donde navega cada tarjeta)
//              Un NavigationStack arriba (si esta es tu pantalla raíz, envuélvela en uno).
//  ⚠️ NO VISTO EN CLASE: ForEach, .clipped(), .buttonStyle(.plain)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaTarjetasView: View {

    @State private var jugadores = cargarJugadores()                // ✏️ tus datos

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {

                // ⚠️ NO VISTO EN CLASE: ForEach repite la vista por cada elemento,
                // igual que List(lista) { }, pero sin el estilo de List.
                ForEach(jugadores) { jugadorItem in

                    NavigationLink {
                        DetalleJugadorView(jugador: jugadorItem)     // ✏️ tu detalle
                    } label: {

                        // ── La tarjeta ───────────────────────────────
                        VStack(alignment: .leading, spacing: 0) {

                            Image(jugadorItem.imagen)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity)
                                .frame(height: 150)
                                .clipped()     // ⚠️ corta lo que sobra de la imagen

                            VStack(alignment: .leading, spacing: 4) {
                                Text(jugadorItem.nombreCompleto)      // ✏️
                                    .font(.title3)
                                    .bold()
                                Text("#\(jugadorItem.numero) · \(jugadorItem.posicion)")   // ✏️
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                        .background(Color.gray.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    // ⚠️ .plain evita que todo el texto de la tarjeta se pinte azul.
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .navigationTitle("Tarjetas")                                 // ✏️
    }
}

#Preview {
    NavigationStack {
        ListaTarjetasView()
    }
}
