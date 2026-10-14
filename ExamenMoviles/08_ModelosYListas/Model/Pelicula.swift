// ═══════════════════════════════════════════════════════════════
//  Pelicula.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Modelo Codable + función que LEE un archivo .json que viene DENTRO de la app.
//  ÚSALO PARA: si el examen te da los datos en un archivo .json (sin internet).
//  BUSCA:      json local, archivo json, bundle, Bundle.main, leer json, cargar json, decodable, recurso
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/Pelicula.swift.
//   2. Pega el archivo completo.
//   3. Arrastra tu archivo .json a Xcode (marca "Copy items if needed" y tu target).
//   4. Cambia lo marcado con ✏️ (nombre del archivo y campos).
//  NECESITA:   08_ModelosYListas/Model/peliculas.json  (o tu propio .json)
//  ⚠️ NO VISTO EN CLASE: Bundle.main.url(forResource:withExtension:), Data(contentsOf:)
// ═══════════════════════════════════════════════════════════════

import Foundation

// Los nombres de los campos deben ser IGUALES a las llaves del JSON:
//   { "id": 1, "titulo": "Coco", "anio": 2017, ... }
struct Pelicula: Codable, Identifiable {          // ✏️
    var id: Int
    var titulo: String
    var anio: Int
    var genero: String
    var calificacion: Double
    var imagen: String
}

func cargarPeliculasJSON() -> [Pelicula] {

    // ⚠️ NO VISTO EN CLASE: Bundle.main es "la carpeta de la app ya instalada".
    // Busca ahí peliculas.json. Si el archivo NO está en el target, regresa nil.
    guard let url = Bundle.main.url(forResource: "peliculas", withExtension: "json") else {   // ✏️ nombre del archivo SIN .json
        print("No se encontró peliculas.json. ¿Está agregado al target?")
        return []
    }

    do {
        // ⚠️ NO VISTO EN CLASE: Data(contentsOf:) lee el archivo completo.
        let data = try Data(contentsOf: url)
        // De aquí en adelante es igual que en la clase de GET.
        let jsonDecoder = JSONDecoder()
        let lista = try jsonDecoder.decode([Pelicula].self, from: data)
        return lista
    } catch {
        // Si un nombre de campo no coincide con el JSON, el error sale aquí.
        print("Error al leer el JSON: \(error)")
        return []
    }
}
