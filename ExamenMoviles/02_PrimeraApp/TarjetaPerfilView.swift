// ═══════════════════════════════════════════════════════════════
//  TarjetaPerfilView.swift  ·  02 Mi primera app (pantalla lista)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla completa "Acerca de mí / Perfil": foto
//              circular, nombre, carrera, frase, renglones de datos,
//              pasatiempos y botón que muestra una alerta con datos
//              de contacto. Fondo completo, paleta propia, ScrollView.
//  ÚSALO PARA: pantalla de presentación, perfil del usuario,
//              "acerca de", créditos del examen.
//  BUSCA:      perfil, profile, acerca de, about, presentacion, tarjeta,
//              card, foto circular, datos personales, matricula, renglon,
//              fila, dato, chips, pasatiempos, contacto, alerta con mensaje
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/TarjetaPerfilView.swift.
//   2. Pega el archivo completo (trae su componente de renglón
//      TarjetaPerfilRenglon al final; puedes moverlo a Components/).
//   3. Cambia tus datos y colores (todo lo marcado con ✏️).
//  NECESITA:   imagen "perfil" en Assets (de preferencia cuadrada).
//  ⚠️ NO VISTO EN CLASE: .preferredColorScheme(.light)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct TarjetaPerfilView: View {

    // ── Paleta (monocromática morada) ──
    let colorFondo    = Color(red: 245/255, green: 243/255, blue: 255/255)   // ✏️
    let colorPrimario = Color(red: 108/255, green: 92/255, blue: 231/255)    // ✏️
    let colorTexto    = Color(red: 45/255, green: 52/255, blue: 54/255)      // ✏️

    // ── Tus datos ──
    let nombre = "Ismael Alvarez Rodriguez"                                  // ✏️
    let matricula = "A01286818"                                              // ✏️
    let carrera = "Ingeniería en Tecnologías Computacionales"                // ✏️
    let semestre = "5to semestre"                                            // ✏️
    let campus = "Monterrey"                                                 // ✏️
    let correo = "A01286818@tec.mx"                                          // ✏️
    let frase = "You can do it!"                                             // ✏️
    let pasatiempos = ["Programar", "Música", "Gym"]                          // ✏️ máximo 3 o 4 cortos

    @State private var showContacto = false

    var body: some View {
        ZStack {
            colorFondo
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    // ── 1. Foto, nombre y carrera ────────────────
                    VStack(spacing: 10) {
                        Image("perfil")                                      // ✏️ tu foto
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .clipShape(.circle)
                            .overlay {
                                Circle().stroke(colorPrimario, lineWidth: 4)
                            }
                            .shadow(color: colorPrimario.opacity(0.5), radius: 8)

                        Text(nombre)
                            .font(.title)
                            .bold()
                            .foregroundStyle(colorTexto)
                            .multilineTextAlignment(.center)

                        Text(carrera)
                            .font(.headline)
                            .foregroundStyle(colorPrimario)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 10)

                    // ── 2. Frase ─────────────────────────────────
                    Text("“\(frase)”")
                        .font(.title3)
                        .italic()
                        .foregroundStyle(colorTexto)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(colorPrimario.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 16))

                    // ── 3. Renglones de datos ────────────────────
                    VStack(spacing: 0) {
                        TarjetaPerfilRenglon(icono: "number", titulo: "Matrícula", valor: matricula, colorIcono: colorPrimario)
                        Divider()
                        TarjetaPerfilRenglon(icono: "graduationcap.fill", titulo: "Semestre", valor: semestre, colorIcono: colorPrimario)
                        Divider()
                        TarjetaPerfilRenglon(icono: "building.columns.fill", titulo: "Campus", valor: campus, colorIcono: colorPrimario)
                        Divider()
                        TarjetaPerfilRenglon(icono: "envelope.fill", titulo: "Correo", valor: correo, colorIcono: colorPrimario)
                    }
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)

                    // ── 4. Pasatiempos (chips) ───────────────────
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Pasatiempos")
                            .font(.headline)
                            .foregroundStyle(colorTexto)

                        HStack(spacing: 8) {
                            ForEach(pasatiempos, id: \.self) { pasatiempo in
                                Text(pasatiempo)
                                    .font(.subheadline)
                                    .bold()
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(colorPrimario.opacity(0.15))
                                    .foregroundStyle(colorPrimario)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // ── 5. Botón con alerta de varias líneas ─────
                    Button {
                        showContacto.toggle()
                    } label: {
                        Label("Contactar", systemImage: "paperplane.fill")    // ✏️
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(colorPrimario)
                    .controlSize(.large)
                }
                .padding()
            }
        }
        .navigationTitle("Mi perfil")
        .alert("Contacto", isPresented: $showContacto) {
            Button("Cerrar") {}
        } message: {
            Text("""
            \(nombre)
            \(correo)
            Campus \(campus)
            """)
        }
        .preferredColorScheme(.light)   // ⚠️ NO VISTO EN CLASE: fija modo claro para que no cambie el contraste
    }
}

// ── Componente: un renglón "ícono · título ........ valor" ──
// Solo muestra datos, por eso sus propiedades son simples (sin @State).
struct TarjetaPerfilRenglon: View {
    var icono: String
    var titulo: String
    var valor: String
    var colorIcono: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icono)
                .foregroundStyle(colorIcono)
                .frame(width: 24)
            Text(titulo)
                .foregroundStyle(.gray)
            Spacer()
            Text(valor)
                .bold()
                .foregroundStyle(.black)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    NavigationStack {
        TarjetaPerfilView()
    }
}
