// ═══════════════════════════════════════════════════════════════
//  GymHistorialView.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Historial": la lista de entrenamientos AGRUPADA
//              por grupo muscular (una sección por grupo), del más nuevo
//              al más viejo, con detalle al tocar y borrar deslizando.
//              Botón para volver a los datos de ejemplo (con confirmación).
//  ÚSALO PARA: listas con secciones (por categoría, por día, por mes…).
//  BUSCA:      List, Section, secciones, agrupar, agrupada por categoria,
//              ordenar por fecha, sorted, swipeActions, deslizar para borrar,
//              borrar por id, remove(at:), NavigationLink detalle, lista vacia
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GymHistorialView.swift.
//   2. Pega el archivo y cambia lo marcado con ✏️.
//   3. Desde la vista del TabView:  GymHistorialView(entrenamientos: $lista)  (CON $: borra)
//  NECESITA:   Model/ (EntrenamientoGym, ModelDataGym, PersistenciaGym),
//              Components/EntrenamientoGymRow.swift, Views/GymDetalleView.swift,
//              Utils/PaletaGym.swift.
//  DE CLASE (Clase 10): List + NavigationLink { Detalle } label: { Row },
//     fondo de la List con .scrollContentBackground(.hidden).
//  ⚠️ NO VISTO EN CLASE: Section, ForEach, .sorted, .swipeActions,
//     Button(role: .destructive). Cómo defenderlo: "Section separa la lista
//     en grupos; swipeActions agrega el botón de borrar al deslizar".
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GymHistorialView: View {

    // BORRA de la lista del dueño → @Binding.
    @Binding var entrenamientos: [EntrenamientoGym]

    @State private var showConfirmacion = false

    let paleta = PaletaGym()

    // ── 1. Los entrenamientos de un grupo, del más nuevo al más viejo ──
    func entrenamientosDelGrupo(grupo: String) -> [EntrenamientoGym] {
        var resultado: [EntrenamientoGym] = []
        for entrenamiento in entrenamientos {
            if entrenamiento.grupo == grupo {
                resultado.append(entrenamiento)
            }
        }
        // ⚠️ NO VISTO EN CLASE: sorted ordena. a.fecha > b.fecha = el más nuevo primero.
        return resultado.sorted { a, b in
            a.fecha > b.fecha
        }
    }

    // ── 2. Borrar UNO buscándolo por su id ──────────────────────────
    // Se busca por id (y no por posición) porque las secciones cambian
    // el orden: la posición en pantalla NO es la posición en la lista.
    func borrar(id: Int) {
        for indice in entrenamientos.indices {
            if entrenamientos[indice].id == id {
                entrenamientos.remove(at: indice)
                return                                // ya lo borró: sale
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                // ── 3. Lista vacía ─────────────────────────────────
                if entrenamientos.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 50))
                            .foregroundStyle(paleta.primario)
                        Text("Aún no hay entrenamientos.")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        Text("Registra el primero en la pestaña Registrar.")
                            .foregroundStyle(paleta.textoSuave)
                    }
                    .padding()
                } else {
                    // ── 4. Lista con una sección por grupo ─────────
                    List {
                        ForEach(gruposMuscularesGym, id: \.self) { grupo in
                            let delGrupo = entrenamientosDelGrupo(grupo: grupo)
                            if !delGrupo.isEmpty {
                                Section {
                                    ForEach(delGrupo) { entrenamiento in
                                        NavigationLink {
                                            GymDetalleView(entrenamiento: entrenamiento)
                                        } label: {
                                            EntrenamientoGymRow(entrenamiento: entrenamiento)
                                        }
                                        .listRowBackground(paleta.superficie)
                                        // ⚠️ deslizar a la izquierda → botón Borrar.
                                        .swipeActions {
                                            Button(role: .destructive) {
                                                borrar(id: entrenamiento.id)
                                            } label: {
                                                Label("Borrar", systemImage: "trash")
                                            }
                                        }
                                    }
                                } header: {
                                    Text("\(grupo) (\(delGrupo.count))")
                                        .foregroundStyle(paleta.textoSuave)
                                }
                            }
                        }

                        // ── 5. Volver a los datos de ejemplo ───────
                        Section {
                            Button {
                                showConfirmacion.toggle()
                            } label: {
                                Label("Volver a los datos de ejemplo", systemImage: "arrow.counterclockwise")
                                    .foregroundStyle(paleta.secundario)
                            }
                            .listRowBackground(paleta.superficie)
                        } footer: {
                            Text("Desliza un entrenamiento a la izquierda para borrarlo. Todo se guarda solo, aunque cierres la app.")
                                .foregroundStyle(paleta.textoSuave)
                        }
                    }
                    .scrollContentBackground(.hidden)     // apaga el fondo propio de la List
                }
            }
            .navigationTitle("Historial")
            .alert("¿Borrar tus entrenamientos y volver a los de ejemplo?", isPresented: $showConfirmacion) {
                Button("Cancelar", role: .cancel) {}
                Button("Sí, volver", role: .destructive) {
                    borrarEntrenamientosGuardadosGym()
                    entrenamientos = cargarEntrenamientosEjemploGym()
                }
            }
        }
    }
}

#Preview {
    GymHistorialView(entrenamientos: .constant(cargarEntrenamientosEjemploGym()))
        .preferredColorScheme(.dark)
}
