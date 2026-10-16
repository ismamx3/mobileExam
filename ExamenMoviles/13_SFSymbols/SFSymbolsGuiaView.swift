// ═══════════════════════════════════════════════════════════════
//  SFSymbolsGuiaView.swift  ·  13 SF Symbols (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es la guía "¿qué ícono uso para…?" en
//  español: más de 300 íconos ordenados por uso (pestañas, acciones,
//  comida, viajes, deporte, escuela…). La misma guía en texto está en
//  13_SFSymbols/SFSymbols_GUIA.md para buscar con ⌘F.
//  Toca un renglón para ver el ícono grande y copiar su nombre.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct SFSymbolsGuiaView: View {

    @State private var secciones: [SeccionSF] = []
    @State private var textoBusqueda = ""
    @State private var elegido: SimboloRecomendadoSF? = nil

    func coincide(_ simbolo: SimboloRecomendadoSF, _ seccion: SeccionSF) -> Bool {
        if textoBusqueda.isEmpty {
            return true
        }
        return simbolo.nombre.localizedStandardContains(textoBusqueda)
            || simbolo.uso.localizedStandardContains(textoBusqueda)
            || seccion.seccion.localizedStandardContains(textoBusqueda)
    }

    var body: some View {
        List {
            ForEach(secciones) { seccion in
                Section(seccion.seccion) {
                    ForEach(seccion.simbolos) { simbolo in
                        if coincide(simbolo, seccion) {
                            Button {
                                elegido = simbolo
                            } label: {
                                HStack(spacing: 14) {
                                    Image(systemName: simbolo.nombre)
                                        .font(.title2)
                                        .foregroundStyle(.purple)
                                        .frame(width: 40)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(simbolo.uso)
                                            .foregroundStyle(.primary)
                                        Text(simbolo.nombre)
                                            .font(.caption)
                                            .monospaced()
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                            .buttonStyle(.plain)    // sin esto el renglón sale azul
                        }
                    }
                }
            }
        }
        .navigationTitle("¿Qué ícono uso?")
        .searchable(text: $textoBusqueda, prompt: "comida, borrar, perfil, gym…")
        .sheet(item: $elegido) { simbolo in
            SFSymbolDetalleView(nombre: simbolo.nombre, uso: simbolo.uso, ios: simbolo.ios,
                                categorias: [], palabras: [], existeRelleno: false)
        }
        .onAppear {
            if secciones.isEmpty {
                secciones = cargarRecomendadosSF()
            }
        }
    }
}

#Preview {
    NavigationStack {
        SFSymbolsGuiaView()
    }
}
