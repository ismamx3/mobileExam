// ═══════════════════════════════════════════════════════════════
//  NuevoRegistroConFotoView.swift  ·  10 Fotos y cámara
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Formulario: nombre + descripción + foto (galería o
//              cámara). Valida cada dato con una alerta específica.
//              Si todo está bien, AGREGA a la lista y regresa solo.
//  ÚSALO PARA: "formulario para dar de alta X con foto".
//  BUSCA:      formulario, form, validacion, validar vacio, alerta,
//              append, agregar, dismiss, Binding lista, foto, camara
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/NuevoRegistroConFotoView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   10_FotosYCamara/RegistroConFoto.swift (modelo),
//              10_FotosYCamara/CamaraPicker.swift + permiso de cámara.
//              Se abre desde RegistroConFotoView (que le pasa $registros).
//  ⚠️ NO VISTO EN CLASE: UIImagePickerController.isSourceTypeAvailable(.camera)
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import PhotosUI

struct NuevoRegistroConFotoView: View {

    // @Binding: la lista es de la pantalla anterior; aquí solo
    // recibimos permiso para modificarla (agregar).
    @Binding var registros: [RegistroConFoto]

    // Para regresar a la lista por código después de guardar
    @Environment(\.dismiss) private var dismiss

    // Datos del formulario
    @State private var nombre: String = ""
    @State private var descripcion: String = ""
    @State private var foto: UIImage? = nil

    // Galería y cámara
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var showCamara = false

    // Alerta con mensaje que cambia según el error
    @State private var showAlert = false
    @State private var alertMessage = ""

    // Para esconder el teclado
    @FocusState private var campoEnFoco: Bool

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. Campos de texto ────────────────────────
                    Text("Nombre")
                        .font(.headline)
                    TextField("Ej. Firulais", text: $nombre)              // ✏️
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Descripción")
                        .font(.headline)
                    TextField("Ej. Perro muy juguetón", text: $descripcion) // ✏️
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    // ── 2. Vista previa de la foto ────────────────
                    Text("Foto")
                        .font(.headline)

                    if let fotoElegida = foto {
                        Image(uiImage: fotoElegida)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 220)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        VStack(spacing: 8) {
                            Image(systemName: "photo")
                                .font(.system(size: 40))
                            Text("Sin foto")
                        }
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    // ── 3. Botones Galería y Cámara ───────────────
                    HStack(spacing: 12) {
                        PhotosPicker(
                            selection: $selectedItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                            Label("Galería", systemImage: "photo.on.rectangle")
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(.purple.opacity(0.15))
                                .foregroundStyle(.purple)
                                .cornerRadius(12)
                        }
                        .onChange(of: selectedItem) { oldItem, newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    foto = uiImage
                                }
                            }
                        }

                        Button {
                            // ⚠️ NO VISTO EN CLASE: el simulador no tiene cámara
                            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                showCamara = true
                            } else {
                                alertMessage = "Este dispositivo no tiene cámara. Usa la galería."
                                showAlert.toggle()
                            }
                        } label: {
                            Label("Cámara", systemImage: "camera.fill")
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(.purple.opacity(0.15))
                                .foregroundStyle(.purple)
                                .cornerRadius(12)
                        }
                        .sheet(isPresented: $showCamara) {
                            CamaraPicker(selectedImageFromCamera: $foto)
                        }
                    }

                    // ── 4. Guardar con validación ─────────────────
                    Button {
                        guardarRegistro()
                    } label: {
                        Text("Guardar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)                                         // ✏️ color
                    .padding(.top, 10)
                }
                .padding()
            }
        }
        .onTapGesture {
            campoEnFoco = false           // tocar fuera esconde el teclado
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
        .navigationTitle("Nuevo registro")                                 // ✏️ título
    }

    // Revisa cada dato en orden. Al primer error avisa cuál falta.
    func guardarRegistro() {
        if nombre.isEmpty {
            alertMessage = "Escribe el nombre"                             // ✏️ mensajes
            showAlert.toggle()
        } else if descripcion.isEmpty {
            alertMessage = "Escribe una descripción"
            showAlert.toggle()
        } else if foto == nil {
            // ✏️ quita este else if si la foto NO es obligatoria
            alertMessage = "Agrega una foto de la galería o de la cámara"
            showAlert.toggle()
        } else {
            let nuevo = RegistroConFoto(nombre: nombre, descripcion: descripcion, foto: foto)
            registros.append(nuevo)       // se ve en la lista gracias al @Binding
            dismiss()                     // regresa a la lista
        }
    }
}

#Preview {
    NavigationStack {
        NuevoRegistroConFotoView(registros: .constant([]))
    }
}
