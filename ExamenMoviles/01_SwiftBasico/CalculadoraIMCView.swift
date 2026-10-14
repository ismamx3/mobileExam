// ═══════════════════════════════════════════════════════════════
//  CalculadoraIMCView.swift  ·  01 Swift básico (ejemplo de examen)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla completa tipo examen: el usuario escribe peso
//              y estatura, se valida con alertas, se convierte a
//              Double con if let, se calcula el IMC, se clasifica con
//              switch por rangos y se pinta de un color según el resultado.
//  ÚSALO PARA: cualquier "calculadora": IMC, propina, promedio,
//              conversión de moneda, descuento, etc. Solo cambia la
//              fórmula y los textos.
//  BUSCA:      calculadora, imc, formulario, validar, validacion,
//              TextField numero, Double(texto), alerta, alert, resultado,
//              switch rangos, color segun resultado, teclado, FocusState,
//              ocultar teclado, limpiar, calcular
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/CalculadoraIMCView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (textos, fórmula, rangos).
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: .keyboardType(.decimalPad)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct CalculadoraIMCView: View {

    @State private var pesoTexto = ""
    @State private var estaturaTexto = ""

    // nil = todavía no se calcula. Así no inventamos un valor como 0 o -1.
    @State private var imc: Double? = nil
    @State private var clasificacion = ""

    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool       // para esconder el teclado

    var body: some View {
        ZStack {
            Color.teal.opacity(0.08)                    // ✏️ color de fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    // ── 1. Encabezado ────────────────────────────
                    VStack(spacing: 8) {
                        Image(systemName: "heart.text.square.fill")     // ✏️ ícono
                            .font(.system(size: 60))
                            .foregroundStyle(.teal)
                        Text("Calculadora de IMC")                       // ✏️ título
                            .font(.largeTitle)
                            .bold()
                        Text("Índice de Masa Corporal")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top, 10)

                    // ── 2. Campos de captura ─────────────────────
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Peso (kg)")                                // ✏️ etiqueta
                            .font(.headline)
                        TextField("Ej. 70", text: $pesoTexto)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)    // ⚠️ NO VISTO EN CLASE: teclado numérico
                            .focused($campoEnFoco)

                        Text("Estatura (m)")                             // ✏️ etiqueta
                            .font(.headline)
                        TextField("Ej. 1.75", text: $estaturaTexto)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                            .focused($campoEnFoco)
                    }
                    .padding()
                    .background(Color.teal.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    // ── 3. Botones ───────────────────────────────
                    Button {
                        calcularIMC()
                    } label: {
                        Text("Calcular")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.teal)
                    .controlSize(.large)

                    Button("Limpiar") {
                        limpiar()
                    }
                    .buttonStyle(.bordered)
                    .tint(.gray)

                    // ── 4. Resultado (solo si ya se calculó) ─────
                    if let imcCalculado = imc {
                        VStack(spacing: 8) {
                            Text("Tu IMC es")
                                .foregroundStyle(.secondary)
                            Text("\(imcCalculado, specifier: "%.1f")")
                                .font(.system(size: 56))
                                .bold()
                                .foregroundStyle(colorParaIMC(valor: imcCalculado))
                            Text(clasificacion)
                                .font(.title2)
                                .bold()
                                .padding(.horizontal, 16)
                                .padding(.vertical, 6)
                                .background(colorParaIMC(valor: imcCalculado).opacity(0.2))
                                .clipShape(Capsule())
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.teal.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding()
            }
        }
        .onTapGesture {
            campoEnFoco = false                         // tocar fuera esconde el teclado
        }
        .navigationTitle("IMC")
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }

    // ── Validar, convertir y calcular ────────────────
    func calcularIMC() {
        campoEnFoco = false

        // Un mensaje ESPECÍFICO por cada dato que falta (se califica)
        if pesoTexto.isEmpty {
            alertMessage = "Escribe tu peso en kilos"
            showAlert.toggle()
        } else if estaturaTexto.isEmpty {
            alertMessage = "Escribe tu estatura en metros"
            showAlert.toggle()
        } else if let peso = Double(pesoTexto), let estatura = Double(estaturaTexto) {
            // Dentro de este if, peso y estatura ya son Double normales
            if peso <= 0 || estatura <= 0 {
                alertMessage = "El peso y la estatura deben ser mayores a 0"
                showAlert.toggle()
            } else if estatura > 3 {
                alertMessage = "La estatura va en metros, por ejemplo 1.75"
                showAlert.toggle()
            } else {
                let resultado = peso / (estatura * estatura)      // ✏️ tu fórmula
                imc = resultado
                clasificacion = clasificarIMC(valor: resultado)
            }
        } else {
            alertMessage = "Escribe solo números. Usa punto para decimales (ej. 1.75)"
            showAlert.toggle()
        }
    }

    // ── switch por rangos ────────────────────────────
    func clasificarIMC(valor: Double) -> String {
        switch valor {
        case 0..<18.5:                    // ✏️ tus rangos
            return "Bajo peso"
        case 18.5..<25:
            return "Peso normal"
        case 25..<30:
            return "Sobrepeso"
        default:
            return "Obesidad"
        }
    }

    // ── Color según el resultado ─────────────────────
    func colorParaIMC(valor: Double) -> Color {
        switch valor {
        case 0..<18.5:
            return .blue
        case 18.5..<25:
            return .green
        case 25..<30:
            return .orange
        default:
            return .red
        }
    }

    func limpiar() {
        pesoTexto = ""
        estaturaTexto = ""
        imc = nil
        clasificacion = ""
    }
}

#Preview {
    NavigationStack {
        CalculadoraIMCView()
    }
}
