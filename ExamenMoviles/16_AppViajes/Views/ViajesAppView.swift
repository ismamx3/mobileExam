// ═══════════════════════════════════════════════════════════════
//  ViajesAppView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La pantalla RAÍZ de "Mis Viajes". Decide con un if qué
//              mostrar: la BIENVENIDA (onboarding, solo la primera vez)
//              o la app con su TabView de 4 pestañas. También es la
//              DUEÑA de los datos (@State) y los reparte.
//  ÚSALO PARA: apps con pantalla de bienvenida / login antes del TabView.
//  BUSCA:      raiz, root, onboarding, bienvenida primera vez, AppStorage,
//              if en la raiz, TabView, compartir datos entre pestañas
//
//  CÓMO COPIARLO:
//   1. Copia TODA la carpeta 16_AppViajes (Model, Utils, Components, Views)
//      y también 10_FotosYCamara/CamaraPicker.swift (lo usa Mis viajes).
//   2. En TuAppApp.swift cambia ContentView() por ViajesAppView().
//   3. Agrega el permiso de cámara (ver LEEME_Viajes.md).
//  NECESITA:   toda la carpeta 16_AppViajes + CamaraPicker.swift.
//  DE CLASE:   TabView + .tabItem { Label } + .tint (Clase 7);
//              @State en el dueño, $ para quien modifica (Clase 6B);
//              @AppStorage (clase de persistencia).
//  ⚠️ NO VISTO EN CLASE: .preferredColorScheme(.light) (lo usaste en Movil2).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ViajesAppView: View {

    // ── Datos de la app: viven AQUÍ (la raíz es la dueña) ──────
    // La lista de destinos sale del archivo destinos_viajes.json.
    @State private var destinos = cargarDestinosViajes()
    // Los viajes que el usuario planea (arranca con 2 de ejemplo).
    @State private var viajes = viajesDeEjemploViajes()

    // ── ¿Ya vio la bienvenida? ─────────────────────────────────
    // @AppStorage = como @State pero se GUARDA en el iPhone (UserDefaults):
    // al cerrar y abrir la app sigue en true y ya no sale la bienvenida.
    @AppStorage("viajesVioOnboarding") private var vioOnboarding = false

    let paleta = PaletaViajes()

    var body: some View {
        // ── 1. La raíz decide qué pantalla mostrar ─────────────
        // No se usa NavigationLink para la bienvenida porque:
        //  - con NavigationLink quedaría una flecha "<" para regresar a ella;
        //  - el TabView tiene NavigationStack en cada pestaña y quedarían
        //    dos barras de navegación encimadas.
        // Con un if, la bienvenida se REEMPLAZA por la app completa.
        ZStack {
            if vioOnboarding {
                // ── 2. La app: 4 pestañas (Clase 7) ───────────────
                TabView {
                    // Modifica destinos (favorito) y agrega viajes → con $
                    ExplorarViajesView(destinos: $destinos, viajes: $viajes)
                        .tabItem {
                            Label("Explorar", systemImage: "map.fill")                // ✏️
                        }

                    // Modifica viajes (fotos, "ya fui", borrar) → con $
                    MisViajesView(viajes: $viajes)
                        .tabItem {
                            Label("Mis viajes", systemImage: "suitcase.fill")        // ✏️
                        }

                    // Puede quitar favoritos y planear → con $
                    FavoritosViajesView(destinos: $destinos, viajes: $viajes)
                        .tabItem {
                            Label("Favoritos", systemImage: "heart.fill")            // ✏️
                        }

                    // Solo LEE los viajes para el resumen → sin $
                    AjustesViajesView(viajes: viajes)
                        .tabItem {
                            Label("Ajustes", systemImage: "gearshape.fill")          // ✏️
                        }
                }
                .tint(paleta.primario)              // color de la pestaña seleccionada
            } else {
                // ── 3. Bienvenida: recibe el valor con $ para poder
                //    ponerlo en true al presionar "Comenzar".
                OnboardingViajesView(vioOnboarding: $vioOnboarding)
            }
        }
        .preferredColorScheme(.light)               // ⚠️ la paleta es clara
    }
}

#Preview {
    ViajesAppView()
}
