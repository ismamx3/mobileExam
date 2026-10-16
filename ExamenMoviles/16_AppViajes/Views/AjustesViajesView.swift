// ═══════════════════════════════════════════════════════════════
//  AjustesViajesView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Ajustes": resumen de tus viajes (3 tarjetas
//              iguales y presupuesto total) y un botón para volver a ver
//              la bienvenida (cambia el mismo @AppStorage que la raíz).
//  ÚSALO PARA: resúmenes con for (contar, sumar) y preferencias guardadas.
//  BUSCA:      resumen, totales, sumar con for, contar, AppStorage misma llave,
//              ver bienvenida otra vez, ajustes, tarjetas iguales
//
//  CÓMO COPIARLO:
//   1. Views/AjustesViajesView.swift → pega esto.
//  NECESITA:   Model/ViajePlaneado.swift, Components/FilaDatoViajes.swift
//  DE CLASE:   recibe la lista SIN $ porque solo la lee (Clase 6B);
//              @AppStorage con la MISMA llave = el mismo dato guardado
//              (clase de persistencia).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct AjustesViajesView: View {

    var viajes: Array<ViajePlaneado>                 // solo lee → sin @Binding

    // MISMA llave que ViajesAppView: si aquí se pone en false, la raíz
    // vuelve a mostrar la bienvenida (las dos leen el mismo dato guardado).
    @AppStorage("viajesVioOnboarding") private var vioOnboarding = false

    let paleta = PaletaViajes()

    // ── Totales con for (propiedades calculadas) ──
    var viajesRealizados: Int {
        var cuenta = 0
        for viaje in viajes {
            if viaje.yaFui {
                cuenta += 1
            }
        }
        return cuenta
    }

    var totalFotos: Int {
        var total = 0
        for viaje in viajes {
            total += viaje.fotos.count
        }
        return total
    }

    var presupuestoTotal: Double {
        var total = 0.0
        for viaje in viajes {
            total += viaje.presupuesto
        }
        return total
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {

                        // ── 1. Tres tarjetas del mismo ancho ─────
                        HStack(spacing: 12) {
                            tarjetaResumen(numero: "\(viajes.count)", etiqueta: "Viajes", icono: "suitcase.fill")
                            tarjetaResumen(numero: "\(viajesRealizados)", etiqueta: "Ya fui", icono: "checkmark.seal.fill")
                            tarjetaResumen(numero: "\(totalFotos)", etiqueta: "Fotos", icono: "photo.fill")
                        }

                        // ── 2. Presupuesto total en pesos ────────
                        FilaDatoViajes(icono: "dollarsign.circle.fill", etiqueta: "Presupuesto total",
                                       valor: presupuestoTotal.formatted(.currency(code: "MXN")))
                            .padding()
                            .background(paleta.superficie)
                            .cornerRadius(16)

                        // ── 3. Volver a ver la bienvenida ────────
                        Button {
                            vioOnboarding = false
                        } label: {
                            Label("Ver la bienvenida otra vez", systemImage: "arrow.counterclockwise")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(paleta.textoSobrePrimario)
                                .background(paleta.primario)
                                .cornerRadius(14)
                        }
                        Text("La app recuerda si ya viste la bienvenida aunque la cierres (@AppStorage). Este botón lo regresa a false.")
                            .font(.footnote)
                            .foregroundStyle(paleta.textoSuave)

                        // ── 4. Recordatorio de la cámara ─────────
                        VStack(alignment: .leading, spacing: 6) {
                            Label("Cámara", systemImage: "camera.fill")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text("El simulador no tiene cámara: ahí usa la galería. En un iPhone físico la app pide permiso la primera vez.")
                                .font(.footnote)
                                .foregroundStyle(paleta.textoSuave)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(paleta.superficie)
                        .cornerRadius(16)
                    }
                    .padding()
                }
            }
            .navigationTitle("Ajustes")
        }
    }

    // Una tarjeta del resumen. .frame(maxWidth: .infinity) en cada una →
    // las 3 se reparten el ancho por igual.
    func tarjetaResumen(numero: String, etiqueta: String, icono: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .foregroundStyle(paleta.secundario)
            Text(numero)
                .font(.title)
                .bold()
                .foregroundStyle(paleta.primario)
            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(paleta.textoSuave)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(paleta.superficie)
        .cornerRadius(14)
    }
}

#Preview {
    AjustesViajesView(viajes: viajesDeEjemploViajes())
}
