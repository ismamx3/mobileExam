// ═══════════════════════════════════════════════════════════════
//  ModelDataMascotas.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Los datos fijos con los que arranca la app
//              y las opciones del Picker de especie.
//  ÚSALO PARA: llenar tu lista con datos de prueba sin internet.
//  BUSCA:      datos fijos, ModelData, arreglo, array, lista inicial,
//              cargar datos, opciones picker, append
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/ModelDataMascotas.swift.
//   2. Pega el archivo completo.
//   3. Cambia los datos marcados con ✏️
//  NECESITA:   Model/Mascota.swift
// ═══════════════════════════════════════════════════════════════

import Foundation

// Opciones de especie. Se usan en DOS lugares:
//  - el Picker de AgregarMascotaView
//  - la gráfica de barras de EstadisticasMascotasView
// Por eso viven aquí: si agregas una especie, se agrega en los dos.
let especiesMascotas = ["Perro", "Gato", "Ave", "Pez", "Conejo"]     // ✏️

// Función que devuelve el arreglo. La vista dueña de los datos
// (AppCompletaView) la llama UNA vez en su @State.
func cargarMascotas() -> Array<Mascota> {

    var lista = Array<Mascota>()

    // ✏️ tus datos de prueba
    lista.append(Mascota(
        id: 1,
        nombre: "Firulais",
        especie: "Perro",
        edad: 4,
        peso: 12.5,
        imagen: "mascota",
        vacunada: true))

    lista.append(Mascota(
        id: 2,
        nombre: "Michi",
        especie: "Gato",
        edad: 2,
        peso: 4.2,
        imagen: "",
        vacunada: true))

    lista.append(Mascota(
        id: 3,
        nombre: "Kiwi",
        especie: "Ave",
        edad: 1,
        peso: 0.3,
        imagen: "",
        vacunada: false))

    lista.append(Mascota(
        id: 4,
        nombre: "Nemo",
        especie: "Pez",
        edad: 1,
        peso: 0.1,
        imagen: "",
        vacunada: true))

    lista.append(Mascota(
        id: 5,
        nombre: "Copito",
        especie: "Conejo",
        edad: 3,
        peso: 2.1,
        imagen: "",
        vacunada: false))

    lista.append(Mascota(
        id: 6,
        nombre: "Luna",
        especie: "Perro",
        edad: 7,
        peso: 20.0,
        imagen: "",
        vacunada: true))

    return lista
}
