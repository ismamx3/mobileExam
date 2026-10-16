// ═══════════════════════════════════════════════════════════════
//  ComoUsarPaletaView.swift  ·  12 Paletas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Una pantalla completa que usa una paleta del repo en
//              TODO: fondo, textos, tarjetas, botones, controles,
//              íconos y gráfica. Es el ejemplo de cómo se usa.
//  ÚSALO PARA: pintar tu app con una paleta (rúbrica: "paleta adecuada
//              y armónica, monocromática o análoga").
//  BUSCA:      usar paleta, como usar colores, paleta.fondo, paleta.primario,
//              tint, fondo pantalla completa, colores de la app, palette usage
//
//  CÓMO USAR UNA PALETA EN TU APP (3 pasos):
//   1. Elige una paleta en 12_Paletas/Paletas/ (o en la galería del menú).
//   2. En tu proyecto: Utils/ → New File → Swift File → "Paleta".
//      Pega el struct y cámbiale el nombre a:  struct Paleta {
//   3. En CADA vista que use colores, agrega arriba del body:
//          let paleta = Paleta()
//      y usa  paleta.fondo, paleta.superficie, paleta.primario,
//             paleta.secundario, paleta.texto, paleta.textoSuave,
//             paleta.textoSobrePrimario, paleta.graficas[0…4]
//
//  ¿Quieres cambiar TODOS los colores de la app? Cambia solo el
//  struct Paleta (o pega otra paleta encima). Por eso se centraliza.
//
//  POR QUÉ ASÍ (para defenderlo):
//   - Es un struct con constantes (let), igual que cualquier modelo.
//   - No uso static (no se vio en clase): creo una instancia con
//     let paleta = Paleta() en cada vista. No lleva @State porque los
//     colores no cambian.
//   - Otra forma válida: let globales (paletaFondo, paletaPrimario…),
//     como en 00_AppCompleta/Utils/PaletaMascotas.swift.
//
//  PALETAS OSCURAS (las que terminan en "Oscura"): agrega a tu vista
//  raíz .preferredColorScheme(.dark) ⚠️ para que los ejes de las gráficas,
//  la barra de estado y el teclado también salgan claros.
//
//  NECESITA:   una paleta de 12_Paletas/Paletas/ (aquí PaletaTaqueriaAnaloga)
//              e import Charts para el bloque de la gráfica.
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

struct ComoUsarPaletaView: View {

    // ✏️ Para probar otra paleta cambia SOLO esta línea.
    //    En tu app sería:  let paleta = Paleta()
    let paleta = PaletaTaqueriaAnaloga()

    @State private var soloFavoritos = true
    @State private var presupuesto = 150.0
    @State private var categoria = "Tacos"

    var body: some View {

        // ── 1. Fondo de pantalla completa (opción 1 de la Clase 3) ──
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 2. Textos: principal y suave ─────────────────
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hola 👋")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(paleta.texto)          // texto principal
                        Text("Así se usa la paleta en cada parte")
                            .foregroundStyle(paleta.textoSuave)     // subtítulo
                    }

                    // ── 3. Tarjeta con la superficie ─────────────────
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Tacos Juanito")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        Text("Tacos de trompo con mucha piña")
                            .foregroundStyle(paleta.textoSuave)
                        Text("$120.00")
                            .bold()
                            .foregroundStyle(paleta.primario)       // dato importante
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(paleta.superficie)                  // tarjeta
                    .cornerRadius(16)

                    // ── 4. Botón primario (relleno) ──────────────────
                    Button {
                    } label: {
                        Text("Agregar antojo")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.textoSobrePrimario) // texto encima del botón
                            .background(paleta.primario)
                            .cornerRadius(14)
                    }

                    // ── 5. Botón secundario (solo borde) ─────────────
                    Button {
                    } label: {
                        Text("Ver estadísticas")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.primario)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(paleta.primario, lineWidth: 2)
                            )
                    }

                    // ── 6. Botón con estilo del sistema + .tint ──────
                    Button("Botón del sistema pintado con .tint") {
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(paleta.primario)
                    .controlSize(.large)

                    // ── 7. Controles: .tint pinta Toggle, Slider, etc. ─
                    VStack(alignment: .leading, spacing: 12) {
                        Toggle("Solo favoritos", isOn: $soloFavoritos)
                            .foregroundStyle(paleta.texto)
                        Text("Presupuesto: \(Int(presupuesto))")
                            .foregroundStyle(paleta.texto)
                        Slider(value: $presupuesto, in: 0 ... 500)
                        Picker(selection: $categoria, label: Text("Categoría")) {
                            Text("Tacos").tag("Tacos")
                            Text("Burgers").tag("Burgers")
                            Text("Postres").tag("Postres")
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)
                    .tint(paleta.primario)                          // un solo .tint para todos

                    // ── 8. Íconos SF Symbols ─────────────────────────
                    HStack(spacing: 24) {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(paleta.primario)
                        Image(systemName: "star.fill")
                            .foregroundStyle(paleta.secundario)
                        Image(systemName: "fork.knife")
                            .foregroundStyle(paleta.textoSuave)
                    }
                    .font(.title)

                    // ── 9. Gráfica con los colores de la paleta ──────
                    // Opción C de la Clase 15: chartForegroundStyleScale
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Antojos por categoría")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        Chart {
                            BarMark(x: .value("Categoría", "Tacos"), y: .value("Cantidad", 5))
                                .foregroundStyle(by: .value("Categoría", "Tacos"))
                            BarMark(x: .value("Categoría", "Burgers"), y: .value("Cantidad", 3))
                                .foregroundStyle(by: .value("Categoría", "Burgers"))
                            BarMark(x: .value("Categoría", "Postres"), y: .value("Cantidad", 4))
                                .foregroundStyle(by: .value("Categoría", "Postres"))
                        }
                        .chartForegroundStyleScale([
                            "Tacos": paleta.graficas[0],
                            "Burgers": paleta.graficas[2],
                            "Postres": paleta.graficas[4]
                        ])
                        .frame(height: 180)
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 10. Otros lugares donde va la paleta (para copiar) ──
                    //  TabView:   TabView { … }.tint(paleta.primario)
                    //  List:      List { … .listRowBackground(paleta.superficie) }
                    //                 .scrollContentBackground(.hidden)
                    //                 .background(paleta.fondo)
                    //  Alerta / NavigationLink / Picker:  .tint(paleta.primario)
                    //  Gráfica de un solo color:  .foregroundStyle(paleta.primario)
                    //  ProgressView:  .tint(paleta.primario)
                    ProgressView(value: 70, total: 100)
                        .scaleEffect(x: 1, y: 3)
                        .tint(paleta.primario)
                        .padding(.vertical, 8)
                }
                .padding()
            }
        }
        .navigationTitle("Usar una paleta")
    }
}

#Preview {
    NavigationStack {
        ComoUsarPaletaView()
    }
}
