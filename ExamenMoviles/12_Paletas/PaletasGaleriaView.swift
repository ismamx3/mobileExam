// ═══════════════════════════════════════════════════════════════
//  PaletasGaleriaView.swift  ·  12 Paletas (menú del repo)
// ───────────────────────────────────────────────────────────────
//  NO NECESITAS COPIAR ESTO. Es la galería para VER las 25 paletas
//  y elegir una. Al tocar una, se abre una mini app pintada con ella.
//  Archivo generado: cada paleta vive en 12_Paletas/Paletas/.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct PaletasGaleriaView: View {
    var body: some View {
        List {
            Section {
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Morado", archivo: "PaletaMoradoMonocromatica", fondo: PaletaMoradoMonocromatica().fondo, superficie: PaletaMoradoMonocromatica().superficie, primario: PaletaMoradoMonocromatica().primario, secundario: PaletaMoradoMonocromatica().secundario, texto: PaletaMoradoMonocromatica().texto, textoSuave: PaletaMoradoMonocromatica().textoSuave, textoSobrePrimario: PaletaMoradoMonocromatica().textoSobrePrimario, graficas: PaletaMoradoMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Morado", detalle: "Monocromática · Claro · PaletaMoradoMonocromatica", ideal: "Apps de estudio, música, tareas, cualquier tema", fondo: PaletaMoradoMonocromatica().fondo, superficie: PaletaMoradoMonocromatica().superficie, primario: PaletaMoradoMonocromatica().primario, secundario: PaletaMoradoMonocromatica().secundario, texto: PaletaMoradoMonocromatica().texto, textoSuave: PaletaMoradoMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Azul", archivo: "PaletaAzulMonocromatica", fondo: PaletaAzulMonocromatica().fondo, superficie: PaletaAzulMonocromatica().superficie, primario: PaletaAzulMonocromatica().primario, secundario: PaletaAzulMonocromatica().secundario, texto: PaletaAzulMonocromatica().texto, textoSuave: PaletaAzulMonocromatica().textoSuave, textoSobrePrimario: PaletaAzulMonocromatica().textoSobrePrimario, graficas: PaletaAzulMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Azul", detalle: "Monocromática · Claro · PaletaAzulMonocromatica", ideal: "Viajes, clima, finanzas, salud, apps serias", fondo: PaletaAzulMonocromatica().fondo, superficie: PaletaAzulMonocromatica().superficie, primario: PaletaAzulMonocromatica().primario, secundario: PaletaAzulMonocromatica().secundario, texto: PaletaAzulMonocromatica().texto, textoSuave: PaletaAzulMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Verde", archivo: "PaletaVerdeMonocromatica", fondo: PaletaVerdeMonocromatica().fondo, superficie: PaletaVerdeMonocromatica().superficie, primario: PaletaVerdeMonocromatica().primario, secundario: PaletaVerdeMonocromatica().secundario, texto: PaletaVerdeMonocromatica().texto, textoSuave: PaletaVerdeMonocromatica().textoSuave, textoSobrePrimario: PaletaVerdeMonocromatica().textoSobrePrimario, graficas: PaletaVerdeMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Verde", detalle: "Monocromática · Claro · PaletaVerdeMonocromatica", ideal: "Plantas, salud, gym, finanzas, ecología", fondo: PaletaVerdeMonocromatica().fondo, superficie: PaletaVerdeMonocromatica().superficie, primario: PaletaVerdeMonocromatica().primario, secundario: PaletaVerdeMonocromatica().secundario, texto: PaletaVerdeMonocromatica().texto, textoSuave: PaletaVerdeMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Rojo", archivo: "PaletaRojoMonocromatica", fondo: PaletaRojoMonocromatica().fondo, superficie: PaletaRojoMonocromatica().superficie, primario: PaletaRojoMonocromatica().primario, secundario: PaletaRojoMonocromatica().secundario, texto: PaletaRojoMonocromatica().texto, textoSuave: PaletaRojoMonocromatica().textoSuave, textoSobrePrimario: PaletaRojoMonocromatica().textoSobrePrimario, graficas: PaletaRojoMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Rojo", detalle: "Monocromática · Claro · PaletaRojoMonocromatica", ideal: "Comida, deportes, películas, alertas", fondo: PaletaRojoMonocromatica().fondo, superficie: PaletaRojoMonocromatica().superficie, primario: PaletaRojoMonocromatica().primario, secundario: PaletaRojoMonocromatica().secundario, texto: PaletaRojoMonocromatica().texto, textoSuave: PaletaRojoMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Naranja", archivo: "PaletaNaranjaMonocromatica", fondo: PaletaNaranjaMonocromatica().fondo, superficie: PaletaNaranjaMonocromatica().superficie, primario: PaletaNaranjaMonocromatica().primario, secundario: PaletaNaranjaMonocromatica().secundario, texto: PaletaNaranjaMonocromatica().texto, textoSuave: PaletaNaranjaMonocromatica().textoSuave, textoSobrePrimario: PaletaNaranjaMonocromatica().textoSobrePrimario, graficas: PaletaNaranjaMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Naranja", detalle: "Monocromática · Claro · PaletaNaranjaMonocromatica", ideal: "Comida, antojos, mascotas, apps alegres", fondo: PaletaNaranjaMonocromatica().fondo, superficie: PaletaNaranjaMonocromatica().superficie, primario: PaletaNaranjaMonocromatica().primario, secundario: PaletaNaranjaMonocromatica().secundario, texto: PaletaNaranjaMonocromatica().texto, textoSuave: PaletaNaranjaMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Rosa", archivo: "PaletaRosaMonocromatica", fondo: PaletaRosaMonocromatica().fondo, superficie: PaletaRosaMonocromatica().superficie, primario: PaletaRosaMonocromatica().primario, secundario: PaletaRosaMonocromatica().secundario, texto: PaletaRosaMonocromatica().texto, textoSuave: PaletaRosaMonocromatica().textoSuave, textoSobrePrimario: PaletaRosaMonocromatica().textoSobrePrimario, graficas: PaletaRosaMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Rosa", detalle: "Monocromática · Claro · PaletaRosaMonocromatica", ideal: "Postres, belleza, regalos, música pop", fondo: PaletaRosaMonocromatica().fondo, superficie: PaletaRosaMonocromatica().superficie, primario: PaletaRosaMonocromatica().primario, secundario: PaletaRosaMonocromatica().secundario, texto: PaletaRosaMonocromatica().texto, textoSuave: PaletaRosaMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Turquesa", archivo: "PaletaTurquesaMonocromatica", fondo: PaletaTurquesaMonocromatica().fondo, superficie: PaletaTurquesaMonocromatica().superficie, primario: PaletaTurquesaMonocromatica().primario, secundario: PaletaTurquesaMonocromatica().secundario, texto: PaletaTurquesaMonocromatica().texto, textoSuave: PaletaTurquesaMonocromatica().textoSuave, textoSobrePrimario: PaletaTurquesaMonocromatica().textoSobrePrimario, graficas: PaletaTurquesaMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Turquesa", detalle: "Monocromática · Claro · PaletaTurquesaMonocromatica", ideal: "Playa, viajes, salud, agua", fondo: PaletaTurquesaMonocromatica().fondo, superficie: PaletaTurquesaMonocromatica().superficie, primario: PaletaTurquesaMonocromatica().primario, secundario: PaletaTurquesaMonocromatica().secundario, texto: PaletaTurquesaMonocromatica().texto, textoSuave: PaletaTurquesaMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Café", archivo: "PaletaCafeMonocromatica", fondo: PaletaCafeMonocromatica().fondo, superficie: PaletaCafeMonocromatica().superficie, primario: PaletaCafeMonocromatica().primario, secundario: PaletaCafeMonocromatica().secundario, texto: PaletaCafeMonocromatica().texto, textoSuave: PaletaCafeMonocromatica().textoSuave, textoSobrePrimario: PaletaCafeMonocromatica().textoSobrePrimario, graficas: PaletaCafeMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Café", detalle: "Monocromática · Claro · PaletaCafeMonocromatica", ideal: "Cafeterías, libros, recetas, madera", fondo: PaletaCafeMonocromatica().fondo, superficie: PaletaCafeMonocromatica().superficie, primario: PaletaCafeMonocromatica().primario, secundario: PaletaCafeMonocromatica().secundario, texto: PaletaCafeMonocromatica().texto, textoSuave: PaletaCafeMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Gris", archivo: "PaletaGrisMonocromatica", fondo: PaletaGrisMonocromatica().fondo, superficie: PaletaGrisMonocromatica().superficie, primario: PaletaGrisMonocromatica().primario, secundario: PaletaGrisMonocromatica().secundario, texto: PaletaGrisMonocromatica().texto, textoSuave: PaletaGrisMonocromatica().textoSuave, textoSobrePrimario: PaletaGrisMonocromatica().textoSobrePrimario, graficas: PaletaGrisMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Gris", detalle: "Monocromática · Claro · PaletaGrisMonocromatica", ideal: "Apps serias, herramientas, tecnología, minimalista", fondo: PaletaGrisMonocromatica().fondo, superficie: PaletaGrisMonocromatica().superficie, primario: PaletaGrisMonocromatica().primario, secundario: PaletaGrisMonocromatica().secundario, texto: PaletaGrisMonocromatica().texto, textoSuave: PaletaGrisMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Amarillo / mostaza", archivo: "PaletaAmarilloMonocromatica", fondo: PaletaAmarilloMonocromatica().fondo, superficie: PaletaAmarilloMonocromatica().superficie, primario: PaletaAmarilloMonocromatica().primario, secundario: PaletaAmarilloMonocromatica().secundario, texto: PaletaAmarilloMonocromatica().texto, textoSuave: PaletaAmarilloMonocromatica().textoSuave, textoSobrePrimario: PaletaAmarilloMonocromatica().textoSobrePrimario, graficas: PaletaAmarilloMonocromatica().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Amarillo / mostaza", detalle: "Monocromática · Claro · PaletaAmarilloMonocromatica", ideal: "Comida rápida, verano, ideas, niños", fondo: PaletaAmarilloMonocromatica().fondo, superficie: PaletaAmarilloMonocromatica().superficie, primario: PaletaAmarilloMonocromatica().primario, secundario: PaletaAmarilloMonocromatica().secundario, texto: PaletaAmarilloMonocromatica().texto, textoSuave: PaletaAmarilloMonocromatica().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Atardecer (rojo · naranja · ámbar)", archivo: "PaletaAtardecerAnaloga", fondo: PaletaAtardecerAnaloga().fondo, superficie: PaletaAtardecerAnaloga().superficie, primario: PaletaAtardecerAnaloga().primario, secundario: PaletaAtardecerAnaloga().secundario, texto: PaletaAtardecerAnaloga().texto, textoSuave: PaletaAtardecerAnaloga().textoSuave, textoSobrePrimario: PaletaAtardecerAnaloga().textoSobrePrimario, graficas: PaletaAtardecerAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Atardecer (rojo · naranja · ámbar)", detalle: "Análoga · Claro · PaletaAtardecerAnaloga", ideal: "Antojos, eventos, conciertos, fotos de viajes", fondo: PaletaAtardecerAnaloga().fondo, superficie: PaletaAtardecerAnaloga().superficie, primario: PaletaAtardecerAnaloga().primario, secundario: PaletaAtardecerAnaloga().secundario, texto: PaletaAtardecerAnaloga().texto, textoSuave: PaletaAtardecerAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Océano (azul · turquesa · verde agua)", archivo: "PaletaOceanoAnaloga", fondo: PaletaOceanoAnaloga().fondo, superficie: PaletaOceanoAnaloga().superficie, primario: PaletaOceanoAnaloga().primario, secundario: PaletaOceanoAnaloga().secundario, texto: PaletaOceanoAnaloga().texto, textoSuave: PaletaOceanoAnaloga().textoSuave, textoSobrePrimario: PaletaOceanoAnaloga().textoSobrePrimario, graficas: PaletaOceanoAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Océano (azul · turquesa · verde agua)", detalle: "Análoga · Claro · PaletaOceanoAnaloga", ideal: "Viajes, playa, clima, salud", fondo: PaletaOceanoAnaloga().fondo, superficie: PaletaOceanoAnaloga().superficie, primario: PaletaOceanoAnaloga().primario, secundario: PaletaOceanoAnaloga().secundario, texto: PaletaOceanoAnaloga().texto, textoSuave: PaletaOceanoAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Bosque (verde olivo · verde · turquesa)", archivo: "PaletaBosqueAnaloga", fondo: PaletaBosqueAnaloga().fondo, superficie: PaletaBosqueAnaloga().superficie, primario: PaletaBosqueAnaloga().primario, secundario: PaletaBosqueAnaloga().secundario, texto: PaletaBosqueAnaloga().texto, textoSuave: PaletaBosqueAnaloga().textoSuave, textoSobrePrimario: PaletaBosqueAnaloga().textoSobrePrimario, graficas: PaletaBosqueAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Bosque (verde olivo · verde · turquesa)", detalle: "Análoga · Claro · PaletaBosqueAnaloga", ideal: "Naturaleza, plantas, senderismo, ecología", fondo: PaletaBosqueAnaloga().fondo, superficie: PaletaBosqueAnaloga().superficie, primario: PaletaBosqueAnaloga().primario, secundario: PaletaBosqueAnaloga().secundario, texto: PaletaBosqueAnaloga().texto, textoSuave: PaletaBosqueAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Uva (índigo · morado · magenta)", archivo: "PaletaUvaAnaloga", fondo: PaletaUvaAnaloga().fondo, superficie: PaletaUvaAnaloga().superficie, primario: PaletaUvaAnaloga().primario, secundario: PaletaUvaAnaloga().secundario, texto: PaletaUvaAnaloga().texto, textoSuave: PaletaUvaAnaloga().textoSuave, textoSobrePrimario: PaletaUvaAnaloga().textoSobrePrimario, graficas: PaletaUvaAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Uva (índigo · morado · magenta)", detalle: "Análoga · Claro · PaletaUvaAnaloga", ideal: "Música, fiestas, videojuegos, arte", fondo: PaletaUvaAnaloga().fondo, superficie: PaletaUvaAnaloga().superficie, primario: PaletaUvaAnaloga().primario, secundario: PaletaUvaAnaloga().secundario, texto: PaletaUvaAnaloga().texto, textoSuave: PaletaUvaAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Frutos rojos (rojo · frambuesa · rosa)", archivo: "PaletaFrutosRojosAnaloga", fondo: PaletaFrutosRojosAnaloga().fondo, superficie: PaletaFrutosRojosAnaloga().superficie, primario: PaletaFrutosRojosAnaloga().primario, secundario: PaletaFrutosRojosAnaloga().secundario, texto: PaletaFrutosRojosAnaloga().texto, textoSuave: PaletaFrutosRojosAnaloga().textoSuave, textoSobrePrimario: PaletaFrutosRojosAnaloga().textoSobrePrimario, graficas: PaletaFrutosRojosAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Frutos rojos (rojo · frambuesa · rosa)", detalle: "Análoga · Claro · PaletaFrutosRojosAnaloga", ideal: "Postres, cafeterías, San Valentín, belleza", fondo: PaletaFrutosRojosAnaloga().fondo, superficie: PaletaFrutosRojosAnaloga().superficie, primario: PaletaFrutosRojosAnaloga().primario, secundario: PaletaFrutosRojosAnaloga().secundario, texto: PaletaFrutosRojosAnaloga().texto, textoSuave: PaletaFrutosRojosAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Cítrico (verde lima · olivo · mostaza)", archivo: "PaletaCitricoAnaloga", fondo: PaletaCitricoAnaloga().fondo, superficie: PaletaCitricoAnaloga().superficie, primario: PaletaCitricoAnaloga().primario, secundario: PaletaCitricoAnaloga().secundario, texto: PaletaCitricoAnaloga().texto, textoSuave: PaletaCitricoAnaloga().textoSuave, textoSobrePrimario: PaletaCitricoAnaloga().textoSobrePrimario, graficas: PaletaCitricoAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Cítrico (verde lima · olivo · mostaza)", detalle: "Análoga · Claro · PaletaCitricoAnaloga", ideal: "Jugos, comida saludable, gym, primavera", fondo: PaletaCitricoAnaloga().fondo, superficie: PaletaCitricoAnaloga().superficie, primario: PaletaCitricoAnaloga().primario, secundario: PaletaCitricoAnaloga().secundario, texto: PaletaCitricoAnaloga().texto, textoSuave: PaletaCitricoAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Taquería (chile · naranja · maíz)", archivo: "PaletaTaqueriaAnaloga", fondo: PaletaTaqueriaAnaloga().fondo, superficie: PaletaTaqueriaAnaloga().superficie, primario: PaletaTaqueriaAnaloga().primario, secundario: PaletaTaqueriaAnaloga().secundario, texto: PaletaTaqueriaAnaloga().texto, textoSuave: PaletaTaqueriaAnaloga().textoSuave, textoSobrePrimario: PaletaTaqueriaAnaloga().textoSobrePrimario, graficas: PaletaTaqueriaAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Taquería (chile · naranja · maíz)", detalle: "Análoga · Claro · PaletaTaqueriaAnaloga", ideal: "Antojos de Monterrey, tacos, comida mexicana", fondo: PaletaTaqueriaAnaloga().fondo, superficie: PaletaTaqueriaAnaloga().superficie, primario: PaletaTaqueriaAnaloga().primario, secundario: PaletaTaqueriaAnaloga().secundario, texto: PaletaTaqueriaAnaloga().texto, textoSuave: PaletaTaqueriaAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Cafetería (café · caramelo · naranja tostado)", archivo: "PaletaCafeteriaAnaloga", fondo: PaletaCafeteriaAnaloga().fondo, superficie: PaletaCafeteriaAnaloga().superficie, primario: PaletaCafeteriaAnaloga().primario, secundario: PaletaCafeteriaAnaloga().secundario, texto: PaletaCafeteriaAnaloga().texto, textoSuave: PaletaCafeteriaAnaloga().textoSuave, textoSobrePrimario: PaletaCafeteriaAnaloga().textoSobrePrimario, graficas: PaletaCafeteriaAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Cafetería (café · caramelo · naranja tostado)", detalle: "Análoga · Claro · PaletaCafeteriaAnaloga", ideal: "Cafés, panaderías, libros, lugares para estudiar", fondo: PaletaCafeteriaAnaloga().fondo, superficie: PaletaCafeteriaAnaloga().superficie, primario: PaletaCafeteriaAnaloga().primario, secundario: PaletaCafeteriaAnaloga().secundario, texto: PaletaCafeteriaAnaloga().texto, textoSuave: PaletaCafeteriaAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Lavanda (azul periwinkle · lavanda · lila)", archivo: "PaletaLavandaAnaloga", fondo: PaletaLavandaAnaloga().fondo, superficie: PaletaLavandaAnaloga().superficie, primario: PaletaLavandaAnaloga().primario, secundario: PaletaLavandaAnaloga().secundario, texto: PaletaLavandaAnaloga().texto, textoSuave: PaletaLavandaAnaloga().textoSuave, textoSobrePrimario: PaletaLavandaAnaloga().textoSobrePrimario, graficas: PaletaLavandaAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Lavanda (azul periwinkle · lavanda · lila)", detalle: "Análoga · Claro · PaletaLavandaAnaloga", ideal: "Bienestar, meditación, diarios, notas", fondo: PaletaLavandaAnaloga().fondo, superficie: PaletaLavandaAnaloga().superficie, primario: PaletaLavandaAnaloga().primario, secundario: PaletaLavandaAnaloga().secundario, texto: PaletaLavandaAnaloga().texto, textoSuave: PaletaLavandaAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Menta (esmeralda · verde agua · azul petróleo)", archivo: "PaletaMentaAnaloga", fondo: PaletaMentaAnaloga().fondo, superficie: PaletaMentaAnaloga().superficie, primario: PaletaMentaAnaloga().primario, secundario: PaletaMentaAnaloga().secundario, texto: PaletaMentaAnaloga().texto, textoSuave: PaletaMentaAnaloga().textoSuave, textoSobrePrimario: PaletaMentaAnaloga().textoSobrePrimario, graficas: PaletaMentaAnaloga().graficas, oscura: false)
                } label: {
                    FilaGaleriaPaleta(nombre: "Menta (esmeralda · verde agua · azul petróleo)", detalle: "Análoga · Claro · PaletaMentaAnaloga", ideal: "Salud, finanzas personales, hábitos, agua", fondo: PaletaMentaAnaloga().fondo, superficie: PaletaMentaAnaloga().superficie, primario: PaletaMentaAnaloga().primario, secundario: PaletaMentaAnaloga().secundario, texto: PaletaMentaAnaloga().texto, textoSuave: PaletaMentaAnaloga().textoSuave)
                }
            } header: {
                Text("Modo claro (20)")
            }

            Section {
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Noche azul", archivo: "PaletaNocheAzulOscura", fondo: PaletaNocheAzulOscura().fondo, superficie: PaletaNocheAzulOscura().superficie, primario: PaletaNocheAzulOscura().primario, secundario: PaletaNocheAzulOscura().secundario, texto: PaletaNocheAzulOscura().texto, textoSuave: PaletaNocheAzulOscura().textoSuave, textoSobrePrimario: PaletaNocheAzulOscura().textoSobrePrimario, graficas: PaletaNocheAzulOscura().graficas, oscura: true)
                } label: {
                    FilaGaleriaPaleta(nombre: "Noche azul", detalle: "Monocromática · Oscuro · PaletaNocheAzulOscura", ideal: "Watchlist, música, apps de noche, tecnología", fondo: PaletaNocheAzulOscura().fondo, superficie: PaletaNocheAzulOscura().superficie, primario: PaletaNocheAzulOscura().primario, secundario: PaletaNocheAzulOscura().secundario, texto: PaletaNocheAzulOscura().texto, textoSuave: PaletaNocheAzulOscura().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Morado oscuro", archivo: "PaletaMoradoOscura", fondo: PaletaMoradoOscura().fondo, superficie: PaletaMoradoOscura().superficie, primario: PaletaMoradoOscura().primario, secundario: PaletaMoradoOscura().secundario, texto: PaletaMoradoOscura().texto, textoSuave: PaletaMoradoOscura().textoSuave, textoSobrePrimario: PaletaMoradoOscura().textoSobrePrimario, graficas: PaletaMoradoOscura().graficas, oscura: true)
                } label: {
                    FilaGaleriaPaleta(nombre: "Morado oscuro", detalle: "Monocromática · Oscuro · PaletaMoradoOscura", ideal: "Videojuegos, música, fiestas, cine", fondo: PaletaMoradoOscura().fondo, superficie: PaletaMoradoOscura().superficie, primario: PaletaMoradoOscura().primario, secundario: PaletaMoradoOscura().secundario, texto: PaletaMoradoOscura().texto, textoSuave: PaletaMoradoOscura().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Gym neón", archivo: "PaletaGymNeonOscura", fondo: PaletaGymNeonOscura().fondo, superficie: PaletaGymNeonOscura().superficie, primario: PaletaGymNeonOscura().primario, secundario: PaletaGymNeonOscura().secundario, texto: PaletaGymNeonOscura().texto, textoSuave: PaletaGymNeonOscura().textoSuave, textoSobrePrimario: PaletaGymNeonOscura().textoSobrePrimario, graficas: PaletaGymNeonOscura().graficas, oscura: true)
                } label: {
                    FilaGaleriaPaleta(nombre: "Gym neón", detalle: "Monocromática · Oscuro · PaletaGymNeonOscura", ideal: "Gimnasio, deportes, rutinas, hábitos", fondo: PaletaGymNeonOscura().fondo, superficie: PaletaGymNeonOscura().superficie, primario: PaletaGymNeonOscura().primario, secundario: PaletaGymNeonOscura().secundario, texto: PaletaGymNeonOscura().texto, textoSuave: PaletaGymNeonOscura().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Cine (rojo · coral · naranja)", archivo: "PaletaCineOscuraAnaloga", fondo: PaletaCineOscuraAnaloga().fondo, superficie: PaletaCineOscuraAnaloga().superficie, primario: PaletaCineOscuraAnaloga().primario, secundario: PaletaCineOscuraAnaloga().secundario, texto: PaletaCineOscuraAnaloga().texto, textoSuave: PaletaCineOscuraAnaloga().textoSuave, textoSobrePrimario: PaletaCineOscuraAnaloga().textoSobrePrimario, graficas: PaletaCineOscuraAnaloga().graficas, oscura: true)
                } label: {
                    FilaGaleriaPaleta(nombre: "Cine (rojo · coral · naranja)", detalle: "Análoga · Oscuro · PaletaCineOscuraAnaloga", ideal: "Películas, series, watchlist, eventos", fondo: PaletaCineOscuraAnaloga().fondo, superficie: PaletaCineOscuraAnaloga().superficie, primario: PaletaCineOscuraAnaloga().primario, secundario: PaletaCineOscuraAnaloga().secundario, texto: PaletaCineOscuraAnaloga().texto, textoSuave: PaletaCineOscuraAnaloga().textoSuave)
                }
                NavigationLink {
                    VistaPreviaPaleta(nombre: "Grafito", archivo: "PaletaGrafitoOscura", fondo: PaletaGrafitoOscura().fondo, superficie: PaletaGrafitoOscura().superficie, primario: PaletaGrafitoOscura().primario, secundario: PaletaGrafitoOscura().secundario, texto: PaletaGrafitoOscura().texto, textoSuave: PaletaGrafitoOscura().textoSuave, textoSobrePrimario: PaletaGrafitoOscura().textoSobrePrimario, graficas: PaletaGrafitoOscura().graficas, oscura: true)
                } label: {
                    FilaGaleriaPaleta(nombre: "Grafito", detalle: "Monocromática · Oscuro · PaletaGrafitoOscura", ideal: "Minimalista, herramientas, fotografía", fondo: PaletaGrafitoOscura().fondo, superficie: PaletaGrafitoOscura().superficie, primario: PaletaGrafitoOscura().primario, secundario: PaletaGrafitoOscura().secundario, texto: PaletaGrafitoOscura().texto, textoSuave: PaletaGrafitoOscura().textoSuave)
                }
            } header: {
                Text("Modo oscuro (5)")
            }
        }
        .navigationTitle("Paletas")
    }
}

// Renglón de la galería: nombre + muestras de color.
struct FilaGaleriaPaleta: View {
    var nombre: String
    var detalle: String
    var ideal: String
    var fondo: Color
    var superficie: Color
    var primario: Color
    var secundario: Color
    var texto: Color
    var textoSuave: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(nombre)
                .font(.headline)
            Text(detalle)
                .font(.caption)
                .monospaced()
                .foregroundStyle(.secondary)
            HStack(spacing: 0) {
                fondo
                superficie
                primario
                secundario
                texto
                textoSuave
            }
            .frame(height: 34)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            Text("Ideal para: " + ideal)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        PaletasGaleriaView()
    }
}
