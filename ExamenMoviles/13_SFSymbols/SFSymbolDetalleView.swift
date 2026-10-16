// ═══════════════════════════════════════════════════════════════
//  SFSymbolDetalleView.swift  ·  13 SF Symbols (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es la hoja que sale al tocar un ícono en el
//  catálogo: lo muestra grande, en sus estilos, con el código listo y
//  un botón para COPIAR el nombre (el portapapeles del simulador se
//  comparte con tu Mac: copias aquí y pegas en Xcode con ⌘V).
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import UIKit

struct SFSymbolDetalleView: View {

    var nombre: String
    var uso: String
    var ios: String
    var categorias: [String]
    var palabras: [String]
    var existeRelleno: Bool         // true si también existe "nombre.fill"

    @Environment(\.dismiss) private var dismiss
    @State private var copiado = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {

                    // Ícono grande
                    Image(systemName: nombre)
                        .font(.system(size: 90))
                        .foregroundStyle(.purple)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)

                    Text(nombre)
                        .font(.title3)
                        .bold()
                        .monospaced()
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)

                    if !uso.isEmpty {
                        Text("Úsalo para: " + uso)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }

                    // Copiar
                    HStack(spacing: 12) {
                        Button {
                            UIPasteboard.general.string = nombre
                            copiado = "Nombre copiado ✓"
                        } label: {
                            Label("Copiar nombre", systemImage: "doc.on.doc")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)

                        Button {
                            UIPasteboard.general.string = "Image(systemName: \"\(nombre)\")"
                            copiado = "Código copiado ✓"
                        } label: {
                            Label("Copiar código", systemImage: "chevron.left.forwardslash.chevron.right")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                    .tint(.purple)
                    .controlSize(.large)

                    if !copiado.isEmpty {
                        Text(copiado + "  Pégalo en Xcode con ⌘V")
                            .font(.footnote)
                            .foregroundStyle(.green)
                            .frame(maxWidth: .infinity)
                    }

                    // Código
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Código")
                            .font(.headline)
                        Text("Image(systemName: \"\(nombre)\")")
                        Text("Label(\"Texto\", systemImage: \"\(nombre)\")")
                        Text("Button(\"Texto\", systemImage: \"\(nombre)\") { }")
                    }
                    .font(.footnote)
                    .monospaced()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.12))
                    .cornerRadius(12)

                    // Tamaños
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Tamaños (.font)")
                            .font(.headline)
                        HStack(alignment: .bottom, spacing: 22) {
                            muestra(texto: ".caption", vista: Image(systemName: nombre).font(.caption))
                            muestra(texto: ".body", vista: Image(systemName: nombre).font(.body))
                            muestra(texto: ".title", vista: Image(systemName: nombre).font(.title))
                            muestra(texto: ".largeTitle", vista: Image(systemName: nombre).font(.largeTitle))
                        }
                    }

                    // Estilos de color
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Estilos de color")
                            .font(.headline)
                        HStack(alignment: .bottom, spacing: 22) {
                            muestra(texto: "un color", vista: Image(systemName: nombre).font(.largeTitle).foregroundStyle(.purple))
                            muestra(texto: "jerárquico ⚠️", vista: Image(systemName: nombre).font(.largeTitle).symbolRenderingMode(.hierarchical).foregroundStyle(.purple))
                            muestra(texto: "paleta ⚠️", vista: Image(systemName: nombre).font(.largeTitle).symbolRenderingMode(.palette).foregroundStyle(.purple, .orange))
                            muestra(texto: "multicolor ⚠️", vista: Image(systemName: nombre).font(.largeTitle).symbolRenderingMode(.multicolor))
                        }
                    }

                    if existeRelleno {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Normal vs relleno")
                                .font(.headline)
                            HStack(spacing: 30) {
                                muestra(texto: nombre, vista: Image(systemName: nombre).font(.largeTitle))
                                muestra(texto: nombre + ".fill", vista: Image(systemName: nombre + ".fill").font(.largeTitle))
                            }
                            Text("Usa .fill para lo seleccionado o activo (ej. favorito).")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }

                    // Datos
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Desde iOS " + ios)
                            .bold()
                            .foregroundStyle((Double(ios) ?? 0) >= 18 ? Color.orange : Color.primary)
                        if (Double(ios) ?? 0) >= 18 {
                            Text("Si tu proyecto es iOS 17, este ícono no se verá en un iPhone con iOS 17.")
                                .font(.footnote)
                                .foregroundStyle(.orange)
                        }
                        if !categorias.isEmpty {
                            Text("Categorías: " + categorias.joined(separator: ", "))
                                .font(.footnote)
                        }
                        if !palabras.isEmpty {
                            Text("Palabras clave: " + palabras.joined(separator: ", "))
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Ícono")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }

    func muestra(texto: String, vista: some View) -> some View {
        VStack(spacing: 6) {
            vista
            Text(texto)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    SFSymbolDetalleView(nombre: "heart", uso: "Favoritos / me gusta", ios: "13.0",
                        categorias: ["Salud", "Formas"], palabras: ["love", "like"], existeRelleno: true)
}
