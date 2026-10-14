// ═══════════════════════════════════════════════════════════════
//  CuadriculaView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Cuadrículas: 2x2 y 3x3 hechas con VStack + HStack, y una
//              galería de fotos / menú de íconos con LazyVGrid.
//  ÚSALO PARA: "divide la pantalla en 4 cuadros", tableros, galerías de
//              fotos, menú de categorías con íconos.
//  BUSCA:      cuadricula, grid, 2x2, 3x3, galeria, mosaico, LazyVGrid, GridItem,
//              columnas, cuadros iguales, tablero
//
//  CÓMO COPIARLO:
//   1. Copia SOLO el bloque que quieras (entre las líneas  // ── N. ──).
//   2. Bloques 1 y 2: borra el .frame(height:) marcado ✏️ DEMO para que
//      use toda la pantalla.
//   3. Bloques 3 y 4: copia también las constantes de arriba
//      (fotosGaleria, iconosMenu, nombresMenu) y cambia sus valores.
//  NECESITA:   imágenes "foto1", "foto2", "foto3", "foto4" para el bloque 3.
//  ⚠️ NO VISTO EN CLASE: LazyVGrid y GridItem (bloques 3 y 4).
//     Si no quieres usarlos, los bloques 1 y 2 hacen lo mismo con stacks.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct CuadriculaView: View {

    // Datos para la galería (bloque 3). Se repiten a propósito para llenar.
    let fotosGaleria = ["foto1", "foto2", "foto3", "foto4", "foto1", "foto2", "foto3", "foto4"] // ✏️

    // Datos para el menú de íconos (bloque 4). Mismo orden en los dos arreglos.
    let iconosMenu = ["house.fill", "star.fill", "heart.fill", "gearshape.fill", "person.fill", "bell.fill"] // ✏️
    let nombresMenu = ["Inicio", "Favoritos", "Me gusta", "Ajustes", "Perfil", "Avisos"]                  // ✏️

    // ⚠️ NO VISTO EN CLASE: cada GridItem(.flexible()) es UNA columna que se
    // estira. 2 GridItem = 2 columnas iguales; 3 GridItem = 3 columnas.
    let dosColumnas = [GridItem(.flexible()), GridItem(.flexible())]
    let tresColumnas = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. Cuadrícula 2x2 con stacks ────────────────────────
                // Un VStack con 2 HStack; cada cuadro pide todo el espacio.
                Text("1. Cuadrícula 2x2")
                    .font(.headline)

                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Text("Arriba izq.")           // ✏️
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.purple.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text("Arriba der.")           // ✏️
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.orange.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    HStack(spacing: 8) {
                        Text("Abajo izq.")            // ✏️
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.blue.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text("Abajo der.")            // ✏️
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.green.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .bold()
                .frame(height: 260)   // ✏️ DEMO: bórralo para usar toda la pantalla

                // ── 2. Cuadrícula 3x3 con ForEach ───────────────────────
                // Dos ForEach anidados: el de afuera hace 3 renglones, el de
                // adentro 3 columnas. "fila * 3 + columna + 1" numera del 1 al 9.
                Text("2. Cuadrícula 3x3")
                    .font(.headline)

                VStack(spacing: 6) {
                    ForEach(0..<3, id: \.self) { fila in
                        HStack(spacing: 6) {
                            ForEach(0..<3, id: \.self) { columna in
                                Text("\(fila * 3 + columna + 1)")
                                    .font(.title2)
                                    .bold()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.indigo.opacity(0.15 + Double(fila) * 0.15))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
                .frame(height: 300)   // ✏️ DEMO

                // ── 3. Galería de fotos con LazyVGrid (2 columnas) ──────
                Text("3. Galería de fotos (LazyVGrid)")
                    .font(.headline)

                LazyVGrid(columns: dosColumnas, spacing: 12) {
                    // Usamos el índice (0, 1, 2…) porque los nombres se repiten
                    // y el ForEach necesita algo único por elemento.
                    ForEach(0..<fotosGaleria.count, id: \.self) { indice in
                        Image(fotosGaleria[indice])
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }

                // ── 4. Menú de íconos con LazyVGrid (3 columnas) ────────
                Text("4. Menú de íconos (3 columnas)")
                    .font(.headline)

                LazyVGrid(columns: tresColumnas, spacing: 12) {
                    ForEach(0..<iconosMenu.count, id: \.self) { indice in
                        VStack(spacing: 8) {
                            Image(systemName: iconosMenu[indice])
                                .font(.system(size: 28))
                                .foregroundStyle(.purple)
                            Text(nombresMenu[indice])
                                .font(.caption)
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color.purple.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CuadriculaView()
}
