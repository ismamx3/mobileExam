// ═══════════════════════════════════════════════════════════════
//  DashboardView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de inicio tipo "dashboard" que junta todo:
//              encabezado con foto, fila de 3 tiles iguales, bloque 2x2,
//              renglones de actividad y botón. Con ScrollView y fondo.
//  ÚSALO PARA: la pantalla Inicio/Home de tu app, un resumen, un perfil.
//  BUSCA:      dashboard, inicio, home, resumen, tablero, pantalla principal, tiles,
//              2x2, renglones, layout completo, plantilla
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/DashboardView.swift.
//   2. Pega el archivo COMPLETO (incluye 3 piezas chiquitas abajo:
//      TileDashboard, TarjetaDashboard y RenglonDashboard).
//   3. Cambia lo marcado con ✏️
//  NECESITA:   imagen "perfil" en Assets. Nada más (no depende de 04_Componentes).
//  ⚠️ NO VISTO EN CLASE: .preferredColorScheme(.light) (lo usaste en Movil2).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct DashboardView: View {

    let colorFondoDashboard = Color(red: 245/255, green: 243/255, blue: 255/255)  // ✏️ fondo
    let colorPrincipalDashboard = Color(red: 91/255, green: 33/255, blue: 182/255) // ✏️ color fuerte

    var body: some View {
        ZStack {
            // Fondo de pantalla completo.
            colorFondoDashboard
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // ── 1. Encabezado: saludo + foto ────────────────────
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Hola, Ismael 👋")                      // ✏️
                                .font(.title)
                                .bold()
                                .foregroundStyle(colorPrincipalDashboard)
                            Text("Este es tu resumen de hoy")           // ✏️
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Image("perfil")                                 // ✏️
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)
                            .clipShape(.circle)
                    }

                    // ── 2. Fila de 3 tiles iguales ──────────────────────
                    HStack(spacing: 12) {
                        TileDashboard(valor: "12", etiqueta: "Tareas", icono: "checklist", color: .purple)     // ✏️
                        TileDashboard(valor: "3", etiqueta: "Pendientes", icono: "clock.fill", color: .orange)
                        TileDashboard(valor: "95", etiqueta: "Promedio", icono: "star.fill", color: .blue)
                    }

                    // ── 3. Bloque 2x2 ───────────────────────────────────
                    Text("Accesos rápidos")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(colorPrincipalDashboard)

                    VStack(spacing: 12) {
                        HStack(spacing: 12) {
                            TarjetaDashboard(titulo: "Calendario", icono: "calendar", color: .purple)      // ✏️
                            TarjetaDashboard(titulo: "Mensajes", icono: "message.fill", color: .indigo)
                        }
                        HStack(spacing: 12) {
                            TarjetaDashboard(titulo: "Gráficas", icono: "chart.bar.fill", color: .blue)
                            TarjetaDashboard(titulo: "Ajustes", icono: "gearshape.fill", color: .gray)
                        }
                    }

                    // ── 4. Renglones de actividad ───────────────────────
                    Text("Actividad reciente")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(colorPrincipalDashboard)

                    VStack(spacing: 0) {
                        RenglonDashboard(icono: "doc.fill", titulo: "Entrega 1", detalle: "Hace 2 h")       // ✏️
                        Divider()
                        RenglonDashboard(icono: "camera.fill", titulo: "Foto subida", detalle: "Ayer")
                        Divider()
                        RenglonDashboard(icono: "person.2.fill", titulo: "Reunión de equipo", detalle: "Lunes")
                    }
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(16)

                    // ── 5. Botón principal ──────────────────────────────
                    Button {
                        // ✏️ acción
                    } label: {
                        Text("Ver todo")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(colorPrincipalDashboard)
                }
                .padding()
            }
        }
        // ⚠️ NO VISTO EN CLASE (lo usaste en tu tarea Movil2): el fondo es
        // claro fijo, así que forzamos modo claro para que los textos
        // .primary no se vuelvan blancos en modo oscuro.
        .preferredColorScheme(.light)
    }
}

// ── Pieza: tile con número grande (mismo ancho que sus vecinos) ─────
struct TileDashboard: View {
    var valor: String
    var etiqueta: String
    var icono: String
    var color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundStyle(color)
            Text(valor)
                .font(.title)
                .bold()
            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity)      // ← así los 3 quedan iguales
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(16)
    }
}

// ── Pieza: cuadro del bloque 2x2 ────────────────────────────────────
struct TarjetaDashboard: View {
    var titulo: String
    var icono: String
    var color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
                .background(color)
                .cornerRadius(12)
            Text(titulo)
                .font(.headline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)   // ← 2 por renglón, iguales
        .background(Color.white)
        .cornerRadius(16)
    }
}

// ── Pieza: renglón ícono + título + detalle ─────────────────────────
struct RenglonDashboard: View {
    var icono: String
    var titulo: String
    var detalle: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icono)
                .foregroundStyle(.purple)
                .frame(width: 28)
            Text(titulo)
            Spacer()
            Text(detalle)
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    DashboardView()
}
