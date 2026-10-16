// ═══════════════════════════════════════════════════════════════
//  VistaPreviaPaleta.swift  ·  12 Paletas (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es la "mini app" que pinta la galería
//  con cada paleta, para que veas cómo se vería TU app con esos colores.
//  Recibe los colores como parámetros (componente de la Clase 5A).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import Charts

struct VistaPreviaPaleta: View {

    var nombre: String
    var archivo: String
    var fondo: Color
    var superficie: Color
    var primario: Color
    var secundario: Color
    var texto: Color
    var textoSuave: Color
    var textoSobrePrimario: Color
    var graficas: [Color]
    var oscura: Bool = false

    @State private var favorito = true

    var body: some View {
        ZStack {
            fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // Encabezado
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Mis Antojos")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(texto)
                        Text("jueves, 15 de octubre")
                            .foregroundStyle(textoSuave)
                    }

                    // 3 tarjetas iguales
                    HStack(spacing: 12) {
                        tarjeta(numero: "10", etiqueta: "Antojos", icono: "fork.knife")
                        tarjeta(numero: "4", etiqueta: "Favoritos", icono: "heart.fill")
                        tarjeta(numero: "4.2", etiqueta: "Promedio", icono: "star.fill")
                    }

                    // Renglones tipo lista
                    VStack(spacing: 0) {
                        renglon(nombre: "Tacos Juanito", detalle: "Tacos · $120", esFavorito: true)
                        Divider()
                        renglon(nombre: "Burger Barrio", detalle: "Hamburguesas · $180", esFavorito: false)
                        Divider()
                        renglon(nombre: "Nieves La Fe", detalle: "Postres · $60", esFavorito: true)
                    }
                    .background(superficie)
                    .cornerRadius(16)

                    // Gráfica con los colores de la paleta
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Antojos por categoría")
                            .font(.headline)
                            .foregroundStyle(texto)
                        Chart {
                            BarMark(x: .value("Categoría", "Tacos"), y: .value("Cantidad", 5))
                                .foregroundStyle(graficas[0])
                            BarMark(x: .value("Categoría", "Burgers"), y: .value("Cantidad", 3))
                                .foregroundStyle(graficas[1])
                            BarMark(x: .value("Categoría", "Postres"), y: .value("Cantidad", 4))
                                .foregroundStyle(graficas[2])
                            BarMark(x: .value("Categoría", "Café"), y: .value("Cantidad", 2))
                                .foregroundStyle(graficas[3])
                            BarMark(x: .value("Categoría", "Pizza"), y: .value("Cantidad", 3))
                                .foregroundStyle(graficas[4])
                        }
                        .frame(height: 160)
                    }
                    .padding()
                    .background(superficie)
                    .cornerRadius(16)

                    Toggle("Solo favoritos", isOn: $favorito)
                        .foregroundStyle(texto)
                        .tint(primario)

                    // Botón primario y secundario
                    Button {
                    } label: {
                        Text("Agregar antojo")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(textoSobrePrimario)
                            .background(primario)
                            .cornerRadius(14)
                    }

                    Button {
                    } label: {
                        Text("Ver estadísticas")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(primario)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(primario, lineWidth: 2)
                            )
                    }

                    Text("let paleta = \(archivo)()")
                        .font(.caption)
                        .monospaced()
                        .foregroundStyle(textoSuave)
                }
                .padding()
            }
        }
        .navigationTitle(nombre)
        .navigationBarTitleDisplayMode(.inline)
        // Paletas oscuras: el sistema (ejes, barra de estado) también en oscuro
        .preferredColorScheme(oscura ? .dark : .light)
    }

    func tarjeta(numero: String, etiqueta: String, icono: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .foregroundStyle(secundario)
            Text(numero)
                .font(.title2)
                .bold()
                .foregroundStyle(primario)
            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(textoSuave)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(superficie)
        .cornerRadius(14)
    }

    func renglon(nombre: String, detalle: String, esFavorito: Bool) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(nombre)
                    .font(.headline)
                    .foregroundStyle(texto)
                Text(detalle)
                    .font(.subheadline)
                    .foregroundStyle(textoSuave)
            }
            Spacer()
            Image(systemName: esFavorito ? "heart.fill" : "heart")
                .foregroundStyle(primario)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        VistaPreviaPaleta(nombre: "Taquería", archivo: "PaletaTaqueriaAnaloga",
                          fondo: PaletaTaqueriaAnaloga().fondo,
                          superficie: PaletaTaqueriaAnaloga().superficie,
                          primario: PaletaTaqueriaAnaloga().primario,
                          secundario: PaletaTaqueriaAnaloga().secundario,
                          texto: PaletaTaqueriaAnaloga().texto,
                          textoSuave: PaletaTaqueriaAnaloga().textoSuave,
                          textoSobrePrimario: PaletaTaqueriaAnaloga().textoSobrePrimario,
                          graficas: PaletaTaqueriaAnaloga().graficas)
    }
}
