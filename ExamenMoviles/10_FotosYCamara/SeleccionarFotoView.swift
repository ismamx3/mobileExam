// ═══════════════════════════════════════════════════════════════
//  SeleccionarFotoView.swift  ·  10 Fotos y cámara
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Escoger UNA foto de la galería con PhotosPicker y
//              mostrarla en pantalla. Pasos A–F de la clase (Clase 17).
//              Desde iOS 16 SwiftUI trae este componente NATIVO. Abre
//              un image picker que toma el control del dispositivo;
//              el usuario puede cancelar o seleccionar una foto.
//  ÚSALO PARA: "el usuario elige una imagen de sus fotos".
//  BUSCA:      galeria, fotos, photos, PhotosPicker, PhotoPicker,
//              PhotosPickerItem, loadTransferable, UIImage, uiImage,
//              libreria de fotos, seleccionar foto, gallery
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/SeleccionarFotoView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   import PhotosUI (ya viene arriba). NO pide permiso.
//              Funciona en el simulador (trae fotos de ejemplo).
//  ⚠️ NO VISTO EN CLASE: el botón extra "Quitar foto" con role: .destructive
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import PhotosUI                 // A. PhotosPicker vive aquí

struct SeleccionarFotoView: View {

    // B. Lo que el usuario escogió (todavía NO es una imagen).
    @State private var selectedItem: PhotosPickerItem? = nil

    // D. La imagen ya convertida, lista para mostrarse.
    //    Es opcional: nil = todavía no hay foto.
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    Text("Elige una foto de tu galería")
                        .font(.headline)

                    // ── F. Mostrar la imagen ─────────────────────
                    // Image(uiImage: selectedImage) NO compila solo, porque
                    // selectedImage es opcional (?). Primero se verifica que
                    // no sea nula con if let; si es nula, un texto provisional.
                    if let selectedImageBien = selectedImage {
                        Image(uiImage: selectedImageBien)        // uiImage: (no es un asset)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)                  // ✏️ tamaño
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        // Lo que se ve mientras no hay foto
                        VStack(spacing: 8) {
                            Image(systemName: "photo")
                                .font(.system(size: 60))
                            Text("Seleccionar imagen")
                        }
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    // ── C. El componente PhotosPicker ─────────────
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,          // filtra solo fotos
                        photoLibrary: .shared()) {
                        Label("Seleccionar Foto", systemImage: "photo.on.rectangle")   // ✏️ texto
                            .padding(12)
                            .background(.purple)                                         // ✏️ color
                            .foregroundStyle(.white)
                            .cornerRadius(12)
                    }
                    // ── E. Convertir cuando cambia la selección ───
                    .onChange(of: selectedItem) { oldItem, newItem in
                        Task { // ejecuta código asíncrono para cargar la imagen
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                // si pudo CARGAR y CONVERTIR, la asigna a la variable @State
                                selectedImage = uiImage
                            }
                        }
                    }

                    // ── Extra: quitar la foto ─────────────────────
                    if selectedImage != nil {
                        // ⚠️ NO VISTO EN CLASE: role: .destructive pinta el botón de rojo
                        Button("Quitar foto", role: .destructive) {
                            selectedImage = nil
                            selectedItem = nil
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Foto de la galería")
    }
}

#Preview {
    NavigationStack {
        SeleccionarFotoView()
    }
}
