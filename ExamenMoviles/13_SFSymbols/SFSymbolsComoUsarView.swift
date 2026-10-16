// ═══════════════════════════════════════════════════════════════
//  SFSymbolsComoUsarView.swift  ·  13 SF Symbols
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Cómo usar los íconos que YA trae iOS (SF Symbols): tamaño,
//              color, relleno, con texto, en botones, en pestañas, dentro
//              de un círculo, y los estilos de color avanzados.
//  ÚSALO PARA: cualquier ícono de tu app sin agregar imágenes a Assets.
//  BUSCA:      sf symbols, iconos, icono, icon, systemName, Image(systemName,
//              tamaño icono, color icono, fill, relleno, Label, systemImage
//
//  CÓMO COPIARLO:
//   Copia el bloque que necesites dentro de tu body. Para saber el NOMBRE
//   de un ícono: corre la app → 13 · SF Symbols → Catálogo (toca uno y
//   "Copiar nombre") o busca en 13_SFSymbols/SFSymbols_GUIA.md.
//  NECESITA:   nada (los íconos vienen en iOS). Ojo: si tu proyecto es
//              iOS 17, usa íconos que digan "desde iOS 17" o menos.
//  ⚠️ NO VISTO EN CLASE: symbolRenderingMode, variableValue, symbolEffect
//              (bloques 8, 9 y 10). Lo demás (systemName, .font, color,
//              Label) sí sale en las clases 3, 5A y 7.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct SFSymbolsComoUsarView: View {

    @State private var esFavorito = false
    @State private var nivel = 0.6
    @State private var toques = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 26) {

                // ── 1. Ícono básico (Clase 3) ─────────────────────
                Text("1. Ícono básico")
                    .font(.headline)
                Image(systemName: "gamecontroller.fill")              // ✏️ nombre exacto del ícono
                    .font(.system(size: 60))

                // ── 2. Tamaño ────────────────────────────────────
                // Un SF Symbol se comporta como TEXTO: su tamaño se cambia con .font
                Text("2. Tamaño")
                    .font(.headline)
                HStack(alignment: .bottom, spacing: 20) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                    Image(systemName: "star.fill")
                        .font(.title)
                    Image(systemName: "star.fill")
                        .font(.system(size: 50))                      // tamaño exacto en puntos
                    Image(systemName: "star.fill")
                        .imageScale(.large)                           // chico / mediano / grande
                    Image(systemName: "star.fill")
                        .resizable(resizingMode: .stretch)            // también como imagen normal
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                }

                // ── 3. Color ─────────────────────────────────────
                Text("3. Color")
                    .font(.headline)
                HStack(spacing: 20) {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)                        // ✏️ tu color o paleta.primario
                    Image(systemName: "leaf.fill")
                        .foregroundStyle(Color(red: 21/255, green: 128/255, blue: 61/255))
                    Image(systemName: "moon.fill")
                        .foregroundStyle(.secondary)                  // gris del sistema
                }
                .font(.largeTitle)

                // ── 4. Normal vs relleno (.fill) ─────────────────
                // Regla: .fill = seleccionado / activo. Ternario como en clase.
                Text("4. Normal vs relleno (ej. favorito)")
                    .font(.headline)
                Button {
                    esFavorito.toggle()
                } label: {
                    Image(systemName: esFavorito ? "heart.fill" : "heart")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                }

                // ── 5. Ícono + texto: Label ──────────────────────
                Text("5. Ícono con texto (Label)")
                    .font(.headline)
                Label("Favoritos", systemImage: "star.fill")
                Label("Ubicación", systemImage: "mappin.and.ellipse")
                    .foregroundStyle(.purple)

                // ── 6. En botones ────────────────────────────────
                Text("6. En botones")
                    .font(.headline)
                Button("Agregar", systemImage: "plus") {
                }
                .buttonStyle(.borderedProminent)
                Button {
                } label: {
                    Label("Tomar foto", systemImage: "camera.fill")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                // En un TabView (Clase 7):
                //   .tabItem { Label("Inicio", systemImage: "house.fill") }

                // ── 7. Dentro de un círculo de color ─────────────
                Text("7. Ícono dentro de un círculo")
                    .font(.headline)
                HStack(spacing: 16) {
                    Image(systemName: "fork.knife")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.orange)
                        .clipShape(.circle)
                    Image(systemName: "pawprint.fill")
                        .font(.title2)
                        .foregroundStyle(.purple)
                        .frame(width: 56, height: 56)
                        .background(Color.purple.opacity(0.15))
                        .cornerRadius(14)
                }

                // ── 8. Estilos de color ⚠️ ───────────────────────
                // ⚠️ NO VISTO EN CLASE: symbolRenderingMode cambia cómo se pintan
                // las partes del ícono (un color, tonos de un color, 2 colores, original).
                Text("8. Estilos de color ⚠️")
                    .font(.headline)
                HStack(spacing: 20) {
                    Image(systemName: "cloud.sun.rain.fill")
                        .symbolRenderingMode(.monochrome)
                    Image(systemName: "cloud.sun.rain.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.blue)
                    Image(systemName: "cloud.sun.rain.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.gray, .orange, .blue)
                    Image(systemName: "cloud.sun.rain.fill")
                        .symbolRenderingMode(.multicolor)
                }
                .font(.largeTitle)

                // ── 9. Ícono que se llena según un valor ⚠️ ──────
                // ⚠️ NO VISTO EN CLASE: variableValue (0 a 1) llena el ícono por partes.
                Text("9. Se llena según un valor ⚠️")
                    .font(.headline)
                HStack(spacing: 20) {
                    Image(systemName: "wifi", variableValue: nivel)
                    Image(systemName: "speaker.wave.3.fill", variableValue: nivel)
                    Image(systemName: "cellularbars", variableValue: nivel)
                }
                .font(.largeTitle)
                Slider(value: $nivel, in: 0 ... 1)
                    .tint(.purple)

                // ── 10. Animación al tocar ⚠️ (iOS 17) ───────────
                // ⚠️ NO VISTO EN CLASE: symbolEffect anima el ícono cuando cambia "value".
                Text("10. Animación ⚠️")
                    .font(.headline)
                Button {
                    toques += 1
                } label: {
                    Image(systemName: "bell.fill")
                        .font(.largeTitle)
                        .symbolEffect(.bounce, value: toques)
                }
            }
            .padding()
        }
        .navigationTitle("Usar SF Symbols")
    }
}

#Preview {
    NavigationStack {
        SFSymbolsComoUsarView()
    }
}
