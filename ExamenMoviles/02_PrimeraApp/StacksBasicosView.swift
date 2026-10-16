// ═══════════════════════════════════════════════════════════════
//  StacksBasicosView.swift  ·  02 Mi primera app
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     VStack, HStack y ZStack con alignment y spacing,
//              Spacer (elástico y fijo), Divider, padding por lado y
//              frame(maxWidth: .infinity, alignment:). Termina con un
//              renglón típico armado con stacks anidados.
//  ÚSALO PARA: acomodar cualquier cosa en la pantalla.
//  BUSCA:      vstack, hstack, zstack, stack, vertical, horizontal,
//              encima, capas, alignment, alinear, leading, trailing,
//              izquierda, derecha, centro, spacing, espacio, separacion,
//              Spacer, empujar, Divider, linea, padding, margen, frame,
//              maxWidth, infinity, ancho completo, anidar
//
//  CÓMO COPIARLO:
//   1. Copia el stack del bloque que quieras.
//   2. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  Para dividir la pantalla en partes iguales, grids y renglones
//  más completos, ve al tema 05_Layouts.
//  ⚠️ NO VISTO EN CLASE: Rectangle()/Circle() con .fill. Aquí solo
//              dibujan cajas de color para que se vea el acomodo.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct StacksBasicosView: View {

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    // ── 1. VStack, HStack y ZStack ───────────────
                    // HStack = horizontal · VStack = vertical · ZStack = en profundidad.
                    // Se pueden meter Stacks dentro de Stacks para organizar mejor (bloque 10).
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. VStack, HStack y ZStack")
                            .font(.headline)

                        HStack(alignment: .top, spacing: 20) {
                            VStack {                             // uno ABAJO del otro
                                Text("A")
                                Text("B")
                                Text("C")
                            }
                            .padding()
                            .background(Color.purple.opacity(0.2))

                            HStack {                             // uno JUNTO al otro
                                Text("A")
                                Text("B")
                                Text("C")
                            }
                            .padding()
                            .background(Color.orange.opacity(0.2))

                            ZStack {                             // uno ENCIMA del otro
                                Circle()
                                    .fill(.blue)
                                    .frame(width: 60, height: 60)
                                Text("Z")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                        }
                    }

                    // ── 2. Alineación de un VStack ───────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. VStack(alignment:)")
                            .font(.headline)

                        HStack(spacing: 10) {
                            VStack(alignment: .leading) {        // ✏️ .leading .center .trailing
                                Text(".leading")
                                Text("corto")
                            }
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.purple.opacity(0.15))

                            VStack(alignment: .center) {
                                Text(".center")
                                Text("corto")
                            }
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.purple.opacity(0.15))

                            VStack(alignment: .trailing) {
                                Text(".trailing")
                                Text("corto")
                            }
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.purple.opacity(0.15))
                        }
                    }

                    // ── 3. Alineación de un HStack ───────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. HStack(alignment:)")
                            .font(.headline)

                        HStack(alignment: .top) {                // ✏️ .top .center .bottom
                            Rectangle().fill(.purple).frame(width: 40, height: 80)
                            Rectangle().fill(.orange).frame(width: 40, height: 40)
                            Text(".top")
                        }
                        HStack(alignment: .bottom) {
                            Rectangle().fill(.purple).frame(width: 40, height: 80)
                            Rectangle().fill(.orange).frame(width: 40, height: 40)
                            Text(".bottom")
                        }
                        HStack(alignment: .center) {             // en medio (es el default)
                            Rectangle().fill(.purple).frame(width: 40, height: 80)
                            Rectangle().fill(.orange).frame(width: 40, height: 40)
                            Text(".center")
                        }
                    }

                    // ── 4. ZStack con alineación ─────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. ZStack(alignment:)")
                            .font(.headline)

                        ZStack(alignment: .bottomTrailing) {     // ✏️ .topLeading .bottomTrailing ...
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue.opacity(0.3))
                                .frame(height: 100)
                            Text("abajo a la derecha")
                                .padding(8)
                        }
                    }

                    // ── 5. spacing ───────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("5. spacing: 0 vs spacing: 20")
                            .font(.headline)

                        HStack(alignment: .top, spacing: 30) {
                            VStack(spacing: 0) {                 // pegados
                                Rectangle().fill(.purple).frame(width: 60, height: 30)
                                Rectangle().fill(.orange).frame(width: 60, height: 30)
                                Rectangle().fill(.blue).frame(width: 60, height: 30)
                            }
                            VStack(spacing: 20) {                // ✏️ separados
                                Rectangle().fill(.purple).frame(width: 60, height: 30)
                                Rectangle().fill(.orange).frame(width: 60, height: 30)
                                Rectangle().fill(.blue).frame(width: 60, height: 30)
                            }
                        }
                    }

                    // ── 6. Spacer ────────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("6. Spacer (empuja)")
                            .font(.headline)

                        HStack {                                 // un Spacer: manda todo a los lados
                            Text("Izquierda")
                            Spacer()
                            Text("Derecha")
                        }
                        .padding(10)
                        .background(Color.purple.opacity(0.15))

                        HStack {                                 // varios Spacer: reparten el espacio
                            Spacer()
                            Text("A")
                            Spacer()
                            Text("B")
                            Spacer()
                            Text("C")
                            Spacer()
                        }
                        .padding(10)
                        .background(Color.orange.opacity(0.15))

                        Text("Arriba")
                        Spacer().frame(height: 30)               // Spacer FIJO de 30 puntos
                        Text("Abajo (30 puntos después)")
                    }

                    // ── 7. Divider ───────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("7. Divider (línea)")
                            .font(.headline)
                        Text("Sección uno")
                        Divider()
                        Text("Sección dos")
                    }

                    // ── 8. padding por lado ──────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("8. padding")
                            .font(.headline)

                        Text(".padding() en todos lados")
                            .padding()
                            .background(Color.purple.opacity(0.2))
                        Text(".padding(.horizontal, 30)")
                            .padding(.horizontal, 30)                // ✏️ .top .bottom .leading .trailing .vertical
                            .background(Color.purple.opacity(0.2))
                        Text(".padding(.top, 20)")
                            .padding(.top, 20)
                            .background(Color.purple.opacity(0.2))
                    }

                    // ── 9. Ancho completo con alineación ─────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("9. frame(maxWidth: .infinity, alignment:)")
                            .font(.headline)

                        // Alinear TODO el VStack hacia la izquierda (forma de clase).
                        // La profesora: primero intenta acomodar los elementos
                        // dentro del VStack; usa este .frame solo si no basta.
                        VStack(alignment: .leading) {
                            Text("Todo el VStack")
                            Text("pegado a la izquierda")
                        }
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading)                    // ✏️ .leading .center .trailing
                        .background(Color.orange.opacity(0.15))

                        Text("a la izquierda")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.purple.opacity(0.15))
                        Text("al centro")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.purple.opacity(0.15))
                        Text("a la derecha")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .background(Color.purple.opacity(0.15))
                    }

                    // ── 10. Stacks anidados: un renglón típico ───
                    VStack(alignment: .leading, spacing: 8) {
                        Text("10. Stacks anidados (renglón típico)")
                            .font(.headline)

                        HStack(spacing: 12) {
                            Image(systemName: "music.note")            // ✏️ ícono
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(width: 50, height: 50)
                                .background(Color.purple)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Título del renglón")             // ✏️
                                    .font(.headline)
                                Text("Subtítulo en gris")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Stacks")
    }
}

#Preview {
    NavigationStack {
        StacksBasicosView()
    }
}
