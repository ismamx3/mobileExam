// ═══════════════════════════════════════════════════════════════
//  ListaAgregarBorrarView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista donde puedes AGREGAR (con formulario en sheet) y BORRAR.
//  ÚSALO PARA: altas y bajas: registrar productos, tareas, alumnos…
//  BUSCA:      agregar, append, borrar, eliminar, delete, onDelete, swipe, sheet, removeAll, lista vacia
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaAgregarBorrarView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Components/JugadorRow.swift
//              08_ModelosYListas/Views/AgregarJugadorView.swift  (el formulario)
//  ⚠️ NO VISTO EN CLASE: ForEach + .onDelete (borrar deslizando), IndexSet,
//                        remove(atOffsets:), Button(role:)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaAgregarBorrarView: View {

    @State private var jugadores = cargarJugadores()       // ✏️ tus datos
    @State private var mostrarFormulario = false
    @State private var mostrarConfirmacion = false

    // ⚠️ NO VISTO EN CLASE: .onDelete entrega las POSICIONES (IndexSet) que
    // el usuario deslizó; remove(atOffsets:) las quita del arreglo.
    func borrarJugador(at posiciones: IndexSet) {
        jugadores.remove(atOffsets: posiciones)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {

                // ── 1. Mensaje si la lista está vacía ────────────────
                if jugadores.isEmpty {
                    Spacer()
                    Image(systemName: "person.3")
                        .font(.system(size: 60))
                        .foregroundStyle(.secondary)
                    Text("No hay jugadores. Agrega uno.")      // ✏️
                        .foregroundStyle(.secondary)
                    Spacer()
                } else {

                    // ── 2. Lista con borrar deslizando ───────────────────
                    // List(lista) NO tiene .onDelete; por eso aquí se usa
                    // List { ForEach(lista) { } .onDelete(...) }
                    List {
                        ForEach(jugadores) { jugadorItem in
                            JugadorRow(jugador: jugadorItem)       // ✏️
                        }
                        .onDelete(perform: borrarJugador)
                    }
                    .listStyle(.inset)
                }

                // ── 3. Botones abajo ─────────────────────────────────
                VStack(spacing: 10) {
                    Button {
                        mostrarFormulario.toggle()
                    } label: {
                        Label("Agregar jugador", systemImage: "plus")     // ✏️
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)

                    HStack(spacing: 10) {
                        Button {
                            mostrarConfirmacion.toggle()
                        } label: {
                            Text("Borrar todos")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 6)
                        }
                        .buttonStyle(.bordered)
                        .tint(.red)
                        .disabled(jugadores.isEmpty)

                        Button {
                            jugadores = cargarJugadores()
                        } label: {
                            Text("Restaurar")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 6)
                        }
                        .buttonStyle(.bordered)
                        .tint(.purple)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
            .navigationTitle("Jugadores (\(jugadores.count))")        // ✏️

            // ── 4. Sheet con el formulario ───────────────────────────
            // Se le pasa la lista con $ para que pueda hacer append.
            .sheet(isPresented: $mostrarFormulario) {
                AgregarJugadorView(jugadores: $jugadores)
            }

            // ── 5. Alerta de confirmación antes de borrar todo ───────
            .alert("¿Borrar todos los jugadores?", isPresented: $mostrarConfirmacion) {
                Button("Borrar", role: .destructive) {
                    jugadores.removeAll()
                }
                Button("Cancelar", role: .cancel) {}
            }
        }
    }
}

#Preview {
    ListaAgregarBorrarView()
}
