// ═══════════════════════════════════════════════════════════════
//  FotoPerfilView.swift  ·  10 Fotos y cámara
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Foto de perfil CIRCULAR con borde. Dos botones
//              (Galería y Cámara) llenan la MISMA imagen.
//              Si no hay foto, muestra un ícono de persona.
//  ÚSALO PARA: pantalla de perfil, registro de usuario, avatar.
//  BUSCA:      perfil, avatar, foto circular, circle, profile picture,
//              galeria y camara, PhotosPicker, CamaraPicker, quitar foto
//
//  CÓMO COPIARLO:
//   1. Copia antes 10_FotosYCamara/CamaraPicker.swift (sin cambiarlo).
//   2. En tu proyecto crea Views/FotoPerfilView.swift y pega este archivo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   10_FotosYCamara/CamaraPicker.swift + permiso de cámara
//              (pasos en 10_FotosYCamara/TomarFotoView.swift).
//  ⚠️ NO VISTO EN CLASE: UIImagePickerController.isSourceTypeAvailable(.camera)
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import PhotosUI

struct FotoPerfilView: View {

    // UNA sola imagen para las dos fuentes (galería y cámara)
    @State private var fotoPerfil: UIImage? = nil

    // Para la galería
    @State private var selectedItem: PhotosPickerItem? = nil

    // Para la cámara
    @State private var showCamara = false
    @State private var showAlertSinCamara = false

    var body: some View {
        ZStack {
            Color.indigo.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {

                    // ── 1. Foto circular (o ícono si no hay) ──────
                    if let foto = fotoPerfil {
                        Image(uiImage: foto)
                            .resizable(resizingMode: .stretch)
                            // .fill llena todo el círculo (recorta lo que sobra).
                            // Con .fit quedarían huecos si la foto no es cuadrada.
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 180)            // ✏️ tamaño
                            .clipShape(.circle)
                            .overlay {
                                Circle().stroke(.indigo, lineWidth: 5) // ✏️ color del borde
                            }
                            .shadow(color: .indigo, radius: 5)
                    } else {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 160))
                            .foregroundStyle(.gray)
                            .frame(width: 180, height: 180)
                    }

                    Text("Nombre del usuario")                          // ✏️ tu texto
                        .font(.title2)
                        .bold()

                    // ── 2. Botones Galería y Cámara (mismo ancho) ─
                    HStack(spacing: 12) {

                        PhotosPicker(
                            selection: $selectedItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                            Label("Galería", systemImage: "photo.on.rectangle")
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(.indigo)
                                .foregroundStyle(.white)
                                .cornerRadius(12)
                        }
                        .onChange(of: selectedItem) { oldItem, newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    fotoPerfil = uiImage
                                }
                            }
                        }

                        Button {
                            // ⚠️ NO VISTO EN CLASE: evita que truene en el simulador (sin cámara)
                            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                showCamara = true
                            } else {
                                showAlertSinCamara.toggle()
                            }
                        } label: {
                            Label("Cámara", systemImage: "camera.fill")
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(.indigo)
                                .foregroundStyle(.white)
                                .cornerRadius(12)
                        }
                        .sheet(isPresented: $showCamara) {
                            // La cámara escribe en la MISMA variable que la galería
                            CamaraPicker(selectedImageFromCamera: $fotoPerfil)
                        }
                    }

                    // ── 3. Quitar foto ────────────────────────────
                    if fotoPerfil != nil {
                        Button("Quitar foto", role: .destructive) {
                            fotoPerfil = nil
                            selectedItem = nil
                        }
                    }
                }
                .padding()
            }
        }
        .alert("Este dispositivo no tiene cámara. Usa la galería o un iPhone físico.", isPresented: $showAlertSinCamara) {
            Button("OK") {}
        }
        .navigationTitle("Foto de perfil")
    }
}

#Preview {
    NavigationStack {
        FotoPerfilView()
    }
}
