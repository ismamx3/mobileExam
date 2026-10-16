// ═══════════════════════════════════════════════════════════════
//  GastoAgregarView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Hoja (sheet) para registrar un gasto: concepto, monto
//              (texto → número), categoría (Picker con opción vacía),
//              método de pago (segmented) y fecha (DatePicker). Valida
//              campo por campo con un mensaje específico, agrega el gasto
//              a la lista (append) y se cierra (dismiss).
//  ÚSALO PARA: cualquier formulario de alta con dinero y fecha.
//  BUSCA:      agregar, formulario, alta, nuevo gasto, validar monto,
//              texto a numero, Double(texto), coma decimal, negativo, cero,
//              decimalPad, DatePicker, fecha, Picker vacio, segmented,
//              append, id nuevo, dismiss, sheet
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/AgregarView.swift y pega el archivo.
//   2. Ábrelo desde la lista con:
//        .sheet(isPresented: $mostrarAgregar) { GastoAgregarView(gastos: $gastos) }
//  NECESITA:   Model/GastoApp.swift, Model/ModelDataGastos.swift
//              (categoriasGastos, metodosPagoGastos), Utils/PaletaGastos.swift
//
//  TEXTO → NÚMERO (lo más preguntado):
//   Un TextField SIEMPRE da un String, aunque escriban números. Para
//   convertirlo:  if let monto = Double(montoLimpio) { … }
//   Double("12.5") da 12.5, pero Double("12,5") y Double("abc") dan nil
//   (por eso es opcional y se desempaca con if let, nunca con !).
//   Si el teclado del iPhone pone coma decimal, se cambia por punto antes.
//
//  DE CLASE: alerta con mensaje dinámico + toggle (Clase 3),
//     Picker(selection:label:) con .tag y opción vacía, .segmented (Clase 4),
//     @FocusState + .onTapGesture en el Stack principal (Clase 4),
//     @Binding de la lista + dismiss() (Clases 6B y 6A), if let (Clase 2).
//  ⚠️ NO VISTO EN CLASE: DatePicker, .keyboardType(.decimalPad),
//     .replacingOccurrences(of:with:), .trimmingCharacters, ForEach en el Picker,
//     .environment(\.locale, …) (DatePicker en español).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastoAgregarView: View {

    @Binding var gastos: Array<GastoApp>     // la lista REAL: aquí se hace el append

    @Environment(\.dismiss) private var dismiss

    // ── Campos (todos @State: el usuario los cambia) ────────────
    @State private var concepto = ""
    @State private var montoTexto = ""               // texto: luego se convierte a Double
    @State private var categoria = ""                // "" = no ha elegido
    @State private var metodoPago = "Efectivo"
    @State private var fecha = Date()                // empieza en HOY

    @State private var showAlert = false
    @State private var mensajeAlerta = ""

    @FocusState private var tecladoActivo: Bool

    let paleta = PaletaGastos()

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // ── 1. Encabezado con Cancelar ─────────────
                    HStack {
                        Text("Nuevo gasto")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(paleta.texto)
                        Spacer()
                        Button("Cancelar") {
                            dismiss()
                        }
                        .foregroundStyle(paleta.primario)
                    }

                    // ── 2. Concepto ────────────────────────────
                    Text("Concepto")
                        .font(.headline)
                        .foregroundStyle(paleta.texto)
                    TextField("Ej. Tacos con amigos", text: $concepto)          // ✏️
                        .textFieldStyle(.roundedBorder)
                        .focused($tecladoActivo)

                    // ── 3. Monto (texto que luego es número) ───
                    Text("Monto en pesos")
                        .font(.headline)
                        .foregroundStyle(paleta.texto)
                    TextField("Ej. 150.50", text: $montoTexto)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)        // ⚠️ teclado de números con punto
                        .focused($tecladoActivo)

                    // ── 4. Categoría: Picker con opción vacía ──
                    HStack {
                        Text("Categoría")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)
                        Spacer()
                        Picker(selection: $categoria, label: Text("Categoría")) {
                            Text("Selecciona…").tag("")                // tag vacío = no ha elegido
                            ForEach(categoriasGastos, id: \.self) { opcion in   // ⚠️ ForEach
                                Text(opcion).tag(opcion)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(paleta.primario)
                    }

                    // ── 5. Método de pago: segmented (2 opciones) ──
                    Text("Método de pago")
                        .font(.headline)
                        .foregroundStyle(paleta.texto)
                    Picker(selection: $metodoPago, label: Text("Método de pago")) {
                        Text("Efectivo").tag("Efectivo")
                        Text("Tarjeta").tag("Tarjeta")
                    }
                    .pickerStyle(.segmented)

                    // ── 6. Fecha ⚠️ DatePicker ─────────────────
                    // in: ...Date() = solo deja elegir HOY o antes (un gasto no
                    // puede ser del futuro). displayedComponents: .date = sin hora.
                    DatePicker("Fecha", selection: $fecha, in: ...Date(), displayedComponents: .date)
                        .font(.headline)
                        .foregroundStyle(paleta.texto)
                        .tint(paleta.primario)
                        .environment(\.locale, Locale(identifier: "es_MX"))   // ⚠️ meses en español

                    // ── 7. Guardar ─────────────────────────────
                    Button {
                        guardarGasto()
                    } label: {
                        Text("Guardar gasto")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .background(paleta.primario)
                            .cornerRadius(14)
                    }
                    .padding(.top, 8)
                    .alert(mensajeAlerta, isPresented: $showAlert) {
                        Button("OK") {}
                    }
                }
                .padding()
            }
        }
        // Clase 4: el .onTapGesture va en el Stack PRINCIPAL.
        .onTapGesture {
            tecladoActivo = false
        }
    }

    // El siguiente id = el mayor id que existe + 1 (así nunca se repite,
    // aunque se hayan borrado gastos).
    func siguienteId() -> Int {
        var mayor = 0
        for gasto in gastos {
            if gasto.id > mayor {
                mayor = gasto.id
            }
        }
        return mayor + 1
    }

    // Valida EN ORDEN (cadena de else if): el primer error que encuentre
    // es el que se avisa, con su mensaje específico.
    func guardarGasto() {
        tecladoActivo = false

        // ⚠️ quita espacios del inicio y del final ("  " cuenta como vacío)
        let conceptoLimpio = concepto.trimmingCharacters(in: .whitespaces)
        // ⚠️ "12,5" → "12.5": Double() solo entiende el punto decimal
        let montoLimpio = montoTexto.replacingOccurrences(of: ",", with: ".")

        if conceptoLimpio.isEmpty {
            mensajeAlerta = "Escribe en qué gastaste."
            showAlert.toggle()
        } else if montoLimpio.isEmpty {
            mensajeAlerta = "Escribe el monto."
            showAlert.toggle()
        } else if let monto = Double(montoLimpio) {
            // Aquí monto YA es Double (no opcional).
            if monto <= 0 {
                mensajeAlerta = "El monto debe ser mayor a $0."
                showAlert.toggle()
            } else if monto > 100000 {
                mensajeAlerta = "El monto parece demasiado grande. Revísalo."       // ✏️ límite
                showAlert.toggle()
            } else if categoria.isEmpty {
                mensajeAlerta = "Elige una categoría."
                showAlert.toggle()
            } else {
                // Todo bien → se agrega a la lista real y se cierra la hoja.
                let nuevo = GastoApp(id: siguienteId(), concepto: conceptoLimpio, monto: monto,
                                     categoria: categoria, fecha: fecha, metodoPago: metodoPago)
                gastos.append(nuevo)
                dismiss()
            }
        } else {
            // Double(...) dio nil: escribieron letras o símbolos.
            mensajeAlerta = "El monto debe ser un número, por ejemplo 150.50"
            showAlert.toggle()
        }
    }
}

#Preview {
    GastoAgregarView(gastos: .constant(cargarGastosApp()))
}
