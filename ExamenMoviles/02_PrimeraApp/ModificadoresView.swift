// ═══════════════════════════════════════════════════════════════
//  ModificadoresView.swift  ·  02 Mi primera app
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Modificadores visuales y por qué importa su ORDEN:
//              padding antes/después de background, esquinas
//              redondeadas, bordes, sombras, opacidad, offset,
//              tamaño fijo vs flexible, escala y rotación.
//  ÚSALO PARA: dejar bonitas tarjetas, botones, textos y fotos.
//  BUSCA:      modificador, modifier, orden, padding, background, fondo,
//              cornerRadius, esquinas, clipShape, borde, border, stroke,
//              overlay, sombra, shadow, opacity, opacidad, offset, mover,
//              frame, tamaño, width, height, scaleEffect, escala,
//              rotationEffect, rotar, girar, tarjeta, card
//
//  CÓMO COPIARLO:
//   1. Copia el elemento del bloque que quieras CON sus modificadores
//      en el MISMO orden.
//   2. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: .border(), .rotationEffect()
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ModificadoresView: View {

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    // ── 1. El orden importa ──────────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("1. El orden importa")
                            .font(.headline)

                        HStack(spacing: 20) {
                            VStack {
                                Text("Hola")
                                    .foregroundStyle(.black)
                                    .padding()                       // 1° crece
                                    .background(Color.yellow)        // 2° pinta TODO (incluye el padding)
                                Text("padding → background")
                                    .font(.caption)
                            }
                            VStack {
                                Text("Hola")
                                    .foregroundStyle(.black)
                                    .background(Color.yellow)        // 1° pinta solo el texto
                                    .padding()                       // 2° agrega espacio SIN color
                                Text("background → padding")
                                    .font(.caption)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }

                    // ── 2. Esquinas redondeadas ──────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("2. Esquinas redondeadas")
                            .font(.headline)

                        Text("clipShape(RoundedRectangle)")
                            .padding()
                            .background(Color.purple)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))     // ✏️ radio

                        Text("clipShape(Capsule())")
                            .padding()
                            .background(Color.orange)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())

                        Text("O")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }

                    // ── 3. Bordes ────────────────────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("3. Bordes")
                            .font(.headline)

                        Text("Borde redondeado con overlay")
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.purple, lineWidth: 2)             // ✏️ color y grosor
                            )

                        Text("Fondo + borde del MISMO radio")
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.purple.opacity(0.4), lineWidth: 1)
                            )

                        Text("Borde cuadrado con .border")
                            .padding()
                            .border(.orange, width: 2)       // ⚠️ NO VISTO EN CLASE: borde recto rápido
                    }

                    // ── 4. Sombras ───────────────────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("4. Sombras")
                            .font(.headline)

                        HStack(spacing: 20) {
                            Text("Sombra de color")
                                .padding()
                                .background(Color.white)
                                .foregroundStyle(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(color: .orange, radius: 5)             // ✏️

                            Text("Sombra suave")
                                .padding()
                                .background(Color.white)
                                .foregroundStyle(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }
                        .frame(maxWidth: .infinity)
                    }

                    // ── 5. Opacidad ──────────────────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("5. Opacidad")
                            .font(.headline)

                        HStack(spacing: 20) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(.orange)
                            Image(systemName: "star.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(.orange)
                                .opacity(0.5)                                  // ✏️ 0 a 1
                            Image(systemName: "star.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(.orange)
                                .opacity(0.2)
                        }
                    }

                    // ── 6. offset (mover sin cambiar el lugar) ───
                    VStack(alignment: .leading, spacing: 10) {
                        Text("6. offset")
                            .font(.headline)

                        HStack(spacing: 30) {
                            Circle()
                                .fill(.purple)
                                .frame(width: 50, height: 50)
                            Circle()
                                .fill(.orange)
                                .frame(width: 50, height: 50)
                                .offset(x: 0, y: 20)                           // ✏️ baja 20 puntos
                        }
                        .padding(.bottom, 20)
                    }

                    // ── 7. Tamaño fijo vs flexible ───────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("7. frame fijo vs flexible")
                            .font(.headline)

                        Text("width: 150, height: 50")
                            .frame(width: 150, height: 50)                     // ✏️ tamaño fijo
                            .background(Color.purple.opacity(0.2))

                        Text("maxWidth: .infinity")
                            .frame(maxWidth: .infinity, minHeight: 50)         // ocupa todo el ancho
                            .background(Color.orange.opacity(0.2))
                    }

                    // ── 8. Escala y rotación ─────────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("8. Escala y rotación")
                            .font(.headline)

                        HStack(spacing: 40) {
                            Image(systemName: "airplane")
                                .font(.system(size: 30))
                                .scaleEffect(1.5)                              // 1.5 veces más grande
                            Image(systemName: "airplane")
                                .font(.system(size: 30))
                                .rotationEffect(.degrees(-45))  // ⚠️ NO VISTO EN CLASE: gira en grados
                        }
                        .foregroundStyle(.blue)
                        .padding()
                    }

                    // ── 9. Todo junto: tarjeta ───────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("9. Todo junto: tarjeta")
                            .font(.headline)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Título de la tarjeta")                       // ✏️
                                .font(.title3)
                                .bold()
                            Text("Fondo blanco, esquinas redondeadas y sombra suave. Se ve bien sobre fondos claros.")
                                .foregroundStyle(.gray)
                        }
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Modificadores")
    }
}

#Preview {
    NavigationStack {
        ModificadoresView()
    }
}
