// ═══════════════════════════════════════════════════════════════
//  SimboloSF.swift  ·  13 SF Symbols (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Son los modelos y las funciones que leen
//  los .json de esta carpeta para el catálogo de íconos.
//  Los datos salen de la lista oficial de SF Symbols que trae macOS
//  (nombres, categorías, palabras clave y desde qué iOS existe cada uno).
//  Es el mismo patrón de "cargar un .json del bundle" de
//  08_ModelosYListas/Views/JSONLocalView.swift.
// ═══════════════════════════════════════════════════════════════

import Foundation

struct SimboloSF: Codable, Identifiable {
    var nombre: String
    var categorias: [String]
    var palabras: [String]          // palabras clave en inglés (de Apple)
    var ios: String                 // desde qué versión de iOS existe
    var uso: String                 // para qué usarlo (en español); "" si no está en la guía

    var id: String {
        return nombre
    }

    // true si funciona en un proyecto con iOS 17
    var funcionaEnIOS17: Bool {
        if let version = Double(ios) {
            return version < 18
        }
        return true
    }
}

struct CategoriaSF: Codable, Identifiable {
    var clave: String
    var nombre: String
    var icono: String

    var id: String {
        return clave
    }
}

struct SimboloRecomendadoSF: Codable, Identifiable {
    var nombre: String
    var uso: String
    var ios: String

    var id: String {
        return nombre + uso
    }
}

struct SeccionSF: Codable, Identifiable {
    var seccion: String
    var simbolos: [SimboloRecomendadoSF]

    var id: String {
        return seccion
    }
}

func leerJSONSF(archivo: String) -> Data? {
    if let url = Bundle.main.url(forResource: archivo, withExtension: "json") {
        return try? Data(contentsOf: url)
    }
    return nil
}

func cargarSimbolosSF() -> [SimboloSF] {
    if let datos = leerJSONSF(archivo: "sfsymbols_todos"),
       let lista = try? JSONDecoder().decode([SimboloSF].self, from: datos) {
        return lista
    }
    return []
}

func cargarCategoriasSF() -> [CategoriaSF] {
    if let datos = leerJSONSF(archivo: "sfsymbols_categorias"),
       let lista = try? JSONDecoder().decode([CategoriaSF].self, from: datos) {
        return lista
    }
    return []
}

func cargarRecomendadosSF() -> [SeccionSF] {
    if let datos = leerJSONSF(archivo: "sfsymbols_recomendados"),
       let lista = try? JSONDecoder().decode([SeccionSF].self, from: datos) {
        return lista
    }
    return []
}
