// ═══════════════════════════════════════════════════════════════
//  GastosEditarPresupuestoView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla para cambiar el presupuesto mensual. Recibe el
//              presupuesto con @Binding: lo que cambies aquí se ve al
//              regresar en Perfil, en Resumen y en Estadísticas.
//  ÚSALO PARA: editar un dato de otra pantalla (paso de valores IDA Y VUELTA).
//  BUSCA:      Binding, ida y vuelta, editar dato, modificar en otra
//              pantalla, cambiar valor, Stepper, TextField numero, constant
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/EditarView.swift y pega el archivo.
//   2. Desde la base:  EditarView(presupuesto: $presupuesto)   ← con $
//  NECESITA:   Model/GastoApp.swift (textoPesosGastos), Utils/PaletaGastos.swift
//
//  IDA Y VUELTA (Clase 6B, los 3 pasos de la lámina):
//   1. Aquí (Detalle): una variable que sea @Binding, NO privada y SIN
//      valor inicial:   @Binding var presupuesto: Double
//   2. En la Base: una variable @State private  (está en GastosAppView).
//   3. Al llamar la vista se pasa la @State CON $ :  (presupuesto: $presupuesto)
//   @State = esta vista es DUEÑA del dato. @Binding = esta vista recibe
//   PERMISO para leer y modificar el dato de otra vista.
//
//  DE CLASE: @Binding y .constant(...) en el #Preview (6B), dismiss (6A),
//     alerta (Clase 3), if let para convertir texto (Clase 2).
//  ⚠️ NO VISTO EN CLASE: Stepper con step:, .keyboardType(.decimalPad),
//     .onAppear (para llenar el TextField con el valor actual).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosEditarPresupuestoView: View {

    @Binding var presupuesto: Double          // 1. @Binding, no private, sin valor inicial

    @Environment(\.dismiss) private var dismiss

    @State private var textoPresupuesto = ""
    @State private var showAlert = false
    @State private var mensajeAlerta = ""

    @FocusState private var tecladoActivo: Bool

    let paleta = PaletaGastos()

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 22) {

                    // ── 1. Valor actual (se actualiza en vivo) ─
                    VStack(spacing: 4) {
                        Text("Presupuesto mensual")
                            .foregroundStyle(paleta.textoSuave)
                        Text(textoPesosGastos(presupuesto))
                            .font(.system(size: 40))
                            .bold()
                            .foregroundStyle(paleta.primario)
                    }
                    .frame(maxWidth: .infinity)

                    // ── 2. Cambiarlo con un Stepper ⚠️ ─────────
                    // El Stepper cambia el @Binding DIRECTO: la pantalla base
                    // ya tiene el valor nuevo aunque no presiones nada más.
                    VStack(alignment: .leading, spacing: 8) {
                        Text("De 500 en 500")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        Stepper("Ajustar", value: $presupuesto, in: 0 ... 200000, step: 500)
                            .foregroundStyle(paleta.texto)
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 3. O escribirlo exacto ─────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Escribe una cantidad exacta")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        TextField("Ej. 7500", text: $textoPresupuesto)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)          // ⚠️
                            .focused($tecladoActivo)
                        Button {
                            aplicar()
                        } label: {
                            Text("Aplicar y regresar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(paleta.textoSobrePrimario)
                                .background(paleta.primario)
                                .cornerRadius(14)
                        }
                        .alert(mensajeAlerta, isPresented: $showAlert) {
                            Button("OK") {}
                        }
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    Text("Regresa a Perfil: el presupuesto nuevo ya aparece ahí, en Resumen y en Estadísticas.")
                        .font(.footnote)
                        .foregroundStyle(paleta.textoSuave)
                }
                .padding()
            }
        }
        .navigationTitle("Editar presupuesto")
        .navigationBarTitleDisplayMode(.inline)       // ⚠️ título chico
        .onTapGesture {
            tecladoActivo = false
        }
        // ⚠️ onAppear: al abrir la pantalla, el TextField muestra el valor actual.
        .onAppear {
            textoPresupuesto = String(Int(presupuesto))
        }
    }

    func aplicar() {
        tecladoActivo = false
        let limpio = textoPresupuesto.replacingOccurrences(of: ",", with: ".")   // ⚠️

        if limpio.isEmpty {
            mensajeAlerta = "Escribe una cantidad."
            showAlert.toggle()
        } else if let nuevo = Double(limpio) {
            if nuevo <= 0 {
                mensajeAlerta = "El presupuesto debe ser mayor a $0."
                showAlert.toggle()
            } else {
                presupuesto = nuevo        // cambia el dato de la BASE (por ser @Binding)
                dismiss()
            }
        } else {
            mensajeAlerta = "Escribe solo números, por ejemplo 7500."
            showAlert.toggle()
        }
    }
}

#Preview {
    // En el preview no hay pantalla base que pase el binding:
    // .constant(...) inyecta uno de prueba (lámina de la Clase 6B).
    NavigationStack {
        GastosEditarPresupuestoView(presupuesto: .constant(6000))
    }
}
