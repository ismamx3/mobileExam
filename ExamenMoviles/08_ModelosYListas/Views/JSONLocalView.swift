// ═══════════════════════════════════════════════════════════════
//  JSONLocalView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Lista llenada desde un archivo .json incluido en la app.
//  ÚSALO PARA: cuando te dan los datos en un .json y no hay internet.
//  BUSCA:      json local, archivo json, bundle, lista desde json, peliculas, cargar archivo, año sin coma
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/JSONLocalView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Pelicula.swift (modelo + cargarPeliculasJSON)
//              08_ModelosYListas/Model/peliculas.json (dentro del target)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct JSONLocalView: View {

    // Se lee el archivo UNA vez, al crear la pantalla.
    @State private var peliculas = cargarPeliculasJSON()          // ✏️

    var body: some View {
        // Si el JSON no se pudo leer, la lista queda vacía: avisamos.
        if peliculas.isEmpty {
            VStack(spacing: 12) {
                Image(systemName: "doc.badge.exclamationmark")
                    .font(.system(size: 50))
                    .foregroundStyle(.secondary)
                Text("No se pudo leer el archivo JSON.")
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("Películas")
        } else {
            List(peliculas) { pelicula in
                HStack(spacing: 12) {
                    Image(pelicula.imagen)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(pelicula.titulo)                         // ✏️
                            .font(.headline)
                        // .grouping(.never) evita que el año salga como "2,017".
                        Text("\(pelicula.anio, format: .number.grouping(.never)) · \(pelicula.genero)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Text("\(pelicula.calificacion, specifier: "%.1f") ⭐️")
                        .font(.subheadline)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Películas (JSON)")                      // ✏️
        }
    }
}

#Preview {
    NavigationStack {
        JSONLocalView()
    }
}
