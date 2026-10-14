// ═══════════════════════════════════════════════════════════════
//  PickersDependientesView.swift  ·  03 Elementos UI
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Dos Pickers donde las opciones del segundo dependen
//              del primero (país → ciudad). Con .onChange se borra la
//              ciudad cuando cambia el país.
//  ÚSALO PARA: categoría → producto, estado → municipio, marca → modelo.
//  BUSCA:      picker dependiente, cascada, onchange, oldvalue, newvalue,
//              resetear seleccion, pais, ciudad, opciones que cambian
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PickersDependientesView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (países, ciudades y textos).
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: nada.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PickersDependientesView: View {

    let paises = ["México", "España", "Argentina"]       // ✏️ opciones del primer Picker

    @State private var pais: String = ""
    @State private var ciudad: String = ""
    @State private var ultimoCambio: String = ""

    // Las opciones del segundo Picker se calculan según el país elegido
    var ciudadesDelPais: [String] {
        if pais == "México" {
            return ["Monterrey", "CDMX", "Guadalajara"]   // ✏️
        } else if pais == "España" {
            return ["Madrid", "Barcelona", "Sevilla"]     // ✏️
        } else if pais == "Argentina" {
            return ["Buenos Aires", "Córdoba", "Rosario"] // ✏️
        } else {
            return []
        }
    }

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // ── 1. Primer Picker (país) ─────────────────
                    Text("1. Elige un país")
                        .font(.headline)

                    Picker(selection: $pais, label: Text("País")) {
                        Text("Selecciona…").tag("")
                        ForEach(paises, id: \.self) { opcion in
                            Text(opcion).tag(opcion)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: pais) { oldValue, newValue in
                        // Si cambia el país, la ciudad anterior ya no existe en la lista nueva.
                        // Se resetea para que el Picker no apunte a un tag que no existe.
                        ciudad = ""
                        ultimoCambio = "Cambiaste de \(oldValue == "" ? "nada" : oldValue) a \(newValue)"
                    }

                    if ultimoCambio != "" {
                        Text(ultimoCambio)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                    // ── 2. Segundo Picker (ciudad) ──────────────
                    Text("2. Elige una ciudad")
                        .font(.headline)

                    if pais == "" {
                        Text("Primero elige un país")
                            .foregroundStyle(.gray)
                    } else {
                        Picker(selection: $ciudad, label: Text("Ciudad")) {
                            Text("Selecciona…").tag("")
                            ForEach(ciudadesDelPais, id: \.self) { opcion in
                                Text(opcion).tag(opcion)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 140)
                        .background(Color.white)
                        .cornerRadius(12)
                    }

                    // ── 3. Resultado ────────────────────────────
                    Text("3. Resultado")
                        .font(.headline)

                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.title)
                            .foregroundStyle(.purple)

                        if ciudad == "" {
                            Text("Sin ciudad elegida")
                                .foregroundStyle(.gray)
                        } else {
                            Text("\(ciudad), \(pais)")
                                .font(.title3)
                                .bold()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Pickers dependientes")
    }
}

#Preview {
    NavigationStack {
        PickersDependientesView()
    }
}
