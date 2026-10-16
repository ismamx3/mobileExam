// ═══════════════════════════════════════════════════════════════
//  VariasFotosView.swift  ·  10 Fotos y cámara
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Escoger VARIAS fotos de la galería a la vez y
//              mostrarlas en una cuadrícula de 3 columnas.
//  ÚSALO PARA: galería / álbum, "sube hasta 6 fotos", evidencias.
//  BUSCA:      varias fotos, multiples fotos, multiple selection,
//              maxSelectionCount, galeria, grid, cuadricula, LazyVGrid,
//              PhotosPickerItem arreglo
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/VariasFotosView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import PhotosUI (ya viene arriba). NO pide permiso.
//  ⚠️ NO VISTO EN CLASE: maxSelectionCount (selección múltiple),
//                        LazyVGrid + GridItem (cuadrícula),
//                        ForEach por índice y role: .destructive.
//                        En clase solo se vio escoger UNA foto
//                        (SeleccionarFotoView.swift).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import PhotosUI

struct VariasFotosView: View {

    // Igual que con una foto, pero ahora son ARREGLOS
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var fotosCargadas: [UIImage] = []

    // ⚠️ NO VISTO EN CLASE: 3 columnas que se reparten el ancho por igual.
    // Para 2 columnas deja solo dos GridItem.
    let columnasFotos = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            Color.teal.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    // ── 1. PhotosPicker de varias fotos ───────────
                    PhotosPicker(
                        selection: $selectedItems,
                        maxSelectionCount: 6,                 // ✏️ máximo de fotos (⚠️)
                        matching: .images,
                        photoLibrary: .shared()) {
                        Label("Seleccionar fotos", systemImage: "photo.stack")   // ✏️ texto
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background(.teal)
                            .foregroundStyle(.white)
                            .cornerRadius(12)
                    }
                    // ── 2. Convertir TODAS a UIImage ──────────────
                    .onChange(of: selectedItems) { oldItems, newItems in
                        Task {
                            var nuevasFotos: [UIImage] = []
                            // Mismo código que con una foto, pero dentro de un for
                            for item in newItems {
                                if let data = try? await item.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    nuevasFotos.append(uiImage)
                                }
                            }
                            fotosCargadas = nuevasFotos
                        }
                    }

                    Text("\(fotosCargadas.count) de 6 fotos")       // ✏️ mismo número que arriba
                        .foregroundStyle(.gray)

                    // ── 3. Cuadrícula de fotos ────────────────────
                    if fotosCargadas.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "photo.on.rectangle.angled")
                                .font(.system(size: 50))
                            Text("Todavía no hay fotos")
                        }
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        LazyVGrid(columns: columnasFotos, spacing: 8) {
                            // ⚠️ NO VISTO EN CLASE: ForEach por índice.
                            // UIImage no es Identifiable, por eso se recorre por posición (0, 1, 2...)
                            ForEach(0..<fotosCargadas.count, id: \.self) { indice in
                                Image(uiImage: fotosCargadas[indice])
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fill)   // llena el cuadro sin deformar
                                    .frame(width: 105, height: 105)   // ✏️ tamaño de cada cuadro
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }

                    // ── 4. Borrar todas ───────────────────────────
                    if !fotosCargadas.isEmpty {
                        // ⚠️ NO VISTO EN CLASE: role: .destructive pinta el botón de rojo
                        Button("Borrar todas", role: .destructive) {
                            fotosCargadas = []
                            selectedItems = []
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Varias fotos")
    }
}

#Preview {
    NavigationStack {
        VariasFotosView()
    }
}
