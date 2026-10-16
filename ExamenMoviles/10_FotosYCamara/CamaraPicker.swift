// ═══════════════════════════════════════════════════════════════
//  CamaraPicker.swift  ·  10 Fotos y cámara
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El archivo de la profesora (Canvas) que abre la cámara.
//              SwiftUI todavía no tiene un equivalente a PhotosPicker
//              para la cámara. Por eso se usa UIImagePickerController
//              (del framework anterior, UIKit) dentro de una estructura
//              propia, CamaraPicker, que implementa el protocolo
//              UIViewControllerRepresentable (de SwiftUI). Así queda
//              encapsulado y se usa en cualquier pantalla como un
//              componente propio.
//              (Para una cámara personalizada se usaría AVFoundation;
//              solo se mencionó en clase.)
//  ÚSALO PARA: tomar una foto con la cámara del iPhone.
//  BUSCA:      camara, camera, CamaraPicker, UIImagePickerController,
//              UIViewControllerRepresentable, UIKit, tomar foto,
//              take photo, sheet camara
//
//  CÓMO COPIARLO:
//   1. Arrastra este archivo a tu proyecto (o el de Canvas).
//      Marca "Copy items if needed" para que se haga una COPIA.
//   2. NO lo modifiques. Se usa tal cual.
//   3. Desde tu vista se llama así (dentro de un .sheet):
//
//        @State private var selectedImage: UIImage?
//        @State private var showCamara = false
//
//        .sheet(isPresented: $showCamara) {
//            CamaraPicker(selectedImageFromCamera: $selectedImage)
//        }
//
//      selectedImageFromCamera es un @Binding: el componente
//      REGRESA la foto en tu variable (paso de valores ida y vuelta).
//  NECESITA:   permiso "Privacy - Camera Usage Description" en la
//              pestaña Info del target (si no, la app truena).
//              Obligatorio desde iOS 10.
//              Ver 10_FotosYCamara/TomarFotoView.swift.
//              El simulador NO tiene cámara: prueba en iPhone físico.
// ═══════════════════════════════════════════════════════════════
//
//  CamaraPicker.swift
//
//  Created by Cristina Gonzalez Cordova
//
import SwiftUI
import UIKit

struct CamaraPicker: UIViewControllerRepresentable {
    private let sourceType: UIImagePickerController.SourceType = .camera
    @Binding var selectedImageFromCamera: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CamaraPicker

        init(_ parent: CamaraPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImageFromCamera = image
            }
            picker.dismiss(animated: true)
        }
    }
}
