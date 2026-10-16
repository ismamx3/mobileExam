// ═══════════════════════════════════════════════════════════════
//  ProporcionesView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Dividir en partes DESIGUALES: 1/3 + 2/3, 30% + 70%.
//              Con GeometryReader (exacto) y sin él (alto fijo).
//  ÚSALO PARA: "la imagen ocupa un tercio de la pantalla", barra lateral
//              angosta + contenido ancho, encabezado chico + cuerpo grande.
//  BUSCA:      proporcion, porcentaje, tercio, 1/3, 2/3, 30 70, GeometryReader,
//              dividir desigual, ancho relativo, alto relativo
//
//  CÓMO COPIARLO:
//   1. Copia SOLO el bloque que quieras (entre las líneas  // ── N. ──).
//   2. Borra el .frame(height:) marcado ✏️ DEMO para que use toda la pantalla.
//   3. Cambia los números (/ 3, * 0.3, * 0.7) a la proporción que quieras.
//      Que sumen 1: 0.3 + 0.7, 0.25 + 0.75, 1/3 + 2/3…
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: GeometryReader (bloques 1 y 2).
//     Te da el tamaño del espacio disponible en "geo.size.width" y
//     "geo.size.height". Con eso calculas cuánto mide cada parte.
//     Si no quieres usarlo, el bloque 3 hace algo parecido sin él.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ProporcionesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. 1/3 arriba + 2/3 abajo (GeometryReader) ──────────
                Text("1. Un tercio / dos tercios")
                    .font(.headline)

                // ⚠️ NO VISTO EN CLASE: GeometryReader. "geo" trae el tamaño que tiene para dibujar.
                GeometryReader { geo in
                    VStack(spacing: 0) {
                        Text("1/3")                  // ✏️ tu contenido
                            .font(.title2)
                            .bold()
                            .frame(width: geo.size.width, height: geo.size.height / 3)
                            .background(Color.purple.opacity(0.3))

                        Text("2/3")                  // ✏️ tu contenido
                            .font(.title2)
                            .bold()
                            .frame(width: geo.size.width, height: geo.size.height * 2 / 3)
                            .background(Color.orange.opacity(0.3))
                    }
                }
                .frame(height: 330)   // ✏️ DEMO: bórralo para usar toda la pantalla

                // ── 2. 30% izquierda + 70% derecha (GeometryReader) ─────
                Text("2. 30% / 70% (lado a lado)")
                    .font(.headline)

                GeometryReader { geo in
                    HStack(spacing: 0) {
                        VStack(spacing: 8) {
                            Image(systemName: "line.3.horizontal")
                            Text("30%")
                                .bold()
                        }
                        .frame(width: geo.size.width * 0.3, height: geo.size.height)
                        .background(Color.indigo.opacity(0.3))

                        VStack(spacing: 8) {
                            Image(systemName: "doc.text")
                            Text("70%")
                                .bold()
                        }
                        .frame(width: geo.size.width * 0.7, height: geo.size.height)
                        .background(Color.blue.opacity(0.15))
                    }
                }
                .frame(height: 180)   // ✏️ DEMO

                // ── 3. Sin GeometryReader: alto fijo + el resto ─────────
                // La parte de arriba mide 120 puntos SIEMPRE; la de abajo
                // (maxHeight: .infinity) se queda con todo lo que sobra.
                Text("3. Alto fijo arriba + el resto abajo")
                    .font(.headline)

                VStack(spacing: 0) {
                    Text("Arriba: siempre 120 pt")   // ✏️
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)          // ✏️ el alto fijo
                        .background(Color.purple.opacity(0.3))

                    Text("Abajo: todo lo que sobra") // ✏️
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green.opacity(0.3))
                }
                .frame(height: 330)   // ✏️ DEMO

                // ── 4. Sin GeometryReader: ancho fijo + el resto ────────
                Text("4. Ancho fijo a la izquierda + el resto")
                    .font(.headline)

                HStack(spacing: 0) {
                    Image(systemName: "person.fill")
                        .font(.largeTitle)
                        .frame(width: 90)            // ✏️ el ancho fijo
                        .frame(maxHeight: .infinity)
                        .background(Color.orange.opacity(0.3))

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Nombre")
                            .bold()
                        Text("El resto del ancho es para esta parte.")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(Color.orange.opacity(0.1))
                }
                .frame(height: 110)   // ✏️ DEMO
            }
            .padding()
        }
    }
}

#Preview {
    ProporcionesView()
}
