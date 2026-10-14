// ═══════════════════════════════════════════════════════════════
//  CapasZStackView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Poner cosas una ENCIMA de otra con ZStack: texto sobre
//              imagen, badge en una esquina, tarjeta con foto de fondo y
//              degradado, imagen como fondo de pantalla.
//  ÚSALO PARA: portadas, banners, tarjetas bonitas, fondos con imagen.
//  BUSCA:      zstack, capas, encima, sobre imagen, texto sobre imagen, badge, insignia,
//              degradado, gradiente, gradient, imagen de fondo, background image, banner
//
//  CÓMO COPIARLO:
//   1. Copia SOLO el bloque que quieras (entre las líneas  // ── N. ──).
//   2. Cambia lo marcado con ✏️ (imagen y textos).
//  NECESITA:   imágenes "foto1", "foto2", "foto4" y "perfil" en Assets.
//  ⚠️ NO VISTO EN CLASE: LinearGradient (bloque 3) — un color que se
//     desvanece; aquí sirve para oscurecer la foto y que el texto se lea.
//
//  CLAVE:  en un ZStack lo PRIMERO que escribes queda HASTA ATRÁS y lo
//          último queda hasta adelante. ZStack(alignment: .bottomLeading)
//          acomoda a todos los hijos en esa esquina.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct CapasZStackView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. Texto encima de una imagen ───────────────────────
                Text("1. Texto sobre imagen")
                    .font(.headline)

                ZStack {
                    Image("foto4")                                  // ✏️ atrás
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 16))

                    Text("¡Despegue!")                              // ✏️ adelante
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.black.opacity(0.4))       // da contraste
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                // ── 2. Badge (insignia) en una esquina ──────────────────
                // ZStack(alignment: .topTrailing) → todo se acomoda arriba a la derecha.
                Text("2. Insignia en la esquina")
                    .font(.headline)

                HStack(spacing: 30) {
                    ZStack(alignment: .topTrailing) {
                        Image("perfil")                             // ✏️
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .clipShape(.circle)

                        Image(systemName: "checkmark.seal.fill")
                            .font(.title)
                            .foregroundStyle(.blue)
                    }

                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "envelope.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.purple)
                            .padding(10)

                        Text("5")                                   // ✏️
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                            .background(Color.red)
                            .clipShape(.circle)
                    }

                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.gray)

                        Circle()                                    // puntito "en línea"
                            .fill(Color.green)
                            .frame(width: 18, height: 18)
                            .overlay {
                                Circle().stroke(.white, lineWidth: 3)
                            }
                    }
                }
                .frame(maxWidth: .infinity)

                // ── 3. Tarjeta con foto de fondo y degradado ────────────
                Text("3. Tarjeta con foto y degradado")
                    .font(.headline)

                ZStack(alignment: .bottomLeading) {
                    Image("foto2")                                  // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 220)

                    // ⚠️ NO VISTO EN CLASE: LinearGradient.
                    // Arriba transparente → abajo negro: el texto blanco se lee bien.
                    LinearGradient(colors: [Color.clear, Color.black.opacity(0.75)],
                                   startPoint: .top,
                                   endPoint: .bottom)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Playa del Carmen")                    // ✏️
                            .font(.title2)
                            .bold()
                        Text("Quintana Roo · 4 días")               // ✏️
                            .font(.subheadline)
                    }
                    .foregroundStyle(.white)
                    .padding()
                }
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 18))

                // ── 4. Imagen como fondo de pantalla ────────────────────
                // En tu app: quita el .frame(height:) y el clipShape, y deja
                // .ignoresSafeArea() en la imagen para que cubra TODA la pantalla.
                Text("4. Imagen de fondo con contenido encima")
                    .font(.headline)

                ZStack {
                    Image("foto1")                                  // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()

                    VStack(spacing: 12) {
                        Text("Bienvenido")                          // ✏️
                            .font(.largeTitle)
                            .bold()
                        Button("Empezar") {}
                            .buttonStyle(.borderedProminent)
                            .tint(.purple)
                            .controlSize(.large)
                    }
                    .foregroundStyle(.white)
                }
                .frame(height: 260)   // ✏️ DEMO
                .clipShape(RoundedRectangle(cornerRadius: 18))  // ✏️ DEMO

                // ── 5. Fondo de color + tarjeta encima ──────────────────
                // El patrón de clase para fondo completo: ZStack con Color hasta atrás.
                Text("5. Fondo de color + tarjeta encima")
                    .font(.headline)

                ZStack {
                    Color.indigo                                    // ✏️ fondo
                        .ignoresSafeArea()

                    VStack(spacing: 8) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.orange)
                        Text("Tarjeta blanca")
                            .font(.headline)
                            .foregroundStyle(.black)
                        Text("encima de un fondo de color")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .padding(24)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(radius: 8)
                }
                .frame(height: 240)   // ✏️ DEMO
                .clipShape(RoundedRectangle(cornerRadius: 18))  // ✏️ DEMO
            }
            .padding()
        }
    }
}

#Preview {
    CapasZStackView()
}
