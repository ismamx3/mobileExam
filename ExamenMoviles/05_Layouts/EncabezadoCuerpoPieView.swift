// ═══════════════════════════════════════════════════════════════
//  EncabezadoCuerpoPieView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla en 3 partes: ENCABEZADO fijo arriba, CUERPO con
//              scroll en medio y PIE fijo abajo con el botón principal.
//  ÚSALO PARA: formularios de registro, "agregar elemento", checkout,
//              cualquier pantalla larga donde el botón Guardar siempre
//              debe verse sin hacer scroll.
//  BUSCA:      encabezado, cuerpo, pie, header, footer, boton fijo abajo, formulario,
//              scroll en medio, sticky, registro, plantilla de pantalla
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/RegistroView.swift (o el nombre que quieras).
//   2. Pega el archivo completo y renombra el struct.
//   3. Cambia lo marcado con ✏️ (textos, campos, mensajes de la alerta).
//  NECESITA:   nada más.
//
//  ¿CÓMO FUNCIONA?
//   VStack(spacing: 0) con 3 hijos. El ScrollView del medio es el único
//   que se estira (pide todo el alto que haya), así que empuja al
//   encabezado hasta arriba y al pie hasta abajo. Lo que no cabe en el
//   cuerpo se ve haciendo scroll, sin mover encabezado ni pie.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EncabezadoCuerpoPieView: View {

    @State private var nombre: String = ""
    @State private var correo: String = ""
    @State private var telefono: String = ""
    @State private var comentarios: String = ""
    @State private var aceptaTerminos = false

    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool

    var body: some View {
        VStack(spacing: 0) {

            // ── 1. ENCABEZADO (fijo arriba) ─────────────────────────────
            VStack(spacing: 4) {
                Image(systemName: "person.crop.circle.badge.plus")
                    .font(.system(size: 40))
                Text("Registro")                       // ✏️
                    .font(.title)
                    .bold()
                Text("Llena tus datos")                // ✏️
                    .font(.subheadline)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)

            // ── 2. CUERPO (con scroll) ──────────────────────────────────
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    Text("Nombre")
                        .bold()
                    TextField("Escribe tu nombre", text: $nombre)          // ✏️
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Correo")
                        .bold()
                    TextField("correo@ejemplo.com", text: $correo)          // ✏️
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Teléfono")
                        .bold()
                    TextField("10 dígitos", text: $telefono)                // ✏️
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Comentarios")
                        .bold()
                    TextField("Opcional", text: $comentarios)               // ✏️
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Toggle("Acepto los términos", isOn: $aceptaTerminos)
                        .tint(.purple)

                    // Texto largo solo para que se note el scroll.
                    Text("Haz scroll: el encabezado y el botón de abajo no se mueven. Esto es útil cuando el formulario es largo y el botón Guardar siempre debe estar a la mano.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
            .onTapGesture {
                campoEnFoco = false   // Tocar fuera de un campo esconde el teclado.
            }

            // ── 3. PIE (fijo abajo) ─────────────────────────────────────
            VStack {
                Button {
                    validar()
                } label: {
                    Text("Guardar")                    // ✏️
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }

    // Revisa los campos en orden y arma un mensaje específico.
    func validar() {
        if nombre.isEmpty {
            alertMessage = "Escribe tu nombre"                  // ✏️
        } else if correo.isEmpty {
            alertMessage = "Escribe tu correo"
        } else if telefono.count != 10 {
            alertMessage = "El teléfono debe tener 10 dígitos"
        } else if aceptaTerminos == false {
            alertMessage = "Debes aceptar los términos"
        } else {
            alertMessage = "¡Registro guardado, \(nombre)!"
        }
        showAlert.toggle()
    }
}

#Preview {
    EncabezadoCuerpoPieView()
}
