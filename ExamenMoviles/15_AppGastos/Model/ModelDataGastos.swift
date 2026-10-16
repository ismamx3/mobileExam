// ═══════════════════════════════════════════════════════════════
//  ModelDataGastos.swift  ·  15 App Gastos
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Los datos fijos de arranque: 14 gastos con fechas DISTINTAS
//              (hace 0, 1, 2… días), las categorías y los métodos de pago.
//  ÚSALO PARA: llenar tu app con datos de prueba que tengan fechas.
//  BUSCA:      ModelData, datos fijos, cargar, append, fecha hace dias,
//              DateComponents, Calendar, byAdding, restar dias, fechas distintas
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/ModelData.swift (Swift File).
//   2. Pega el archivo; cambia los datos marcados con ✏️.
//  NECESITA:   Model/GastoApp.swift
//  DE CLASE:   función que regresa Array<…> (Clase 10), forma con
//              lista.append(...) (tu tarea Movil2), sumar a una fecha con
//              DateComponents + Calendar.current.date(byAdding:to:) (Clase 3B).
//
//  OJO (error típico): configurar un DateFormatter o un DateComponents
//  (dateComponent.day = …) es CÓDIGO QUE SE EJECUTA, así que va DENTRO de
//  una función. Si lo pones suelto en el archivo, Xcode marca
//  "Expressions are not allowed at the top level".
// ═══════════════════════════════════════════════════════════════

import Foundation

// Opciones fijas (se usan en los Pickers y en las gráficas).
let categoriasGastos = ["Comida", "Transporte", "Escuela", "Diversión", "Otros"]   // ✏️
let metodosPagoGastos = ["Efectivo", "Tarjeta"]                                     // ✏️

// Regresa la fecha de hace N días (Clase 3B: "sumar a una fecha").
// Con un número NEGATIVO se va hacia atrás.
func fechaGastoHaceDias(dias: Int) -> Date {
    var dateComponent = DateComponents()
    dateComponent.day = -dias

    // date(byAdding:to:) regresa un OPCIONAL (la lámina lo dice), por eso if let.
    if let fecha = Calendar.current.date(byAdding: dateComponent, to: Date()) {
        return fecha
    }
    return Date()          // por si algo falla: hoy
}

func cargarGastosApp() -> Array<GastoApp> {
    var lista = Array<GastoApp>()

    lista.append(GastoApp(id: 1, concepto: "Tacos de trompo", monto: 145.50, categoria: "Comida",
                          fecha: fechaGastoHaceDias(dias: 0), metodoPago: "Efectivo"))
    lista.append(GastoApp(id: 2, concepto: "Camión a la escuela", monto: 24, categoria: "Transporte",
                          fecha: fechaGastoHaceDias(dias: 0), metodoPago: "Efectivo"))
    lista.append(GastoApp(id: 3, concepto: "Libro de cálculo", monto: 620, categoria: "Escuela",
                          fecha: fechaGastoHaceDias(dias: 1), metodoPago: "Tarjeta"))
    lista.append(GastoApp(id: 4, concepto: "Cine con amigos", monto: 210, categoria: "Diversión",
                          fecha: fechaGastoHaceDias(dias: 2), metodoPago: "Tarjeta"))
    lista.append(GastoApp(id: 5, concepto: "Café para estudiar", monto: 68, categoria: "Comida",
                          fecha: fechaGastoHaceDias(dias: 3), metodoPago: "Tarjeta"))
    lista.append(GastoApp(id: 6, concepto: "Uber de regreso", monto: 135, categoria: "Transporte",
                          fecha: fechaGastoHaceDias(dias: 4), metodoPago: "Tarjeta"))
    lista.append(GastoApp(id: 7, concepto: "Copias e impresiones", monto: 45, categoria: "Escuela",
                          fecha: fechaGastoHaceDias(dias: 5), metodoPago: "Efectivo"))
    lista.append(GastoApp(id: 8, concepto: "Hamburguesa doble", monto: 189, categoria: "Comida",
                          fecha: fechaGastoHaceDias(dias: 6), metodoPago: "Efectivo"))
    lista.append(GastoApp(id: 9, concepto: "Videojuego en oferta", monto: 399, categoria: "Diversión",
                          fecha: fechaGastoHaceDias(dias: 8), metodoPago: "Tarjeta"))
    lista.append(GastoApp(id: 10, concepto: "Recarga del celular", monto: 150, categoria: "Otros",
                          fecha: fechaGastoHaceDias(dias: 9), metodoPago: "Tarjeta"))
    lista.append(GastoApp(id: 11, concepto: "Gasolina", monto: 500, categoria: "Transporte",
                          fecha: fechaGastoHaceDias(dias: 11), metodoPago: "Tarjeta"))
    lista.append(GastoApp(id: 12, concepto: "Pizza el viernes", monto: 260, categoria: "Comida",
                          fecha: fechaGastoHaceDias(dias: 13), metodoPago: "Efectivo"))
    lista.append(GastoApp(id: 13, concepto: "Corte de cabello", monto: 180, categoria: "Otros",
                          fecha: fechaGastoHaceDias(dias: 16), metodoPago: "Efectivo"))
    lista.append(GastoApp(id: 14, concepto: "Concierto", monto: 950, categoria: "Diversión",
                          fecha: fechaGastoHaceDias(dias: 20), metodoPago: "Tarjeta"))

    return lista
}
