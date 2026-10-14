// ═══════════════════════════════════════════════════════════════
//  TextosView.swift  ·  02 Mi primera app
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Todo lo que se le puede hacer a un Text: tamaños de
//              fuente, tamaño exacto, negritas, cursiva, color,
//              alineación de varias líneas, límite de líneas y texto
//              tipo "etiqueta" con fondo.
//  ÚSALO PARA: títulos, subtítulos, descripciones, etiquetas.
//  BUSCA:      text, texto, font, fuente, tamaño, largeTitle, title,
//              headline, caption, bold, negrita, italic, cursiva,
//              underline, subrayado, color texto, foregroundStyle,
//              multilineTextAlignment, centrar texto, lineLimit,
//              etiqueta, chip, badge, Label, icono con texto
//
//  CÓMO COPIARLO:
//   1. Copia solo el Text del bloque que quieras con sus modificadores.
//   2. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: weight:/design: en .font(.system(...)),
//              .underline(), .strikethrough(), .lineLimit()
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TextosView: View {

    let nombre = "Ismael"          // ✏️ para el bloque 8
    let puntos = 120

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // ── 1. Tamaños de fuente del sistema ─────────
                    VStack(alignment: .leading, spacing: 6) {
                        Text("1. Tamaños del sistema")
                            .font(.headline)
                            .foregroundStyle(.purple)
                        Text(".largeTitle").font(.largeTitle)
                        Text(".title").font(.title)
                        Text(".title2").font(.title2)
                        Text(".title3").font(.title3)
                        Text(".headline").font(.headline)
                        Text(".subheadline").font(.subheadline)
                        Text(".body (el normal)").font(.body)
                        Text(".callout").font(.callout)
                        Text(".footnote").font(.footnote)
                        Text(".caption").font(.caption)
                        Text(".caption2").font(.caption2)
                    }

                    // ── 2. Tamaño exacto ─────────────────────────
                    VStack(alignment: .leading, spacing: 6) {
                        Text("2. Tamaño exacto")
                            .font(.headline)
                            .foregroundStyle(.purple)
                        Text("size: 21")
                            .font(.system(size: 21))                        // ✏️ tamaño
                        Text("size: 28, bold")
                            .font(.system(size: 28, weight: .bold))         // ⚠️ NO VISTO EN CLASE: weight
                        Text("size: 24, rounded")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))   // ⚠️ design
                    }

                    // ── 3. Estilos ───────────────────────────────
                    VStack(alignment: .leading, spacing: 6) {
                        Text("3. Estilos")
                            .font(.headline)
                            .foregroundStyle(.purple)
                        Text("Negrita").bold()
                        Text("Cursiva").italic()
                        Text("Negrita y cursiva").bold().italic()
                        Text("Subrayado").underline()                   // ⚠️ NO VISTO EN CLASE
                        Text("Tachado").strikethrough()                 // ⚠️ NO VISTO EN CLASE
                    }

                    // ── 4. Color del texto ───────────────────────
                    VStack(alignment: .leading, spacing: 6) {
                        Text("4. Color del texto")
                            .font(.headline)
                            .foregroundStyle(.purple)
                        Text("Color del sistema")
                            .foregroundStyle(.orange)                    // ✏️ color
                        Text("Gris secundario (para subtítulos)")
                            .foregroundStyle(.secondary)
                        Text("Color RGB propio")
                            .foregroundStyle(Color(red: 9/255, green: 132/255, blue: 227/255))
                    }

                    // ── 5. Varias líneas y alineación ────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("5. Varias líneas")
                            .font(.headline)
                            .foregroundStyle(.purple)

                        Text("Este texto es largo y está centrado. Cuando no cabe en una línea, se pasa a la siguiente sola.")
                            .multilineTextAlignment(.center)             // .leading .center .trailing
                            .frame(maxWidth: .infinity)

                        Text("Este texto solo enseña dos líneas aunque sea mucho más largo, y al final pone tres puntitos para que no se salga del espacio.")
                            .lineLimit(2)                                // ⚠️ NO VISTO EN CLASE
                    }

                    // ── 6. Texto con fondo (etiqueta) ────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("6. Texto con fondo")
                            .font(.headline)
                            .foregroundStyle(.purple)

                        Text("Etiqueta con esquinas redondeadas")
                            .padding()                                   // primero el padding...
                            .background(Color.purple)                    // ...luego el fondo
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                        Text("Cápsula / chip")
                            .font(.caption)
                            .bold()
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.orange.opacity(0.2))
                            .foregroundStyle(.orange)
                            .clipShape(Capsule())
                    }

                    // ── 7. Texto con ícono ───────────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("7. Texto con ícono")
                            .font(.headline)
                            .foregroundStyle(.purple)

                        Label("Favoritos", systemImage: "star.fill")     // ✏️ texto e ícono
                            .foregroundStyle(.orange)

                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundStyle(.red)
                            Text("Monterrey, N.L.")
                        }
                    }

                    // ── 8. Texto con variables ───────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("8. Texto con variables")
                            .font(.headline)
                            .foregroundStyle(.purple)

                        Text("Hola, \(nombre). Tienes \(puntos) puntos.")
                        Text("Bienvenido, " + nombre)                   // concatenar también funciona
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .navigationTitle("Textos")
    }
}

#Preview {
    NavigationStack {
        TextosView()
    }
}
