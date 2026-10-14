// ═══════════════════════════════════════════════════════════════
//  DetalleRegistroConFotoView.swift  ·  10 Fotos y cámara
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de detalle: la foto grande + nombre +
//              descripción de un RegistroConFoto.
//  ÚSALO PARA: "al tocar un elemento de la lista, ver su detalle".
//  BUSCA:      detalle, detail, foto grande, paso de valores
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/DetalleRegistroConFotoView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   10_FotosYCamara/RegistroConFoto.swift (modelo).
//              Se abre desde RegistroConFotoView con NavigationLink.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct DetalleRegistroConFotoView: View {

    // Paso de valores de ida: sin @State y sin private
    var registro: RegistroConFoto

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {

                    // ── 1. Foto grande ────────────────────────────
                    if let foto = registro.foto {
                        Image(uiImage: foto)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 5)
                    } else {
                        Image(systemName: "photo")
                            .font(.system(size: 80))
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity)
                            .frame(height: 250)
                            .background(Color.gray.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }

                    // ── 2. Textos ─────────────────────────────────
                    Text(registro.nombre)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)

                    Text(registro.descripcion)
                        .font(.title3)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
        }
        .navigationTitle("Detalle")                                       // ✏️ título
    }
}

#Preview {
    NavigationStack {
        DetalleRegistroConFotoView(registro: RegistroConFoto(nombre: "Firulais", descripcion: "Perro muy juguetón", foto: UIImage(named: "mascota")))
    }
}
