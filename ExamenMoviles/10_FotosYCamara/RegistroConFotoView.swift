// ═══════════════════════════════════════════════════════════════
//  RegistroConFotoView.swift  ·  10 Fotos y cámara  (PANTALLA RAÍZ)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Mini app tipo examen: una lista de registros con foto.
//              Botón "Nuevo registro" → formulario con validación
//              (nombre + descripción + foto de galería o cámara).
//              Al tocar un renglón → detalle con la foto grande.
//  ÚSALO PARA: "registra X con su foto y muéstralos en una lista".
//  BUSCA:      registro con foto, formulario foto, lista con fotos,
//              agregar a lista, append, NavigationStack, Binding
//
//  CÓMO COPIARLO (son 5 archivos de esta carpeta):
//   1. Model/RegistroConFoto.swift          ← el struct
//   2. Components/RegistroConFotoRow.swift  ← el renglón
//   3. Views/RegistroConFotoView.swift      ← ESTE (la lista, es la raíz)
//   4. Views/NuevoRegistroConFotoView.swift ← el formulario
//   5. Views/DetalleRegistroConFotoView.swift ← el detalle
//   + CamaraPicker.swift y el permiso de cámara (ver TomarFotoView.swift).
//   Cambia lo marcado con ✏️
//  NECESITA:   lo de arriba. Esta vista YA trae su NavigationStack,
//              así que úsala como pantalla inicial o dentro de un tab.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct RegistroConFotoView: View {

    // Esta vista es DUEÑA de la lista (@State).
    // El formulario la recibe con @Binding para poder agregar.
    @State private var registros: [RegistroConFoto] = [
        // ✏️ dato de ejemplo. UIImage(named:) busca en Assets; si no existe da nil (sin foto).
        RegistroConFoto(nombre: "Firulais", descripcion: "Perro muy juguetón", foto: UIImage(named: "mascota"))
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // ── 1. La lista (o un mensaje si está vacía) ──
                if registros.isEmpty {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "tray")
                            .font(.system(size: 50))
                        Text("Todavía no hay registros")
                    }
                    .foregroundStyle(.gray)
                    Spacer()
                } else {
                    List(registros) { registroItem in
                        NavigationLink {
                            DetalleRegistroConFotoView(registro: registroItem)
                        } label: {
                            RegistroConFotoRow(registro: registroItem)
                        }
                    }
                    .listStyle(.inset)
                }

                // ── 2. Botón para ir al formulario ────────────
                NavigationLink {
                    // Con $: el formulario puede AGREGAR a la lista
                    NuevoRegistroConFotoView(registros: $registros)
                } label: {
                    Label("Nuevo registro", systemImage: "plus")          // ✏️ texto
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)                                            // ✏️ color
                .padding()
            }
            .navigationTitle("Registros")                                 // ✏️ título
        }
    }
}

#Preview {
    RegistroConFotoView()
}
