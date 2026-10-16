// ═══════════════════════════════════════════════════════════════
//  EtiquetaChip.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Texto chiquito dentro de una cápsula de color (chip / badge).
//  ÚSALO PARA: categorías, estados ("Activo", "Pendiente"), géneros, tags.
//  BUSCA:      chip, etiqueta, tag, badge, capsula, categoria, estado, componente
//
//  CÓMO SE CREA (en tu proyecto):
//   (pasos de clase) File → New → File from Template... → sección
//   "User Interface" → "SwiftUI View" → Next → nómbralo EtiquetaChip.swift
//   → Create (en la carpeta Components/). Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista:
//       EtiquetaChip(texto: "Activo")
//       EtiquetaChip(texto: "Pendiente", color: .red)
//       HStack { EtiquetaChip(texto: "iOS"); EtiquetaChip(texto: "SwiftUI") }   // varios en fila
//
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EtiquetaChip: View {

    var texto: String           // ✏️
    // Usa colores oscuros (purple, indigo, blue, red, black) porque el texto es
    // blanco. Con .yellow o .mint el contraste es malo y se lee mal.
    var color: Color = .purple

    var body: some View {
        Text(texto)
            .font(.caption)
            .bold()
            .foregroundStyle(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color)
            .cornerRadius(50)   // radio grande = forma de cápsula
    }
}

#Preview {
    HStack {
        EtiquetaChip(texto: "Activo")
        EtiquetaChip(texto: "Pendiente", color: .red)
        EtiquetaChip(texto: "SwiftUI", color: .indigo)
    }
    .padding()
}
