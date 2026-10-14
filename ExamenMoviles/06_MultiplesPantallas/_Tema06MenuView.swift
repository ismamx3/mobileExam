// ═══════════════════════════════════════════════════════════════
//  _Tema06MenuView.swift  ·  06 Múltiples pantallas (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Solo es el menú de este tema dentro de
//  la app del repo. Los ejemplos que traen su propio NavigationStack
//  se abren a pantalla completa (botón ✕ para regresar).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct Tema06MenuView: View {
    var body: some View {
        List {
            Section("Navegación y paso de valores") {
                EjemploPantallaCompleta(titulo: "NavigationStack y NavigationLink", archivo: "06_MultiplesPantallas/NavegacionBasicaView.swift", icono: "arrow.right.square") {
                    NavegacionBasicaView()
                }
                EjemploPantallaCompleta(titulo: "Paso de valores (solo ida)", archivo: "06_MultiplesPantallas/PasoDeValoresView.swift", icono: "arrow.right.doc.on.clipboard") {
                    PasoDeValoresView()
                }
                EjemploPantallaCompleta(titulo: "@Binding (ida y vuelta)", archivo: "06_MultiplesPantallas/BindingIdaYVueltaView.swift", icono: "arrow.left.arrow.right") {
                    BindingIdaYVueltaView()
                }
                EjemploPantallaCompleta(titulo: "Navegar solo si es válido", archivo: "06_MultiplesPantallas/NavegacionConValidacionView.swift", icono: "checkmark.shield") {
                    NavegacionConValidacionView()
                }
            }

            Section("Pantallas típicas de examen") {
                EjemploPantallaCompleta(titulo: "Login con validación", archivo: "06_MultiplesPantallas/LoginView.swift", icono: "person.badge.key") {
                    LoginView()
                }
                EjemploPantallaCompleta(titulo: "Menú principal 2x2", archivo: "06_MultiplesPantallas/MenuPrincipalView.swift", icono: "square.grid.2x2") {
                    MenuPrincipalView()
                }
            }

            Section("Otras formas de mostrar pantallas") {
                NavigationLink {
                    SheetView()
                } label: {
                    EjemploRow(titulo: "Sheet y pantalla completa", archivo: "06_MultiplesPantallas/SheetView.swift", icono: "rectangle.bottomhalf.inset.filled")
                }
                EjemploPantallaCompleta(titulo: "Toolbar y esconder la barra", archivo: "06_MultiplesPantallas/ToolbarView.swift", icono: "menubar.rectangle") {
                    ToolbarView()
                }
            }

            Section("Pantallas destino (las usan las de arriba)") {
                NavigationLink {
                    PantallaDestinoView()
                } label: {
                    EjemploRow(titulo: "Destino con dismiss()", archivo: "06_MultiplesPantallas/PantallaDestinoView.swift", icono: "arrow.uturn.backward")
                }
                NavigationLink {
                    RecibeValoresView(nombre: "Cristina", edad: 20)
                } label: {
                    EjemploRow(titulo: "Pantalla que recibe valores", archivo: "06_MultiplesPantallas/RecibeValoresView.swift", icono: "tray.and.arrow.down")
                }
            }
        }
        .navigationTitle("06 · Múltiples pantallas")
    }
}

#Preview {
    NavigationStack {
        Tema06MenuView()
    }
}
