// ═══════════════════════════════════════════════════════════════
//  AgregarMascotaView.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Formulario para dar de alta una mascota nueva.
//              Valida campo por campo con una alerta que dice
//              EXACTAMENTE qué falta, la agrega a la lista (append)
//              y se cierra solo (dismiss).
//  ÚSALO PARA: cualquier "registrar / agregar / nuevo" de tu app.
//  BUSCA:      formulario, form, alta, agregar, nuevo, registrar, validar,
//              validacion, alerta, alert, campo vacio, numero entero,
//              Int(texto), if let, Picker vacio, PhotosPicker, append,
//              sheet, dismiss, teclado, FocusState
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/AgregarMascotaView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (campos, mensajes, rangos).
//  NECESITA:   Model/Mascota.swift, Model/ModelDataMascotas.swift
//              (especiesMascotas), Utils/PaletaMascotas.swift,
//              Components/FotoMascotaView.swift
//  DE CLASE: PhotosPicker pasos A–F (Clase 17), Picker(selection:label:)
//     (Clase 4), alerta con .toggle() (Clase 3), @FocusState + .onTapGesture
//     en el Stack principal (Clase 4), .sheet + dismiss() (Clases 17 y 6A).
//  ⚠️ NO VISTO EN CLASE: .keyboardType(.numberPad) (teclado solo números).
//  ⚠️ NO VISTO EN CLASE: ForEach dentro del Picker, step: del Slider y
//     .aspectRatio(contentMode: .fill) en la foto elegida.
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import PhotosUI

struct AgregarMascotaView: View {

    // Con @Binding para poder hacer append a la lista real.
    @Binding var mascotas: Array<Mascota>

    // Para cerrar la sheet al guardar o cancelar.
    @Environment(\.dismiss) private var dismiss

    // ── Campos del formulario ───────────────────────────────────
    @State private var nombre = ""
    @State private var especie = ""          // "" = no ha seleccionado
    @State private var edadTexto = ""        // String: el TextField siempre da texto
    @State private var peso = 5.0
    @State private var vacunada = false

    // ── Foto (PhotosPicker) ─────────────────────────────────────
    @State private var fotoSeleccionada: PhotosPickerItem? = nil
    @State private var imagenSeleccionada: UIImage? = nil

    // ── Alerta con mensaje que cambia según el error ────────────
    @State private var mostrarAlerta = false
    @State private var mensajeAlerta = ""

    // ── Teclado ─────────────────────────────────────────────────
    @FocusState private var tecladoActivo: Bool

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    Text("Nueva mascota")                                       // ✏️
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(paletaTexto)
                        .padding(.top, 20)

