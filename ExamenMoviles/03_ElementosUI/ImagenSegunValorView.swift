// ═══════════════════════════════════════════════════════════════
//  ImagenSegunValorView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Un Slider que cambia la imagen, el ícono, el color y el
//              texto según su valor, usando propiedades calculadas
//              (igual que gokuImage de tu tarea actSwift).
//  ÚSALO PARA: nivel de energía, estado de ánimo, batería, semáforo,
//              cualquier "si el valor es X, muestra Y".
//  BUSCA:      imagen segun valor, cambiar imagen, propiedad calculada,
//              computed property, var calculada, if else, rango, nivel,
//              bateria, slider imagen, semaforo
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ImagenSegunValorView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (nombres de imágenes y rangos).
//  NECESITA:   imágenes "foto1", "foto2", "foto3", "foto4" en Assets
//              (arrastra 4 imágenes a Assets.xcassets y nómbralas así).
//  ⚠️ NO VISTO EN CLASE: nada.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ImagenSegunValorView: View {

    @State private var nivel = 0.0

    // ── Propiedades calculadas: se recalculan solas cada vez que cambia "nivel" ──

    var imagenSegunNivel: String {
        if nivel > 75 {
            return "foto4"          // ✏️ nombre de tu imagen en Assets
        } else if nivel > 50 {
            return "foto3"
        } else if nivel > 25 {
            return "foto2"
        } else {
            return "foto1"
        }
    }

    var iconoBateria: String {
        if nivel > 87 {
            return "battery.100percent"
        } else if nivel > 62 {
            return "battery.75percent"
        } else if nivel > 37 {
            return "battery.50percent"
        } else if nivel > 12 {
            return "battery.25percent"
        } else {
            return "battery.0percent"
        }
    }

    var colorSegunNivel: Color {
        if nivel > 66 {
            return Color.green
        } else if nivel > 33 {
            return Color.orange
        } else {
            return Color.red
        }
    }

    var mensajeSegunNivel: String {
        if nivel > 75 {
            return "¡Al máximo! 🚀"         // ✏️ tus mensajes
        } else if nivel > 50 {
            return "Vas muy bien"
        } else if nivel > 25 {
            return "Calentando motores"
        } else {
            return "Apenas empezando"
        }
    }

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {

                    // ── 1. Imagen que cambia según el valor ─────
                    Text("1. Imagen según el valor")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(imagenSegunNivel)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 260)
                        .cornerRadius(16)
                        .shadow(radius: 5)

                    Text(mensajeSegunNivel)
                        .font(.title2)
                        .bold()

                    // ── 2. El Slider que controla todo ──────────
                    Text("2. Slider que lo controla")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Nivel: \(Int(nivel))")
                        .font(.title3)

                    Slider(value: $nivel, in: 0 ... 100, step: 1)
                        .tint(colorSegunNivel)

                    // ── 3. Ícono y color según el valor ─────────
                    Text("3. Ícono y color según el valor")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    HStack(spacing: 20) {
                        Image(systemName: iconoBateria)
                            .font(.system(size: 50))
                            .foregroundStyle(colorSegunNivel)

                        Circle()
                            .fill(colorSegunNivel)
                            .frame(width: 50, height: 50)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Imagen según valor")
    }
}

#Preview {
    NavigationStack {
        ImagenSegunValorView()
    }
}
