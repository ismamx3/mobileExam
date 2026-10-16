// ═══════════════════════════════════════════════════════════════
//  ContentView.swift  ·  Menú principal del repo
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es solo el índice que ves al correr la app.
//
//  CÓMO ENCONTRAR ALGO RÁPIDO EN XCODE:
//   ⌘⇧O  (Open Quickly)  → escribe el nombre del archivo. Ej: "Botones"
//   ⌘⇧F  (Find in Project) → escribe una palabra clave. Ej: "dividir",
//         "mitad", "alerta", "dona", "camara". Cada archivo tiene una
//         línea BUSCA: con palabras clave en español e inglés.
//   00_INDICE.md → tabla "Quiero… → archivo".
//
//  Cada renglón del menú dice el ARCHIVO donde vive ese ejemplo.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    EjemploPantallaCompleta(titulo: "App completa: Mis Mascotas", archivo: "00_AppCompleta/Views/AppCompletaView.swift", icono: "pawprint.fill") {
                        AppCompletaView()
                    }
                } header: {
                    Text("Empieza aquí")
                } footer: {
                    Text("Una app que junta todos los temas: TabView, lista con detalle, formulario con validación, gráficas, fotos y @AppStorage. Lee 00_AppCompleta/LEEME_AppCompleta.md.")
                }

                Section("Temas del examen") {
                    NavigationLink {
                        Tema01MenuView()
                    } label: {
                        EjemploRow(titulo: "01 · Swift básico", archivo: "01_SwiftBasico/", icono: "swift")
                    }
                    NavigationLink {
                        Tema02MenuView()
                    } label: {
                        EjemploRow(titulo: "02 · Mi primera app", archivo: "02_PrimeraApp/", icono: "iphone")
                    }
                    NavigationLink {
                        Tema03MenuView()
                    } label: {
                        EjemploRow(titulo: "03 · Elementos UI", archivo: "03_ElementosUI/", icono: "slider.horizontal.3")
                    }
                    NavigationLink {
                        Tema04MenuView()
                    } label: {
                        EjemploRow(titulo: "04 · Componentes", archivo: "04_Componentes/", icono: "square.on.square")
                    }
                    NavigationLink {
                        Tema05MenuView()
                    } label: {
                        EjemploRow(titulo: "05 · Layouts / dividir pantalla", archivo: "05_Layouts/", icono: "rectangle.split.2x2")
                    }
                    NavigationLink {
                        Tema06MenuView()
                    } label: {
                        EjemploRow(titulo: "06 · Múltiples pantallas", archivo: "06_MultiplesPantallas/", icono: "rectangle.stack")
                    }
                    NavigationLink {
                        Tema07MenuView()
                    } label: {
                        EjemploRow(titulo: "07 · TabView", archivo: "07_TabView/", icono: "rectangle.split.3x1")
                    }
                    NavigationLink {
                        Tema08MenuView()
                    } label: {
                        EjemploRow(titulo: "08 · Modelos y listas", archivo: "08_ModelosYListas/", icono: "list.bullet.rectangle")
                    }
                    NavigationLink {
                        Tema09MenuView()
                    } label: {
                        EjemploRow(titulo: "09 · Gráficas", archivo: "09_Graficas/", icono: "chart.bar.xaxis")
                    }
                    NavigationLink {
                        Tema10MenuView()
                    } label: {
                        EjemploRow(titulo: "10 · Fotos y cámara", archivo: "10_FotosYCamara/", icono: "camera")
                    }
                }

                Section {
                    NavigationLink {
                        Tema11MenuView()
                    } label: {
                        EjemploRow(titulo: "11 · Extras", archivo: "11_Extras/", icono: "sparkles")
                    }
                    NavigationLink {
                        Tema12MenuView()
                    } label: {
                        EjemploRow(titulo: "12 · Paletas de colores", archivo: "12_Paletas/", icono: "paintpalette")
                    }
                } header: {
                    Text("Extras de otras tareas")
                } footer: {
                    Text("Persistencia con @AppStorage / UserDefaults, sonido con AVAudioPlayer y 25 paletas de colores listas para usar.")
                }
            }
            .navigationTitle("Examen Móviles")
        }
        // Todo el repo en modo claro: varios ejemplos usan fondos claros fijos.
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
