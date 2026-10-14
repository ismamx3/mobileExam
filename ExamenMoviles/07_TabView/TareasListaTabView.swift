// ═══════════════════════════════════════════════════════════════
//  TareasListaTabView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña que MODIFICA la lista compartida: agrega tareas
//              nuevas (con validación) y las marca como completadas.
//  ÚSALO PARA: agregar elementos a una lista desde un TextField,
//              marcar/desmarcar con un Toggle dentro de la List.
//  BUSCA:      agregar a la lista, append, binding lista, List($lista),
//              toggle en lista, marcar completada, nueva tarea, validar vacio
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TareasListaTabView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   07_TabView/Model/TareaTab.swift
//  ⚠️ NO VISTO EN CLASE: .strikethrough (texto tachado)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TareasListaTabView: View {

    // @Binding: la lista vive en TabDatosCompartidosView
    @Binding var tareas: [TareaTab]

    @State private var nuevaTarea = ""
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // ── 1. Agregar una tarea ────────────────────────────
                HStack(spacing: 12) {
                    TextField("Nueva tarea", text: $nuevaTarea)       // ✏️
                        .textFieldStyle(.roundedBorder)

                    Button("Agregar") {
                        agregarTarea()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
                .padding()

                // ── 2. Lista que se puede modificar ─────────────────
                // List($tareas) { $tarea in } da un binding por renglón:
                //   $tarea = se puede modificar   ·   tarea = solo leer
                List($tareas) { $tarea in
                    Toggle(isOn: $tarea.completada) {
                        Text(tarea.titulo)
                            // ⚠️ NO VISTO EN CLASE: tacha el texto si ya está completada
                            .strikethrough(tarea.completada)
                            .foregroundStyle(tarea.completada ? .secondary : .primary)
                    }
                    .tint(.green)
                }
                .listStyle(.inset)
            }
            .navigationTitle("Tareas")
            .alert("Escribe el nombre de la tarea", isPresented: $showAlert) {
                Button("OK") {}
            }
        }
    }

    func agregarTarea() {
        if nuevaTarea.isEmpty {
            showAlert.toggle()
        } else {
            // id = cantidad + 1 (sirve mientras no se borren tareas)
            let nueva = TareaTab(id: tareas.count + 1, titulo: nuevaTarea, completada: false)
            tareas.append(nueva)
            nuevaTarea = ""          // limpia el campo
        }
    }
}

#Preview {
    TareasListaTabView(tareas: .constant(cargarTareasTab()))
}
