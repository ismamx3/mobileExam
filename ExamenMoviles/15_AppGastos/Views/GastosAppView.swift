// ═══════════════════════════════════════════════════════════════
//  GastosAppView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La pantalla RAÍZ de "Mis Gastos". Primero muestra el
//              LOGIN; cuando el login es correcto, muestra la app (un
//              TabView con 5 pestañas).
//              Es la DUEÑA de todos los datos (@State) y los reparte:
//                - sin $ → la pestaña solo LEE        (var en la pestaña)
//                - con $ → la pestaña puede MODIFICAR (@Binding en la pestaña)
//  ÚSALO PARA: una app con login + pestañas.
//  BUSCA:      raiz, root, login, iniciar sesion, cerrar sesion, TabView,
//              if sesion, cambiar pantalla, sin anidar NavigationStack,
//              compartir datos entre pestañas, State, Binding
//
//  CÓMO COPIARLO:
//   1. Copia toda la carpeta 15_AppGastos a tu proyecto.
//   2. En TuAppApp.swift cambia ContentView() por GastosAppView().
//  NECESITA:   toda la carpeta 15_AppGastos (Model, Utils, Components, Views).
//
//  ¿POR QUÉ UN `if` Y NO UN NavigationLink DEL LOGIN A LA APP?
//   Cada pestaña del TabView trae su PROPIO NavigationStack (así se hace,
//   Clase 7). Si el login estuviera en un NavigationStack y "empujara" el
//   TabView (NavigationLink o navigationDestination), quedarían dos
//   NavigationStack uno dentro de otro → dos barras de navegación y la
//   flecha "<" regresaría al login.
//   Solución: la raíz decide qué mostrar con un `if` y una @State:
//      sesionIniciada == false → GastosLoginView
//      sesionIniciada == true  → TabView
//   El login recibe esa @State como @Binding y la pone en true.
//   Cerrar sesión (en Perfil) la regresa a false.
//
//  DE CLASE: @State = esta vista es DUEÑA del dato; @Binding = permiso para
//     leerlo y modificarlo (Clase 6B). TabView + .tabItem + .tint (Clase 7).
//  ⚠️ NO VISTO EN CLASE: .preferredColorScheme(.light) (lo usaste en Movil2).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosAppView: View {

    // ── Los datos de toda la app viven AQUÍ (una sola fuente de verdad) ──
    @State private var sesionIniciada = false
    @State private var nombreUsuario = ""
    @State private var gastos = cargarGastosApp()
    @State private var presupuesto = 6000.0           // ✏️ presupuesto mensual en pesos

    let paleta = PaletaGastos()

    var body: some View {

        // ── 1. ¿Ya inició sesión? ──────────────────────────────
        if sesionIniciada {

            // ── 2. La app: 5 pestañas ──────────────────────────
            TabView {
                // Solo LEE → sin $
                GastosResumenView(gastos: gastos, presupuesto: presupuesto, nombreUsuario: nombreUsuario)
                    .tabItem {
                        Label("Resumen", systemImage: "house.fill")                 // ✏️
                    }

                // Agrega y borra → con $ (@Binding en la pestaña)
                GastosListaView(gastos: $gastos)
                    .tabItem {
                        Label("Gastos", systemImage: "list.bullet.rectangle.fill")  // ✏️
                    }

                // Solo LEE para graficar → sin $
                GastosEstadisticasView(gastos: gastos, presupuesto: presupuesto)
                    .tabItem {
                        Label("Estadísticas", systemImage: "chart.pie.fill")        // ✏️
                    }

                // No usa la lista: tiene sus propios datos
                GastosCalculadoraView()
                    .tabItem {
                        Label("Ahorro", systemImage: "banknote.fill")               // ✏️
                    }

                // Cambia el presupuesto y cierra sesión → con $
                GastosPerfilView(nombreUsuario: nombreUsuario, totalGastos: gastos.count,
                                 presupuesto: $presupuesto, sesionIniciada: $sesionIniciada)
                    .tabItem {
                        Label("Perfil", systemImage: "person.crop.circle.fill")     // ✏️
                    }
            }
            .tint(paleta.primario)                 // color de la pestaña seleccionada
            .preferredColorScheme(.light)          // ⚠️ la paleta es clara

        } else {

            // ── 3. Login: recibe permiso (@Binding) para iniciar sesión ──
            GastosLoginView(sesionIniciada: $sesionIniciada, nombreUsuario: $nombreUsuario)
                .preferredColorScheme(.light)
        }
    }
}

#Preview {
    GastosAppView()
}
