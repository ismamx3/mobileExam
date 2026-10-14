// ═══════════════════════════════════════════════════════════════
//  BotonGrande.swift  ·  04 Componentes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Botón de todo el ancho con ícono, color y la acción que tú
//              le mandes desde afuera.
//  ÚSALO PARA: Guardar, Calcular, Enviar… y que todos se vean iguales.
//  BUSCA:      boton, button, reutilizable, accion, closure, ancho completo, componente
//
//  CÓMO SE CREA (en tu proyecto):
//   File → New → File from Template → "SwiftUI View" → nómbralo BotonGrande
//   → carpeta Components/. Borra lo que trae y pega este archivo.
//
//  CÓMO SE USA desde otra vista. Dos formas:
//
//   (a) Con el código directo entre llaves (lo de las llaves es la acción):
//       BotonGrande(titulo: "Sumar", icono: "plus", color: .purple) {
//           contador += 1
//       }
//
//   (b) Mandando el nombre de una función que ya tengas
//       (igual que Button("Aceptar", action: CalcularValor) de clase):
//       BotonGrande(titulo: "Calcular", icono: "function", color: .indigo, accion: calcular)
//
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: recibir la acción como parámetro (var accion: () -> Void)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct BotonGrande: View {

    var titulo: String          // ✏️ texto del botón
    var icono: String           // ✏️ SF Symbol
    var color: Color = .purple

    // ⚠️ NO VISTO EN CLASE: "() -> Void" es el tipo de una función que no recibe
    // nada y no regresa nada. Así el botón no sabe QUÉ hace: se lo dice quien lo usa.
    // Es lo mismo que pasa con Button("Aceptar", action: CalcularValor).
    var accion: () -> Void

    var body: some View {
        Button {
            accion()
        } label: {
            // El .frame va DENTRO del label para que el fondo ocupe todo el ancho.
            Label(titulo, systemImage: icono)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .tint(color)
        .controlSize(.large)   // Más alto: área táctil cómoda (≥ 44 pt).
    }
}

#Preview {
    VStack(spacing: 12) {
        BotonGrande(titulo: "Guardar", icono: "checkmark.circle.fill", color: .purple) {
            print("Tocaste Guardar")
        }
        BotonGrande(titulo: "Cancelar", icono: "xmark.circle.fill", color: .red) {
            print("Tocaste Cancelar")
        }
    }
    .padding()
}
