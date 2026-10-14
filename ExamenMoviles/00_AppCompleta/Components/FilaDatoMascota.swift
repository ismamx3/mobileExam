// ═══════════════════════════════════════════════════════════════
//  FilaDatoMascota.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Renglón "etiqueta ……… valor" con ícono a la izquierda.
//  ÚSALO PARA: fichas de detalle, perfil, resumen de datos.
//  BUSCA:      fila dato, renglon etiqueta valor, label value row,
//              ficha, detalle, HStack Spacer, clave valor
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/FilaDatoMascota.swift.
//   2. Pega el archivo completo.
//   3. Úsalo así:
//        FilaDatoMascota(icono: "scalemass", titulo: "Peso", valor: "12.5 kg")
//  NECESITA:   Utils/PaletaMascotas.swift
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct FilaDatoMascota: View {

    var icono: String
    var titulo: String
    var valor: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icono)
                .foregroundStyle(paletaPrimario)
                .frame(width: 24)          // mismo ancho = textos alineados

            Text(titulo)
                .foregroundStyle(paletaTextoSuave)

            Spacer()                       // empuja el valor a la derecha

            Text(valor)
                .bold()
                .foregroundStyle(paletaTexto)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    VStack {
        FilaDatoMascota(icono: "pawprint", titulo: "Especie", valor: "Perro")
        Divider()
        FilaDatoMascota(icono: "scalemass", titulo: "Peso", valor: "12.5 kg")
    }
    .padding()
}
