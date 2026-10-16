// ═══════════════════════════════════════════════════════════════
//  GastoDetalleView.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El detalle de UN gasto (solo para ver): monto grande,
//              categoría, fecha completa en español, método de pago, y un
//              botón para regresar. Abajo, las formas de mostrar dinero.
//  ÚSALO PARA: cualquier pantalla de detalle de solo lectura.
//  BUSCA:      detalle, detail, paso de valores, ida, var sin State,
//              dismiss, regresar, boton regresar, formato moneda, currency,
//              MXN, pesos, specifier, formatted, fecha completa
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/DetalleView.swift y pega el archivo.
//   2. Llámalo desde la lista:  NavigationLink { GastoDetalleView(gasto: gasto) } label: { … }
//  NECESITA:   Model/GastoApp.swift, Utils/PaletaGastos.swift,
//              Components/GastosFilaDato.swift
//
//  PASO DE VALORES DE IDA (Clase 6B):
//   1. Aquí: una variable que NO es private y NO lleva @State: var gasto.
//   2. En la pantalla anterior: se asigna al llamar la vista:
//        GastoDetalleView(gasto: gasto)
//   Solo de ida: si aquí cambiaras algo, la lista no se enteraría. Para
//   que el cambio regrese se usa @Binding (ver GastosEditarPresupuestoView).
//
//  DE CLASE: @Environment(\.dismiss) + dismiss() para regresar (Clase 6A),
//     DateFormatter con dateStyle (Clase 3B), Text(x, format: .currency)
//     y specifier (Clase 3B).
//  ⚠️ NO VISTO EN CLASE: .locale(...) en el formato de moneda.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GastoDetalleView: View {

    var gasto: GastoApp                       // llega de la lista (paso de valores de ida)

    @Environment(\.dismiss) private var dismiss

    let paleta = PaletaGastos()

    // "jueves, 15 de octubre de 2026" (Clase 3B: dateStyle .full)
    var fechaCompleta: String {
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.full
        formato.timeStyle = DateFormatter.Style.none
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: gasto.fecha)
    }

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    // ── 1. Ícono y monto grande ────────────────
                    Image(systemName: gasto.iconoCategoria)
                        .font(.system(size: 44))
                        .foregroundStyle(paleta.textoSobrePrimario)
                        .frame(width: 96, height: 96)
                        .background(paleta.primario)
                        .clipShape(.circle)
                        .padding(.top, 10)

                    Text(gasto.concepto)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(paleta.texto)
                        .multilineTextAlignment(.center)

                    Text(gasto.montoTexto)
                        .font(.system(size: 44))
                        .bold()
                        .foregroundStyle(paleta.primario)

                    // ── 2. Datos en renglones ──────────────────
                    VStack(spacing: 0) {
                        GastosFilaDato(icono: "tag.fill", etiqueta: "Categoría", valor: gasto.categoria)
                        Divider()
                        GastosFilaDato(icono: "calendar", etiqueta: "Fecha", valor: fechaCompleta)
                        Divider()
                        GastosFilaDato(icono: gasto.metodoPago == "Tarjeta" ? "creditcard.fill" : "banknote.fill",
                                       etiqueta: "Método de pago", valor: gasto.metodoPago)
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 3. Formas de mostrar dinero (Clase 3B) ─
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Formas de mostrar el monto")
                            .font(.headline)
                            .foregroundStyle(paleta.texto)

                        // a) Forma de clase dentro de un Text
                        Text(gasto.monto, format: .currency(code: "MXN"))
                        // b) Forma de clase convertida a String (para interpolar)
                        Text("Gastaste " + gasto.monto.formatted(.currency(code: "MXN")))
                        // c) Con specifier: número con 2 decimales y el signo a mano
                        Text("$\(gasto.monto, specifier: "%.2f") pesos")
                        // d) Número con 2 decimales sin signo
                        Text(gasto.monto, format: .number.precision(.fractionLength(2)))
                        // e) ⚠️ Con .locale: siempre "$" aunque el iPhone esté en inglés
                        Text(gasto.montoTexto)

                        Text("Si el simulador está en inglés, a) y b) salen como \"MX$\". Por eso la app usa e).")
                            .font(.caption)
                            .foregroundStyle(paleta.textoSuave)
                    }
                    .foregroundStyle(paleta.texto)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(16)

                    // ── 4. Regresar por código (Clase 6A) ──────
                    Button {
                        dismiss()
                    } label: {
                        Label("Regresar a la lista", systemImage: "chevron.left")
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
        .navigationBarTitleDisplayMode(.inline)       // ⚠️ título chico
    }
}

#Preview {
    // Es una pantalla empujada: en el preview la metemos en un NavigationStack
    // para que se vea el título, y le pasamos un gasto de prueba.
    NavigationStack {
        GastoDetalleView(gasto: cargarGastosApp()[0])
    }
}
