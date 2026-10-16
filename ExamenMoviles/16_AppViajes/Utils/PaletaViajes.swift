// ═══════════════════════════════════════════════════════════════
//  PaletaViajes.swift  ·  16 App Viajes
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La paleta de la app: es PaletaOceanoAnaloga de
//              12_Paletas, copiada y renombrada (esquema ANÁLOGO:
//              azul · turquesa · verde agua). Contraste ya revisado.
//  ÚSALO PARA: que todos los colores salgan de un solo lugar.
//              En cada vista:  let paleta = PaletaViajes()
//  BUSCA:      paleta viajes, colores, oceano, analoga
//
//  CÓMO COPIARLO:
//   1. Copia cualquier paleta de 12_Paletas/Paletas/ a Utils/.
//   2. Cámbiale el nombre del struct (aquí: PaletaViajes).
//  NECESITA:   import SwiftUI.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PaletaViajes {
    let fondo = Color(red: 240/255, green: 249/255, blue: 255/255)            // fondo de toda la pantalla
    let superficie = Color(red: 223/255, green: 243/255, blue: 251/255)       // tarjetas, renglones, campos
    let primario = Color(red: 3/255, green: 105/255, blue: 161/255)           // botones, íconos, pestaña seleccionada
    let secundario = Color(red: 13/255, green: 148/255, blue: 136/255)        // acentos, segundo botón
    let texto = Color(red: 12/255, green: 42/255, blue: 62/255)               // títulos y texto principal
    let textoSuave = Color(red: 54/255, green: 91/255, blue: 112/255)         // subtítulos, notas, fechas
    let textoSobrePrimario = Color(red: 255/255, green: 255/255, blue: 255/255)  // texto ENCIMA de un botón primario
}
