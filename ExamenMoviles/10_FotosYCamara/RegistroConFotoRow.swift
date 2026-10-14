// ═══════════════════════════════════════════════════════════════
//  RegistroConFotoRow.swift  ·  10 Fotos y cámara  (COMPONENTE)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El renglón de la lista: miniatura de la foto +
//              nombre + descripción en una línea.
//  ÚSALO PARA: renglón de List con foto del usuario (UIImage).
//  BUSCA:      row con foto, miniatura, thumbnail, renglon, celda
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Components/RegistroConFotoRow.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   10_FotosYCamara/RegistroConFoto.swift (el modelo).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct RegistroConFotoRow: View {

    // Propiedad simple: el renglón solo MUESTRA, no modifica
    var registro: RegistroConFoto

    var body: some View {
        HStack(spacing: 12) {

            // Miniatura: la foto si hay, si no un ícono
            if let foto = registro.foto {
                Image(uiImage: foto)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)                  // ✏️ tamaño
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Image(systemName: "photo")
                    .font(.title2)
                    .foregroundStyle(.gray)
                    .frame(width: 55, height: 55)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(registro.nombre)
                    .font(.headline)
                Text(registro.descripcion)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(1)                                  // una sola línea
            }
        }
    }
}

#Preview {
    List {
        RegistroConFotoRow(registro: RegistroConFoto(nombre: "Firulais", descripcion: "Perro muy juguetón", foto: UIImage(named: "mascota")))
        RegistroConFotoRow(registro: RegistroConFoto(nombre: "Sin foto", descripcion: "Este no tiene foto", foto: nil))
    }
}
