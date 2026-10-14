// ═══════════════════════════════════════════════════════════════
//  OnboardingView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     3 páginas de bienvenida que se deslizan (TabView .page).
//              La última tiene un botón "Comenzar" que cambia a la app.
//              El cambio se hace con un if y una variable @State.
//  ÚSALO PARA: tutorial inicial, presentación de la app, splash.
//  BUSCA:      onboarding, bienvenida, tutorial, introduccion, paginas,
//              comenzar, empezar, splash, primera vez, cambiar de pantalla con if
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/OnboardingView.swift
//   2. Pega el archivo completo (trae OnboardingPagina al final).
//   3. Cambia lo marcado con ✏️. En el bloque "tu app real" pon tu
//      pantalla principal (por ejemplo TabViewBasicoView()).
//  NECESITA:   nada más.
//  TIP: para que solo salga la PRIMERA vez que abren la app, cambia
//       @State por @AppStorage("yaEmpezo") (ver tema 11 Extras).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct OnboardingView: View {

    // false = mostrar bienvenida · true = mostrar la app
    @State private var yaEmpezo = false

    var body: some View {
        if yaEmpezo {

            // ── Tu app real ─────────────────────────────────────────
            // ✏️ Cambia este VStack por tu pantalla principal
            ZStack {
                Color.green.opacity(0.12)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.green)
                    Text("¡Ya estás dentro de la app!")
                        .font(.title)
                        .bold()
                    Button("Ver la bienvenida otra vez") {
                        yaEmpezo = false
                    }
                    .buttonStyle(.bordered)
                    .tint(.green)
                }
                .padding()
            }

        } else {

            // ── Las páginas de bienvenida ───────────────────────────
            ZStack {
                Color.purple.opacity(0.1)
                    .ignoresSafeArea()

                TabView {
                    OnboardingPagina(icono: "hand.wave.fill",                  // ✏️
                                     titulo: "Bienvenido",
                                     texto: "Esta app te ayuda a organizar tus tareas.")

                    OnboardingPagina(icono: "list.bullet.clipboard.fill",
                                     titulo: "Organiza",
                                     texto: "Agrega tareas y márcalas cuando las termines.")

                    // Última página: la misma vista + el botón
                    VStack(spacing: 20) {
                        OnboardingPagina(icono: "chart.bar.fill",
                                         titulo: "Revisa tu avance",
                                         texto: "Mira tu progreso en gráficas.")

                        Button {
                            yaEmpezo = true
                        } label: {
                            Text("Comenzar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.purple)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 60)       // espacio para los puntitos
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
    }
}

// ═══════════════════════════════════════════════════════════════
//  OnboardingPagina — ícono grande + título + texto. Solo muestra.
// ═══════════════════════════════════════════════════════════════
struct OnboardingPagina: View {

    var icono: String
    var titulo: String
    var texto: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: icono)
                .font(.system(size: 90))
                .foregroundStyle(.purple)
            Text(titulo)
                .font(.largeTitle)
                .bold()
            Text(texto)
                .font(.title3)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(30)
    }
}

#Preview {
    OnboardingView()
}
