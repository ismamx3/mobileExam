// ═══════════════════════════════════════════════════════════════
//  EncabezadoPantalla.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Encabezado centrado: ícono grande + título + subtítulo.
//  ÚSALO PARA: la parte de arriba de cualquier pantalla, para que todas
//              tus pantallas empiecen igual.
//  BUSCA:      encabezado, header, titulo, subtitulo, icono, componente
//
//  CÓMO SE CREA (en tu proyecto):
//   File → New → File from Template → "SwiftUI View" → nómbralo EncabezadoPantalla
//   → carpeta Components/. Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista:
//       EncabezadoPantalla(titulo: "Registro",
//                          subtitulo: "Llena tus datos",
//                          icono: "person.crop.circle.badge.plus")
//
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct EncabezadoPantalla: View {

    var titulo: String         // ✏️
    var subtitulo: String      // ✏️
    var icono: String          // ✏️ SF Symbol
    var color: Color = .purple

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icono)
                .font(.system(size: 48))
                .foregroundStyle(color)

            Text(titulo)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            Text(subtitulo)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)   // Ocupa todo el ancho y queda centrado.
        .padding(.vertical)
    }
}

#Preview {
    EncabezadoPantalla(titulo: "Registro", subtitulo: "Llena tus datos para continuar", icono: "person.crop.circle.badge.plus")
}
