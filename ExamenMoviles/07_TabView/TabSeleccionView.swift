// ═══════════════════════════════════════════════════════════════
//  TabSeleccionView.swift  ·  07 TabView
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     TabView que sabe en qué pestaña está (selection + tag).
//              Así un botón puede CAMBIAR de pestaña por código.
//              También pone un numerito rojo (badge) en una pestaña.
//  ÚSALO PARA: "después de guardar, ir a la pestaña Lista",
//              notificaciones sin leer, abrir la app en otra pestaña.
//  BUSCA:      cambiar de pestaña por codigo, selection, tag, badge,
//              numero rojo, notificacion, tabview selection, ir a otra tab
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TabSeleccionView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: TabView(selection:), .tag en pestañas, .badge
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TabSeleccionView: View {

    // Qué pestaña está abierta. El número coincide con el .tag
    @State private var pestana = 1                 // ✏️ pestaña inicial
    @State private var mensajesSinLeer = 3

    var body: some View {
        // ⚠️ NO VISTO EN CLASE: selection liga la pestaña con la variable
        TabView(selection: $pestana) {

            // ── Pestaña 1 ───────────────────────────────────────────
            ZStack {
                Color.blue.opacity(0.12)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Inicio")
                        .font(.largeTitle)
                        .bold()

                    // Cambiar de pestaña = cambiar la variable
                    Button {
                        pestana = 2
                    } label: {
                        Text("Ir a Mensajes")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)

                    Button {
                        pestana = 3
                    } label: {
                        Text("Ir a Ajustes")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                }
                .padding(30)
            }
            .tabItem {
                Label("Inicio", systemImage: "house")
            }
            .tag(1)        // ⚠️ el número que identifica la pestaña

            // ── Pestaña 2 (con badge) ───────────────────────────────
            ZStack {
                Color.red.opacity(0.08)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Mensajes")
                        .font(.largeTitle)
                        .bold()

                    Text("Tienes \(mensajesSinLeer) mensajes sin leer")
                        .font(.title3)

                    Button("Marcar como leídos") {
                        mensajesSinLeer = 0
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)

                    Button("Volver a Inicio") {
                        pestana = 1
                    }
                    .buttonStyle(.bordered)
                }
                .padding(30)
            }
            .tabItem {
                Label("Mensajes", systemImage: "envelope")
            }
            .tag(2)
            // ⚠️ NO VISTO EN CLASE: numerito rojo. Con 0 no se muestra.
            .badge(mensajesSinLeer)

            // ── Pestaña 3 ───────────────────────────────────────────
            ZStack {
                Color.gray.opacity(0.12)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Ajustes")
                        .font(.largeTitle)
                        .bold()

                    Text("Estás en la pestaña \(pestana)")
                        .foregroundStyle(.secondary)
                }
                .padding(30)
            }
            .tabItem {
                Label("Ajustes", systemImage: "gearshape")
            }
            .tag(3)
        }
        .tint(.blue)
    }
}

#Preview {
    TabSeleccionView()
}
