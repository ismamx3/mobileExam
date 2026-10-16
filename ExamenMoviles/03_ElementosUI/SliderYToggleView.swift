// ═══════════════════════════════════════════════════════════════
//  SliderYToggleView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Slider (barra de valores continuos) y Toggle (switch para
//              prender/apagar un valor), como en la Clase 4: Slider con
//              onEditingChanged y .tint, Toggle con .onChange. Además:
//              valor sin decimales, step, slider que cambia tamaño y
//              opacidad, toggle con ícono y toggle que muestra u oculta.
//  ÚSALO PARA: brillo, volumen, nivel, calificación, activar música,
//              modo oscuro, favorito, mostrar opciones extra.
//  BUSCA:      slider, deslizador, barra, rango, brillo, volumen, step,
//              onEditingChanged, editing, sliderValue, tint, toggle, switch,
//              interruptor, isOnVal, activar musica, onchange, oldValue,
//              newValue, encendido, apagado, prender, apagar, bool,
//              mostrar ocultar, favorito, corazon, opacidad, tamaño
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/SliderYToggleView.swift (o pega solo un bloque).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: el parámetro step: del Slider (bloque 2; lo usaste
//                        en actSwift). Toggle con Label (bloque 5) no viene
//                        en las láminas de la Clase 4 (sí en tus tareas).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct SliderYToggleView: View {

    @State private var brillo = 50.0               // en la lámina: @State private var sliderValue = 50.0
    @State private var moviendoBrillo = false
    @State private var calificacion = 5.0
    @State private var moviendo = false
    @State private var tamano = 40.0
    @State private var opacidad = 1.0

    @State private var musicaActiva: Bool = false  // en la lámina: @State private var isOnVal: Bool = false
    @State private var mensajeMusica: String = ""
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

                    // ── 1. Slider como en clase (onEditingChanged + tint) ─
                    Text("1. Slider (forma de clase)")
                        .font(.headline)

                    // Barra de valores continuos para seleccionar un valor (brillo, volumen, etc.).
                    // Int(...) quita los decimales para mostrarlo bonito.
                    Text("Brillo: \(Int(brillo))")

                    Slider(value: $brillo, in: 0 ... 100,       // ✏️ variable y rango
                           onEditingChanged: { editing in
                               // hace algo: editing = true mientras el dedo lo mueve
                               moviendoBrillo = editing
                           }
                    )
                    .tint(.purple)                               // ✏️ color de la barra

                    Text(moviendoBrillo ? "Moviendo…" : "Listo")
                        .font(.caption)
                        .foregroundStyle(.gray)

                    // ── 2. Slider con step (de 1 en 1) ──────────
                    Text("2. Con step (saltos de 1 en 1)")
                        .font(.headline)

                    // ⚠️ NO VISTO EN CLASE: step: hace que el valor avance en saltos (aquí de 1 en 1).
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

                    // ── 4. Toggle con texto + .onChange ─────────
                    Text("4. Toggle con texto y .onChange")
                        .font(.headline)

                    // Toggle = prender/apagar un valor (activar elementos, audio, etc.)
                    Toggle("Activar música", isOn: $musicaActiva)   // ✏️ texto
                        .tint(.purple)
                        // Para "hacer algo" cuando se prenda o se apague: .onChange
                        .onChange(of: musicaActiva) { oldValue, newValue in
                            mensajeMusica = newValue ? "se prendió la música 🎵" : "se apagó la música"   // ✏️
                        }

                    Text(musicaActiva ? "Música encendida 🎵" : "Música apagada")

                    if mensajeMusica != "" {
                        Text("Último cambio: \(mensajeMusica)")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

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
                            Text("Brillo: \(Int(brillo))")
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
