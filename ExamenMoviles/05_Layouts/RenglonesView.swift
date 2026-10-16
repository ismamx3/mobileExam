// ═══════════════════════════════════════════════════════════════
//  RenglonesView.swift  ·  05 Layouts
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Todo tipo de renglones (filas) hechos con HStack:
//              etiqueta/valor, ícono + texto + flecha, renglón tipo lista
//              con imagen, tabla con columnas alineadas y color alternado.
//  ÚSALO PARA: pantallas de detalle, ajustes, resúmenes, mostrar datos en
//              forma de tabla.
//  BUSCA:      renglon, renglones, fila, filas, row, tabla, columnas alineadas, etiqueta valor,
//              chevron, flecha, color alternado, zebra, Divider, separador, ajustes
//
//  CÓMO COPIARLO:
//   1. Copia SOLO el bloque que quieras (entre las líneas  // ── N. ──).
//   2. Para la tabla (bloque 4) copia también el struct FilaTablaLayout
//      de abajo y el arreglo "filasTabla", y cambia sus datos.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   imagen "mascota" para el bloque 3.
//  ⚠️ NO VISTO EN CLASE: ForEach(…, id: \.self) en la tabla (bloque 4).
//     Si son pocos renglones, puedes escribir cada HStack a mano.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Modelo de un renglón de la tabla (bloque 4).
// Identifiable + id, igual que el modelo de una List.
struct FilaTablaLayout: Identifiable {
    var id: Int
    var nombre: String
    var goles: Int
    var promedio: Double
}

struct RenglonesView: View {

    let filasTabla = [                                              // ✏️ tus datos
        FilaTablaLayout(id: 1, nombre: "Ana", goles: 12, promedio: 8.5),
        FilaTablaLayout(id: 2, nombre: "Luis", goles: 7, promedio: 9.1),
        FilaTablaLayout(id: 3, nombre: "Sofía", goles: 15, promedio: 7.8),
        FilaTablaLayout(id: 4, nombre: "Diego", goles: 3, promedio: 9.6),
        FilaTablaLayout(id: 5, nombre: "Mariana", goles: 10, promedio: 8.0)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // ── 1. Etiqueta a la izquierda, valor a la derecha ──────
                // El Spacer() empuja el valor hasta la orilla derecha.
                Text("1. Etiqueta / valor")
                    .font(.headline)

                VStack(spacing: 0) {
                    HStack {
                        Text("Álbum")                              // ✏️
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("Take Care")                          // ✏️
                            .bold()
                    }
                    .padding(.vertical, 10)
                    Divider()
                    HStack {
                        Text("Duración")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("5:07")
                            .bold()
                    }
                    .padding(.vertical, 10)
                    Divider()
                    HStack {
                        Text("Favorito")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("Sí")
                            .bold()
                    }
                    .padding(.vertical, 10)
                }
                .padding(.horizontal)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(14)

                // ── 2. Ícono + texto + flecha (estilo Ajustes) ──────────
                Text("2. Ícono + texto + flecha")
                    .font(.headline)

                VStack(spacing: 0) {
                    HStack(spacing: 12) {
                        Image(systemName: "person.fill")           // ✏️
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .cornerRadius(8)
                        Text("Perfil")                             // ✏️
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 10)
                    Divider()
                    HStack(spacing: 12) {
                        Image(systemName: "bell.fill")
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                            .background(Color.red)
                            .cornerRadius(8)
                        Text("Notificaciones")
                        Spacer()
                        Text("Activadas")
                            .foregroundStyle(.secondary)
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 10)
                    Divider()
                    HStack(spacing: 12) {
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                            .background(Color.gray)
                            .cornerRadius(8)
                        Text("Privacidad")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 10)
                }
                .padding(.horizontal)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(14)

                // ── 3. Renglón tipo lista: imagen + 2 textos + valor ────
                // Es el mismo diseño de un JugadorRow / CancionRow.
                Text("3. Renglón con imagen")
                    .font(.headline)

                HStack(spacing: 12) {
                    Image("mascota")                               // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 56)
                        .cornerRadius(10)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Firulais")                           // ✏️ título
                            .font(.headline)
                        Text("Perro · 3 años")                     // ✏️ subtítulo
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Text("$350")                                   // ✏️ valor
                        .font(.headline)
                        .foregroundStyle(.purple)
                }
                .padding()
                .background(Color.purple.opacity(0.08))
                .cornerRadius(14)

                // ── 4. Tabla: columnas alineadas + color alternado ──────
                // Cada columna tiene un .frame de ancho FIJO (o maxWidth en la
                // primera), igual en el encabezado y en los renglones. Así
                // todas las columnas quedan alineadas.
                Text("4. Tabla con columnas alineadas")
                    .font(.headline)

                VStack(spacing: 0) {
                    // Encabezado de la tabla
                    HStack {
                        Text("Nombre")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Goles")
                            .frame(width: 60, alignment: .trailing)
                        Text("Promedio")
                            .frame(width: 90, alignment: .trailing)
                    }
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.purple)

                    // Renglones. Usamos el índice para saber si es par o impar.
                    // ⚠️ NO VISTO EN CLASE: ForEach repite el HStack por cada fila.
                    ForEach(0..<filasTabla.count, id: \.self) { indice in
                        HStack {
                            Text(filasTabla[indice].nombre)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(filasTabla[indice].goles)")
                                .frame(width: 60, alignment: .trailing)
                            Text("\(filasTabla[indice].promedio, specifier: "%.1f")")
                                .frame(width: 90, alignment: .trailing)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        // Par → morado clarito, impar → sin color (efecto "cebra").
                        .background(indice % 2 == 0 ? Color.purple.opacity(0.08) : Color.clear)
                    }
                }
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.purple.opacity(0.4), lineWidth: 1)
                )
            }
            .padding()
        }
    }
}

#Preview {
    RenglonesView()
}
