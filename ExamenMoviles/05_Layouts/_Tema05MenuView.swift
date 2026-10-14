// ═══════════════════════════════════════════════════════════════
//  _Tema05MenuView.swift  ·  05 Layouts (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo arma el menú del tema en el simulador.
//  El título de cada pantalla se pone aquí (no en el archivo del
//  ejemplo) para que el código que copias quede limpio.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema05MenuView: View {
    var body: some View {
        List {
            Section("Dividir la pantalla") {
                NavigationLink {
                    MitadesView()
                        .navigationTitle("Mitades")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "2 mitades (arriba/abajo, izq/der)", archivo: "05_Layouts/MitadesView.swift", icono: "rectangle.split.1x2")
                }

                NavigationLink {
                    PartesIgualesView()
                        .navigationTitle("Partes iguales")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "3 o 4 partes iguales", archivo: "05_Layouts/PartesIgualesView.swift", icono: "rectangle.split.3x1")
                }

                NavigationLink {
                    CuadriculaView()
                        .navigationTitle("Cuadrícula")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "Cuadrícula 2x2, 3x3 y galería", archivo: "05_Layouts/CuadriculaView.swift", icono: "square.grid.2x2")
                }

                NavigationLink {
                    ProporcionesView()
                        .navigationTitle("Proporciones")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "1/3 + 2/3, 30% + 70%", archivo: "05_Layouts/ProporcionesView.swift", icono: "rectangle.split.2x1")
                }

                NavigationLink {
                    EncabezadoCuerpoPieView()
                        .navigationTitle("Encabezado, cuerpo y pie")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "Encabezado + scroll + botón fijo abajo", archivo: "05_Layouts/EncabezadoCuerpoPieView.swift", icono: "rectangle.topthird.inset.filled")
                }
            }

            Section("Renglones y acomodo") {
                NavigationLink {
                    RenglonesView()
                        .navigationTitle("Renglones")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "Renglones y tabla", archivo: "05_Layouts/RenglonesView.swift", icono: "list.bullet.rectangle")
                }

                NavigationLink {
                    AlineacionView()
                        .navigationTitle("Alineación")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "Esquinas, centro, pegado abajo", archivo: "05_Layouts/AlineacionView.swift", icono: "align.horizontal.left")
                }

                NavigationLink {
                    ScrollHorizontalView()
                        .navigationTitle("Scroll")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "Scroll horizontal y vertical", archivo: "05_Layouts/ScrollHorizontalView.swift", icono: "arrow.left.and.right")
                }

                NavigationLink {
                    CapasZStackView()
                        .navigationTitle("Capas con ZStack")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "Texto sobre imagen, badges, fondos", archivo: "05_Layouts/CapasZStackView.swift", icono: "square.3.layers.3d")
                }
            }

            Section("Todo junto") {
                NavigationLink {
                    DashboardView()
                        .navigationTitle("Dashboard")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    EjemploRow(titulo: "Dashboard / pantalla de inicio", archivo: "05_Layouts/DashboardView.swift", icono: "rectangle.3.group.fill")
                }
            }
        }
        .navigationTitle("05 · Layouts")
    }
}

#Preview {
    NavigationStack {
        Tema05MenuView()
    }
}
