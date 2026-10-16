// ═══════════════════════════════════════════════════════════════
//  NavegacionBasicaView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     NavigationStack con las 2 formas de NavigationLink de la
//              clase 6A (bloques 1 y 2), la forma con label: que se usa
//              en listas (bloque 3) y el Paso 3 de la clase: darle
//              aspecto de botón (bloques 4 y 5).
//  ÚSALO PARA: pasar de una pantalla a otra (lista → detalle,
//              inicio → perfil). Es la base de "múltiples pantallas".
//  BUSCA:      navigationstack, navigationlink, navegar, ir a otra pantalla,
//              navigation, push, navigationTitle, titulo, link como boton
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/NavegacionBasicaView.swift
//      (o pega solo el bloque del NavigationLink que quieras).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   06_MultiplesPantallas/PantallaDestinoView.swift
//              (o cambia PantallaDestinoView() por tu propia pantalla).
//
//  LO QUE DICE LA CLASE (6A):
//   - NavigationStack presenta una PILA (stack) de vistas sobre una
//     vista raíz.
//   - Las nuevas vistas se agregan "encima" al tocar un NavigationLink.
//   - Se quitan con controles integrados: el Back (<) del iPhone o un
//     gesto de deslizamiento.
//   - La pila siempre muestra la vista agregada más recientemente y NO
//     permite que se elimine la vista raíz.
//   - El NavigationLink se ve como botón/liga.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct NavegacionBasicaView: View {
    var body: some View {
        // Paso 1: agregar el NavigationStack en toda la vista principal
        // (o inclusive, en solamente una sección).
        // Solo va UNO, en la pantalla raíz. Las pantallas destino NO lo llevan.
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // ── 1. Forma 1 de la clase: texto + destino ─────────
                    // Paso 2: el NavigationLink hace la liga a la nueva pantalla.
                    Text("1. Forma corta")
                        .font(.headline)

                    NavigationLink("Ir al destino") {           // ✏️ texto
                        PantallaDestinoView()                    // ✏️ tu pantalla
                    }

                    Divider()

                    // ── 2. Forma 2 de la clase: con destination: ─────────
                    Text("2. Con destination:")
                        .font(.headline)

                    NavigationLink(destination: PantallaDestinoView(titulo: "Forma 2", color: .orange, icono: "2.circle.fill")) {
                        Text("Ir con destination:")              // ✏️
                    }

                    Divider()

                    // ── 3. Con label personalizado (para renglones y tarjetas)
                    // Es la forma que se usa en las listas: { destino } label: { lo que se ve }
                    Text("3. Con label personalizado")
                        .font(.headline)

                    NavigationLink {
                        PantallaDestinoView(titulo: "Mi perfil", color: .teal, icono: "person.crop.circle.fill")
                    } label: {
                        HStack(spacing: 14) {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(.teal)

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Mi perfil")                // ✏️
                                    .font(.headline)
                                    .foregroundStyle(.primary)
                                Text("Toca para ver el detalle") // ✏️
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.teal.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    Divider()

                    // ── 4. Paso 3 de la clase: darle aspecto de botón ───
                    // Se le da formato al NavigationLink con modificadores.
                    Text("4. Con aspecto de botón")
                        .font(.headline)

                    NavigationLink("Ir (botón)") {
                        PantallaDestinoView(titulo: "Botón", color: .purple, icono: "hand.tap.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)                               // ✏️ color

                    // ── 5. Botón que ocupa todo el ancho ────────────────
                    // El .frame va DENTRO del label para que el fondo se estire.
                    NavigationLink {
                        PantallaDestinoView(titulo: "Siguiente", color: .indigo, icono: "arrow.right.circle.fill")
                    } label: {
                        Text("Continuar")                        // ✏️
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo)
                }
                .padding()
            }
            // El título va sobre el CONTENIDO (dentro del NavigationStack),
            // no sobre el NavigationStack. También es el texto que sale
            // junto a la flecha de regreso en la pantalla siguiente.
            .navigationTitle("Navegación")                       // ✏️
        }
    }
}

#Preview {
    NavegacionBasicaView()
}
