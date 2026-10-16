// ═══════════════════════════════════════════════════════════════
//  FavoritosViajesView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Favoritos": solo los destinos con corazón.
//              Si no hay ninguno, un mensaje que explica qué hacer.
//  ÚSALO PARA: "mostrar solo los que cumplen algo" (favoritos,
//              pendientes, completados) sin perder el binding.
//  BUSCA:      favoritos, filtrar lista, lista vacia, mensaje vacio,
//              indices filtrados, binding de elemento filtrado
//
//  CÓMO COPIARLO:
//   1. Views/FavoritosViajesView.swift → pega esto.
//  NECESITA:   Model/DestinoViajes.swift, Views/DetalleDestinoViajesView.swift
//  DE CLASE:   List + NavigationLink { } label: { } (Clase 10),
//              filtrar con for + if + append, lista vacía con if.
//  ⚠️ NO VISTO EN CLASE: ForEach sobre posiciones (para poder mandar
//     $destinos[indice] al detalle y que el corazón se actualice aquí).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FavoritosViajesView: View {

    @Binding var destinos: Array<DestinoViajes>
    @Binding var viajes: Array<ViajePlaneado>

    let paleta = PaletaViajes()

    // Posiciones de los favoritos (for + if + append).
    var indicesFavoritos: Array<Int> {
        var resultado = Array<Int>()
        for indice in 0..<destinos.count {
            if destinos[indice].favorito {
                resultado.append(indice)
            }
        }
        return resultado
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                // ── 1. Sin favoritos ─────────────────────────────
                if indicesFavoritos.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 60))
                        Text("Aún no tienes favoritos.")
                            .font(.headline)
                        Text("Abre un destino en Explorar y toca el ❤️.")
                    }
                    .foregroundStyle(paleta.textoSuave)
                } else {
                    // ── 2. Lista de favoritos ────────────────────
                    List {
                        ForEach(indicesFavoritos, id: \.self) { indice in
                            NavigationLink {
                                DetalleDestinoViajesView(destino: $destinos[indice], viajes: $viajes)
                            } label: {
                                HStack(spacing: 12) {
                                    Image(destinos[indice].imagenPrincipal)
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 64)
                                        .cornerRadius(10)
                                    VStack(alignment: .leading, spacing: 3) {
                                        Text(destinos[indice].nombre)
                                            .font(.headline)
                                            .foregroundStyle(paleta.texto)
                                        Text(destinos[indice].estado + " · " + destinos[indice].categoria)
                                            .font(.subheadline)
                                            .foregroundStyle(paleta.textoSuave)
                                    }
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(Color.red)
                                }
                            }
                            .listRowBackground(paleta.superficie)
                        }
                    }
                    .listStyle(.inset)
                    .scrollContentBackground(.hidden)                 // ⚠️ fondo propio
                }
            }
            .navigationTitle("Favoritos")
        }
    }
}

#Preview {
    FavoritosViajesView(destinos: .constant(cargarDestinosViajes()), viajes: .constant(viajesDeEjemploViajes()))
}
