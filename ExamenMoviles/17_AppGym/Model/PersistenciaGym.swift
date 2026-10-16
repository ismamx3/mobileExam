// ═══════════════════════════════════════════════════════════════
//  PersistenciaGym.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Guardar una LISTA completa para que NO se borre al cerrar
//              la app: la lista se convierte a JSON (texto) y ese JSON
//              se guarda en UserDefaults con una llave. Al abrir la app
//              se lee y se convierte de regreso a la lista.
//  ÚSALO PARA: que lo que agrega el usuario siga ahí la próxima vez
//              (tareas, gastos, antojos, entrenamientos…).
//  BUSCA:      guardar lista, persistencia, persistir, no se borre, UserDefaults,
//              JSONEncoder, JSONDecoder, Codable, AppStorage lista, save list
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/Persistencia.swift.
//   2. Pega el archivo y cambia EntrenamientoGym por tu modelo (✏️).
//      Tu modelo debe ser Codable:  struct X: Identifiable, Codable { … }
//   3. En la vista DUEÑA de la lista (la del TabView):
//        @State private var lista = cargarEntrenamientosGym()
//        .onChange(of: lista) { oldValue, newValue in
//            guardarEntrenamientosGym(newValue)
//        }
//      (.onChange(of: lista) pide que el modelo sea también Equatable.)
//  NECESITA:   Model/EntrenamientoGym.swift (Codable + Equatable) y
//              Model/ModelDataGym.swift (datos de ejemplo).
//  ⚠️ NO VISTO EN CLASE: guardar una LISTA en UserDefaults como JSON.
//     En clase se vio UserDefaults/@AppStorage para datos simples y
//     JSONEncoder/JSONDecoder por separado; aquí se juntan las dos cosas.
//     Cómo defenderlo: "UserDefaults solo guarda tipos simples (String,
//     Int, Bool, Double, Data); por eso convierto la lista a JSON (Data)
//     con Codable y guardo esos datos con una llave".
// ═══════════════════════════════════════════════════════════════
//
//  ¿QUÉ GUARDAR DÓNDE? (tabla de la clase de persistencia)
//   @State                    → temporal: se pierde al cerrar la app.
//   UserDefaults/@AppStorage  → preferencias y datos chicos (esta lista
//                               de entrenamientos es chica: está bien).
//   Keychain                  → contraseñas y tokens. NUNCA en UserDefaults:
//                               ahí se guarda en texto claro.
//   SwiftData / CoreData      → muchos datos con estructura (no se practicó).
// ═══════════════════════════════════════════════════════════════

import Foundation

// La llave es el "nombre del cajón" donde se guarda. Debe ser la misma
// al guardar y al leer.
let llaveEntrenamientosGym = "entrenamientosGym"                    // ✏️

// ── 1. Guardar: lista → JSON (Data) → UserDefaults ─────────────────
func guardarEntrenamientosGym(_ lista: [EntrenamientoGym]) {
    // try? = si la conversión falla, regresa nil en vez de tronar.
    if let datos = try? JSONEncoder().encode(lista) {
        UserDefaults.standard.set(datos, forKey: llaveEntrenamientosGym)
    }
}

// ── 2. Cargar: UserDefaults → JSON (Data) → lista ──────────────────
// Si todavía no hay nada guardado (primera vez), regresa los datos
// de ejemplo de ModelDataGym.
func cargarEntrenamientosGym() -> [EntrenamientoGym] {
    if let datos = UserDefaults.standard.data(forKey: llaveEntrenamientosGym),
       let lista = try? JSONDecoder().decode([EntrenamientoGym].self, from: datos) {
        return lista
    }
    return cargarEntrenamientosEjemploGym()
}

// ── 3. Borrar lo guardado (para empezar de cero) ───────────────────
func borrarEntrenamientosGuardadosGym() {
    UserDefaults.standard.removeObject(forKey: llaveEntrenamientosGym)
}
