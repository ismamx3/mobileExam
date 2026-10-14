// ═══════════════════════════════════════════════════════════════
//  _Tema10MenuView.swift  ·  10 Fotos y cámara (menú del tema)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo es el menú del simulador que
//  lleva a cada ejemplo del tema.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema10MenuView: View {
    var body: some View {
        List {
            Section("Galería (PhotosPicker)") {
                NavigationLink {
                    SeleccionarFotoView()
                } label: {
                    EjemploRow(titulo: "Escoger una foto", archivo: "10_FotosYCamara/SeleccionarFotoView.swift", icono: "photo.on.rectangle")
                }
                NavigationLink {
                    VariasFotosView()
                } label: {
                    EjemploRow(titulo: "Escoger varias fotos (cuadrícula)", archivo: "10_FotosYCamara/VariasFotosView.swift", icono: "photo.stack")
                }
            }

            Section("Cámara (CamaraPicker)") {
                NavigationLink {
                    TomarFotoView()
                } label: {
                    EjemploRow(titulo: "Tomar foto + permiso", archivo: "10_FotosYCamara/TomarFotoView.swift", icono: "camera.fill")
                }
                NavigationLink {
                    FotoPerfilView()
                } label: {
                    EjemploRow(titulo: "Foto de perfil (galería o cámara)", archivo: "10_FotosYCamara/FotoPerfilView.swift", icono: "person.crop.circle")
                }
            }

            Section("Tipo examen") {
                EjemploPantallaCompleta(titulo: "Registros con foto (lista + formulario)", archivo: "10_FotosYCamara/RegistroConFotoView.swift", icono: "list.bullet.rectangle.portrait") {
                    RegistroConFotoView()
                }
            }

            Section("Archivo de la profesora") {
                Label("CamaraPicker.swift — se copia tal cual, no se modifica", systemImage: "doc.badge.gearshape")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("10 · Fotos y cámara")
    }
}

#Preview {
    NavigationStack {
        Tema10MenuView()
    }
}
