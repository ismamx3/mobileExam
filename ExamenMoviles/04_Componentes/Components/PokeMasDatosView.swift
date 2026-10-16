// ═══════════════════════════════════════════════════════════════
//  PokeMasDatosView.swift  ·  04 Componentes (ejemplo Pokémon de clase 5A)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Los datos complementarios del Pokémon (Paso #4 de la
//              clase 5A): "Evoluciones:" con dos imágenes y su nombre.
//              En clase se llamó "MasDatosView".
//              Abajo viene también la PAUSA de clase: "¿cómo ponemos
//              una imagen en la mitad izquierda de la pantalla?"
//              → PokeUnaEvolucionView.
//  ÚSALO PARA: una fila de 2 fotos con su nombre, cada una en su mitad;
//              o una sola foto en la mitad izquierda.
//  BUSCA:      MasDatosView, PokeMasDatosView, evoluciones, mitad izquierda,
//              Spacer frame maxWidth infinity, elemento complementario,
//              espacio en blanco, dos imagenes, componente, clase 5A
//
//  CÓMO SE CREA: igual que PokeImagenView (File → New → File from
//   Template... → "User Interface" → "SwiftUI View" → Next → nombre → Create).
//
//  CÓMO SE USA: en la pantalla principal, abajo de PokeDatosView:
//       PokeMasDatosView()
//       PokeUnaEvolucionView()      // solo si hay UNA evolución
//
//  NECESITA:   imágenes "foto2" y "foto3" en Assets (✏️ cámbialas).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PokeMasDatosView: View {

    var color: Color = .orange      // ✏️

    var body: some View {
        VStack(alignment: .leading) {
            Text("Evoluciones:")                            // ✏️
                .bold()
                .foregroundStyle(color)

            HStack {
                // Cada evolución pide todo el ancho (maxWidth: .infinity):
                // como son dos y piden lo mismo, cada una queda en su mitad.
                VStack {
                    Image("foto2")                          // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110)
                    Text("Charmeleon")                      // ✏️
                        .font(.system(size: 13))
                }
                .frame(maxWidth: .infinity)

                VStack {
                    Image("foto3")                          // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110)
                    Text("Charizard")                       // ✏️
                        .font(.system(size: 13))
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

// ── PAUSA de clase: una imagen en la mitad IZQUIERDA ─────────────
// Si solo hay UNA evolución, el HStack la deja centrada. Para que se
// quede en la mitad izquierda se usa el "elemento complementario"
// (espacio en blanco):  Spacer().frame(maxWidth: .infinity)
// El Spacer pide todo el ancho igual que la evolución, así que el
// HStack les da una mitad a cada uno: imagen a la izquierda, vacío
// a la derecha.
struct PokeUnaEvolucionView: View {

    var color: Color = .orange      // ✏️

    var body: some View {
        VStack(alignment: .leading) {
            Text("Evoluciones:")                            // ✏️
                .bold()
                .foregroundStyle(color)

            HStack {
                VStack {
                    Image("foto2")                          // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110)
                    Text("Charmeleon")                      // ✏️
                        .font(.system(size: 13))
                }
                .frame(maxWidth: .infinity)

                Spacer()
                    .frame(maxWidth: .infinity)             // ← la mitad derecha vacía
            }
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        PokeMasDatosView()
        Divider()
        PokeUnaEvolucionView()
    }
    .padding()
}
