// ═══════════════════════════════════════════════════════════════
//  ImagenesView.swift  ·  02 Mi primera app
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Imágenes de Assets y SF Symbols: el orden correcto de
//              modificadores, fit vs fill, foto circular con borde y
//              sombra, esquinas redondeadas, imagen de fondo con texto
//              encima, e imagen que cambia según un Picker.
//  ÚSALO PARA: foto de perfil, portada, logo, íconos, galería.
//  BUSCA:      image, imagen, foto, assets, resizable, aspectRatio, fit,
//              fill, frame, circulo, circular, clipShape, borde, stroke,
//              sombra, shadow, esquinas redondeadas, cornerRadius,
//              SF Symbols, systemName, icono, imagen de fondo, background,
//              imageScale, tint, globe, Gravity
//
//  CÓMO COPIARLO:
//   1. Copia la Image del bloque que quieras con sus modificadores.
//   2. Cambia el nombre de la imagen ("foto1", "perfil"...) por el de
//      tu asset. Para agregarla (Clase 3): navegador del proyecto
//      (izquierda) → Assets.xcassets → arrastra y suelta la imagen.
//      En el código va su nombre: Image("Gravity").
//   3. Cambia lo marcado con ✏️
//  NECESITA:   imágenes "foto1", "foto2", "foto3", "foto4" y "perfil"
//              en Assets (o cambia los nombres por los tuyos).
//  ⚠️ NO VISTO EN CLASE: .clipped() (recorta lo que se sale del frame)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ImagenesView: View {

    @State private var fotoElegida = "foto1"       // nombre del asset que se muestra

    var body: some View {
        ZStack {
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // ── 1. Imagen de Assets (orden de clase) ─────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Imagen de Assets")
                            .font(.headline)
                        // Sin modificadores la imagen queda muy grande.
                        // Sin .resizable el .frame NO hace nada.
                        // .fit evita que se deforme. .frame pone el tamaño final.
                        Image("foto1")                                   // ✏️ nombre de tu asset
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                            .frame(maxWidth: .infinity)                  // solo para centrarla
                    }

                    // ── 2. fit vs fill ───────────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. .fit (completa) vs .fill (llena y recorta)")
                            .font(.headline)
                        HStack(spacing: 16) {
                            VStack {
                                Image("foto2")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)      // se ve completa, puede dejar espacio
                                    .frame(width: 150, height: 150)
                                    .background(Color.gray.opacity(0.2))
                                Text(".fit")
                            }
                            VStack {
                                Image("foto2")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fill)     // llena todo el cuadro
                                    .frame(width: 150, height: 150)
                                    .clipped()      // ⚠️ NO VISTO EN CLASE: recorta lo que se sale
                                Text(".fill + .clipped()")
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }

                    // ── 3. Circular con borde y sombra ───────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. Circular con borde y sombra")
                            .font(.headline)
                        // Usa una imagen cuadrada para que el círculo salga perfecto
                        Image("perfil")                                  // ✏️
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .clipShape(.circle)
                            .overlay {
                                Circle().stroke(.orange, lineWidth: 5)   // ✏️ color y grosor del borde
                            }
                            .shadow(color: .orange, radius: 5)
                            .frame(maxWidth: .infinity)
                    }

                    // ── 4. Esquinas redondeadas con borde ────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. Esquinas redondeadas con borde")
                            .font(.headline)
                        // El radio del clipShape y el del borde deben ser IGUALES
                        Image("foto3")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple, lineWidth: 3)
                            )
                            .frame(maxWidth: .infinity)
                    }

                    // ── 5. SF Symbols (íconos del sistema) ───────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("5. SF Symbols")
                            .font(.headline)
                        HStack(spacing: 24) {
                            Image(systemName: "gamecontroller.fill")    // ✏️ nombre del símbolo
                                .font(.system(size: 50))                 // el tamaño se pone con font
                                .foregroundStyle(.purple)
                            Image(systemName: "heart.fill")
                                .font(.system(size: 50))
                                .foregroundStyle(.red)
                            Image(systemName: "star.circle.fill")
                                .font(.system(size: 50))
                                .foregroundStyle(.orange)
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 50))
                                .foregroundStyle(.blue)
                        }
                        .frame(maxWidth: .infinity)

                        // Así viene el símbolo en el ContentView de un proyecto nuevo:
                        HStack {
                            Image(systemName: "globe")
                                .imageScale(.large)                      // .small .medium .large
                                .foregroundStyle(.tint)                  // color de acento de la app
                            Text("Hola Mundo")
                        }

                        Text("Busca nombres en la app SF Symbols de la Mac.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    // ── 6. Imagen de fondo con texto encima ──────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("6. Imagen de fondo con texto encima")
                            .font(.headline)
                        ZStack {
                            Image("foto4")                               // ✏️
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 180)
                                .clipped()

                            Text("Texto sobre la imagen")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                                .shadow(color: .black, radius: 4)        // sombra = se lee mejor
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        // Para fondo de TODA la pantalla: dentro de un ZStack pon
                        // Image("foto4").resizable(resizingMode: .stretch)
                        //     .aspectRatio(contentMode: .fill).ignoresSafeArea()
                    }

                    // ── 7. Imagen que cambia con un Picker ───────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("7. Imagen según lo que elija el usuario")
                            .font(.headline)
                        Picker(selection: $fotoElegida, label: Text("Foto")) {
                            Text("Montaña").tag("foto1")                 // ✏️ el tag = nombre del asset
                            Text("Playa").tag("foto2")
                            Text("Pizza").tag("foto3")
                            Text("Cohete").tag("foto4")
                        }
                        .pickerStyle(.segmented)

                        Image(fotoElegida)                               // usa la variable, no un texto fijo
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Imágenes")
    }
}

#Preview {
    NavigationStack {
        ImagenesView()
    }
}
