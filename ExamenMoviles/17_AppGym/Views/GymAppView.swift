// ═══════════════════════════════════════════════════════════════
//  GymAppView.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La pantalla RAÍZ de "Mi Gym": un TabView con 5 pestañas.
//              Es la DUEÑA de la lista de entrenamientos (@State) y la
//              reparte; además la GUARDA cada vez que cambia, para que no
//              se borre al cerrar la app.
//  ÚSALO PARA: el esqueleto de una app con varias pestañas que comparten
//              datos y los guardan.
//  BUSCA:      TabView, raiz, root, tabItem, compartir datos entre pestañas,
//              onChange lista, guardar al cambiar, persistencia, preferredColorScheme
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GymAppView.swift (o úsala como ContentView).
//   2. En TuAppApp.swift pon:  WindowGroup { GymAppView() }
//  NECESITA:   toda la carpeta 17_AppGym (Model, Utils, Components, Views).
//  DE CLASE (Clase 7): cada pestaña = una vista + .tabItem { Label(...) }
//     y .tint(...) sobre el TabView pinta la pestaña seleccionada.
//  ⚠️ NO VISTO EN CLASE: .preferredColorScheme(.dark) (paleta oscura) y
//     guardar la lista con .onChange + PersistenciaGym (JSON en UserDefaults).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GymAppView: View {

    // ── 1. La DUEÑA de los datos ───────────────────────────────────
    // Un solo @State para toda la app: aquí nace la lista y de aquí se
    // reparte. cargarEntrenamientosGym() lee lo guardado (o los datos de
    // ejemplo la primera vez).
    @State private var entrenamientos = cargarEntrenamientosGym()

    let paleta = PaletaGym()

    var body: some View {
        // ── 2. Las pestañas ────────────────────────────────────────
        // Cada pestaña trae su PROPIO NavigationStack adentro (nunca uno
        // afuera del TabView: saldrían dos barras de navegación).
        TabView {
            // Solo LEE la lista → sin $ (recibe  var entrenamientos).
            GymHoyView(entrenamientos: entrenamientos)
                .tabItem {
                    Label("Hoy", systemImage: "flame.fill")                       // ✏️
                }

            // AGREGA a la lista → con $ (recibe @Binding).
            GymRegistrarView(entrenamientos: $entrenamientos)
                .tabItem {
                    Label("Registrar", systemImage: "plus.circle.fill")
                }

            // BORRA de la lista → con $.
            GymHistorialView(entrenamientos: $entrenamientos)
                .tabItem {
                    Label("Historial", systemImage: "list.bullet.rectangle.fill")
                }

            // Solo LEE para graficar → sin $.
            GymProgresoView(entrenamientos: entrenamientos)
                .tabItem {
                    Label("Progreso", systemImage: "chart.xyaxis.line")
                }

            // No usa la lista: muestra las clases del protocolo.
            GymEjerciciosView()
                .tabItem {
                    Label("Ejercicios", systemImage: "dumbbell.fill")
                }
        }
        .tint(paleta.primario)                     // color de la pestaña seleccionada
        // ── 3. Guardar cada vez que la lista cambia ────────────────
        // ⚠️ NO VISTO EN CLASE (la idea): .onChange es de la Clase 4; aquí
        // vigila la LISTA (por eso EntrenamientoGym es Equatable) y la
        // guarda como JSON en UserDefaults (ver Model/PersistenciaGym.swift).
        .onChange(of: entrenamientos) { oldValue, newValue in
            guardarEntrenamientosGym(newValue)
        }
        // ⚠️ NO VISTO EN CLASE: la paleta es OSCURA; esto pone al sistema en
        // modo oscuro para que los ejes de las gráficas y la barra de estado
        // salgan claros (si no, salen negros sobre negro).
        .preferredColorScheme(.dark)
    }
}

#Preview {
    GymAppView()
}
