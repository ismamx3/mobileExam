// ═══════════════════════════════════════════════════════════════
//  DetalleViajeViajesView.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Detalle de UN viaje: fechas en español, días, personas,
//              presupuesto, Toggle "Ya fui" y las FOTOS del viaje:
//              tomar con la CÁMARA (CamaraPicker) o elegir VARIAS de la
//              galería (PhotosPicker). Tocar una foto la abre en grande.
//  ÚSALO PARA: "agregar fotos a un registro", álbum, evidencia, galería.
//  BUSCA:      camara, CamaraPicker, tomar foto, varias fotos, galeria,
//              PhotosPicker, maxSelectionCount, foto en grande,
//              fullScreenCover, cuadricula de fotos, isSourceTypeAvailable,
//              Toggle binding, detalle con binding
//
//  CÓMO COPIARLO:
//   1. Copia 10_FotosYCamara/CamaraPicker.swift a tu proyecto (de la
//      profe, sin cambiarlo). Este archivo NO lo trae: usa ese.
//   2. Agrega el permiso de cámara (Info → Add Row → Privacy - Camera
//      Usage Description). Sin él la app TRUENA al abrir la cámara.
//   3. Views/DetalleViajeViajesView.swift → pega esto.
//  NECESITA:   10_FotosYCamara/CamaraPicker.swift, permiso de cámara,
//              Model/ViajePlaneado.swift, Components/FilaDatoViajes.swift
//  DE CLASE (Clase 17): PhotosPicker + .onChange + Task + loadTransferable;
//     CamaraPicker en una .sheet con un @Binding UIImage?; showCamara = true.
//  ⚠️ NO VISTO EN CLASE: maxSelectionCount (varias fotos), LazyVGrid,
//     ForEach por índice, .fullScreenCover(item:), .clipped(),
//     UIImagePickerController.isSourceTypeAvailable(.camera) y
//     role: .destructive.
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import PhotosUI

// ⚠️ .fullScreenCover(item:) necesita algo Identifiable: guardamos la
// POSICIÓN de la foto que se tocó dentro de un struct con id.
struct FotoElegidaViajes: Identifiable {
    var id: Int             // la posición de la foto en viaje.fotos
}

struct DetalleViajeViajesView: View {

    // @Binding: el Toggle y las fotos cambian el viaje en la lista de la raíz.
    @Binding var viaje: ViajePlaneado

    // ── Cámara (Clase 17) ──
    @State private var fotoCamara: UIImage? = nil       // aquí regresa la foto el CamaraPicker
    @State private var showCamara = false
    @State private var showAlertSinCamara = false

    // ── Galería: VARIAS fotos ⚠️ (arreglo en lugar de una sola) ──
    @State private var seleccionGaleria: Array<PhotosPickerItem> = []

    // ── Foto en grande ⚠️ ──
    @State private var fotoElegida: FotoElegidaViajes? = nil

    let paleta = PaletaViajes()

