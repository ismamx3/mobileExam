// ═══════════════════════════════════════════════════════════════
//  DetalleMascotaView.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Detalle de UNA mascota que además la EDITA.
//              Recibe la mascota con @Binding: cualquier cambio aquí
//              (nombre, vacunada, edad, peso) se ve solo en la lista
//              al regresar, sin código extra.
//  ÚSALO PARA: pantalla de detalle / edición de un elemento.
//  BUSCA:      detalle, detail, editar, binding, @Binding, Toggle,
//              Slider, Stepper, dismiss, regresar, ficha, foto grande
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/DetalleMascotaView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   Model/Mascota.swift, Utils/PaletaMascotas.swift,
//              Components/FotoMascotaView.swift, FilaDatoMascota.swift,
//              BotonPrincipalMascotas.swift
//  DE CLASE: @Binding (6B), @Environment(\.dismiss) + dismiss() (6A),
//     .constant(...) en el #Preview (6B).
//  ⚠️ NO VISTO EN CLASE: Stepper (botones − / + para la edad).
//     Si no lo quieres, usa un Slider como el del peso.
//  ⚠️ NO VISTO EN CLASE: step: en el Slider.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct DetalleMascotaView: View {

    // @Binding = recibe PERMISO para leer y modificar la mascota de la lista.
    @Binding var mascota: Mascota

    // Para regresar por código (además de la flecha nativa).
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    // ── 1. Foto grande + nombre + chip ──────────────
                    FotoMascotaView(mascota: mascota, tamano: 170)
                        .padding(.top, 10)

                    Text(mascota.nombre)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(paletaTexto)
                        .multilineTextAlignment(.center)

                    Label(mascota.especie, systemImage: mascota.iconoEspecie)
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(paletaTexto)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(paletaPrimarioClaro)
                        .cornerRadius(50)       // radio grande = forma de cápsula (Clase 17 usa .cornerRadius)

                    // ── 2. Ficha de datos (renglones etiqueta-valor) ─
                    VStack(spacing: 0) {
                        FilaDatoMascota(icono: "pawprint", titulo: "Especie", valor: mascota.especie)
                        Divider()
                        FilaDatoMascota(icono: "birthday.cake", titulo: "Edad", valor: mascota.textoEdad)
                        Divider()
                        FilaDatoMascota(
                            icono: "scalemass",
                            titulo: "Peso",
                            valor: mascota.peso.formatted(.number.precision(.fractionLength(1))) + " kg")
                        Divider()
                        FilaDatoMascota(
                            icono: "cross.case",
                            titulo: "Vacunas",
                            valor: mascota.vacunada ? "Al día" : "Pendientes")
                    }
                    .padding()
                    .background(paletaSuperficie)
                    .cornerRadius(16)

                    // ── 3. Controles que MODIFICAN la mascota ───────
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Editar")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(paletaTexto)

                        Text("Nombre")
                            .font(.subheadline)
                            .foregroundStyle(paletaTextoSuave)
                        // $mascota.nombre: binding a UN campo de la mascota.
                        TextField("Nombre", text: $mascota.nombre)
                            .textFieldStyle(.roundedBorder)

                        Toggle(isOn: $mascota.vacunada) {
                            Label("Vacunada", systemImage: mascota.vacunada ? "checkmark.seal.fill" : "seal")
                                .foregroundStyle(paletaTexto)
                        }
                        .tint(paletaPrimario)

                        // ⚠️ NO VISTO EN CLASE: Stepper.
                        Stepper(value: $mascota.edad, in: 0...40) {
                            Text("Edad: \(mascota.textoEdad)")
                                .foregroundStyle(paletaTexto)
                        }

                        Text("Peso: \(mascota.peso, specifier: "%.1f") kg")
                            .foregroundStyle(paletaTexto)
                        // ⚠️ NO VISTO EN CLASE: step: (avanza de 0.5 en 0.5).
                        // Forma de clase (Clase 4): Slider(value: $x, in: 0 ... 100)
                        Slider(value: $mascota.peso, in: 0...60, step: 0.5)          // ✏️ rango
                            .tint(paletaPrimario)
                    }
                    .padding()
                    .background(paletaSuperficie)
                    .cornerRadius(16)

                    // ── 4. Regresar por código ──────────────────────
                    BotonPrincipalMascotas(titulo: "Listo", icono: "checkmark") {
                        dismiss()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Detalle")                                             // ✏️
    }
}

#Preview {
    // En el preview no hay lista real: .constant da un binding de prueba.
    NavigationStack {
        DetalleMascotaView(mascota: .constant(cargarMascotas()[0]))
    }
}
