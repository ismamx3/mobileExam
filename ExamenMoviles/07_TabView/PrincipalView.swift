// ═══════════════════════════════════════════════════════════════
//  PrincipalView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña 1 del ejemplo de clase (Charmander): fondo
//              oscuro arriba, imagen circular con borde naranja
//              encimada, nombre y una frase en cursiva.
//  ÚSALO PARA: pantalla de inicio / portada de una pestaña.
//  BUSCA:      PrincipalView, pestaña principal, portada, imagen circular
//              encimada, offset, borde naranja, frase, italic, charmander
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PrincipalView.swift (New File > SwiftUI View).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   imagen "foto3" en Assets (✏️ tu portada). Se usa desde 07_TabView/TabViewBasicoView.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PrincipalView: View {
    var body: some View {
        VStack(spacing: 20) {

            // ── 1. Fondo de arriba + imagen circular encimada ───────
            ZStack(alignment: .bottom) {
                // Imagen de fondo que abarca todo el ancho (como en clase).
                Image("foto3")                 // ✏️ en clase: la imagen de fondo del Pokémon
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)

                // Imagen circular con borde y sombra (igual que PokeImagenView)
                // ✏️ En clase es Image("charmander"); aquí un SF Symbol.
                Image(systemName: "flame.fill")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.orange)
                    .padding(30)
                    .frame(width: 150, height: 150)
                    .background(Color.white)
                    .clipShape(.circle)
                    .overlay {
                        Circle().stroke(.orange, lineWidth: 5)
                    }
                    .shadow(color: .orange, radius: 5)
                    // offset la baja 75 pts: queda mitad sobre el fondo y mitad fuera
                    .offset(y: 75)
            }

            // ── 2. Nombre ───────────────────────────────────────────
            Text("Charmander")                                    // ✏️
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.orange)
                .padding(.top, 80)          // deja espacio para la imagen que bajó

            Spacer()

            // ── 3. Frase en cursiva ─────────────────────────────────
            Text("\"Dicen que cuando llueve le sale vapor de la punta de la cola.\"")   // ✏️
                .font(.title2)
                .italic()
                .padding(.horizontal, 30)

            Spacer()
        }
    }
}

#Preview {
    PrincipalView()
}
