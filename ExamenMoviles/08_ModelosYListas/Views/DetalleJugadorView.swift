// ═══════════════════════════════════════════════════════════════
//  DetalleJugadorView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de DETALLE de solo lectura (recibe un elemento).
//  ÚSALO PARA: mostrar toda la info del elemento que tocaste en la lista.
//  BUSCA:      detalle, detail, recibir valor, paso de valores, ficha, perfil, info
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/DetalleJugadorView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift (solo para el #Preview)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct DetalleJugadorView: View {

    // Paso de valores de ida: variable NO privada y SIN @State.
    // Quien abre esta pantalla la llena: DetalleJugadorView(jugador: jugadorItem)
    var jugador: Jugador                                  // ✏️ tu modelo

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {

                // ── 1. Imagen grande ─────────────────────────────────
                Image(jugador.imagen)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                // ── 2. Título y etiqueta ─────────────────────────────
                Text(jugador.nombreCompleto)                  // ✏️
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)

                Text(jugador.posicion)                        // ✏️
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.purple)
                    .clipShape(Capsule())

                // ── 3. Tres cuadritos del MISMO ancho ────────────────
                // .frame(maxWidth: .infinity) en cada uno = se reparten el ancho igual.
                HStack(spacing: 12) {
                    VStack(spacing: 4) {
                        Text("\(jugador.numero)")
                            .font(.title)
                            .bold()
                        Text("Número")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(spacing: 4) {
                        Text("\(jugador.estatura, specifier: "%.2f")")
                            .font(.title)
                            .bold()
                        Text("Estatura (m)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(spacing: 4) {
                        Image(systemName: jugador.esFavorito ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundStyle(.red)
                        Text("Favorito")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Divider()

                // ── 4. Renglones etiqueta ······ valor ────────────────
                HStack {
                    Text("Nombre")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(jugador.nombre)
                }

                HStack {
                    Text("Apellido")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(jugador.apellido)
                }

                HStack {
                    Text("Favorito")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(jugador.esFavorito ? "Sí" : "No")
                }
            }
            .padding()
        }
        .navigationTitle(jugador.nombre)                      // ✏️
    }
}

#Preview {
    NavigationStack {
        DetalleJugadorView(jugador: cargarJugadores()[0])
    }
}
