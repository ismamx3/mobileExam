// ═══════════════════════════════════════════════════════════════
//  DetalleDestinoViajesView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Detalle de un destino: CARRUSEL de fotos dentro de un
//              ScrollView, nombre, estrellas, favorito (corazón que se
//              llena), datos y botón "Planear viaje" que abre una sheet.
//  ÚSALO PARA: detalle de producto/lugar con varias fotos.
//  BUSCA:      carrusel en scrollview, TabView page dentro de ScrollView,
//              frame height carrusel, favorito corazon, detalle con binding,
//              sheet formulario, precio en pesos, currency MXN
//
//  CÓMO COPIARLO:
//   1. Views/DetalleDestinoViajesView.swift → pega esto.
//   2. Desde la lista: NavigationLink { DetalleDestinoViajesView(destino:
//      $destinos[indice], viajes: $viajes) } label: { … }
//  NECESITA:   Model/DestinoViajes.swift, Components (Estrellas, FilaDato),
//              Views/PlanearViajeViajesView.swift
//  DE CLASE:   carrusel (Clase 7), @Binding (Clase 6B), .sheet (Clase 17),
//              .currency(code: "MXN") (Clase 3B).
//  ⚠️ NO VISTO EN CLASE: ForEach dentro del carrusel (una página por foto)
//     y .navigationBarTitleDisplayMode(.inline) (título chico).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct DetalleDestinoViajesView: View {

    // @Binding: el corazón cambia el favorito en la lista de la raíz.
    @Binding var destino: DestinoViajes
    // @Binding: la sheet de planear agrega un viaje a esta lista.
    @Binding var viajes: Array<ViajePlaneado>

    @State private var mostrarPlanear = false

    let paleta = PaletaViajes()

    // Cuántos viajes ya planeaste a este destino (for + if, como en clase).
    var viajesAEsteDestino: Int {
        var cuenta = 0
        for viaje in viajes {
            if viaje.destinoNombre == destino.nombre {
                cuenta += 1
            }
        }
        return cuenta
    }

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // ── 1. Carrusel de fotos (Clase 7) ───────────
                    // OJO: dentro de un ScrollView el TabView NO sabe qué alto
                    // tener (el ScrollView le ofrece alto "infinito") y queda en
                    // alto 0 = INVISIBLE. Por eso SIEMPRE lleva .frame(height:).
                    TabView {
                        // ⚠️ ForEach: una página por cada nombre de imagen.
                        ForEach(destino.imagenes, id: \.self) { nombreImagen in
                            Image(nombreImagen)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 240)
                        }
                    }
                    .tabViewStyle(.page)                                       // carrusel que se desliza
                    .indexViewStyle(.page(backgroundDisplayMode: .always))     // puntitos con fondo
                    .frame(height: 280)                                        // ← OBLIGATORIO en ScrollView
                    .background(paleta.superficie)
                    .cornerRadius(18)

                    // ── 2. Nombre, estado y favorito ─────────────
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(destino.nombre)
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(paleta.texto)
                            Label(destino.estado, systemImage: "mappin.and.ellipse")
                                .foregroundStyle(paleta.textoSuave)
                        }
                        Spacer()
                        // Corazón vacío / lleno (ternario, como en clase).
                        Button {
                            destino.favorito.toggle()
                        } label: {
                            Image(systemName: destino.favorito ? "heart.fill" : "heart")
                                .font(.largeTitle)
                                .foregroundStyle(Color.red)
                        }
                    }

                    EstrellasViajes(calificacion: destino.calificacion)

                    Text(destino.descripcion)
                        .foregroundStyle(paleta.texto)

                    // ── 3. Datos del destino ─────────────────────
                    VStack(spacing: 14) {
                        FilaDatoViajes(icono: destino.iconoCategoria, etiqueta: "Categoría", valor: destino.categoria)
                        Divider()
                        FilaDatoViajes(icono: "thermometer.medium", etiqueta: "Clima", valor: destino.clima)
                        Divider()
                        // .formatted(.currency(code: "MXN")) → "$2,200.00" (Clase 3B)
                        FilaDatoViajes(icono: "dollarsign.circle.fill",
                                       etiqueta: "Costo por persona al día",
                                       valor: destino.costoAproximado.formatted(.currency(code: "MXN")))
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 4. Botón que abre la sheet para planear ──
                    Button {
                        mostrarPlanear = true
                    } label: {
                        Label("Planear viaje", systemImage: "airplane.departure")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .background(paleta.primario)
                            .cornerRadius(14)
                    }

                    if viajesAEsteDestino > 0 {
                        Text(viajesAEsteDestino == 1
                             ? "Ya tienes 1 viaje planeado aquí. Míralo en Mis viajes."
                             : "Ya tienes \(viajesAEsteDestino) viajes planeados aquí. Míralos en Mis viajes.")
                            .font(.footnote)
                            .foregroundStyle(paleta.secundario)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(destino.nombre)
        .navigationBarTitleDisplayMode(.inline)                  // ⚠️ título chico
        // .sheet (Clase 17): la hoja recibe el destino (solo lo lee) y el
        // binding de viajes (para hacer append).
        .sheet(isPresented: $mostrarPlanear) {
            PlanearViajeViajesView(destino: destino, viajes: $viajes)
        }
    }
}

#Preview {
    NavigationStack {
        DetalleDestinoViajesView(destino: .constant(destinoDePruebaViajes()), viajes: .constant(viajesDeEjemploViajes()))
    }
}
