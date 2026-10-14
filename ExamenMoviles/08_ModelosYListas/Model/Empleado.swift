// ═══════════════════════════════════════════════════════════════
//  Empleado.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Modelo Codable + CustomStringConvertible, y funciones para
//              convertirlo a JSON / XML y para leerlo desde un JSON.
//  ÚSALO PARA: "convierte tu lista a JSON", "lee este JSON", imprimir bonito en consola.
//  BUSCA:      codable, json, encoder, decoder, JSONEncoder, JSONDecoder, plist, xml, CustomStringConvertible, description, print
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/Empleado.swift.
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   nada más.
//  ⚠️ NO VISTO EN CLASE: .outputFormatting = .prettyPrinted (JSON con saltos de línea)
// ═══════════════════════════════════════════════════════════════

import Foundation

// ── 1. El modelo ───────────────────────────────────────────────────
// Codable                 = se puede convertir a/desde JSON o XML (Plist).
// CustomStringConvertible = tú decides cómo se ve con print(empleado).
// Identifiable            = para poder usarlo en List.
struct Empleado: CustomStringConvertible, Codable, Identifiable {     // ✏️
    var id: Int
    var nombre: String
    var apellidos: String
    var depto: String

    var description: String {
        return "ID=\(id) NOMBRE = \(nombre) \(apellidos) (\(depto))"
    }
}

// ── 2. Datos de prueba ─────────────────────────────────────────────
func cargarEmpleados() -> [Empleado] {
    return [
        Empleado(id: 123, nombre: "Perla", apellidos: "Leal Flores", depto: "Ventas"),     // ✏️
        Empleado(id: 456, nombre: "Jorge", apellidos: "Garza Junco", depto: "Mercadotecnia"),
        Empleado(id: 789, nombre: "Ana", apellidos: "Ruiz Peña", depto: "Sistemas")
    ]
}

// ── 3. Arreglo → texto JSON ────────────────────────────────────────
// La conversión vive en Model/ (no dentro de la pantalla), como pide la clase.
func convertirEmpleadosAJSON(_ lista: [Empleado]) -> String {
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted     // ⚠️ solo para que se lea bonito
    do {
        let jsonData = try jsonEncoder.encode(lista)
        // if let en lugar de "!": si falla, no truena.
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        return "No se pudo convertir a texto."
    } catch {
        return "Error inesperado \(error)"
    }
}

// ── 4. Arreglo → texto XML (PropertyList) ──────────────────────────
func convertirEmpleadosAXML(_ lista: [Empleado]) -> String {
    let plistEncoder = PropertyListEncoder()
    plistEncoder.outputFormat = .xml
    do {
        let plistData = try plistEncoder.encode(lista)
        if let plistString = String(data: plistData, encoding: .utf8) {
            return plistString
        }
        return "No se pudo convertir a texto."
    } catch {
        return "Error inesperado \(error)"
    }
}

// ── 5. Texto JSON → arreglo (decodificar) ──────────────────────────
// [Empleado].self le dice al decoder que espere un ARREGLO.
// Los nombres de las llaves del JSON deben ser IGUALES a los del struct.
func leerEmpleadosDeJSON(_ texto: String) -> [Empleado] {
    if let data = texto.data(using: .utf8) {
        do {
            let jsonDecoder = JSONDecoder()
            let lista = try jsonDecoder.decode([Empleado].self, from: data)
            return lista
        } catch {
            print("Error al leer el JSON: \(error)")
        }
    }
    return []
}
