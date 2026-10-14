// ═══════════════════════════════════════════════════════════════
//  _Tema04MenuView.swift  ·  04 Componentes (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo arma el menú del tema en el simulador.
//  El código que sí se copia está en 04_Componentes/Components/.
//  Cada renglón abre una "vitrina": cómo se ve el componente y cómo se llama.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema04MenuView: View {
    var body: some View {
        List {
            Section("Pantalla de ejemplo") {
                NavigationLink {
                    ComponentesDemoView()
                        .navigationTitle("Demo componentes")
                } label: {
                    EjemploRow(titulo: "Todos los componentes juntos", archivo: "04_Componentes/ComponentesDemoView.swift", icono: "square.stack.3d.up.fill")
                }
            }

            Section("Componentes (uno por archivo)") {
                NavigationLink {
                    Tema04VitrinaView(titulo: "TarjetaInfo", codigo: """
                    TarjetaInfo(icono: "book.fill",
                                titulo: "Tareas",
                                subtitulo: "3 pendientes",
                                color: .purple)
                    """) {
                        TarjetaInfo(icono: "book.fill", titulo: "Tareas", subtitulo: "3 pendientes", color: .purple)
                        TarjetaInfo(icono: "calendar", titulo: "Examen", subtitulo: "Viernes 16 de octubre", color: .indigo)
                    }
                } label: {
                    EjemploRow(titulo: "Tarjeta con ícono", archivo: "04_Componentes/Components/TarjetaInfo.swift", icono: "rectangle.portrait.on.rectangle.portrait")
                }

                NavigationLink {
                    Tema04BotonDemoView()
                } label: {
                    EjemploRow(titulo: "Botón grande con acción", archivo: "04_Componentes/Components/BotonGrande.swift", icono: "hand.tap.fill")
                }

                NavigationLink {
                    Tema04VitrinaView(titulo: "ImagenCircular", codigo: """
                    ImagenCircular(nombreImagen: "perfil")
                    ImagenCircular(nombreImagen: "mascota",
                                   tamano: 80,
                                   colorBorde: .purple)
                    """) {
                        HStack(spacing: 20) {
                            ImagenCircular(nombreImagen: "perfil")
                            ImagenCircular(nombreImagen: "mascota", tamano: 80, colorBorde: .purple)
                        }
                        .frame(maxWidth: .infinity)
                    }
                } label: {
                    EjemploRow(titulo: "Imagen circular", archivo: "04_Componentes/Components/ImagenCircular.swift", icono: "person.crop.circle")
                }

                NavigationLink {
                    Tema04VitrinaView(titulo: "EncabezadoPantalla", codigo: """
                    EncabezadoPantalla(titulo: "Registro",
                                       subtitulo: "Llena tus datos",
                                       icono: "person.crop.circle.badge.plus")
                    """) {
                        EncabezadoPantalla(titulo: "Registro", subtitulo: "Llena tus datos", icono: "person.crop.circle.badge.plus")
                    }
                } label: {
                    EjemploRow(titulo: "Encabezado de pantalla", archivo: "04_Componentes/Components/EncabezadoPantalla.swift", icono: "textformat.size")
                }

                NavigationLink {
                    Tema04VitrinaView(titulo: "FilaDato", codigo: """
                    FilaDato(etiqueta: "Álbum", valor: "Take Care")
                    Divider()
                    FilaDato(etiqueta: "Edad", valor: "\\(edad)")
                    """) {
                        VStack(spacing: 0) {
                            FilaDato(etiqueta: "Álbum", valor: "Take Care")
                            Divider()
                            FilaDato(etiqueta: "Edad", valor: "\(20)")
                            Divider()
                            FilaDato(etiqueta: "Estatura", valor: 1.98.formatted(.number.precision(.fractionLength(2))) + " m")
                        }
                    }
                } label: {
                    EjemploRow(titulo: "Fila etiqueta / valor", archivo: "04_Componentes/Components/FilaDato.swift", icono: "list.bullet.rectangle")
                }

                NavigationLink {
                    Tema04VitrinaView(titulo: "EtiquetaChip", codigo: """
                    EtiquetaChip(texto: "Activo")
                    EtiquetaChip(texto: "Pendiente", color: .red)
                    """) {
                        HStack {
                            EtiquetaChip(texto: "Activo")
                            EtiquetaChip(texto: "Pendiente", color: .red)
                            EtiquetaChip(texto: "SwiftUI", color: .indigo)
                        }
                    }
                } label: {
                    EjemploRow(titulo: "Chip / etiqueta de color", archivo: "04_Componentes/Components/EtiquetaChip.swift", icono: "tag.fill")
                }

                NavigationLink {
                    Tema04VitrinaView(titulo: "TileEstadistica", codigo: """
                    HStack(spacing: 12) {
                        TileEstadistica(valor: "12", etiqueta: "Jugadores",
                                        icono: "person.3.fill")
                        TileEstadistica(valor: "4.5", etiqueta: "Rating",
                                        icono: "star.fill", color: .orange)
                    }
                    """) {
                        HStack(spacing: 12) {
                            TileEstadistica(valor: "12", etiqueta: "Jugadores", icono: "person.3.fill")
                            TileEstadistica(valor: "4.5", etiqueta: "Rating", icono: "star.fill", color: .orange)
                            TileEstadistica(valor: "8", etiqueta: "Fotos", icono: "photo.fill", color: .blue)
                        }
                    }
                } label: {
                    EjemploRow(titulo: "Tile de estadística", archivo: "04_Componentes/Components/TileEstadistica.swift", icono: "number.square.fill")
                }

                NavigationLink {
                    Tema04CampoDemoView()
                } label: {
                    EjemploRow(titulo: "Campo con etiqueta (@Binding)", archivo: "04_Componentes/Components/CampoConEtiqueta.swift", icono: "character.cursor.ibeam")
                }

                NavigationLink {
                    Tema04VitrinaView(titulo: "EstrellasRating", codigo: """
                    EstrellasRating(calificacion: 4.5)
                    EstrellasRating(calificacion: 2, color: .purple)
                    """) {
                        EstrellasRating(calificacion: 5)
                        EstrellasRating(calificacion: 3.5)
                        EstrellasRating(calificacion: 2, color: .purple)
                    }
                } label: {
                    EjemploRow(titulo: "Estrellas de calificación", archivo: "04_Componentes/Components/EstrellasRating.swift", icono: "star.leadinghalf.filled")
                }
            }
        }
        .navigationTitle("04 · Componentes")
    }
}

