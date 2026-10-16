// ═══════════════════════════════════════════════════════════════
//  GastosCalculadoraView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Ahorro": calculadora de cuánto ahorrar. Meta con
//              un Slider, meses con un Stepper e ingreso mensual con un
//              TextField. El botón "Calcular" VALIDA y, si todo está bien,
//              navega a la pantalla de resultado PASÁNDOLE los valores.
//              Es el patrón EXACTO de la Clase 6C.
//  ÚSALO PARA: cualquier "formulario → botón → pantalla de resultado".
//  BUSCA:      6C, navegar con validacion, isValid, navigationDestination,
//              isPresented, boton en vez de NavigationLink, paso de valores,
//              calculadora, ahorro, Slider, Stepper, TextField numero
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/CalculadoraView.swift y pega el archivo.
//   2. Copia también Views/GastosResultadoAhorroView.swift.
//  NECESITA:   Model/GastoApp.swift (textoPesosGastos), Utils/PaletaGastos.swift,
//              Views/GastosResultadoAhorroView.swift
//
//  EL PATRÓN 6C, PASO POR PASO (lámina de la Clase 6C):
//   1. Una variable para decidir si la validación pasa o no:
//        @State private var isValid = false
//   2. Un Button EN LUGAR de un NavigationLink (pero DENTRO de un
//      NavigationStack). En su acción se valida:
//        si algo falla → isValid = false  y  showAlert.toggle()
//        si todo bien  → isValid = true
//   3. Un modificador AL BOTÓN que navega cuando isValid sea true:
//        .navigationDestination(isPresented: $isValid) { OtraPantalla() }
//   La .alert también va pegada al botón.
//
//  DE CLASE: 6C completo, paso de valores de ida (6B), Slider con
//     onEditingChanged (Clase 4), alerta con toggle (Clase 3), teclado (Clase 4).
//  ⚠️ NO VISTO EN CLASE: Stepper (botones − / + para un número), step: del
//     Slider, .keyboardType(.decimalPad).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastosCalculadoraView: View {

    // ── Datos del formulario ────────────────────────────────────
    @State private var meta = 10000.0             // Slider → Double
    @State private var meses = 6                  // Stepper → Int
    @State private var ingresoTexto = ""          // TextField → String

    // Ingreso ya convertido a número (se llena al validar y se le pasa
    // a la pantalla de resultado).
    @State private var ingreso = 0.0

    // ── Patrón 6C ───────────────────────────────────────────────
    @State private var isValid = false            // 1. ¿pasa la validación?
    @State private var showAlert = false
    @State private var mensajeAlerta = ""

    @FocusState private var tecladoActivo: Bool

    let paleta = PaletaGastos()

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {

                        Text("¿Cuánto tengo que ahorrar para llegar a mi meta?")
                            .foregroundStyle(paleta.textoSuave)

                        // ── 1. Meta con Slider ─────────────────
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Meta de ahorro")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text(textoPesosGastos(meta))
                                .font(.title)
                                .bold()
                                .foregroundStyle(paleta.primario)
                            Slider(value: $meta, in: 1000 ... 50000, step: 500,      // ⚠️ step: de 500 en 500
                                   onEditingChanged: { editing in
                                       tecladoActivo = false
                                   })
                            .tint(paleta.primario)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 2. Meses con Stepper ⚠️ ────────────
                        VStack(alignment: .leading, spacing: 8) {
                            Text("¿En cuántos meses?")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            // ⚠️ NO VISTO EN CLASE: Stepper = botones − y + que cambian un número.
                            // in: 1...24 → mínimo 1 mes, máximo 24.
                            Stepper("\(meses) meses", value: $meses, in: 1 ... 24)
                                .foregroundStyle(paleta.texto)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 3. Ingreso con TextField ───────────
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tu ingreso mensual")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            TextField("Ej. 8000", text: $ingresoTexto)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)      // ⚠️
                                .focused($tecladoActivo)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 4. Botón con validación (Clase 6C) ─
                        Button {                               // 2. Button en lugar de NavigationLink
                            tecladoActivo = false
                            let ingresoLimpio = ingresoTexto.replacingOccurrences(of: ",", with: ".")   // ⚠️

                            if ingresoLimpio.isEmpty {
                                isValid = false
                                mensajeAlerta = "Escribe tu ingreso mensual."
                                showAlert.toggle()
                            } else if let numero = Double(ingresoLimpio) {
                                if numero <= 0 {
                                    isValid = false
                                    mensajeAlerta = "El ingreso debe ser mayor a $0."
                                    showAlert.toggle()
                                } else {
                                    ingreso = numero           // ya validado: se guarda para pasarlo
                                    isValid = true             // ← esto dispara la navegación
                                }
                            } else {
                                isValid = false
                                mensajeAlerta = "El ingreso debe ser un número, por ejemplo 8000."
                                showAlert.toggle()
                            }
                        } label: {
                            Text("Calcular")
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
                        // 3. Modificador AL BOTÓN: navega cuando isValid es true.
                        //    Y aquí se PASAN LOS VALORES a la otra pantalla (6B, ida).
                        .navigationDestination(isPresented: $isValid) {
                            GastosResultadoAhorroView(meta: meta, meses: meses, ingreso: ingreso)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Calculadora de ahorro")
            .onTapGesture {
                tecladoActivo = false
            }
        }
    }
}

#Preview {
    GastosCalculadoraView()
}
