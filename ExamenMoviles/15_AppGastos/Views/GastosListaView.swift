// ═══════════════════════════════════════════════════════════════
//  GastosListaView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Gastos": la lista AGRUPADA por categoría (una
//              sección por categoría con su subtotal), con buscador,
//              borrar deslizando, "Borrar todo" con confirmación, tocar
//              un gasto para ver su detalle y un botón para agregar.
//  ÚSALO PARA: listas agrupadas, CRUD, buscar y borrar.
//  BUSCA:      List, Section, secciones, agrupar por categoria, subtotal,
//              searchable, buscador, buscar, onDelete, borrar deslizando,
//              swipe, confirmationDialog, borrar todo, NavigationLink,
//              detalle, sheet, agregar, Binding lista
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ListaView.swift y pega el archivo.
//   2. Cambia lo marcado con ✏️.
//  NECESITA:   Model/GastoApp.swift, Model/ModelDataGastos.swift
//              (categoriasGastos), Utils/PaletaGastos.swift,
//              Components/GastoRow.swift, Views/GastoDetalleView.swift,
//              Views/GastoAgregarView.swift
//
//  ¿POR QUÉ @Binding var gastos?
//   Esta pestaña AGREGA y BORRA gastos de la lista de GastosAppView.
//   Con @Binding los cambios se hacen en la lista REAL (la de la raíz), y
//   por eso Resumen y Estadísticas también los ven (Clase 6B).
//
//  DE CLASE: NavigationStack + NavigationLink { destino } label: { renglón }
//     (Clases 6A y 10), .sheet(isPresented:) (Clase 17), .listStyle.
//  ⚠️ NO VISTO EN CLASE: Section (agrupar), .searchable (buscador),
//     ForEach + .onDelete (borrar deslizando), .confirmationDialog
//     (menú de confirmación), firstIndex(where:), .localizedStandardContains
//     (buscar sin importar mayúsculas ni acentos), ToolbarItem.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosListaView: View {

    @Binding var gastos: Array<GastoApp>      // la modifica (agregar / borrar)

    @State private var textoBusqueda = ""
    @State private var mostrarAgregar = false
    @State private var mostrarBorrarTodo = false

    let paleta = PaletaGastos()

    // Los gastos de UNA categoría que coinciden con la búsqueda.
    func gastosDe(categoria: String) -> Array<GastoApp> {
        var resultado = Array<GastoApp>()
        for gasto in gastos {
            let coincideCategoria = gasto.categoria == categoria
            // ⚠️ localizedStandardContains: "tacos" encuentra "Tacos de trompo"
            let coincideTexto = textoBusqueda.isEmpty || gasto.concepto.localizedStandardContains(textoBusqueda)
            if coincideCategoria && coincideTexto {
                resultado.append(gasto)
            }
        }
        return resultado
    }

    // Suma de una lista de gastos (para el subtotal de cada sección).
    func subtotal(_ lista: Array<GastoApp>) -> Double {
        var suma = 0.0
        for gasto in lista {
            suma += gasto.monto
        }
        return suma
    }

    // .onDelete da las POSICIONES dentro de la sección, no dentro de la
    // lista completa. Por eso: posición → id del gasto → se busca ese id
    // en la lista real y se borra.
    func borrarGastos(posiciones: IndexSet, categoria: String) {
        let deLaCategoria = gastosDe(categoria: categoria)
        for posicion in posiciones {
            let idABorrar = deLaCategoria[posicion].id
            // ⚠️ firstIndex(where:) = el índice del primer elemento que cumple la condición (opcional)
            if let indice = gastos.firstIndex(where: { gasto in gasto.id == idABorrar }) {
                gastos.remove(at: indice)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                paleta.fondo
                    .ignoresSafeArea()

                // ── 1. Lista vacía → mensaje ───────────────────
                if gastos.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "tray")
                            .font(.system(size: 50))
                            .foregroundStyle(paleta.textoSuave)
                        Text("No tienes gastos registrados")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        Text("Toca \"Agregar gasto\" para empezar.")
                            .foregroundStyle(paleta.textoSuave)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {

                    // ── 2. Lista agrupada por categoría ────────
                    List {
                        ForEach(categoriasGastos, id: \.self) { categoria in
                            let deEstaCategoria = gastosDe(categoria: categoria)

                            // Solo se muestra la sección si tiene gastos.
                            if !deEstaCategoria.isEmpty {
                                // ⚠️ Section: agrupa renglones con un encabezado.
                                Section {
                                    ForEach(deEstaCategoria) { gasto in
                                        // Paso de valores de IDA: el detalle solo muestra.
                                        NavigationLink {
                                            GastoDetalleView(gasto: gasto)
                                        } label: {
                                            GastoRow(gasto: gasto)
                                        }
                                        .listRowBackground(Color.white)
                                    }
                                    // ⚠️ Borrar deslizando el renglón a la izquierda.
                                    .onDelete { posiciones in
                                        borrarGastos(posiciones: posiciones, categoria: categoria)
                                    }
                                } header: {
                                    HStack {
                                        Text(categoria)
                                        Spacer()
                                        Text(textoPesosGastos(subtotal(deEstaCategoria)))
                                    }
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundStyle(paleta.textoSuave)
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)       // para ver el fondo de la paleta
                    .padding(.bottom, 70)                   // espacio para el botón de abajo
                }

                // ── 3. Botón fijo abajo para agregar ───────────
                Button {
                    mostrarAgregar.toggle()
                } label: {
                    Label("Agregar gasto", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(paleta.textoSobrePrimario)
                        .background(paleta.primario)
                        .cornerRadius(14)
                }
                .padding()
            }
            .navigationTitle("Mis gastos")
            // ⚠️ .searchable: barra de búsqueda (filtra con gastosDe).
            .searchable(text: $textoBusqueda, prompt: "Buscar gasto")
            .toolbar {
                // ⚠️ ToolbarItem: botón en la barra de arriba a la izquierda.
                ToolbarItem(placement: .topBarLeading) {
                    Button("Borrar todo", role: .destructive) {
                        mostrarBorrarTodo.toggle()
                    }
                    .disabled(gastos.isEmpty)
                }
            }
            // ⚠️ confirmationDialog: menú que sale de abajo para confirmar.
            .confirmationDialog("¿Borrar todos los gastos?", isPresented: $mostrarBorrarTodo, titleVisibility: .visible) {
                Button("Borrar todo", role: .destructive) {
                    gastos.removeAll()
                }
                Button("Cancelar", role: .cancel) {}
            } message: {
                Text("Esta acción no se puede deshacer.")
            }
            // .sheet de la Clase 17: la hoja recibe la lista con $ para hacer append.
            .sheet(isPresented: $mostrarAgregar) {
                GastoAgregarView(gastos: $gastos)
            }
        }
    }
}

#Preview {
    GastosListaView(gastos: .constant(cargarGastosApp()))
}
