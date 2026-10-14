// ═══════════════════════════════════════════════════════════════
//  TareasResumenTabView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña que solo LEE la lista compartida y muestra:
//              total, completadas, pendientes y una barra de avance
//              (ProgressView). Se actualiza sola al cambiar la lista.
//  ÚSALO PARA: resumen, estadísticas, contar elementos que cumplen algo,
//              porcentaje de avance.
//  BUSCA:      resumen, estadisticas, contar, porcentaje, progressview,
//              barra de progreso, avance, total, computed property, for in
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TareasResumenTabView.swift
//   2. Pega el archivo completo (trae ResumenTabCuadro al final).
//   3. Cambia lo marcado con ✏️
//  NECESITA:   07_TabView/Model/TareaTab.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TareasResumenTabView: View {

    // Sin @Binding: esta pestaña solo lee
    var tareas: [TareaTab]

    // Propiedad calculada: cuenta las completadas con un for
    var completadas: Int {
        var cuenta = 0
        for tarea in tareas {
            if tarea.completada {            // ✏️ tu condición
                cuenta += 1
            }
        }
        return cuenta
    }

    var pendientes: Int {
        return tareas.count - completadas
    }

    // Cuidado: si la lista está vacía NO se puede dividir entre 0
    var porcentaje: Int {
        if tareas.isEmpty {
            return 0
        }
        return Int(Double(completadas) / Double(tareas.count) * 100)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.1)
                    .ignoresSafeArea()

                VStack(spacing: 24) {

                    // ── 1. Tres cuadros iguales en un renglón ───────
                    HStack(spacing: 12) {
                        ResumenTabCuadro(numero: tareas.count, texto: "Total", color: .blue)
                        ResumenTabCuadro(numero: completadas, texto: "Hechas", color: .green)
                        ResumenTabCuadro(numero: pendientes, texto: "Pendientes", color: .orange)
                    }

                    // ── 2. Barra de avance ──────────────────────────
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Avance: \(porcentaje)%")
                            .font(.title2)
                            .bold()

                        // total no puede ser 0, por eso el if
                        if tareas.isEmpty {
                            Text("No hay tareas todavía.")
                                .foregroundStyle(.secondary)
                        } else {
                            ProgressView(value: Double(completadas), total: Double(tareas.count))
                                .scaleEffect(x: 1, y: 3)     // y: 3 la hace más gruesa
                                .tint(.green)
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Resumen")
        }
    }
}

// Cuadro con un número grande y un texto abajo. Solo muestra.
struct ResumenTabCuadro: View {

    var numero: Int
    var texto: String
    var color: Color

    var body: some View {
        VStack(spacing: 6) {
            Text("\(numero)")
                .font(.system(size: 36))
                .bold()
                .foregroundStyle(color)
            Text(texto)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)          // los 3 miden lo mismo
        .padding(.vertical, 16)
        .background(color.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    TareasResumenTabView(tareas: cargarTareasTab())
}
