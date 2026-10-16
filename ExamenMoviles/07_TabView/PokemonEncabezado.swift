// ═══════════════════════════════════════════════════════════════
//  PokemonEncabezado.swift  ·  07 TabView (componente)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La franja negra de arriba con la imagen chica y el
//              nombre en naranja que se repite en DetallesView y
//              EvolucionesView (ejemplo de Charmander de la Clase 7).
//              Como se repite, va en su propio archivo (componente).
//  ÚSALO PARA: un encabezado igual en varias pantallas / pestañas.
//  BUSCA:      encabezado, header, franja de arriba, componente,
//              reutilizar vista, charmander, pokemon
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/PokemonEncabezado.swift
//   2. Pega el archivo completo.
//   3. Úsalo así:  PokemonEncabezado(nombre: "Charmander", icono: "flame.fill")
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PokemonEncabezado: View {

    // Solo muestra: variables simples, sin @State ni private
    var nombre: String
    var icono: String

    var body: some View {
        HStack(alignment: .bottom, spacing: 16) {
            // ✏️ En clase es Image("charmander") de Assets.
            //    Aquí un SF Symbol para que compile sin imágenes.
            Image(systemName: icono)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .foregroundStyle(.orange)

            Text(nombre)
                .font(.title)
                .bold()
                .foregroundStyle(.orange)

            Spacer()
        }
        .padding()
        // El fondo negro también llena la parte de arriba (hora, batería)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    VStack {
        PokemonEncabezado(nombre: "Charmander", icono: "flame.fill")
        Spacer()
    }
}
