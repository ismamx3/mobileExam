// ═══════════════════════════════════════════════════════════════
//  FilaDato.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Renglón con la etiqueta a la izquierda y el valor a la
//              derecha:   Álbum ..................... Take Care
//  ÚSALO PARA: pantallas de detalle, resúmenes, perfiles.
//  BUSCA:      fila, renglon, row, etiqueta valor, detalle, label value, componente
//
//  CÓMO SE CREA (en tu proyecto):
//   File → New → File from Template → "SwiftUI View" → nómbralo FilaDato
//   → carpeta Components/. Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista:
//       FilaDato(etiqueta: "Álbum", valor: "Take Care")
//       FilaDato(etiqueta: "Edad", valor: "\(edad)")                        // Int → String
//       FilaDato(etiqueta: "Estatura", valor: estatura.formatted(.number.precision(.fractionLength(2))) + " m")
//         (Double con 2 decimales. OJO: specifier: solo funciona dentro de Text(), no en un String)
//   Entre filas pon Divider() para la línea separadora.
//
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FilaDato: View {

    // Las dos son String. Si tu dato es número, conviértelo con "\(numero)".
    var etiqueta: String
    var valor: String

    var body: some View {
        HStack {
            Text(etiqueta)
                .foregroundStyle(.secondary)
            Spacer()   // Empuja el valor hasta la derecha.
            Text(valor)
                .bold()
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    VStack {
        FilaDato(etiqueta: "Álbum", valor: "Take Care")
        Divider()
        FilaDato(etiqueta: "Duración", valor: "5:07")
        Divider()
        FilaDato(etiqueta: "Estatura", valor: 1.98.formatted(.number.precision(.fractionLength(2))) + " m")
    }
    .padding()
}
