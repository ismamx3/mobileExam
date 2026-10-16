// ═══════════════════════════════════════════════════════════════
//  ToolbarView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Controlar la barra de navegación: esconderla con
//              .toolbar(.hidden) (visto en clase), poner botones en la
//              barra con ToolbarItem y hacer el título chico (inline).
//  ÚSALO PARA: un botón "+" o "Editar" arriba, quitar la barra en una
//              pantalla de portada, título pequeño centrado.
//  BUSCA:      toolbar, barra de navegacion, esconder barra, ocultar barra,
//              hidden, ToolbarItem, boton arriba, boton en la barra, inline,
//              titulo chico, navigationBarTitleDisplayMode, bottomBar
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ToolbarView.swift (o pega solo los modificadores).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más. Los modificadores van sobre el contenido que está
//              DENTRO de un NavigationStack.
//  ⚠️ NO VISTO EN CLASE: .toolbar { ToolbarItem }, .navigationBarTitleDisplayMode
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ToolbarView: View {

    @State private var contador = 0
    @State private var esconderBarra = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.teal.opacity(0.12)
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    Text("\(contador)")
                        .font(.system(size: 90))
                        .bold()
                        .foregroundStyle(.teal)

                    Text("Usa los botones de la barra de arriba y de abajo.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)

                    Toggle("Esconder la barra de navegación", isOn: $esconderBarra)
                        .tint(.teal)
                }
                .padding(30)
            }
            .navigationTitle("Toolbar")                            // ✏️

            // ── 1. Título chico y centrado ──────────────────────────
            // ⚠️ NO VISTO EN CLASE: .inline = chico arriba; .large = grande (default)
            .navigationBarTitleDisplayMode(.inline)

            // ── 2. Botones en la barra ──────────────────────────────
            // ⚠️ NO VISTO EN CLASE: ToolbarItem pone botones en la barra.
            .toolbar {
                // ✏️ .topBarLeading = arriba a la izquierda
                //    .topBarTrailing = arriba a la derecha (lo normal para un "+")
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        contador += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }

                // .bottomBar = barra de abajo
                ToolbarItem(placement: .bottomBar) {
                    Button("Reiniciar") {
                        contador = 0
                    }
                }
            }

            // ── 3. Esconder la barra (forma de la clase 6A) ─────────
            // Clase: en el Stack principal de la pantalla deseada se
            // agrega el modificador:   .toolbar(.hidden)
            // Aquí depende del Toggle: escondida (.hidden) o visible (.visible).
            .toolbar(esconderBarra ? .hidden : .visible)
        }
    }
}

#Preview {
    ToolbarView()
}
