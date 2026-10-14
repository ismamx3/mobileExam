// ═══════════════════════════════════════════════════════════════
//  RegistroConFoto.swift  ·  10 Fotos y cámara  (MODELO)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     El struct de un registro que guarda texto + FOTO.
//  ÚSALO PARA: cualquier lista donde cada elemento lleva una foto
//              que el usuario toma o escoge (mascotas, reportes,
//              productos, evidencias...).
//  BUSCA:      modelo con foto, struct UIImage, Identifiable, UUID,
//              registro, model photo
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Model/RegistroConFoto.swift.
//   2. Pega el archivo completo.
//   3. Cambia los campos marcados con ✏️ (y el nombre del struct si
//      quieres, pero cámbialo también en las vistas).
//  NECESITA:   nada más. Lo usan RegistroConFotoRow, RegistroConFotoView,
//              NuevoRegistroConFotoView y DetalleRegistroConFotoView.
//  ⚠️ NO VISTO EN CLASE: guardar un UIImage dentro del modelo.
// ═══════════════════════════════════════════════════════════════

import UIKit    // UIImage vive en UIKit (Foundation no lo trae)

struct RegistroConFoto: Identifiable {
    let id = UUID()              // no hay un id natural, así que se genera uno
    var nombre: String           // ✏️ tus campos
    var descripcion: String      // ✏️

    // ⚠️ NO VISTO EN CLASE: en clase el modelo guarda un String con el
    // NOMBRE del asset. Aquí la foto la elige el usuario en tiempo real
    // (galería o cámara), no existe en Assets, así que se guarda la
    // imagen misma. Es opcional (?) porque puede no tener foto.
    var foto: UIImage?
}
