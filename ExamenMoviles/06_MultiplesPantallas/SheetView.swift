// ═══════════════════════════════════════════════════════════════
//  SheetView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Otras formas de mostrar una pantalla SIN NavigationLink:
//              una hoja (.sheet) que sube desde abajo, una sheet que
//              regresa un valor con @Binding, una sheet a media pantalla
//              y una pantalla completa (.fullScreenCover).
//  ÚSALO PARA: ventanas emergentes, elegir una opción, formularios
//              rápidos, la cámara (la clase la abre con .sheet).
//  BUSCA:      sheet, hoja, modal, popup, ventana emergente, fullScreenCover,
//              pantalla completa, presentationDetents, media pantalla,
//              regresar valor, binding, dismiss
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/SheetView.swift (o pega solo el bloque).
//   2. Si copias el bloque 2, copia también el struct
//      SheetSeleccionFrutaView que está al final de este archivo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: .fullScreenCover, .presentationDetents,
//                       ForEach(arreglo, id: \.self)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct SheetView: View {

    @State private var mostrarSheet = false
    @State private var mostrarSeleccion = false
    @State private var mostrarMediana = false
    @State private var mostrarCompleta = false

    @State private var frutaElegida = ""        // lo llena la sheet del bloque 2

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. Sheet básica ─────────────────────────────────
                // Igual que una alerta: Bool + modificador + toggle().
                // Se cierra deslizando hacia abajo.
                Text("1. Sheet básica")
                    .font(.headline)

                Button("Abrir sheet") {
                    mostrarSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .sheet(isPresented: $mostrarSheet) {
                    VStack(spacing: 16) {
                        Image(systemName: "rectangle.bottomhalf.inset.filled")
                            .font(.system(size: 60))
                            .foregroundStyle(.purple)
                        Text("Soy una sheet")                    // ✏️
                            .font(.title)
                            .bold()
                        Text("Desliza hacia abajo para cerrarme.")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                }

                Divider()

                // ── 2. Sheet que REGRESA un valor (@Binding + dismiss) ──
                // Mismo patrón que la cámara: la sheet recibe un $binding
                // y al elegir, lo llena y se cierra.
                Text("2. Sheet que regresa un valor")
                    .font(.headline)

                Text(frutaElegida.isEmpty ? "Aún no eliges fruta" : "Elegiste: \(frutaElegida)")
                    .font(.title3)

                Button("Elegir fruta") {
                    mostrarSeleccion.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .sheet(isPresented: $mostrarSeleccion) {
                    SheetSeleccionFrutaView(frutaElegida: $frutaElegida)
                }

                Divider()

                // ── 3. Sheet a media pantalla ───────────────────────
                Text("3. Sheet a media pantalla")
                    .font(.headline)

                Button("Abrir media sheet") {
                    mostrarMediana.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .sheet(isPresented: $mostrarMediana) {
                    VStack(spacing: 12) {
                        Text("Media pantalla")
                            .font(.title2)
                            .bold()
                        Text("Arrástrala hacia arriba para hacerla grande.")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    // ⚠️ NO VISTO EN CLASE: tamaños que puede tener la sheet
                    .presentationDetents([.medium, .large])
                }

                Divider()

                // ── 4. Pantalla completa ────────────────────────────
                // A diferencia de la sheet, NO se cierra deslizando:
                // necesita un botón que ponga la variable en false.
                Text("4. Pantalla completa")
                    .font(.headline)

                Button("Abrir pantalla completa") {
                    mostrarCompleta.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                // ⚠️ NO VISTO EN CLASE: como .sheet pero cubre toda la pantalla
                .fullScreenCover(isPresented: $mostrarCompleta) {
                    ZStack {
                        Color.indigo
                            .ignoresSafeArea()

                        VStack(spacing: 20) {
                            Text("Pantalla completa")            // ✏️
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)

                            Button("Cerrar") {
                                mostrarCompleta = false
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundStyle(.indigo)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Sheets")
    }
}

// ═══════════════════════════════════════════════════════════════
//  SheetSeleccionFrutaView — el contenido de la sheet del bloque 2.
//  Recibe @Binding: al tocar una fruta la guarda en la pantalla
//  anterior y se cierra con dismiss().
// ═══════════════════════════════════════════════════════════════
struct SheetSeleccionFrutaView: View {

    @Binding var frutaElegida: String

    @Environment(\.dismiss) private var dismiss

    let frutas = ["Manzana", "Plátano", "Fresa", "Mango"]   // ✏️ tus opciones

    var body: some View {
        VStack(spacing: 16) {
            Text("Elige una fruta")
                .font(.title)
                .bold()

            // ⚠️ NO VISTO EN CLASE: ForEach con id: \.self recorre un arreglo
            // de Strings (en clase se vio List con Identifiable).
            ForEach(frutas, id: \.self) { fruta in
                Button {
                    frutaElegida = fruta      // regresa el valor
                    dismiss()                 // y cierra la sheet
                } label: {
                    Text(fruta)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.bordered)
                .tint(.green)
            }
        }
        .padding(30)
    }
}

#Preview {
    NavigationStack {
        SheetView()
    }
}