    // ⚠️ 3 columnas iguales para la cuadrícula de fotos.
    let columnasFotos = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            paleta.fondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // ── 1. Encabezado ─────────────────────────────
                    Image(viaje.imagen)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(18)

                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viaje.destinoNombre)
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(paleta.texto)
                            Text(viaje.estado)
                                .foregroundStyle(paleta.textoSuave)
                        }
                        Spacer()
                        Text(viaje.estadoTexto)                         // "Faltan 10 días"
                            .font(.subheadline)
                            .bold()
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .foregroundStyle(paleta.textoSobrePrimario)
                            .background(viaje.yaFui ? paleta.secundario : paleta.primario)
                            .cornerRadius(20)
                    }

                    // ── 2. Datos del viaje (fechas en español) ───
                    VStack(spacing: 14) {
                        FilaDatoViajes(icono: "airplane.departure", etiqueta: "Ida", valor: textoFechaViajes(fecha: viaje.fechaIda))
                        Divider()
                        FilaDatoViajes(icono: "airplane.arrival", etiqueta: "Regreso", valor: textoFechaViajes(fecha: viaje.fechaRegreso))
                        Divider()
                        FilaDatoViajes(icono: "calendar", etiqueta: "Días", valor: "\(viaje.dias)")
                        Divider()
                        FilaDatoViajes(icono: "person.2.fill", etiqueta: "Personas", valor: "\(viaje.personas)")
                        Divider()
                        FilaDatoViajes(icono: "dollarsign.circle.fill", etiqueta: "Presupuesto",
                                       valor: viaje.presupuesto.formatted(.currency(code: "MXN")))
                    }
                    .padding()
                    .background(paleta.superficie)
                    .cornerRadius(16)

                    // ── 3. Toggle "Ya fui" (con $: modifica el viaje) ──
                    Toggle("Ya fui a este viaje", isOn: $viaje.yaFui)
                        .foregroundStyle(paleta.texto)
                        .tint(paleta.secundario)
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                    // ── 4. Botones: cámara y galería ─────────────
                    Text("Fotos del viaje (\(viaje.fotos.count))")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(paleta.texto)

                    HStack(spacing: 12) {
                        // CÁMARA (Clase 17): showCamara = true abre la sheet.
                        Button {
                            // ⚠️ El simulador NO tiene cámara: abrir CamaraPicker ahí
                            // truena. Primero preguntamos si hay cámara.
                            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                showCamara = true
                            } else {
                                showAlertSinCamara.toggle()
                            }
                        } label: {
                            Label("Cámara", systemImage: "camera.fill")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(paleta.primario)
                        .controlSize(.large)

                        // GALERÍA: PhotosPicker de la Clase 17, pero con un ARREGLO.
                        // Los estilos van FUERA de las llaves (dentro, con colores de
                        // la paleta, Swift 6 marca un warning).
                        PhotosPicker(
                            selection: $seleccionGaleria,
                            maxSelectionCount: 10,                              // ⚠️ hasta 10 fotos
                            matching: .images,
                            photoLibrary: .shared()) {
                            Label("Galería", systemImage: "photo.on.rectangle")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(paleta.secundario)
                        .controlSize(.large)
                        // Mismo .onChange de la Clase 17, pero con un for para
                        // convertir CADA foto elegida a UIImage.
                        .onChange(of: seleccionGaleria) { oldItems, newItems in
                            Task {
                                for item in newItems {
                                    if let data = try? await item.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        viaje.fotos.append(uiImage)
                                    }
                                }
                                // Limpia la selección para que la próxima vez no
                                // se vuelvan a agregar las mismas fotos.
                                if !newItems.isEmpty {
                                    seleccionGaleria = []
                                }
                            }
                        }
                    }

                    // ── 5. Cuadrícula de fotos ───────────────────
                    if viaje.fotos.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "photo.on.rectangle.angled")
                                .font(.system(size: 44))
                            Text("Todavía no hay fotos de este viaje")
                        }
                        .foregroundStyle(paleta.textoSuave)
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .background(paleta.superficie)
                        .cornerRadius(16)
                    } else {
                        LazyVGrid(columns: columnasFotos, spacing: 8) {
                            // ⚠️ ForEach por índice: UIImage no es Identifiable.
                            ForEach(0..<viaje.fotos.count, id: \.self) { indice in
                                Button {
                                    fotoElegida = FotoElegidaViajes(id: indice)
                                } label: {
                                    Image(uiImage: viaje.fotos[indice])
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fill)    // llena el cuadro
                                        .frame(width: 105, height: 105)
                                        .clipped()                          // ⚠️ recorta lo que sobra
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Mi viaje")
        .navigationBarTitleDisplayMode(.inline)                         // ⚠️ título chico
        // CÁMARA (Clase 17): el @Binding regresa la foto en fotoCamara.
        .sheet(isPresented: $showCamara) {
            CamaraPicker(selectedImageFromCamera: $fotoCamara)
        }
        // Cuando llega una foto de la cámara, se agrega al viaje y se limpia.
        .onChange(of: fotoCamara) { oldValue, newValue in
            if let fotoNueva = newValue {
                viaje.fotos.append(fotoNueva)
                fotoCamara = nil
            }
        }
        .alert("Este dispositivo no tiene cámara. Pruébalo en un iPhone físico o usa la galería.", isPresented: $showAlertSinCamara) {
            Button("OK") {}
        }
        // ⚠️ Pantalla completa encima, sin navegar. Recibe la foto tocada.
        .fullScreenCover(item: $fotoElegida) { elegida in
            FotoGrandeViajesView(fotos: $viaje.fotos, indice: elegida.id)
        }
    }
}

// Foto en grande, fondo negro, con botón para cerrar y para borrarla.
struct FotoGrandeViajesView: View {

    @Binding var fotos: Array<UIImage>
    var indice: Int

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            // Revisamos la posición antes de usarla: fotos[indice] fuera de
            // rango truena ("Index out of range").
            if indice < fotos.count {
                Image(uiImage: fotos[indice])
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
            }

            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(Color.white)
                    }
                }
                Spacer()
                // ⚠️ role: .destructive pinta el botón de rojo.
                Button(role: .destructive) {
                    if indice < fotos.count {
                        fotos.remove(at: indice)
                    }
                    dismiss()
                } label: {
                    Label("Borrar foto", systemImage: "trash")
                        .font(.headline)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        DetalleViajeViajesView(viaje: .constant(viajesDeEjemploViajes()[0]))
    }
}
