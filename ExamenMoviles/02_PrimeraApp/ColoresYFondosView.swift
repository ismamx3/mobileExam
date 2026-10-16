// ═══════════════════════════════════════════════════════════════
//  ColoresYFondosView.swift  ·  02 Mi primera app
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Colores del sistema, Color(red:green:blue:) con /255,
//              opacidad, una paleta propia como `let` dentro del
//              struct (monocromática y análoga), contraste y
//              degradados.
//  ÚSALO PARA: definir los colores de tu app en un solo lugar y
//              pintar fondos, textos y botones.
//  BUSCA:      color, colores, rgb, red green blue, 255, opacity,
//              opacidad, transparente, paleta, palette, monocromatico,
//              analogo, contraste, fondo, background, degradado,
//              gradiente, gradient, LinearGradient, flatuicolors, coolors, image picker
//
//  CÓMO COPIARLO:
//   1. Paleta: copia los `let` de colores (arriba del body) dentro de
//      TU vista, o a un archivo Utils/ como `let` globales.
//   2. Copia el bloque que necesites.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  Fondo de pantalla completa (las 2 opciones de clase):
//  ver 02_PrimeraApp/FondoPantallaCompletaView.swift
//  ⚠️ NO VISTO EN CLASE: LinearGradient (degradado)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ColoresYFondosView: View {

    // ── Paleta MONOCROMÁTICA: mismo tono (morado), cambia solo lo claro/oscuro ──
    // Herramientas de la Clase 4: códigos de color flatuicolors.com ·
    // contraste coolors.co/contrast-checker · paleta desde una imagen coolors.co/image-picker
    let moradoOscuro = Color(red: 72/255, green: 52/255, blue: 212/255)      // ✏️ tus colores
    let morado       = Color(red: 108/255, green: 92/255, blue: 231/255)
    let moradoMedio  = Color(red: 162/255, green: 155/255, blue: 254/255)
    let moradoClaro  = Color(red: 236/255, green: 233/255, blue: 255/255)

    // ── Paleta ANÁLOGA: colores vecinos en el círculo cromático (azul, turquesa, verde) ──
    let azul      = Color(red: 9/255, green: 132/255, blue: 227/255)
    let turquesa  = Color(red: 0/255, green: 206/255, blue: 201/255)
    let verde     = Color(red: 0/255, green: 184/255, blue: 148/255)

    var body: some View {
        ZStack {
            // Fondo de pantalla completa: OPCIÓN 1 de clase (ZStack + Color + ignoresSafeArea)
            moradoClaro
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // ── 1. Colores del sistema ───────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Colores del sistema")
                            .font(.headline)
                            .foregroundStyle(moradoOscuro)
                        HStack(spacing: 8) {
                            Circle().fill(.red).frame(width: 34, height: 34)
                            Circle().fill(.orange).frame(width: 34, height: 34)
                            Circle().fill(.yellow).frame(width: 34, height: 34)
                            Circle().fill(.green).frame(width: 34, height: 34)
                            Circle().fill(.teal).frame(width: 34, height: 34)
                            Circle().fill(.blue).frame(width: 34, height: 34)
                            Circle().fill(.purple).frame(width: 34, height: 34)
                            Circle().fill(.pink).frame(width: 34, height: 34)
                            Circle().fill(.gray).frame(width: 34, height: 34)
                        }
                        Text(".red .orange .yellow .green .teal .blue .purple .pink .gray")
                            .font(.caption)
                            .foregroundStyle(.black.opacity(0.6))
                    }

                    // ── 2. Color propio con RGB ──────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Color(red:green:blue:) dividido entre 255")
                            .font(.headline)
                            .foregroundStyle(moradoOscuro)
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 116/255, green: 185/255, blue: 255/255))   // ✏️ tus números RGB
                                .frame(width: 60, height: 60)
                            Text("Color(red: 116/255, green: 185/255, blue: 255/255)")
                                .font(.caption)
                                .foregroundStyle(.black)
                        }
                    }

                    // ── 3. Opacidad ──────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. Opacidad (0 = invisible, 1 = sólido)")
                            .font(.headline)
                            .foregroundStyle(moradoOscuro)
                        HStack(spacing: 8) {
                            RoundedRectangle(cornerRadius: 8).fill(Color.purple.opacity(1.0)).frame(height: 50)
                            RoundedRectangle(cornerRadius: 8).fill(Color.purple.opacity(0.6)).frame(height: 50)
                            RoundedRectangle(cornerRadius: 8).fill(Color.purple.opacity(0.3)).frame(height: 50)
                            RoundedRectangle(cornerRadius: 8).fill(Color.purple.opacity(0.1)).frame(height: 50)
                        }
                        // También se puede dentro del Color:
                        // Color(red: 116/255, green: 185/255, blue: 255/255, opacity: 0.5)
                        Text("1.0 · 0.6 · 0.3 · 0.1")
                            .font(.caption)
                            .foregroundStyle(.black.opacity(0.6))
                    }

                    // ── 4. Paleta monocromática ──────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. Paleta monocromática")
                            .font(.headline)
                            .foregroundStyle(moradoOscuro)
                        HStack(spacing: 0) {
                            moradoOscuro.frame(height: 60)
                            morado.frame(height: 60)
                            moradoMedio.frame(height: 60)
                            moradoClaro.frame(height: 60)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("Un solo tono, varía lo claro y lo oscuro.")
                            .font(.caption)
                            .foregroundStyle(.black.opacity(0.6))
                    }

                    // ── 5. Paleta análoga ────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("5. Paleta análoga")
                            .font(.headline)
                            .foregroundStyle(moradoOscuro)
                        HStack(spacing: 0) {
                            azul.frame(height: 60)
                            turquesa.frame(height: 60)
                            verde.frame(height: 60)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("Colores vecinos del círculo cromático.")
                            .font(.caption)
                            .foregroundStyle(.black.opacity(0.6))
                    }

                    // ── 6. Contraste ─────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("6. Contraste (se califica)")
                            .font(.headline)
                            .foregroundStyle(moradoOscuro)
                        HStack(spacing: 10) {
                            Text("Bien ✓")
                                .bold()
                                .foregroundStyle(.white)                 // texto claro sobre fondo oscuro
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(moradoOscuro)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Text("Mal ✗")
                                .bold()
                                .foregroundStyle(.yellow)                // amarillo sobre blanco casi no se lee
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        Text("Revisa tus colores en coolors.co/contrast-checker")
                            .font(.caption)
                            .foregroundStyle(.black.opacity(0.6))
                    }

                    // ── 7. Usar la paleta en una tarjeta ─────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("7. La paleta aplicada")
                            .font(.headline)
                            .foregroundStyle(moradoOscuro)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tarjeta de ejemplo")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(moradoOscuro)
                            Text("Fondo, texto y botón salen de la misma paleta.")
                                .foregroundStyle(.black.opacity(0.7))
                            Button {
                            } label: {
                                Text("Botón")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(morado)
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }

                    // ── 8. Degradado ─────────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("8. Degradado")
                            .font(.headline)
                            .foregroundStyle(moradoOscuro)
                        // ⚠️ NO VISTO EN CLASE: LinearGradient mezcla colores de un punto a otro
                        LinearGradient(colors: [morado, azul], startPoint: .topLeading, endPoint: .bottomTrailing)   // ✏️ colores y dirección
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(
                                Text("LinearGradient")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            )
                        // Como fondo de pantalla completa:
                        // ZStack {
                        //     LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom)
                        //         .ignoresSafeArea()
                        //     ... tu interfaz ...
                        // }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Colores")
    }
}

#Preview {
    NavigationStack {
        ColoresYFondosView()
    }
}
