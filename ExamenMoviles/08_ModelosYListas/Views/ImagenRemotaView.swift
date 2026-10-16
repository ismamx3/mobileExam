// ═══════════════════════════════════════════════════════════════
//  ImagenRemotaView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Imágenes que se descargan de una URL con AsyncImage
//              (Anexo A "Imagen de URL" de la clase de Modelos y Listas).
//  ÚSALO PARA: cuando el modelo trae un link de imagen (ligaImagen).
//  BUSCA:      asyncimage, AsyncImage, imagen url, imagen de URL, imagen de internet,
//              remote image, placeholder, link imagen, pokemon, scale
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

    // URL de la lámina. Otras de clase: .../pokedex/full/001.png, 002.png, 003.png
    let ligaImagen = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/077.png"   // ✏️ tu URL

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Versión básica ────────────────────────────────
                Text("1. Básica")
                    .font(.headline)
                // scale: 3 la hace 3 veces más chica que su tamaño original.
                AsyncImage(url: URL(string: ligaImagen), scale: 3)

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
                        .frame(height: 100)
                }
                .frame(height: 100)                            // ✏️ tamaño

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
