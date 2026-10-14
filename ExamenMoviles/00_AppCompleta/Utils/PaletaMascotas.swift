// ═══════════════════════════════════════════════════════════════
//  PaletaMascotas.swift  ·  00 App Completa
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Todos los colores de la app en un solo lugar.
//              Paleta MONOCROMÁTICA verde azulado.
//  ÚSALO PARA: cambiar el look de TODA la app tocando solo este archivo.
//  BUSCA:      paleta, colores, palette, color scheme, monocromatico,
//              contraste, tema, Utils, colores globales
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Utils/PaletaMascotas.swift.
//   2. Pega el archivo completo.
//   3. Cambia los números RGB marcados con ✏️
//      (códigos en flatuicolors.com, contraste en coolors.co/contrast-checker).
//  NECESITA:   nada más.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Monocromática = todos son el MISMO tono (verde azulado),
// solo cambia qué tan claro u oscuro es cada uno.
// Son `let` globales (sin static) para usarlos directo en cualquier vista:
//     .background(paletaFondo)     .foregroundStyle(paletaTexto)

// Fondo de todas las pantallas.  #F0F7F6
let paletaFondo = Color(red: 240/255, green: 247/255, blue: 246/255)          // ✏️

// Tarjetas y renglones. Blanco para que resalten sobre el fondo.  #FFFFFF
let paletaSuperficie = Color(red: 255/255, green: 255/255, blue: 255/255)     // ✏️

// Botones, íconos y barras de las gráficas.  #00796B
// Texto blanco sobre este color: contraste 5.3:1 (pasa AA, el mínimo es 4.5:1).
let paletaPrimario = Color(red: 0/255, green: 121/255, blue: 107/255)         // ✏️

// Versión clarita del primario: chips, círculos de ícono, 2º color de gráficas.  #B2DFDB
// paletaTexto sobre este color: 9.6:1.
let paletaPrimarioClaro = Color(red: 178/255, green: 223/255, blue: 219/255)  // ✏️

// Texto principal.  #00332E
// Contra paletaFondo: 12.8:1. Contra blanco: 13.9:1.
let paletaTexto = Color(red: 0/255, green: 51/255, blue: 46/255)              // ✏️

// Texto secundario (subtítulos, etiquetas).  #3D6B66
// Contra paletaFondo: 5.5:1. Contra blanco: 6.0:1.
let paletaTextoSuave = Color(red: 61/255, green: 107/255, blue: 102/255)      // ✏️
