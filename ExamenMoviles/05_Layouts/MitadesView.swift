// ═══════════════════════════════════════════════════════════════
//  MitadesView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Dividir la pantalla en 2 mitades iguales:
//              arriba/abajo y izquierda/derecha.
//  ÚSALO PARA: "la mitad de arriba una imagen y la de abajo los datos",
//              pantallas partidas, comparar dos cosas lado a lado.
//  BUSCA:      mitad, mitades, dividir pantalla, partir, 50/50, split, arriba abajo,
//              izquierda derecha, espacios iguales, maxHeight infinity
//
//  CÓMO COPIARLO:
//   1. Copia SOLO el bloque que quieras (entre las líneas  // ── N. ──).
//   2. Pégalo en el body de tu vista.
//   3. Borra la línea  .frame(height: 300)  marcada con ✏️ DEMO:
//      ese alto es solo para que aquí quepan varios ejemplos. Sin él,
//      las mitades ocupan TODA la pantalla.
//   4. Cambia los Text("…") por tu contenido.
//  NECESITA:   imagen "foto1" solo para el bloque 3.
//
//  ¿POR QUÉ SALEN IGUALES?
//   Cada mitad lleva .frame(maxWidth: .infinity, maxHeight: .infinity):
//   le pide al stack "todo el espacio que haya". Como las dos piden lo
//   mismo, el VStack/HStack se lo reparte en partes iguales.
//   spacing: 0 quita el hueco que el stack pone por default entre hijos.
//   OJO: si el contenido de una mitad NO cabe en su mitad, esa crece.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct MitadesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. Mitad de arriba / mitad de abajo ─────────────────
                Text("1. Arriba / abajo")
                    .font(.headline)

                VStack(spacing: 0) {
                    VStack {
                        Text("Mitad de ARRIBA")      // ✏️ tu contenido
                            .font(.title3)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.purple.opacity(0.3))

                    VStack {
                        Text("Mitad de ABAJO")       // ✏️ tu contenido
                            .font(.title3)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.orange.opacity(0.3))
                }
                .frame(height: 300)   // ✏️ DEMO: bórralo para que ocupe toda la pantalla

                // ── 2. Mitad izquierda / mitad derecha ──────────────────
                Text("2. Izquierda / derecha")
                    .font(.headline)

                HStack(spacing: 0) {
                    VStack {
                        Text("IZQUIERDA")            // ✏️
                            .font(.title3)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue.opacity(0.3))

                    VStack {
                        Text("DERECHA")              // ✏️
                            .font(.title3)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green.opacity(0.3))
                }
                .frame(height: 200)   // ✏️ DEMO: bórralo para que ocupe toda la pantalla

                // ── 3. Mitades con contenido real ───────────────────────
                // Arriba una imagen, abajo datos y un botón.
                Text("3. Imagen arriba, datos abajo")
                    .font(.headline)

                VStack(spacing: 0) {
                    VStack {
                        Image("foto1")               // ✏️ tu imagen
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.purple.opacity(0.15))

                    VStack(spacing: 10) {
                        Text("Montaña")              // ✏️
                            .font(.title2)
                            .bold()
                        Text("La mitad de abajo tiene el texto y el botón.")
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                        Button("Ver más") {}
                            .buttonStyle(.borderedProminent)
                            .tint(.purple)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(height: 420)   // ✏️ DEMO: bórralo para que ocupe toda la pantalla

                // ── 4. Mitades separadas, como tarjetas ─────────────────
                // Igual que el 1, pero con spacing, padding y esquinas redondas.
                Text("4. Mitades separadas (tarjetas)")
                    .font(.headline)

                HStack(spacing: 12) {
                    VStack(spacing: 6) {
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 36))
                        Text("Día")
                            .bold()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.orange.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    VStack(spacing: 6) {
                        Image(systemName: "moon.stars.fill")
                            .font(.system(size: 36))
                        Text("Noche")
                            .bold()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.indigo.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .frame(height: 160)   // ✏️ DEMO: alto de las tarjetas
            }
            .padding()
        }
    }
}

#Preview {
    MitadesView()
}