// Pantalla genérica del menú: "Así se ve" + "Así se usa".
struct Tema04VitrinaView<Contenido: View>: View {

    var titulo: String
    var codigo: String
    @ViewBuilder var contenido: () -> Contenido

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Así se ve")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 12) {
                    contenido()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                Text("Así se usa desde otra vista")
                    .font(.headline)

                Text(codigo)
                    .font(.footnote)
                    .monospaced()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.purple.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .navigationTitle(titulo)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Vitrina de BotonGrande: necesita @State para ver que la acción sí corre.
struct Tema04BotonDemoView: View {

    @State private var contador = 0

    var body: some View {
        Tema04VitrinaView(titulo: "BotonGrande", codigo: """
        @State private var contador = 0

        BotonGrande(titulo: "Sumar", icono: "plus",
                    color: .purple) {
            contador += 1
        }
        """) {
            Text("Contador: \(contador)")
                .font(.title2)
                .bold()
            BotonGrande(titulo: "Sumar", icono: "plus.circle.fill", color: .purple) {
                contador += 1
            }
            BotonGrande(titulo: "Reiniciar", icono: "arrow.counterclockwise", color: .red) {
                contador = 0
            }
        }
    }
}

// Vitrina de CampoConEtiqueta: el @State vive aquí (vista padre).
struct Tema04CampoDemoView: View {

    @State private var nombre: String = ""

    var body: some View {
        Tema04VitrinaView(titulo: "CampoConEtiqueta", codigo: """
        @State private var nombre: String = ""

        CampoConEtiqueta(etiqueta: "Nombre",
                         placeholder: "Escribe tu nombre",
                         texto: $nombre)
        """) {
            CampoConEtiqueta(etiqueta: "Nombre", placeholder: "Escribe tu nombre", texto: $nombre)
            Text("La vista padre recibe: \(nombre.isEmpty ? "(vacío)" : nombre)")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NavigationStack {
        Tema04MenuView()
    }
}
