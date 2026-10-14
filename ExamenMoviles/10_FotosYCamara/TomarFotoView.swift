// ═══════════════════════════════════════════════════════════════
//  TomarFotoView.swift  ·  10 Fotos y cámara
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Botón que abre la cámara (CamaraPicker) en una sheet
//              y muestra la foto tomada.
//  ÚSALO PARA: "el usuario toma una foto con la cámara".
//  BUSCA:      camara, camera, tomar foto, take photo, sheet,
//              CamaraPicker, permiso camara, NSCameraUsageDescription
//
//  CÓMO COPIARLO:
//   1. Primero copia 10_FotosYCamara/CamaraPicker.swift (sin cambiarlo).
//   2. En tu proyecto crea Views/TomarFotoView.swift y pega este archivo.
//   3. Agrega el PERMISO de cámara (si no, la app truena al abrirla):
//      a. Navegador del proyecto → clic en el proyecto (lo de hasta arriba).
//      b. Selecciona el TARGET → pestaña "Info".
//      c. Clic derecho en la última fila de "Custom iOS Target
//         Properties" → "Add Row".
//      d. Elige "Privacy - Camera Usage Description" y en "Value"
//         escribe el mensaje, ej. "La app usa la cámara para tomar fotos."
//      (En ESTE repo ya está puesto en Build Settings como
//       INFOPLIST_KEY_NSCameraUsageDescription. Es lo mismo.)
//   4. Cambia lo marcado con ✏️
//  NECESITA:   10_FotosYCamara/CamaraPicker.swift + permiso de cámara.
//              El simulador NO tiene cámara → sale una alerta.
//              Para probar de verdad usa un iPhone físico.
//  ⚠️ NO VISTO EN CLASE: UIImagePickerController.isSourceTypeAvailable(.camera)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TomarFotoView: View {

    // La foto que regresa la cámara (nil = todavía no hay foto)
    @State private var selectedImage: UIImage?
    // Prende / apaga la sheet de la cámara
    @State private var showCamara = false
    // Alerta para cuando no hay cámara (simulador)
    @State private var showAlertSinCamara = false

    var body: some View {
        ZStack {
            Color.orange.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    Text("Toma una foto con la cámara")
                        .font(.headline)

                    // ── 1. Mostrar la foto tomada ─────────────────
                    if let fotoTomada = selectedImage {
                        Image(uiImage: fotoTomada)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)                  // ✏️ tamaño
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        VStack(spacing: 8) {
                            Image(systemName: "camera")
                                .font(.system(size: 60))
                            Text("Todavía no hay foto")
                        }
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    // ── 2. Botón que abre la cámara en una sheet ──
                    Button("Abrir Cámara", systemImage: "camera.fill") {      // ✏️ texto
                        // ⚠️ NO VISTO EN CLASE: revisa si el dispositivo tiene cámara.
                        // En el simulador NO hay, y abrir CamaraPicker ahí truena.
                        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                            showCamara = true
                        } else {
                            showAlertSinCamara.toggle()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)                                             // ✏️ color
                    .controlSize(.large)
                    .sheet(isPresented: $showCamara) {
                        // El @Binding regresa la foto en selectedImage
                        CamaraPicker(selectedImageFromCamera: $selectedImage)
                    }
                    .alert("Este dispositivo no tiene cámara. Pruébalo en un iPhone físico.", isPresented: $showAlertSinCamara) {
                        Button("OK") {}
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Cámara")
    }
}

#Preview {
    NavigationStack {
        TomarFotoView()
    }
}
