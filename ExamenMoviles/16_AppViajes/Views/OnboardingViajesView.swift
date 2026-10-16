// ═══════════════════════════════════════════════════════════════
//  OnboardingViajesView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de BIENVENIDA de 3 páginas que se deslizan
//              (TabView con estilo página, como el carrusel de la Clase 7).
//              La última página tiene el botón "Comenzar".
//  ÚSALO PARA: tutorial inicial, "cómo funciona la app", presentación.
//  BUSCA:      onboarding, bienvenida, tutorial, paginas, carrusel, page,
//              tabViewStyle, indexViewStyle, primera vez, comenzar, saltar
//
//  CÓMO COPIARLO:
//   1. Views/OnboardingViajesView.swift → pega esto.
//   2. En tu vista raíz:
//        @AppStorage("vioOnboarding") private var vioOnboarding = false
//        if vioOnboarding { TuTabView() } else { OnboardingViajesView(vioOnboarding: $vioOnboarding) }
//   3. Cambia imágenes y textos (✏️).
//  NECESITA:   Utils/PaletaViajes.swift, imágenes destino_* en Assets.
//  DE CLASE:   .tabViewStyle(.page) + .indexViewStyle(.page(backgroundDisplayMode:
//              .always)) es el código del carrusel de la Clase 7. @Binding es
//              ida y vuelta (Clase 6B).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct OnboardingViajesView: View {

    // Permiso para cambiar el valor de la raíz (que es @AppStorage).
    // Al ponerlo en true, la raíz cambia sola a la app.
    @Binding var vioOnboarding: Bool

    let paleta = PaletaViajes()

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            VStack(spacing: 16) {

                // ── 1. Botón "Saltar" arriba a la derecha ────────
                HStack {
                    Spacer()
                    Button("Saltar") {
                        vioOnboarding = true
                    }
                    .foregroundStyle(paleta.primario)
                    .padding(.horizontal)
                }

                // ── 2. Las páginas (carrusel de la Clase 7) ──────
                // Aquí el TabView NO está dentro de un ScrollView, por eso
                // puede ocupar todo el espacio sin .frame(height:).
                TabView {
                    paginaOnboarding(imagen: "destino_playa",                       // ✏️
                                     titulo: "Descubre México",
                                     texto: "Playas, montañas, ciudades y pueblos mágicos en un solo lugar.")

                    paginaOnboarding(imagen: "destino_montana",
                                     titulo: "Planea tus viajes",
                                     texto: "Elige las fechas, cuántas personas van y calcula tu presupuesto.")

                    // Última página: además lleva el botón para entrar.
                    VStack(spacing: 24) {
                        paginaOnboarding(imagen: "destino_pueblo",
                                         titulo: "Guarda tus recuerdos",
                                         texto: "Toma fotos con la cámara o elígelas de tu galería.")

                        Button {
                            vioOnboarding = true
                        } label: {
                            Text("Comenzar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(paleta.textoSobrePrimario)
                                .background(paleta.primario)
                                .cornerRadius(14)
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 50)              // deja espacio a los puntitos
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
    }

    // Una página: imagen + título + texto. Es una función que regresa una
    // vista para no repetir el mismo código 3 veces.
    func paginaOnboarding(imagen: String, titulo: String, texto: String) -> some View {
        VStack(spacing: 18) {
            Image(imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .cornerRadius(24)

            Text(titulo)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(paleta.texto)

            Text(texto)
                .font(.title3)
                .foregroundStyle(paleta.textoSuave)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
    }
}

#Preview {
    OnboardingViajesView(vioOnboarding: .constant(false))
}
