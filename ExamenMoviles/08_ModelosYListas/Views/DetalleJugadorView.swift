// ═══════════════════════════════════════════════════════════════
//  DetalleJugadorView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de DETALLE de solo lectura (recibe un elemento).
//              En clase se llamó DetalleView y va en la carpeta Views.
//              El bloque 2 es el diseño de la lámina (Número / Nombre /
//              Estatura); la foto y los renglones son extra.
//  ÚSALO PARA: mostrar toda la info del elemento que tocaste en la lista.
//  BUSCA:      detalle, detail, DetalleView, recibir valor, paso de valores, ficha,
//              perfil, info, pantalla independiente
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/DetalleView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift (solo para el #Preview)
//              imágenes "foto1"…"foto4" en Assets (bloque 1).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct DetalleJugadorView: View {

    // Variable NO privada y SIN @State (paso de valores de ida).
    // Quien abre esta pantalla la llena: DetalleJugadorView(jugador: jugadorItem)
    var jugador: Jugador                                  // ✏️ tu modelo

    var body: some View {
        // A diferencia del renglón, esta SÍ es una pantalla independiente:
        // aquí puedes poner todos los padding que necesites.
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. (Extra) Imagen grande ─────────────────────────
                Image(jugador.imagen)                         // ✏️
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                // ── 2. Datos como en la lámina de clase ──────────────
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Número:")
                        Text("\(jugador.numero)")             // ✏️
                            .font(.system(size: 30))
                            .bold()
                            .foregroundStyle(.red)
                    }

                    Text("Nombre: \(jugador.nombre) \(jugador.apellido)")   // ✏️
                        .font(.title)

                    Divider()
                        .padding(.vertical, 8)

                    Text("Estatura:")
                        .font(.title2)
                    Text("\(jugador.estatura, specifier: "%.2f") mts")      // ✏️
                        .font(.title2)
                        .bold()
                }

                // ── 3. (Extra) Etiqueta de color ─────────────────────
                Text(jugador.posicion)                        // ✏️
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.purple)
                    .clipShape(Capsule())

                Divider()

                // ── 4. (Extra) Renglones etiqueta ······ valor ────────
                HStack {
                    Text("Posición")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(jugador.posicion)
                }

                HStack {
                    Text("Favorito")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Image(systemName: jugador.esFavorito ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
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
        DetalleJugadorView(jugador: cargarJugadores()[3])
    }
}