                    // ── 1. Foto opcional con PhotosPicker ───────────
                    HStack(spacing: 16) {
                        // Paso F de la Clase 17: como es opcional, primero if let.
                        if let imagenBien = imagenSeleccionada {
                            Image(uiImage: imagenBien)
                                .resizable(resizingMode: .stretch)
                                // ⚠️ NO VISTO EN CLASE: .fill para que la foto (casi
                                // nunca cuadrada) llene el círculo. En clase: .fit
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(.circle)
                        } else {
                            Image(systemName: "camera.circle.fill")
                                .font(.system(size: 70))
                                .foregroundStyle(paletaPrimarioClaro)
                        }

                        PhotosPicker(
                            selection: $fotoSeleccionada,
                            matching: .images,
                            photoLibrary: .shared()) {
                            Label("Elegir foto (opcional)", systemImage: "photo.on.rectangle")
                                .font(.subheadline)
                                .bold()
                                .padding(.vertical, 6)
                        }
                        // En clase (Clase 17, paso C) el estilo va DENTRO de las llaves:
                        //   Label(...).padding(12).background(.purple)
                        //       .foregroundStyle(.white).cornerRadius(12)
                        // Con un color del sistema (.purple) funciona igual.
                        // Aquí van AFUERA porque adentro Swift 6 no deja usar
                        // constantes de la app como paletaPrimario (warning amarillo).
                        .buttonStyle(.borderedProminent)
                        .tint(paletaPrimario)
                        // Paso E de la Clase 17: PhotosPickerItem no se puede
                        // mostrar; hay que cargarlo como Data y convertirlo a UIImage.
                        .onChange(of: fotoSeleccionada) { oldItem, newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    imagenSeleccionada = uiImage
                                }
                            }
                        }
                    }

                    // ── 2. Texto: nombre ────────────────────────────
                    Text("Nombre")
                        .font(.headline)
                        .foregroundStyle(paletaTexto)
                    TextField("Ej. Firulais", text: $nombre)                     // ✏️
                        .textFieldStyle(.roundedBorder)
                        .focused($tecladoActivo)

                    // ── 3. Picker con opción vacía ──────────────────
                    HStack {
                        Text("Especie")
                            .font(.headline)
                            .foregroundStyle(paletaTexto)
                        Spacer()
                        Picker(selection: $especie, label: Text("Especie")) {
                            Text("Selecciona").tag("")      // "" = no ha elegido
                            // ⚠️ NO VISTO EN CLASE: ForEach(arreglo, id: \.self).
                            // Las opciones salen del arreglo de ModelDataMascotas
                            // para no escribirlas dos veces. Forma de clase (Clase 4):
                            // escribir cada una a mano →  Text("Perro").tag("Perro")
                            ForEach(especiesMascotas, id: \.self) { opcion in
                                Text(opcion).tag(opcion)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(paletaPrimario)
                    }

                    // ── 4. Número: edad (TextField + if let) ────────
                    Text("Edad (años)")
                        .font(.headline)
                        .foregroundStyle(paletaTexto)
                    TextField("Ej. 3", text: $edadTexto)                         // ✏️
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)   // ⚠️ NO VISTO EN CLASE
                        .focused($tecladoActivo)

                    // ── 5. Slider: peso ─────────────────────────────
                    Text("Peso: \(peso, specifier: "%.1f") kg")
                        .font(.headline)
                        .foregroundStyle(paletaTexto)
                    // ⚠️ NO VISTO EN CLASE: step: (de 0.5 en 0.5). Sin él es la forma de clase.
                    Slider(value: $peso, in: 0.5...60, step: 0.5)                // ✏️ rango
                        .tint(paletaPrimario)

                    // ── 6. Toggle ───────────────────────────────────
                    Toggle("Tiene sus vacunas al día", isOn: $vacunada)          // ✏️
                        .font(.headline)
                        .foregroundStyle(paletaTexto)
                        .tint(paletaPrimario)

                    // ── 7. Botones del MISMO ancho ──────────────────
                    HStack(spacing: 12) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancelar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.bordered)
                        .tint(paletaPrimario)

                        Button {
                            guardarMascota()
                        } label: {
                            Text("Guardar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(paletaPrimario)
                    }
                    .controlSize(.large)
                    .padding(.top, 10)
                }
                .padding()
            }
        }
        // Tocar cualquier parte vacía esconde el teclado.
        // Va en el Stack PRINCIPAL (el ZStack), como pide la Clase 4.
        .onTapGesture {
            tecladoActivo = false
        }
        .alert(mensajeAlerta, isPresented: $mostrarAlerta) {
            Button("OK") {}
        }
    }

    // ── Validación: un mensaje ESPECÍFICO por cada error ────────────
    func guardarMascota() {
        if nombre.isEmpty {
            mensajeAlerta = "Escribe el nombre de la mascota."                  // ✏️
            mostrarAlerta.toggle()
        } else if especie.isEmpty {
            mensajeAlerta = "Selecciona la especie."
            mostrarAlerta.toggle()
        } else if edadTexto.isEmpty {
            mensajeAlerta = "Escribe la edad."
            mostrarAlerta.toggle()
        } else if let edad = Int(edadTexto) {
            // Dentro del if let, `edad` ya es Int (no opcional).
            if edad < 0 || edad > 40 {                                          // ✏️ rango
                mensajeAlerta = "La edad debe estar entre 0 y 40 años."
                mostrarAlerta.toggle()
            } else {
                let nueva = Mascota(
                    id: siguienteIdMascota(),
                    nombre: nombre,
                    especie: especie,
                    edad: edad,
                    peso: peso,
                    imagen: "",
                    vacunada: vacunada,
                    foto: imagenSeleccionada)
                mascotas.append(nueva)
                dismiss()
            }
        } else {
            // Int("tres") o Int("3.5") regresan nil → entra aquí.
            mensajeAlerta = "La edad debe ser un número entero, sin letras ni puntos."
            mostrarAlerta.toggle()
        }
    }

    // El id debe ser único. Usamos el mayor + 1 (no count + 1,
    // porque si borraste una mascota se repetiría un id).
    func siguienteIdMascota() -> Int {
        var mayor = 0
        for mascota in mascotas {
            if mascota.id > mayor {
                mayor = mascota.id
            }
        }
        return mayor + 1
    }
}

#Preview {
    AgregarMascotaView(mascotas: .constant(cargarMascotas()))
}
