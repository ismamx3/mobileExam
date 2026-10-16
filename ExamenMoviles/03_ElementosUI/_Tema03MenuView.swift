// ═══════════════════════════════════════════════════════════════
//  _Tema03MenuView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es el menú del tema dentro de este repo.
//  Cada renglón dice en qué archivo está el código del ejemplo.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema03MenuView: View {
    var body: some View {
        List {
            Section("Escribir texto") {
                NavigationLink {
                    TextFieldsView()
                } label: {
                    EjemploRow(titulo: "TextField, contraseña y teclado", archivo: "03_ElementosUI/TextFieldsView.swift", icono: "character.cursor.ibeam")
                }
            }

            Section("Botones") {
                NavigationLink {
                    BotonesView()
                } label: {
                    EjemploRow(titulo: "Botones (formas y estilos)", archivo: "03_ElementosUI/BotonesView.swift", icono: "hand.tap")
                }
            }

            Section("Elegir valores") {
                NavigationLink {
                    PickersView()
                } label: {
                    EjemploRow(titulo: "Picker (select, segment control, menú)", archivo: "03_ElementosUI/PickersView.swift", icono: "list.bullet.circle")
                }
                NavigationLink {
                    PickersDependientesView()
                } label: {
                    EjemploRow(titulo: "Pickers dependientes (país → ciudad)", archivo: "03_ElementosUI/PickersDependientesView.swift", icono: "arrow.triangle.branch")
                }
                NavigationLink {
                    SliderYToggleView()
                } label: {
                    EjemploRow(titulo: "Slider y Toggle (con onChange)", archivo: "03_ElementosUI/SliderYToggleView.swift", icono: "slider.horizontal.3")
                }
                NavigationLink {
                    ImagenSegunValorView()
                } label: {
                    EjemploRow(titulo: "Imagen que cambia según un valor", archivo: "03_ElementosUI/ImagenSegunValorView.swift", icono: "photo.stack")
                }
                NavigationLink {
                    OtrosControlesView()
                } label: {
                    EjemploRow(titulo: "Stepper, fecha, color, progreso, link", archivo: "03_ElementosUI/OtrosControlesView.swift", icono: "calendar")
                }
            }

            Section("Mensajes y validación") {
                NavigationLink {
                    AlertasView()
                } label: {
                    EjemploRow(titulo: "Alertas (7 tipos)", archivo: "03_ElementosUI/AlertasView.swift", icono: "exclamationmark.bubble")
                }
                NavigationLink {
                    FormularioValidacionView()
                } label: {
                    EjemploRow(titulo: "Formulario con validación completa", archivo: "03_ElementosUI/FormularioValidacionView.swift", icono: "checkmark.shield")
                }
            }
        }
        .navigationTitle("03 · Elementos UI")
    }
}

#Preview {
    NavigationStack {
        Tema03MenuView()
    }
}
