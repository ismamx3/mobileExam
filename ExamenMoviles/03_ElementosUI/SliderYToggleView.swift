// ═══════════════════════════════════════════════════════════════
//  SliderYToggleView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Slider (barra deslizable) y Toggle (switch on/off):
//              valor sin decimales, step, onEditingChanged, slider que
//              cambia tamaño y opacidad, toggle con ícono y toggle que
//              muestra u oculta contenido.
//  ÚSALO PARA: volumen, nivel, calificación, modo oscuro, favorito,
//              mostrar opciones extra.
//  BUSCA:      slider, deslizador, barra, rango, step, onEditingChanged,
//              toggle, switch, interruptor, encendido, apagado, bool,
//              mostrar ocultar, favorito, corazon, opacidad, tamaño
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/SliderYToggleView.swift (o pega solo un bloque).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: el parámetro step: del Slider (lo usaste en actSwift).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct SliderYToggleView: View {

    @State private var volumen = 50.0              // el Slider siempre usa Double
    @State private var calificacion = 5.0
    @State private var moviendo = false
    @State private var tamano = 40.0
    @State private var opacidad = 1.0

    @State private var musicaActiva: Bool = false
    @State private var esFavorito: Bool = false
    @State private var mostrarDetalles: Bool = false
    @State private var fondoOscuro: Bool = false

    var body: some View {
        ZStack {
            // El color de fondo depende del Toggle del bloque 7
            (fondoOscuro ? Color.black.opacity(0.85) : Color.purple.opacity(0.08))
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. Slider básico (sin decimales) ────────
                    Text("1. Slider básico")
                        .font(.headline)

                    Slider(value: $volumen, in: 0 ... 100)   // ✏️ rango
                        .tint(.purple)

                    // Int(...) quita los decimales para mostrarlo bonito
                    Text("Volumen: \(Int(volumen))")

                    // ── 2. Slider con step y onEditingChanged ───
                    Text("2. Con step y onEditingChanged")
                        .font(.headline)

                    Slider(value: $calificacion, in: 0 ... 10, step: 1,
                           onEditingChanged: { editing in
                               // editing = true mientras el dedo lo mueve
                               moviendo = editing
                           })
                    .tint(.orange)

                    HStack {
                        Text("Calificación: \(Int(calificacion))")
                        Spacer()
                        Text(moviendo ? "Moviendo…" : "Listo")
                            .foregroundStyle(moviendo ? .orange : .gray)
                    }

                    // ── 3. Slider que cambia tamaño y opacidad ──
                    Text("3. Cambia tamaño y opacidad")
                        .font(.headline)

                    HStack {
                        Text("Tamaño")
                        Slider(value: $tamano, in: 20 ... 120)
                    }

                    HStack {
                        Text("Opacidad")
                        Slider(value: $opacidad, in: 0 ... 1)
                    }

                    Image(systemName: "star.fill")
                        .font(.system(size: tamano))       // tamaño viene del Slider
                        .foregroundStyle(.yellow)
                        .opacity(opacidad)                 // opacidad viene del Slider
                        .frame(maxWidth: .infinity, minHeight: 130)

                    // ── 4. Toggle con texto ─────────────────────
                    Text("4. Toggle con texto")
                        .font(.headline)

                    Toggle("Activar música", isOn: $musicaActiva)   // ✏️ texto
                        .tint(.purple)

                    Text(musicaActiva ? "Música encendida 🎵" : "Música apagada")

                    // ── 5. Toggle con Label que cambia de ícono ──
                    Text("5. Toggle con ícono que cambia")
                        .font(.headline)

                    Toggle(isOn: $esFavorito) {
                        Label("Favorita", systemImage: esFavorito ? "heart.fill" : "heart")
                    }
                    .tint(.pink)

                    // ── 6. Toggle que muestra u oculta contenido ─
                    Text("6. Mostrar u ocultar")
                        .font(.headline)

                    Toggle("Mostrar detalles", isOn: $mostrarDetalles)
                        .tint(.purple)

                    if mostrarDetalles {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Volumen: \(Int(volumen))")
                            Text("Calificación: \(Int(calificacion))")
                            Text("Favorita: \(esFavorito ? "Sí" : "No")")
                        }
                        .foregroundStyle(.black)           // la tarjeta es blanca: texto siempre negro
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    }

                    // ── 7. Toggle que cambia el fondo ───────────
                    Text("7. Toggle que cambia el fondo")
                        .font(.headline)

                    Toggle("Fondo oscuro", isOn: $fondoOscuro)
                        .tint(.purple)
                }
                .padding()
                .foregroundStyle(fondoOscuro ? Color.white : Color.black)
            }
        }
        .navigationTitle("Slider y Toggle")
    }
}

#Preview {
    NavigationStack {
        SliderYToggleView()
    }
}
