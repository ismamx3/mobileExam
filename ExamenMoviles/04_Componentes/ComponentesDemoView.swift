// ═══════════════════════════════════════════════════════════════
//  ComponentesDemoView.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Una pantalla de perfil armada SOLO con los componentes de
//              04_Componentes/Components. Muestra cómo se combinan.
//  ÚSALO PARA: ver cómo una pantalla queda corta y limpia cuando cada
//              pieza vive en su propio archivo (encapsulada y reutilizable).
//  BUSCA:      demo componentes, perfil, combinar componentes, reutilizar, pantalla completa
//
//  CÓMO COPIARLO:
//   1. Copia primero los componentes que uses a tu carpeta Components/.
//   2. En tu proyecto crea Views/ComponentesDemoView.swift y pega este archivo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   04_Componentes/Components/  →  TarjetaInfo, BotonGrande,
//              ImagenCircular, EncabezadoPantalla, FilaDato, EtiquetaChip,
//              TileEstadistica, CampoConEtiqueta, EstrellasRating
//              + imagen "perfil" en Assets.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ComponentesDemoView: View {

    // Esta vista es la DUEÑA de los datos (@State). Se los presta a los
    // componentes: con $ al que los modifica (CampoConEtiqueta) y sin $ a
    // los que solo los muestran (TileEstadistica, FilaDato…).
    @State private var nombre: String = ""
    @State private var toques: Int = 0
    @State private var showAlert = false

    var body: some View {
        ZStack {
            // Fondo de pantalla completo.
            Color.purple.opacity(0.06)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {

                    // ── 1. Encabezado + imagen circular ─────────────────
                    EncabezadoPantalla(titulo: "Mi perfil", subtitulo: "Pantalla hecha solo con componentes", icono: "person.crop.circle") // ✏️

                    ImagenCircular(nombreImagen: "perfil", tamano: 120, colorBorde: .purple) // ✏️

                    // ── 2. Chips + estrellas ────────────────────────────
                    HStack {
                        EtiquetaChip(texto: "iOS")
                        EtiquetaChip(texto: "SwiftUI", color: .indigo)
                        EtiquetaChip(texto: "Tec", color: .blue)
                    }

                    EstrellasRating(calificacion: 4.5)

                    // ── 3. Tiles iguales en fila ────────────────────────
                    HStack(spacing: 12) {
                        TileEstadistica(valor: "\(toques)", etiqueta: "Toques", icono: "hand.tap.fill")
                        TileEstadistica(valor: "4.5", etiqueta: "Rating", icono: "star.fill", color: .orange)
                        TileEstadistica(valor: "12", etiqueta: "Fotos", icono: "photo.fill", color: .blue)
                    }

                    // ── 4. Tarjetas ─────────────────────────────────────
                    TarjetaInfo(icono: "book.fill", titulo: "Tareas", subtitulo: "3 pendientes", color: .purple)
                    TarjetaInfo(icono: "calendar", titulo: "Examen final", subtitulo: "Viernes 16 de octubre", color: .indigo)

                    // ── 5. Filas etiqueta / valor ───────────────────────
                    VStack(spacing: 0) {
                        FilaDato(etiqueta: "Carrera", valor: "ITC")
                        Divider()
                        FilaDato(etiqueta: "Semestre", valor: "5to")
                        Divider()
                        FilaDato(etiqueta: "Nombre escrito", valor: nombre.isEmpty ? "—" : nombre)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    // ── 6. Campo que modifica el @State de esta vista ───
                    CampoConEtiqueta(etiqueta: "Tu nombre", placeholder: "Escribe tu nombre", texto: $nombre)

                    // ── 7. Botones con acción ───────────────────────────
                    BotonGrande(titulo: "Sumar toque", icono: "plus.circle.fill", color: .purple) {
                        toques += 1
                    }

                    BotonGrande(titulo: "Saludar", icono: "hand.wave.fill", color: .indigo, accion: saludar)
                }
                .padding()
            }
        }
        .alert(nombre.isEmpty ? "Escribe tu nombre primero" : "¡Hola, \(nombre)!", isPresented: $showAlert) {
            Button("OK") {}
        }
    }

    // Función que se manda al BotonGrande por nombre (forma b).
    func saludar() {
        showAlert.toggle()
    }
}

#Preview {
    ComponentesDemoView()
}
