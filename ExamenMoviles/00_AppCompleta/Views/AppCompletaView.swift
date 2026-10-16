// ═══════════════════════════════════════════════════════════════
//  AppCompletaView.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La pantalla RAÍZ de la app: un TabView con 4 pestañas.
//              Es la DUEÑA de la lista de mascotas (@State) y la
//              reparte a cada pestaña:
//                - con $  → la pestaña puede MODIFICAR la lista
//                - sin $  → la pestaña solo la LEE
//  ÚSALO PARA: el esqueleto de tu app del examen.
//  BUSCA:      TabView, pestañas, tabs, tabItem, raiz, root, compartir
//              datos entre pestañas, cambiar de pestaña, selection
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/AppCompletaView.swift.
//   2. Pega el archivo completo.
//   3. En TuAppApp.swift cambia ContentView() por AppCompletaView().
//   4. Cambia pestañas/íconos marcados con ✏️
//  NECESITA:   toda la carpeta 00_AppCompleta (Model, Utils, Components, Views).
//  DE CLASE (Clase 7): cada pestaña = una vista + .tabItem { Label(...) },
//     y .tint(...) sobre el TabView = "cambiar el color de ícono".
//     En clase el TabView va dentro de un VStack en ContentView; aquí la
//     vista ES el TabView (funciona igual).
//  ⚠️ NO VISTO EN CLASE: TabView(selection:) + .tag para cambiar de
//     pestaña desde un botón. Si no lo quieres: borra `selection:` y los
//     .tag, y quita el botón "Ver mis mascotas" de InicioMascotasView.
//  ⚠️ NO VISTO EN CLASE: .preferredColorScheme(.light) (lo usaste en Movil2).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AppCompletaView: View {

    // Dueña de los datos: se carga UNA vez aquí y se reparte.
    @State private var mascotas = cargarMascotas()

    // ⚠️ NO VISTO EN CLASE: qué pestaña está abierta (usa los .tag de abajo).
    @State private var pestanaSeleccionada = 1

    var body: some View {
        TabView(selection: $pestanaSeleccionada) {

            // Solo lee la lista (sin $) y puede cambiar de pestaña (con $).
            InicioMascotasView(mascotas: mascotas, pestanaSeleccionada: $pestanaSeleccionada)
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")                  // ✏️
                }
                .tag(1)

            // Modifica la lista (agregar, editar, borrar) → con $.
            ListaMascotasView(mascotas: $mascotas)
                .tabItem {
                    Label("Mascotas", systemImage: "pawprint.fill")             // ✏️
                }
                .tag(2)

            // Solo lee para graficar → sin $.
            EstadisticasMascotasView(mascotas: mascotas)
                .tabItem {
                    Label("Estadísticas", systemImage: "chart.bar.fill")        // ✏️
                }
                .tag(3)

            PerfilDuenoView(mascotas: mascotas)
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle.fill")     // ✏️
                }
                .tag(4)
        }
        .tint(paletaPrimario)            // color del ícono de la pestaña seleccionada
        // ⚠️ NO VISTO EN CLASE (lo usaste en tu tarea Movil2).
        // La paleta es clara; forzamos modo claro para que el texto
        // del sistema no salga blanco sobre fondo claro en modo oscuro.
        .preferredColorScheme(.light)
    }
}

#Preview {
    AppCompletaView()
}
