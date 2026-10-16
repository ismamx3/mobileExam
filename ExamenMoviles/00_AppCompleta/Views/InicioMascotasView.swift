// ═══════════════════════════════════════════════════════════════
//  InicioMascotasView.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla de inicio: encabezado con foto y saludo,
//              3 tarjetas iguales con totales calculados, lista de
//              pendientes y un botón que cambia de pestaña.
//  ÚSALO PARA: "Home" / dashboard de tu app.
//  BUSCA:      inicio, home, dashboard, encabezado, header, saludo,
//              totales, promedio, contar con for, tarjetas iguales,
//              ForEach, AppStorage leer
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/InicioMascotasView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   Model/Mascota.swift, Utils/PaletaMascotas.swift,
//              Components/TarjetaResumenMascotas.swift, MascotaRow.swift,
//              BotonPrincipalMascotas.swift, imagen "mascota" en Assets.
//  ⚠️ NO VISTO EN CLASE: ForEach (bloque 3). Si no lo quieres, quita la
//     lista de pendientes y deja solo las tarjetas.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct InicioMascotasView: View {

    // Solo lee la lista → valor simple (sin @Binding).
    var mascotas: Array<Mascota>

    // Para el botón que cambia a la pestaña de Mascotas.
    @Binding var pestanaSeleccionada: Int

    // Misma llave que en PerfilDuenoView → comparten el valor guardado.
    @AppStorage("nombreDueno") private var nombreDueno = ""

    // ── Cálculos (propiedades calculadas con for) ───────────────
    var totalVacunadas: Int {
        var cuenta = 0
        for mascota in mascotas {
            if mascota.vacunada {
                cuenta += 1
            }
        }
        return cuenta
    }

    var pesoPromedio: Double {
        if mascotas.isEmpty {
            return 0          // evita dividir entre 0
        }
        var suma = 0.0
        for mascota in mascotas {
            suma += mascota.peso
        }
        return suma / Double(mascotas.count)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo de pantalla completa (opción 1 de clase).
                paletaFondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {

                        // ── 1. Encabezado con foto y saludo ─────────
                        VStack(spacing: 10) {
                            // Forma de clase: resizable + .fit + frame (Clase 3)
                            // y círculo con borde y sombra (Clase 5A).
                            Image("mascota")                                    // ✏️ tu asset
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 130)
                                .clipShape(.circle)
                                .overlay {
                                    Circle().stroke(paletaPrimario, lineWidth: 4)
                                }
                                .shadow(color: paletaPrimario.opacity(0.4), radius: 8)

                            if nombreDueno.isEmpty {
                                Text("¡Hola!")                                  // ✏️
                                    .font(.title)
                                    .bold()
                                    .foregroundStyle(paletaTexto)
                            } else {
                                Text("¡Hola, \(nombreDueno)!")                  // ✏️
                                    .font(.title)
                                    .bold()
                                    .foregroundStyle(paletaTexto)
                            }

                            Text("Así van tus mascotas hoy")                    // ✏️
                                .font(.subheadline)
                                .foregroundStyle(paletaTextoSuave)
                        }
                        .padding(.top, 8)

                        // ── 2. Tres tarjetas del MISMO ancho ────────
                        HStack(spacing: 12) {
                            TarjetaResumenMascotas(
                                numero: "\(mascotas.count)",
                                etiqueta: "Mascotas",
                                icono: "pawprint.fill")
                            TarjetaResumenMascotas(
                                numero: "\(totalVacunadas)",
                                etiqueta: "Vacunadas",
                                icono: "checkmark.seal.fill")
                            TarjetaResumenMascotas(
                                numero: pesoPromedio.formatted(.number.precision(.fractionLength(1))),
                                etiqueta: "Kg promedio",
                                icono: "scalemass.fill")
                        }

                        // ── 3. Lista filtrada: pendientes de vacuna ─
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Pendientes de vacuna")                        // ✏️
                                .font(.title3)
                                .bold()
                                .foregroundStyle(paletaTexto)

                            if totalVacunadas == mascotas.count {
                                Text("Todas tus mascotas están vacunadas. 🎉")
                                    .foregroundStyle(paletaTextoSuave)
                                    .padding(.vertical, 8)
                            } else {
                                // ⚠️ NO VISTO EN CLASE: ForEach (en clase se usa List).
                                // Aquí va ForEach porque ya estamos dentro de un
                                // ScrollView; el if filtra las que faltan.
                                ForEach(mascotas) { mascota in
                                    if !mascota.vacunada {
                                        MascotaRow(mascota: mascota)
                                        Divider()
                                    }
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(paletaSuperficie)
                        .cornerRadius(16)

                        // ── 4. Botón que cambia de pestaña ──────────
                        BotonPrincipalMascotas(titulo: "Ver mis mascotas", icono: "list.bullet") {
                            pestanaSeleccionada = 2      // el .tag de la pestaña Mascotas
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Mis Mascotas")                                    // ✏️
        }
    }
}

#Preview {
    InicioMascotasView(mascotas: cargarMascotas(), pestanaSeleccionada: .constant(1))
}
