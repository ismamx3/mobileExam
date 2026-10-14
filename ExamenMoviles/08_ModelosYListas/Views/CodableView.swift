// ═══════════════════════════════════════════════════════════════
//  CodableView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla que convierte una lista a JSON / XML y lee un JSON a lista.
//  ÚSALO PARA: ver el resultado de Codable en pantalla (y en consola con print).
//  BUSCA:      codable, json, xml, plist, encoder, decoder, decodificar, codificar, monoespaciado, print
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/CodableView.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Empleado.swift (modelo + funciones de conversión)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct CodableView: View {

    @State private var empleados = cargarEmpleados()            // ✏️
    @State private var resultado = "Toca un botón para ver el resultado."

    // Un JSON escrito a mano (como si viniera de un API o archivo).
    // """ permite escribir texto de varias líneas.
    let textoJSON = """
    [
      { "id": 1, "nombre": "Luis", "apellidos": "Mora Díaz", "depto": "Finanzas" },
      { "id": 2, "nombre": "Sofía", "apellidos": "Cantú Ríos", "depto": "Diseño" }
    ]
    """                                                          // ✏️

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {

                // ── 1. Codificar: lista → JSON ───────────────────────
                Button {
                    resultado = convertirEmpleadosAJSON(empleados)
                    print(resultado)
                } label: {
                    Text("Lista → JSON")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)

                // ── 2. Codificar: lista → XML (Plist) ────────────────
                Button {
                    resultado = convertirEmpleadosAXML(empleados)
                    print(resultado)
                } label: {
                    Text("Lista → XML (Plist)")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)

                // ── 3. Decodificar: JSON → lista ─────────────────────
                Button {
                    let leidos = leerEmpleadosDeJSON(textoJSON)
                    // Los agregamos a la lista que ya teníamos.
                    for empleado in leidos {
                        empleados.append(empleado)
                    }
                    resultado = "Se leyeron \(leidos.count) empleados del JSON. Ahora hay \(empleados.count)."
                } label: {
                    Text("JSON → lista (agregar)")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.bordered)
                .tint(.purple)

                // ── 4. CustomStringConvertible: print bonito ─────────
                Button {
                    var texto = ""
                    for empleado in empleados {
                        print(empleado)                 // usa description
                        texto += empleado.description + "\n"
                    }
                    resultado = texto
                } label: {
                    Text("Ver description de cada uno")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.bordered)
                .tint(.indigo)

                // ── 5. Mostrar el resultado en letra monoespaciada ───
                Text("Resultado")
                    .font(.headline)
                Text(resultado)
                    .font(.system(size: 13, design: .monospaced))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .navigationTitle("Codable y JSON")                       // ✏️
    }
}

#Preview {
    NavigationStack {
        CodableView()
    }
}
