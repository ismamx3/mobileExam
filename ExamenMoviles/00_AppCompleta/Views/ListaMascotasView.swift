// ═══════════════════════════════════════════════════════════════
//  ListaMascotasView.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista de mascotas que se puede MODIFICAR:
//                - tocar un renglón → detalle que edita (@Binding)
//                - botón "Agregar" → abre una sheet con formulario
//                - deslizar a la izquierda → borrar
//  ÚSALO PARA: la pantalla principal de cualquier CRUD (lista + alta +
//              edición + baja).
//  BUSCA:      lista, List, NavigationLink, detalle, binding lista,
//              $item, agregar, sheet, borrar, onDelete, swipe, eliminar,
//              lista vacia, fondo de lista
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaMascotasView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   Model/Mascota.swift, Utils/PaletaMascotas.swift,
//              Components/MascotaRow.swift, BotonPrincipalMascotas.swift,
//              Views/DetalleMascotaView.swift, Views/AgregarMascotaView.swift
//  ⚠️ NO VISTO EN CLASE: ForEach dentro del List + .onDelete (para borrar).
//     Si NO necesitas borrar, usa la forma de clase:
//         List($mascotas) { $mascota in  NavigationLink {…} label: {…}  }
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ListaMascotasView: View {

    // @Binding: la lista vive en AppCompletaView; aquí la modificamos.
    @Binding var mascotas: Array<Mascota>

    @State private var mostrarAgregar = false

    var body: some View {
        NavigationStack {
            ZStack {
                paletaFondo
                    .ignoresSafeArea()

                VStack(spacing: 0) {

                    // ── 1. Lista vacía ──────────────────────────────
                    if mascotas.isEmpty {
                        Spacer()
                        Image(systemName: "pawprint")
                            .font(.system(size: 60))
                            .foregroundStyle(paletaPrimarioClaro)
                        Text("Aún no tienes mascotas")                          // ✏️
                            .font(.title3)
                            .foregroundStyle(paletaTextoSuave)
                            .padding(.top, 8)
                        Spacer()
                    } else {

                        // ── 2. Lista con bindings + borrar ──────────
                        List {
                            // $mascotas y { $mascota in }: cada renglón recibe
                            // un BINDING, así el detalle modifica la mascota real.
                            ForEach($mascotas) { $mascota in
                                NavigationLink {
                                    DetalleMascotaView(mascota: $mascota)       // con $: modifica
                                } label: {
                                    MascotaRow(mascota: mascota)                // sin $: solo muestra
                                }
                                .listRowBackground(paletaSuperficie)
                            }
                            // ⚠️ NO VISTO EN CLASE: deslizar a la izquierda para borrar.
                            .onDelete { posiciones in
                                mascotas.remove(atOffsets: posiciones)
                            }
                        }
                        // En clase (Clase 10) se usa .listStyle(.inset).
                        // .insetGrouped deja cada renglón como tarjeta.
                        .listStyle(.insetGrouped)
                        .scrollContentBackground(.hidden)   // apaga el fondo propio del List
                    }

                    // ── 3. Botón fijo abajo que abre la sheet ───────
                    BotonPrincipalMascotas(titulo: "Agregar mascota", icono: "plus.circle.fill") {    // ✏️
                        mostrarAgregar.toggle()
                    }
                    .padding()
                }
            }
            .navigationTitle("Mascotas")                                        // ✏️
            // La sheet recibe la lista con $ para poder hacer append.
            .sheet(isPresented: $mostrarAgregar) {
                AgregarMascotaView(mascotas: $mascotas)
            }
        }
    }
}

#Preview {
    ListaMascotasView(mascotas: .constant(cargarMascotas()))
}
