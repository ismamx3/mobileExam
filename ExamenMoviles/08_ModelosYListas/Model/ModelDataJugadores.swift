// ═══════════════════════════════════════════════════════════════
//  ModelDataJugadores.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Los DATOS FIJOS de la lista (el ModelData.swift de clase).
//              La clase pide 2 cosas en este archivo:
//                1) una función que regrese el arreglo: Array<Jugador>
//                2) una variable (var) que se inicialice con esa función.
//  ÚSALO PARA: llenar tu lista con datos de prueba sin internet.
//  BUSCA:      model data, ModelData, datos fijos, arreglo, array, Array<Jugador>,
//              cargar datos, lista inicial, listaJugadores, carga de los datos
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/ModelData.swift (así se llama en clase).
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️ (tus datos).
//  NECESITA:   08_ModelosYListas/Model/Jugador.swift
//              imágenes "foto1"…"foto4" en Assets (o cambia los nombres).
// ═══════════════════════════════════════════════════════════════

import Foundation

// ── 1. Función que regresa el arreglo (la lista) ─────────────────
// Array<Jugador> y [Jugador] significan lo mismo; en clase se escribe Array<Jugador>.
func cargarJugadores() -> Array<Jugador> {     // ✏️ nombre de la función
    return [
        // ✏️ tus datos (el id no se debe repetir)
        Jugador(id: 1, nombre: "Stephen", apellido: "Curry", numero: 30, estatura: 1.88, posicion: "Base", imagen: "foto1", esFavorito: true),
        Jugador(id: 2, nombre: "Luka", apellido: "Doncic", numero: 77, estatura: 2.01, posicion: "Base", imagen: "foto2", esFavorito: false),
        Jugador(id: 3, nombre: "Magic", apellido: "Johnson", numero: 32, estatura: 2.06, posicion: "Base", imagen: "foto3", esFavorito: false),
        Jugador(id: 4, nombre: "Michael", apellido: "Jordan", numero: 23, estatura: 1.98, posicion: "Alero", imagen: "foto4", esFavorito: true),
        Jugador(id: 5, nombre: "LeBron", apellido: "James", numero: 6, estatura: 2.06, posicion: "Alero", imagen: "foto1", esFavorito: false),
        Jugador(id: 6, nombre: "Kevin", apellido: "Durant", numero: 35, estatura: 2.11, posicion: "Alero", imagen: "foto2", esFavorito: false),
        Jugador(id: 7, nombre: "Nikola", apellido: "Jokic", numero: 15, estatura: 2.11, posicion: "Pívot", imagen: "foto3", esFavorito: true),
        Jugador(id: 8, nombre: "Shaquille", apellido: "O'Neal", numero: 34, estatura: 2.16, posicion: "Pívot", imagen: "foto4", esFavorito: false),
        Jugador(id: 9, nombre: "Victor", apellido: "Wembanyama", numero: 1, estatura: 2.24, posicion: "Pívot", imagen: "foto1", esFavorito: false)
    ]
}

// ── 2. Variable que se inicializa con la función (como en clase) ──
// Se usa directo en la lista:  List(listaJugadores) { jugadorItem in ... }
// Sirve para pantallas que solo LEEN (ListaSimpleView, ListaConDetalleView).
// Si la pantalla MODIFICA la lista (agregar, borrar, editar), mejor que la vista
// sea dueña de los datos con @State:
//     @State private var jugadores = cargarJugadores()
// (ver por qué en Views/ListaEditableView.swift).
var listaJugadores = cargarJugadores()          // ✏️ nombre de tu lista
