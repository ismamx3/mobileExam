// ═══════════════════════════════════════════════════════════════
//  DestinoViajes.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El MODELO de un destino (struct Codable + Identifiable)
//              y la función que LEE los destinos desde un archivo .json
//              que viene DENTRO de la app (destinos_viajes.json).
//  ÚSALO PARA: cuando los datos de tu app vienen en un .json y no hay
//              internet (no se escriben a mano en ModelData).
//  BUSCA:      json, codable, decodable, JSONDecoder, Bundle.main, leer
//              json, cargar json, archivo json, do try catch, modelo destino
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/DestinoViajes.swift y pega esto.
//   2. Arrastra tu .json a Xcode → marca "Copy items if needed" y tu
//      TARGET (si no, Bundle.main no lo encuentra y la lista sale vacía).
//   3. Cambia lo marcado con ✏️ (campos y nombre del archivo).
//  NECESITA:   16_AppViajes/Model/destinos_viajes.json
//  ⚠️ NO VISTO EN CLASE: Bundle.main.url(forResource:withExtension:) y
//     Data(contentsOf:) (leer un archivo de la app). JSONDecoder y
//     do/try/catch SÍ se vieron (clase de servicios REST).
// ═══════════════════════════════════════════════════════════════

import Foundation

// REGLA DE ORO: cada propiedad se llama EXACTAMENTE igual que su llave
// en el JSON ("costoAproximado" en el JSON = costoAproximado aquí).
// Si una llave falta o se llama distinto, decode() falla y la lista
// sale vacía (el error se imprime en la consola).
struct DestinoViajes: Codable, Identifiable {          // ✏️
    var id: Int
    var nombre: String
    var estado: String
    var categoria: String           // Playa, Montaña, Ciudad, Pueblo Mágico, Naturaleza
    var descripcion: String
    var imagenes: [String]          // nombres de imágenes en Assets (no Image)
    var costoAproximado: Double     // por persona y por día, en pesos
    var calificacion: Int           // de 1 a 5
    var clima: String
    var favorito: Bool              // el JSON trae true/false; se cambia en el detalle

    // Propiedad calculada: la primera imagen sirve de portada.
    var imagenPrincipal: String {
        // ⚠️ NO VISTO EN CLASE: .first regresa un OPCIONAL (el arreglo
        // podría estar vacío), por eso va con if let.
        if let primera = imagenes.first {
            return primera
        }
        return "destino_playa"
    }

    // Propiedad calculada: ícono SF Symbol según la categoría.
    var iconoCategoria: String {
        switch categoria {
        case "Playa":
            return "beach.umbrella.fill"
        case "Montaña":
            return "mountain.2.fill"
        case "Ciudad":
            return "building.2.fill"
        case "Pueblo Mágico":
            return "sparkles"
        default:
            return "leaf.fill"
        }
    }
}

// Lee destinos_viajes.json y lo convierte en un arreglo de DestinoViajes.
// Todo esto va DENTRO de una función: fuera de una función solo se puede
// declarar (let, var, func), no ejecutar instrucciones.
func cargarDestinosViajes() -> Array<DestinoViajes> {

    // PASO 1 ⚠️: buscar el archivo dentro de la app instalada (el "bundle").
    // Regresa un OPCIONAL: nil si el .json no está en el target.
    if let url = Bundle.main.url(forResource: "destinos_viajes", withExtension: "json") {   // ✏️ nombre SIN .json
        do {
            // PASO 2 ⚠️: leer todo el archivo como datos (bytes).
            let data = try Data(contentsOf: url)

            // PASO 3: convertir el JSON a structs (igual que en la clase de REST).
            // [DestinoViajes] porque el JSON empieza con [ … ] (es un arreglo).
            let jsonDecoder = JSONDecoder()
            let lista = try jsonDecoder.decode(Array<DestinoViajes>.self, from: data)
            return lista
        } catch {
            // Si un nombre no coincide o el JSON está mal escrito, cae aquí.
            print("Error al leer destinos_viajes.json: \(error)")
            return []
        }
    } else {
        print("No se encontró destinos_viajes.json. ¿Está agregado al target?")
        return []
    }
}

// Un destino fijo para los #Preview (así el preview no depende del JSON).
func destinoDePruebaViajes() -> DestinoViajes {
    return DestinoViajes(
        id: 99,
        nombre: "Tulum",
        estado: "Quintana Roo",
        categoria: "Playa",
        descripcion: "Playas de arena blanca, mar turquesa y ruinas mayas frente al Caribe.",
        imagenes: ["destino_playa", "foto2", "destino_cascada"],
        costoAproximado: 2200,
        calificacion: 5,
        clima: "Cálido",
        favorito: true)
}
