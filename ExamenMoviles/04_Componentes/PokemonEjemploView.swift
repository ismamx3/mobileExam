// ═══════════════════════════════════════════════════════════════
//  PokemonEjemploView.swift  ·  04 Componentes (ejemplo de la clase 5A)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El ejemplo POKÉMON de la clase 5A "Vistas como
//              Componentes", paso por paso: una pantalla armada con
//              VARIAS VISTAS, cada una definida en su propio archivo.
//              En clase esta pantalla era el ContentView.
//  ÚSALO PARA: pantallas de detalle con portada + foto circular +
//              datos + sección extra (perfil, producto, mascota…).
//  BUSCA:      pokemon, multiples vistas en una pantalla, vistas como componentes,
//              reutilizables, portada, imagen de fondo arriba, foto circular encima,
//              ZStack offset, offset(y:120), Divider, padding, clase 5A
//
//  CÓMO COPIARLO:
//   1. Copia primero los componentes a tu carpeta Components/:
//      PokeImagenView.swift, PokeDatosView.swift, PokeMasDatosView.swift
//   2. Pega este archivo (o su body dentro de tu ContentView).
//   3. Cambia lo marcado con ✏️ (imágenes y textos).
//  NECESITA:   04_Componentes/Components/PokeImagenView.swift
//              04_Componentes/Components/PokeDatosView.swift
//              04_Componentes/Components/PokeMasDatosView.swift
//              imágenes "foto1" (portada), "mascota", "foto2", "foto3".
//
//  POR QUÉ ASÍ (clase 5A): con esta distribución de elementos se
//  generan soluciones mejor estructuradas, encapsuladas y reutilizables.
//  Es indispensable una buena definición de componentes visuales.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PokemonEjemploView: View {
    var body: some View {
        VStack {

            // ── PASO 1 y 2.3: portada + foto circular en un ZStack ──────
            // Paso 1: imagen de fondo que abarca todo el ancho y está hasta arriba.
            // Paso 2.3: la nueva vista (PokeImagenView) va DESPUÉS de la imagen
            // de fondo y las dos dentro de un ZStack (lo último queda encima).
            ZStack {
                Image("foto1")                              // ✏️ portada
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)

                PokeImagenView()
                    .frame(width: 150)                      // 1. Ancho de 150
                    .offset(y: 120)                         // 2. Offset en y de 120 ✏️
            }

            // ── PASO 3: vista con los datos (DatosView en clase) ────────
            // .offset mueve el DIBUJO de la foto, pero no su espacio:
            // lo de abajo no se entera y quedaría tapado. Por eso este
            // padding de arriba deja libre lo que sobresale el círculo.
            PokeDatosView()                                 // ✏️ tus datos
                .padding(.horizontal)
                .padding(.top, 50)                          // ✏️ ajústalo a tu foto

            // ── PASO 5: línea divisora entre secciones ──────────────────
            Divider()

            // ── PASO 4: datos complementarios (MasDatosView en clase) ───
            PokeMasDatosView()
                .padding(.horizontal)

            Spacer()
        }
        // Si en tu app no cabe en pantallas chicas, envuelve el VStack en
        // un ScrollView { }.
    }
}

#Preview {
    PokemonEjemploView()
}
