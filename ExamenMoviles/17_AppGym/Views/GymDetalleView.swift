// ═══════════════════════════════════════════════════════════════
//  GymDetalleView.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de DETALLE de un entrenamiento (solo muestra):
//              ícono grande, fecha completa en español, renglones de datos
//              y la descripción de la rutina que da su clase del protocolo.
//              Botón para regresar con dismiss().
//  ÚSALO PARA: el detalle de un elemento de la lista (Clase 10 + 6A).
//  BUSCA:      detalle, detail, solo lectura, var sin State, fecha completa,
//              dateStyle full, dismiss, regresar, boton regresar
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GymDetalleView.swift.
//   2. Pega el archivo. Se abre con:
//        NavigationLink { GymDetalleView(entrenamiento: item) } label: { … }
//  NECESITA:   Model/ (EntrenamientoGym, ModelDataGym), Components/FilaDatoGym.swift,
//              Utils/PaletaGym.swift.
//  ⚠️ NO VISTO EN CLASE: ninguno.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GymDetalleView: View {

    // Solo MUESTRA → var simple (sin @State, sin private, sin @Binding).
    // NO lleva NavigationStack: ya viene dentro del de Historial.
    var entrenamiento: EntrenamientoGym

    // Clase 6A: regresar por código.
    @Environment(\.dismiss) private var dismiss

    let paleta = PaletaGym()

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {

                    // ── 1. Ícono grande y nombre ───────────────────
                    Image(systemName: entrenamiento.icono)
                        .font(.system(size: 54))
                        .foregroundStyle(paleta.textoSobrePrimario)
                        .frame(width: 110, height: 110)
                        .background(paleta.primario)
                        .clipShape(.circle)
                        .shadow(color: paleta.primario, radius: 8)

                    Text(entrenamiento.ejercicio)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(paleta.texto)

                    // Fecha completa con dateStyle .full (Clase 3B).
                    Text(entrenamiento.fechaCompletaTexto)
                        .foregroundStyle(paleta.textoSuave)
                        .multilineTextAlignment(.center)

                    if entrenamiento.esRecord {
                        Label("Récord personal", systemImage: "trophy.fill")
                            .font(.headline)
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(paleta.secundario)
                            .cornerRadius(20)
                    }

                    // ── 2. Renglones de datos (componente) ─────────
                    // El id NO se muestra en ninguna parte.
                    VStack(spacing: 0) {
                        FilaDatoGym(icono: "figure.strengthtraining.functional", etiqueta: "Grupo", valor: entrenamiento.grupo)
                        Divider()
                        FilaDatoGym(icono: "tag.fill", etiqueta: "Tipo", valor: entrenamiento.tipo)
                        Divider()
                        FilaDatoGym(icono: "timer", etiqueta: "Minutos", valor: "\(entrenamiento.minutos)")
                        Divider()
                        FilaDatoGym(icono: "repeat", etiqueta: "Series × repeticiones", valor: entrenamiento.seriesTexto)
                        Divider()
                        FilaDatoGym(icono: "scalemass.fill", etiqueta: "Peso", valor: entrenamiento.peso > 0 ? "\(Int(entrenamiento.peso)) kg" : "—")
                        Divider()
                        FilaDatoGym(icono: "gauge.with.dots.needle.50percent", etiqueta: "Intensidad", valor: entrenamiento.intensidad)
                        Divider()
                        FilaDatoGym(icono: "bolt.fill", etiqueta: "Calorías", valor: "\(Int(entrenamiento.calorias)) kcal")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 3. Descripción que da la CLASE del protocolo ──
                    if let ejercicio = buscarEjercicioGym(nombre: entrenamiento.ejercicio) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Cómo hacerlo")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text(ejercicio.descripcionRutina())
                                .foregroundStyle(paleta.textoSuave)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(paleta.superficie)
                        .cornerRadius(16)
                    }

                    // ── 4. Regresar por código ─────────────────────
                    Button {
                        dismiss()
                    } label: {
                        Text("Regresar al historial")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.primario)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(paleta.primario, lineWidth: 2)
                            )
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Detalle")
    }
}

#Preview {
    NavigationStack {
        GymDetalleView(entrenamiento: cargarEntrenamientosEjemploGym()[1])
    }
    .preferredColorScheme(.dark)
}
