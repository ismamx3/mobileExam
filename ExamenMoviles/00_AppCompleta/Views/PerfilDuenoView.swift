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
//  ⚠️ NO VISTO EN CLASE: Button(role: .destructive) (botón rojo de borrar)
//     y .aspectRatio(contentMode: .fill) en la foto elegida.
//
//  ¿QUIERES TAMBIÉN CÁMARA? (Clase 17; el simulador NO tiene cámara:
//  la prueba final se hace en un iPhone físico, tutorial en Canvas)
//   1. Copia 10_FotosYCamara/CamaraPicker.swift a tu proyecto (es el de la
//      profe, de Canvas). Arrástralo y asegúrate de que se haga una COPIA.
//   2. Permiso (obligatorio desde iOS 10, si no TRUENA): Navegador del
//      proyecto → selecciona el proyecto → pestaña Info → clic derecho en
//      la última fila de "Custom iOS Target Properties" → Add Row →
//      "Privacy - Camera Usage Description" → en Value escribe el mensaje.
//   3. Aquí agrega:   @State private var showCamara = false
//   4. Junto al PhotosPicker agrega (igual a la lámina):
//        Button("Abrir Cámara", systemImage: "camera.fill") {
//            showCamara = true
//        }
//        .buttonStyle(.borderedProminent)
//        .sheet(isPresented: $showCamara) {
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
                            // Paso F de la Clase 17: como es opcional, primero if let.
                            if let fotoBien = fotoPerfil {
                                Image(uiImage: fotoBien)
                                    .resizable(resizingMode: .stretch)
                                    // ⚠️ NO VISTO EN CLASE: .fill para que la foto
                                    // (casi nunca cuadrada) llene el círculo.
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 140, height: 140)
                                    .clipShape(.circle)
                                    .overlay {
                                        Circle().stroke(colorFavoritoDueno(colorFavorito), lineWidth: 5)
                                    }
                            } else {
                                // Forma de clase: resizable + .fit + frame (Clase 3)
                                // y círculo con borde (Clase 5A). El asset es cuadrado.
                                Image("perfil")                                 // ✏️ tu asset
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140)
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
                            // En clase (Clase 17, paso C) el estilo va DENTRO de las llaves:
                            //   Label(...).padding(12).background(.purple)
                            //       .foregroundStyle(.white).cornerRadius(12)
                            // Aquí van AFUERA porque adentro Swift 6 no deja usar
                            // variables de la vista (warning amarillo).
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
                        // ⚠️ NO VISTO EN CLASE: role: .destructive (pinta el botón de rojo).
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
            // En el Stack PRINCIPAL (el ZStack), como pide la Clase 4.
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
