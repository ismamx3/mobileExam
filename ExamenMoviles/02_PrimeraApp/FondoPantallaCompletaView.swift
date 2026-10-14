// ═══════════════════════════════════════════════════════════════
//  FondoPantallaCompletaView.swift  ·  02 Mi primera app
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Las DOS formas de clase de pintar el fondo de TODA la
//              pantalla (incluye la zona de la hora y la de abajo).
//              Cada opción es una pantalla distinta en este archivo:
//                · FondoCompletoZStackView      → OPCIÓN 1 (ZStack)
//                · FondoCompletoBackgroundView  → OPCIÓN 2 (.background)
//  ÚSALO PARA: cualquier pantalla de tu app (se califica que el fondo
//              cubra toda la pantalla).
//  BUSCA:      fondo, background, pantalla completa, ignoresSafeArea,
//              safe area, zstack fondo, color de fondo, full screen
//
//  CÓMO COPIARLO:
//   1. Elige UNA opción. Copia solo su struct.
//   2. Pon tu interfaz donde dice "tu interfaz va aquí".
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// ── OPCIÓN 1: ZStack principal ───────────────────────────────
// El Color va primero (hasta atrás) y se estira con ignoresSafeArea.
// Encima va tu interfaz, que SÍ respeta el área segura.
struct FondoCompletoZStackView: View {
    var body: some View {
        ZStack {
            Color.purple                         // ✏️ tu color de fondo
                .ignoresSafeArea()

            // ── tu interfaz va aquí ──
            VStack(spacing: 16) {
                Image(systemName: "square.stack.3d.down.forward.fill")
                    .font(.system(size: 60))
                Text("Opción 1")
                    .font(.largeTitle)
                    .bold()
                Text("ZStack { Color.ignoresSafeArea() ... }")
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(.white)
            .padding()
        }
    }
}

// ── OPCIÓN 2: .background al VStack principal ────────────────
// El VStack se estira a toda la pantalla con frame(maxWidth/maxHeight)
// y luego se le pone el fondo.
struct FondoCompletoBackgroundView: View {
    var body: some View {
        VStack(spacing: 16) {
            // ── tu interfaz va aquí ──
            Image(systemName: "paintbrush.fill")
                .font(.system(size: 60))
            Text("Opción 2")
                .font(.largeTitle)
                .bold()
            Text("VStack { ... }\n.frame(maxWidth: .infinity, maxHeight: .infinity)\n.background(Color)\n.ignoresSafeArea()")
                .multilineTextAlignment(.center)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)                  // ✏️ tu color de fondo
        .ignoresSafeArea()
    }
}

#Preview("Opción 1 · ZStack") {
    FondoCompletoZStackView()
}

#Preview("Opción 2 · background") {
    FondoCompletoBackgroundView()
}
