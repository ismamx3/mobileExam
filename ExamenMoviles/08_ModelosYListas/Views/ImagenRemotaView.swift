// ═══════════════════════════════════════════════════════════════
//  ImagenRemotaView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Imágenes que se descargan de una URL con AsyncImage.
//  ÚSALO PARA: cuando el modelo trae un link de imagen (ligaImagen).
//  BUSCA:      asyncimage, imagen url, imagen de internet, remote image, placeholder, link imagen
//
//  ⚠️ OJO EN EL EXAMEN: AsyncImage NECESITA INTERNET. Sin conexión solo verás
//     el placeholder. Si no hay internet, usa imágenes en Assets:
//         Image("foto1")   en lugar de   AsyncImage(url: ...)
//     (Assets: funcionan sin conexión, no gastan datos y cargan al instante).
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ImagenRemotaView.swift (o pega solo el bloque).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (la URL).
//  NECESITA:   conexión a internet.
//  ⚠️ NO VISTO EN CLASE: AsyncImage con { fase in } (bloque 3)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ImagenRemotaView: View {

    let ligaImagen = "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png"   // ✏️ tu URL

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Versión básica ────────────────────────────────
                Text("1. Básica")
                    .font(.headline)
                // scale: 3 la hace 3 veces más chica que su tamaño original.
                AsyncImage(url: URL(string: ligaImagen), scale: 3)
                    .frame(maxWidth: .infinity)

                Divider()

                // ── 2. Con placeholder y tamaño (la de clase) ────────
                Text("2. Con placeholder")
                    .font(.headline)
                AsyncImage(url: URL(string: ligaImagen)) { image in
                    image
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    // Lo que se ve MIENTRAS carga (o si no hay internet).
                    Color.gray
                        .frame(width: 150, height: 150)
                }
                .frame(height: 150)
                .frame(maxWidth: .infinity)

                Divider()

                // ── 3. Con mensaje si falla ──────────────────────────
                // ⚠️ NO VISTO EN CLASE: la "fase" dice si ya cargó, si falló o si
                // sigue cargando. Útil para avisar "sin conexión".
                Text("3. Con mensaje de error")
                    .font(.headline)
                AsyncImage(url: URL(string: ligaImagen)) { fase in
                    if let image = fase.image {
                        image
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                    } else if fase.error != nil {
                        VStack {
                            Image(systemName: "wifi.slash")
                                .font(.largeTitle)
                            Text("Sin conexión")
                        }
                        .foregroundStyle(.secondary)
                    } else {
                        ProgressView()
                    }
                }
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .navigationTitle("AsyncImage")                         // ✏️
    }
}

#Preview {
    NavigationStack {
        ImagenRemotaView()
    }
}
