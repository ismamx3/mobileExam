// ═══════════════════════════════════════════════════════════════
//  ListaEditableView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista cuyo detalle MODIFICA el elemento y el cambio se ve al regresar.
//  ÚSALO PARA: marcar favorito, editar nombre, cambiar cantidad… desde el detalle.
//  BUSCA:      lista editable, binding, $lista, $item, modificar elemento, editar, favorito, ida y vuelta
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaEditableView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              08_ModelosYListas/Model/ModelDataJugadores.swift
//              08_ModelosYListas/Components/JugadorRow.swift
//              08_ModelosYListas/Views/EditarJugadorView.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// ¿POR QUÉ NO UNA VARIABLE GLOBAL?
// Con `var listaJugadores = cargarJugadores()` afuera del struct sí puedes LEER,
// pero SwiftUI no se entera cuando cambia, así que la lista no se redibuja al
// regresar del detalle. Con @State aquí + @Binding en el detalle, SwiftUI
// sí se entera y redibuja solo.

struct ListaEditableView: View {

    // @State = esta vista es DUEÑA de los datos.
    @State private var jugadores = cargarJugadores()           // ✏️ tus datos

    // Propiedad calculada: se vuelve a contar cada vez que cambia la lista.
    var totalFavoritos: Int {
        var total = 0
        for jugador in jugadores {
            if jugador.esFavorito {
                total += 1
            }
        }
        return total
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // ── 1. Resumen que se actualiza solo ─────────────────
                Text("Favoritos: \(totalFavoritos) de \(jugadores.count)")
                    .font(.headline)
                    .foregroundStyle(.purple)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple.opacity(0.12))

                // ── 2. Lista con BINDINGS ────────────────────────────
                // $jugadores → pide bindings.  { $jugador in } → $jugador es el binding
                // y jugador (sin $) es el valor.
                List($jugadores) { $jugador in
                    NavigationLink {
                        EditarJugadorView(jugador: $jugador)       // con $: puede MODIFICAR
                    } label: {
                        JugadorRow(jugador: jugador)               // sin $: solo MUESTRA
                    }
                }
                .listStyle(.inset)
            }
            .navigationTitle("Editar jugadores")                    // ✏️
        }
    }
}

#Preview {
    ListaEditableView()
}
