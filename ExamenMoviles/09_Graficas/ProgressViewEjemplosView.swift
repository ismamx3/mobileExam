// ═══════════════════════════════════════════════════════════════
//  ProgressViewEjemplosView.swift  ·  09 Gráficas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Barras de avance (ProgressView): básica, gruesa y de
//              color, con porcentaje que cambia, varias metas y el
//              circulito de "cargando".
//  ÚSALO PARA: mostrar un porcentaje (avance de un curso, meta de
//              ahorro, nivel de energía) sin necesitar Charts.
//  BUSCA:      progreso, progress, ProgressView, avance, porcentaje,
//              meta, barra de avance, cargando, loading, spinner,
//              scaleEffect, tint
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ProgressViewEjemplosView.swift (o pega solo el bloque que quieras).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más (ProgressView es de SwiftUI, no de Charts).
//  ⚠️ NO VISTO EN CLASE: ForEach (bloque 4; repite una vista por cada
//              elemento, como List pero sin el formato de lista) y
//              ProgressView() circular (bloque 5).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Para el bloque 4: cada meta con su avance actual y su total.
struct MetaGrafica: Identifiable {
    let id: Int
    let nombre: String
    let actual: Double
    let total: Double
}

struct ProgressViewEjemplosView: View {

    // Valor que mueve el Slider del bloque 3.
    @State private var avance = 40.0

    // ✏️ tus metas
    let metas: [MetaGrafica] = [
        MetaGrafica(id: 1, nombre: "Ahorro", actual: 3500, total: 5000),
        MetaGrafica(id: 2, nombre: "Pasos del día", actual: 8200, total: 10000),
        MetaGrafica(id: 3, nombre: "Libros leídos", actual: 3, total: 12)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Básica ─────────────────────────────────────────
                Text("1. Barra de avance básica")
                    .font(.headline)

                VStack(alignment: .leading) {
                    Text("Avance:")
                    ProgressView(value: 75, total: 100)    // ✏️ valor y total
                }

                Divider()

                // ── 2. Gruesa y de color ──────────────────────────────
                // scaleEffect(x: 1, y: 3): mismo ancho, 3 veces más gruesa.
                // Ojo: scaleEffect no aparta espacio, por eso el padding.
                Text("2. Gruesa y de color")
                    .font(.headline)

                ProgressView(value: 66, total: 100)
                    .scaleEffect(x: 1, y: 3)
                    .tint(.purple)                          // ✏️ tu color
                    .padding(.vertical, 6)

                Divider()

                // ── 3. Con porcentaje que cambia ──────────────────────
                // El color cambia según el valor (verde si ya pasó de 70).
                Text("3. Con porcentaje (mueve el slider)")
                    .font(.headline)

                HStack {
                    Text("Avance del proyecto")             // ✏️ tu texto
                    Spacer()
                    Text("\(Int(avance))%")
                        .bold()
                }

                ProgressView(value: avance, total: 100)
                    .scaleEffect(x: 1, y: 3)
                    .tint(avance >= 70 ? .green : .orange)
                    .padding(.vertical, 6)

                Slider(value: $avance, in: 0 ... 100)

                Divider()

                // ── 4. Varias metas ───────────────────────────────────
                Text("4. Varias metas")
                    .font(.headline)

                ForEach(metas) { meta in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(meta.nombre)
                                .bold()
                            Spacer()
                            Text("\(Int(meta.actual)) de \(Int(meta.total))")
                                .foregroundStyle(.gray)
                        }
                        ProgressView(value: meta.actual, total: meta.total)
                            .scaleEffect(x: 1, y: 2)
                            .tint(.indigo)
                            .padding(.vertical, 4)
                    }
                    .padding()
                    .background(Color.indigo.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Divider()

                // ── 5. Cargando (circular) ────────────────────────────
                // ⚠️ NO VISTO EN CLASE: ProgressView() sin valor = rueda que gira.
                // Se usa mientras algo carga y no sabes cuánto falta.
                Text("5. Cargando")
                    .font(.headline)

                HStack(spacing: 30) {
                    ProgressView()
                    ProgressView("Cargando…")              // ✏️ tu texto
                    ProgressView()
                        .controlSize(.large)
                        .tint(.purple)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .navigationTitle("Barras de avance")
    }
}

#Preview {
    NavigationStack {
        ProgressViewEjemplosView()
    }
}
