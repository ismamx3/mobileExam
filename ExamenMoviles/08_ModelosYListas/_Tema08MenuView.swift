// ═══════════════════════════════════════════════════════════════
//  _Tema08MenuView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es solo el menú del tema dentro de este repo.
//  Los que dicen "pantalla completa" traen su propio NavigationStack.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema08MenuView: View {
    var body: some View {
        List {
            Section {
                NavigationLink {
                    ListaSimpleView()
                } label: {
                    EjemploRow(titulo: "Lista simple", archivo: "08_ModelosYListas/Views/ListaSimpleView.swift", icono: "list.bullet")
                }
                EjemploPantallaCompleta(titulo: "Lista → detalle", archivo: "08_ModelosYListas/Views/ListaConDetalleView.swift", icono: "list.bullet.indent") {
                    ListaConDetalleView()
                }
                EjemploPantallaCompleta(titulo: "Lista editable (@Binding)", archivo: "08_ModelosYListas/Views/ListaEditableView.swift", icono: "pencil.line") {
                    ListaEditableView()
                }
            } header: {
                Text("Lo básico")
            } footer: {
                Text("Modelo: Model/Jugador.swift · Datos: Model/ModelDataJugadores.swift · Renglón: Components/JugadorRow.swift")
            }

            Section("Agregar, borrar y buscar") {
                EjemploPantallaCompleta(titulo: "Agregar (formulario) y borrar", archivo: "08_ModelosYListas/Views/ListaAgregarBorrarView.swift", icono: "plus.circle") {
                    ListaAgregarBorrarView()
                }
                EjemploPantallaCompleta(titulo: "Buscar, filtrar y ordenar", archivo: "08_ModelosYListas/Views/ListaBuscarFiltrarView.swift", icono: "magnifyingglass") {
                    ListaBuscarFiltrarView()
                }
            }

            Section("Diseño de la lista") {
                NavigationLink {
                    ListaSeccionesView()
                } label: {
                    EjemploRow(titulo: "Lista con secciones", archivo: "08_ModelosYListas/Views/ListaSeccionesView.swift", icono: "rectangle.grid.1x2")
                }
                NavigationLink {
                    ListaFondoPersonalizadoView()
                } label: {
                    EjemploRow(titulo: "Lista con fondo de color", archivo: "08_ModelosYListas/Views/ListaFondoPersonalizadoView.swift", icono: "paintpalette")
                }
                NavigationLink {
                    ListaTarjetasView()
                } label: {
                    EjemploRow(titulo: "Lista de tarjetas (sin List)", archivo: "08_ModelosYListas/Views/ListaTarjetasView.swift", icono: "rectangle.stack")
                }
            }

            Section("Protocolos, Codable y JSON") {
                NavigationLink {
                    ProtocolosView()
                } label: {
                    EjemploRow(titulo: "Protocolo + 3 clases", archivo: "08_ModelosYListas/Views/ProtocolosView.swift", icono: "person.3.sequence")
                }
                NavigationLink {
                    CodableView()
                } label: {
                    EjemploRow(titulo: "Codable: JSON y XML", archivo: "08_ModelosYListas/Views/CodableView.swift", icono: "curlybraces")
                }
                NavigationLink {
                    JSONLocalView()
                } label: {
                    EjemploRow(titulo: "Leer un archivo .json", archivo: "08_ModelosYListas/Views/JSONLocalView.swift", icono: "doc.text")
                }
            }

            Section("Imágenes de internet") {
                NavigationLink {
                    ImagenRemotaView()
                } label: {
                    EjemploRow(titulo: "AsyncImage (necesita internet)", archivo: "08_ModelosYListas/Views/ImagenRemotaView.swift", icono: "photo.on.rectangle")
                }
            }
        }
        .navigationTitle("08 · Modelos y listas")
    }
}

#Preview {
    NavigationStack {
        Tema08MenuView()
    }
}
