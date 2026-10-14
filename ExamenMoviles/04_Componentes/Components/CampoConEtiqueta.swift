// ═══════════════════════════════════════════════════════════════
//  CampoConEtiqueta.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Etiqueta + TextField en un solo componente. El componente
//              MODIFICA la variable de la vista que lo usa (@Binding).
//  ÚSALO PARA: formularios (registro, login, agregar elemento) sin repetir
//              el mismo Text + TextField diez veces.
//  BUSCA:      campo, textfield, etiqueta, formulario, binding, componente, input
//
//  CÓMO SE CREA (en tu proyecto):
//   File → New → File from Template → "SwiftUI View" → nómbralo CampoConEtiqueta
//   → carpeta Components/. Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista (3 pasos, igual que @Binding de clase):
//   1. En la vista padre:   @State private var nombre: String = ""
//   2. Llama al componente CON $:
//       CampoConEtiqueta(etiqueta: "Nombre", placeholder: "Escribe tu nombre", texto: $nombre)
//   3. Lo que el usuario escribe queda en "nombre" de la vista padre.
//
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct CampoConEtiqueta: View {

    var etiqueta: String       // ✏️ texto de arriba
    var placeholder: String    // ✏️ texto gris dentro del campo

    // @Binding: sin private y sin valor inicial. El dato NO es de este
    // componente; es de la vista padre (que tiene el @State). Aquí solo
    // tenemos permiso para leerlo y cambiarlo.
    @Binding var texto: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(etiqueta)
                .font(.subheadline)
                .bold()

            TextField(placeholder, text: $texto)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    // En el preview no hay vista padre, por eso se usa .constant("")
    // (un binding de prueba que no cambia).
    CampoConEtiqueta(etiqueta: "Nombre", placeholder: "Escribe tu nombre", texto: .constant(""))
        .padding()
}
