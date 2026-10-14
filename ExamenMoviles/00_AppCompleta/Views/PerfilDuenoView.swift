// ═══════════════════════════════════════════════════════════════
//  PerfilDuenoView.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Perfil del dueño:
//                - nombre y color favorito GUARDADOS con @AppStorage
//                  (siguen ahí aunque cierres la app)
//                - foto de perfil con PhotosPicker
//                - renglones de datos
//  ÚSALO PARA: perfil, ajustes, configuración, preferencias.
//  BUSCA:      perfil, profile, ajustes, settings, AppStorage,
//              UserDefaults, guardar, persistencia, foto de perfil,
//              PhotosPicker, Picker segmented, color de fondo guardado
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/PerfilDuenoView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   Model/Mascota.swift, Utils/PaletaMascotas.swift,
//              Components/FilaDatoMascota.swift, imagen "perfil" en Assets.
//
//  ¿QUIERES TAMBIÉN CÁMARA? (el simulador NO tiene cámara: prueba en iPhone)
//   1. Copia 10_FotosYCamara/CamaraPicker.swift a tu proyecto (es el de la profe).
//   2. Proyecto → Target → pestaña Info → Add Row →
//      "Privacy - Camera Usage Description" con un mensaje. Sin esto TRUENA.
//   3. Aquí agrega:   @State private var mostrarCamara = false
//   4. Junto al PhotosPicker agrega:
//        Button("Tomar foto", systemImage: "camera.fill") {
//            mostrarCamara = true
//        }
//        .buttonStyle(.borderedProminent)
//        .sheet(isPresented: $mostrarCamara) {
//            CamaraPicker(selectedImageFromCamera: $fotoPerfil)
//        }
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import PhotosUI

// Convierte el nombre guardado en un Color.
// Se guarda el NOMBRE (String) porque @AppStorage no guarda Color.
func colorFavoritoDueno(_ nombre: String) -> Color {
    switch nombre {
    case "Azul":
        return Color.blue
    case "Morado":
        return Color.purple
    default:
        return paletaPrimario
    }
}

struct PerfilDuenoView: View {

    // Solo lee la lista para mostrar cuántas hay.
    var mascotas: Array<Mascota>

    // @AppStorage = @State que se GUARDA en UserDefaults.
    // "nombreDueno" es la llave; InicioMascotasView usa la misma.
    @AppStorage("nombreDueno") private var nombreDueno = ""
    @AppStorage("colorFavoritoDueno") private var colorFavorito = "Verde"

    // La foto NO se guarda al cerrar la app: UserDefaults no es para imágenes.
    @State private var fotoPerfilItem: PhotosPickerItem? = nil
    @State private var fotoPerfil: UIImage? = nil

    @FocusState private var tecladoActivo: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                paletaFondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 22) {

                        // ── 1. Foto de perfil con borde del color favorito ─
                        VStack(spacing: 12) {
                            if let fotoBien = fotoPerfil {
                                Image(uiImage: fotoBien)
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 140, height: 140)
                                    .clipShape(.circle)
                                    .overlay {
                                        Circle().stroke(colorFavoritoDueno(colorFavorito), lineWidth: 5)
                                    }
                            } else {
                                Image("perfil")                                 // ✏️ tu asset
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 140, height: 140)
                                    .clipShape(.circle)
                                    .overlay {
                                        Circle().stroke(colorFavoritoDueno(colorFavorito), lineWidth: 5)
                                    }
                            }

                            PhotosPicker(
                                selection: $fotoPerfilItem,
                                matching: .images,
                                photoLibrary: .shared()) {
                                Label("Cambiar foto", systemImage: "photo.on.rectangle")
                                    .font(.subheadline)
                                    .bold()
                                    .padding(.vertical, 6)
                            }
                            // Los colores van AFUERA de las llaves del PhotosPicker:
                            // adentro Swift 6 no deja usar variables de la vista
                            // (sale un warning amarillo).
                            .buttonStyle(.borderedProminent)
                            .tint(colorFavoritoDueno(colorFavorito))
                            .onChange(of: fotoPerfilItem) { oldItem, newItem in
                                Task {
                                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        fotoPerfil = uiImage
                                    }
                                }
                            }
                        }
                        .padding(.top, 8)

                        // ── 2. Preferencias guardadas (@AppStorage) ─
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Tus datos")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(paletaTexto)

                            Text("Nombre")
                                .font(.subheadline)
                                .foregroundStyle(paletaTextoSuave)
                            // Ligado DIRECTO a @AppStorage: se guarda al escribir.
                            TextField("Escribe tu nombre", text: $nombreDueno)  // ✏️
                                .textFieldStyle(.roundedBorder)
                                .focused($tecladoActivo)

                            Text("Color favorito")
                                .font(.subheadline)
                                .foregroundStyle(paletaTextoSuave)
                            Picker(selection: $colorFavorito, label: Text("Color favorito")) {
                                Text("Verde").tag("Verde")                      // ✏️
                                Text("Azul").tag("Azul")
                                Text("Morado").tag("Morado")
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding()
                        .background(paletaSuperficie)
                        .cornerRadius(16)

                        // ── 3. Renglones de datos ───────────────────
                        VStack(spacing: 0) {
                            FilaDatoMascota(
                                icono: "person.fill",
                                titulo: "Dueño",
                                valor: nombreDueno.isEmpty ? "Sin nombre" : nombreDueno)
                            Divider()
                            FilaDatoMascota(
                                icono: "pawprint.fill",
                                titulo: "Mascotas registradas",
                                valor: "\(mascotas.count)")
                            Divider()
                            FilaDatoMascota(
                                icono: "paintpalette.fill",
                                titulo: "Color favorito",
                                valor: colorFavorito)
                        }
                        .padding()
                        .background(paletaSuperficie)
                        .cornerRadius(16)

                        // ── 4. Borrar lo guardado ───────────────────
                        Button(role: .destructive) {
                            // Regresar a los valores iniciales también
                            // actualiza UserDefaults.
                            nombreDueno = ""
                            colorFavorito = "Verde"
                            fotoPerfil = nil
                        } label: {
                            Label("Borrar mis datos", systemImage: "trash")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                    }
                    .padding()
                }
            }
            .onTapGesture {
                tecladoActivo = false
            }
            .navigationTitle("Perfil")                                          // ✏️
        }
    }
}

#Preview {
    PerfilDuenoView(mascotas: cargarMascotas())
}
