// ═══════════════════════════════════════════════════════════════
//  AlineacionView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Cómo poner algo donde quieres: en una esquina, al centro,
//              pegado abajo, a la izquierda o a la derecha.
//  ÚSALO PARA: "el botón hasta abajo", "el título a la izquierda",
//              "un ícono en la esquina", "todo centrado".
//  BUSCA:      alinear, alineacion, alignment, esquina, centrar, centrado, pegado abajo,
//              izquierda, derecha, leading, trailing, Spacer, frame alignment, overlay,
//              HStack alignment top bottom center, alinear hijos, VStack a la izquierda
//
//  CÓMO COPIARLO:
//   1. Copia SOLO el bloque que quieras (entre las líneas  // ── N. ──).
//   2. Borra el .frame(height:) marcado ✏️ DEMO para que use toda la pantalla.
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: .overlay(alignment: .topTrailing) del bloque 6
//     (en clase se vio .overlay { } sin alignment, para bordes).
//
//  REGLA RÁPIDA (clase "Mi primera app", diapositivas de Stacks):
//   · Dentro de un stack:  VStack(alignment: .leading / .trailing / .center)
//     y HStack(alignment: .top / .bottom / .center)  alinean a los HIJOS.
//   · Todo el VStack a la izquierda: .frame(maxWidth: .infinity, alignment: .leading)
//     (pero primero intenta acomodar todo DENTRO del VStack).
//   · Para mover algo dentro de su espacio:
//       .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
//     "ocupa todo y acomódate en la esquina de abajo a la derecha".
//   · Spacer() empuja: uno abajo = todo arriba; uno arriba = todo abajo.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AlineacionView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. Cuatro esquinas y el centro ──────────────────────
                // Cada Text ocupa TODO el ZStack y se acomoda con alignment.
                Text("1. Esquinas y centro")
                    .font(.headline)

                ZStack {
                    Color.purple.opacity(0.12)

                    Text("Arriba izq.")
                        .padding(10)   // separa el texto de la orilla
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    Text("Arriba der.")
                        .padding(10)   // separa el texto de la orilla
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    Text("CENTRO")
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    Text("Abajo izq.")
                        .padding(10)   // separa el texto de la orilla
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    Text("Abajo der.")
                        .padding(10)   // separa el texto de la orilla
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }
                .frame(height: 220)   // ✏️ DEMO: bórralo para usar toda la pantalla

                // ── 2. Botón pegado abajo con Spacer ────────────────────
                Text("2. Contenido arriba, botón pegado abajo")
                    .font(.headline)

                VStack(spacing: 12) {
                    Text("Título arriba")                         // ✏️
                        .font(.title2)
                        .bold()
                    Text("El Spacer() se come todo el espacio libre y empuja el botón hasta abajo.")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)

                    Spacer()   // ← la clave: un solo Spacer entre contenido y botón

                    Button {
                        // ✏️ acción
                    } label: {
                        Text("Continuar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                }
                .padding()
                .background(Color.orange.opacity(0.12))
                .frame(height: 280)   // ✏️ DEMO

                // ── 3. Centrado vertical y horizontal ───────────────────
                // Dos Spacer (uno arriba y otro abajo) se reparten el espacio
                // y dejan el contenido justo a la mitad.
                Text("3. Todo centrado")
                    .font(.headline)

                VStack(spacing: 8) {
                    Spacer()
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.green)
                    Text("¡Listo!")                               // ✏️
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.12))
                .frame(height: 220)   // ✏️ DEMO

                // ── 4. Izquierda / centro / derecha con .frame ──────────
                Text("4. Texto a la izquierda, centro o derecha")
                    .font(.headline)

                VStack(spacing: 8) {
                    Text("A la izquierda")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue.opacity(0.12))
                    Text("Al centro")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.blue.opacity(0.12))
                    Text("A la derecha")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .background(Color.blue.opacity(0.12))
                }

                // ── 5. alignment del VStack (alinea a los hijos) ────────
                Text("5. VStack(alignment: .leading / .center / .trailing)")
                    .font(.headline)

                HStack(spacing: 8) {
                    VStack(alignment: .leading) {
                        Text(".leading").bold()
                        Text("corto")
                        Text("más largo")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.purple.opacity(0.12))

                    VStack(alignment: .center) {
                        Text(".center").bold()
                        Text("corto")
                        Text("más largo")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.purple.opacity(0.12))

                    VStack(alignment: .trailing) {
                        Text(".trailing").bold()
                        Text("corto")
                        Text("más largo")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.purple.opacity(0.12))
                }
                .font(.footnote)

                // ── 6. Algo encima de otra cosa, en su esquina ──────────
                // ⚠️ NO VISTO EN CLASE: .overlay(alignment:) pone una vista ENCIMA
                // de otra, en la esquina que digas, sin moverla de su lugar.
                Text("6. Ícono con contador en la esquina")
                    .font(.headline)

                HStack(spacing: 30) {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(.purple)
                        .overlay(alignment: .topTrailing) {
                            Text("3")                             // ✏️
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                                .frame(width: 22, height: 22)
                                .background(Color.red)
                                .clipShape(.circle)
                                .offset(x: 8, y: -8)
                        }

                    Image(systemName: "cart.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(.indigo)
                        .overlay(alignment: .topTrailing) {
                            Text("12")
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                                .frame(width: 24, height: 24)
                                .background(Color.red)
                                .clipShape(.circle)
                                .offset(x: 10, y: -10)
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)

                // ── 7. HStack(alignment: .top / .center / .bottom) ──────
                // Diapositiva de clase "Alinear elementos hijos en HStack":
                //   a) Arriba    HStack(alignment: .top) { }
                //   b) Abajo     HStack(alignment: .bottom) { }
                //   c) En medio  HStack(alignment: .center) { }
                // Se nota cuando los hijos tienen distinta altura.
                Text("7. HStack(alignment: .top / .center / .bottom)")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .top) {                       // a) Arriba
                        Text(".top").bold().frame(width: 70, alignment: .leading)
                        Color.purple.opacity(0.4).frame(width: 40, height: 60)   // bloque alto
                        Text("chico")
                    }
                    HStack(alignment: .center) {                    // c) En medio
                        Text(".center").bold().frame(width: 70, alignment: .leading)
                        Color.purple.opacity(0.4).frame(width: 40, height: 60)   // bloque alto
                        Text("chico")
                    }
                    HStack(alignment: .bottom) {                    // b) Abajo
                        Text(".bottom").bold().frame(width: 70, alignment: .leading)
                        Color.purple.opacity(0.4).frame(width: 40, height: 60)   // bloque alto
                        Text("chico")
                    }
                }
                .font(.footnote)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.purple.opacity(0.06))

                // ── 8. Alinear TODO el VStack hacia la izquierda ────────
                // Código exacto de la clase "Mi primera app":
                //     VStack(alignment: .leading) {
                //     }
                //     .frame(
                //         maxWidth: .infinity,
                //         alignment: .leading)
                // Consejo de la profesora: "primero intenta colocar todos los
                // elementos dentro del VStack antes de recurrir a este
                // modificador .frame".
                Text("8. Todo el VStack pegado a la izquierda")
                    .font(.headline)

                VStack(alignment: .leading) {
                    Text("Teclea tu nombre:")                       // ✏️
                    Text("Este bloque está pegado a la izquierda")
                        .foregroundStyle(.secondary)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading)
                .padding()
                .background(Color.blue.opacity(0.12))
            }
            .padding()
        }
    }
}

#Preview {
    AlineacionView()
}
