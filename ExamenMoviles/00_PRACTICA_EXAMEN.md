# Examen Final Móviles (Individual) — PRÁCTICA

> Simulacro hecho con el formato de las tareas de la profesora (Tarea Movil02) y con TODOS los temas del examen.
> Objetivo: armar la app **desde cero** en un proyecto nuevo, usando solo este repo como apoyo, en **3 horas**.
> La Parte 2 (al final) dice dónde está cada cosa en el repo. **No la abras hasta terminar o atorarte.**

| ⏱ 180 min | Modalidad: **Individual** | **Actividad Examen** | Sin internet |
|---|---|---|---|

---

## 🎯 Objetivo de la actividad

Desarrollar una App iOS que integre los temas del Módulo Móviles: conceptos básicos de Swift, elementos de UI,
componentes reutilizables, múltiples pantallas con paso de valores y validación, TabView, modelos y listas,
gráficas, y fotos y cámara. Utiliza **Xcode 26** con la versión de **Swift 6.x**.

## 📋 Instrucciones

### Definición

De manera INDIVIDUAL desarrollar una App iOS de **registro y recomendaciones** sobre una temática, que permita
consultar, agregar, buscar y analizar los elementos registrados.

### Especificaciones Técnicas

1. Crea un nuevo proyecto en **Xcode con SwiftUI (Xcode 26 con la versión de Swift 6.x)**. Elige **1** temática:
   - A. 🍔 Antojos de Monterrey (restaurantes y puestos que recomiendas).
   - B. 📚 Mi librero (libros leídos o por leer).
   - C. 🏋️ Mi rutina de gimnasio (ejercicios).
   - D. 🎬 Mi watchlist (películas y series).
   - E. ✈️ Viajes soñados (destinos).

2. Deberás generar un **modelo (Struct)** para representar cada elemento. Al menos deberá contener:
   - A. Id
   - B. Nombre
   - C. Descripción
   - D. Categoría (texto; una de **3 o 4 categorías fijas** que tú definas. Ej. para A: Tacos, Hamburguesas, Postres)
   - E. Imagen (nombre de la imagen en Assets)
   - F. Calificación (entero de 1 a 5)
   - G. Precio o costo aproximado (decimal)
   - H. Fecha de registro (Date)
   - I. Si es favorito (booleano)
   - J. Al menos **1 propiedad calculada** (ej. las estrellas ⭐️ a partir de la calificación).

3. Deberás generar un archivo **ModelData.swift** con una lista fija de **al menos 10 elementos**, todos diferentes,
   que usen **al menos 3 categorías** y **al menos 4 imágenes distintas**.

4. La pantalla inicial de la App debe ser una **Tab Bar (TabView)** con **5 pestañas**, cada una con ícono
   (SF Symbols) y texto. El color de la pestaña seleccionada debe ir de acuerdo con tu paleta.
   La lista de elementos debe ser **la misma para todas las pestañas**: si se agrega un elemento o se cambia un
   favorito en una pestaña, el cambio se debe ver en las demás.

5. **Pestaña 1 · Inicio**
   - A. Saludo y la **fecha de hoy en español** (ej. "jueves, 15 de octubre").
   - B. Un **carrusel** de imágenes (TabView con estilo de página) con al menos 3 imágenes de tu lista.
   - C. Una fila con **3 tarjetas de resumen del mismo tamaño** (mismo ancho cada una): total de elementos,
     número de favoritos y calificación promedio (con 1 decimal). Las tarjetas deben ser **un componente
     reutilizable** (una sola vista con parámetros, usada 3 veces).
   - D. Un botón **"Recomendación sorpresa"** que muestre un elemento al azar de la lista con TODOS sus datos.

6. **Pestaña 2 · Lista**
   - A. Muestra la lista. Cada renglón debe ser un **componente** y mostrar: imagen pequeña + nombre +
     calificación con estrellas + si es favorito (ícono).
   - B. Al dar touch a un renglón, debe llevar a una pantalla de **Detalle** con: imagen en grande, nombre en
     grande, descripción, categoría, precio en **pesos mexicanos** (ej. "$185.00"), fecha de registro **en
     español**, y calificación con estrellas.
   - C. En el Detalle se debe poder **modificar si es favorito y la calificación**. Al regresar, el cambio se debe
     ver en la lista y en las demás pestañas.
   - D. El Detalle debe tener forma de regresar a la lista (botón además de la flecha).
   - E. Un botón **"Agregar"** que abra un formulario con: nombre, descripción, categoría (Picker con una opción
     inicial "Selecciona…"), precio, calificación y si es favorito. **Puntos extra:** foto opcional desde la galería.
   - F. Al presionar **"Guardar"** se debe validar y mostrar una **alerta con un mensaje específico** para cada
     error: nombre vacío, descripción vacía, sin categoría, precio vacío, precio que no es número, precio menor o
     igual a 0. Si todo está bien: se agrega a la lista, se cierra el formulario y aparece en todas las pestañas.
     La fecha de registro es la fecha del momento en que se guarda.

7. **Pestaña 3 · Buscador** (múltiples pantallas con validación)
   - A. Un campo para escribir el **presupuesto máximo** y un Picker para elegir la **categoría**.
   - B. Un **botón "Buscar"** (no NavigationLink) que valide: presupuesto vacío, que no sea número, que sea
     menor o igual a 0, y que se haya elegido categoría. Si hay error, alerta con mensaje específico.
   - C. Si todo es válido, debe navegar a una pantalla de **Resultados** a la que se le **pasan** el presupuesto y
     la categoría. Ahí se muestran solo los elementos de esa categoría con precio menor o igual al presupuesto.
     Si no hay ninguno, mostrar un mensaje amigable.
   - D. El teclado debe esconderse al tocar fuera de los campos.

8. **Pestaña 4 · Estadísticas**
   - A. Una **gráfica de barras** con cuántos elementos hay por categoría (calculado a partir de la lista, NO
     datos fijos).
   - B. Una **gráfica de pastel o dona** de favoritos vs. no favoritos.
   - C. Una barra de avance (**ProgressView**) con el porcentaje de favoritos, y el porcentaje en texto.
   - D. Las gráficas se deben actualizar al agregar elementos o cambiar favoritos.
   - E. Cada gráfica debe ser del **tipo adecuado** para el dato que muestra (prepárate para justificarlo).

9. **Pestaña 5 · Perfil**
   - A. Foto de perfil **circular con borde**. Si no hay foto, mostrar un ícono.
   - B. Un botón para elegir la foto de la **galería** (PhotosPicker) y otro para tomarla con la **cámara**
     (usar el `CamaraPicker.swift` de Canvas). La app no debe tronar al abrir la cámara (permiso de cámara).
   - C. Nombre, matrícula y carrera mostrados en renglones "Etiqueta ……… Valor".

10. La App deberá contener además las siguientes características:
    - A. Organización de archivos adecuada y en carpetas correspondientes (**Model, Views, Components, Utils**).
    - B. Al menos **2 componentes reutilizables** en la carpeta Components, usados con parámetros.
    - C. Utilizar una paleta de colores adecuada y armónica, definida en **Utils**. El esquema de color debe ser
      **Monocromático** o **Análogo**.
    - D. Que el color de la letra sea compatible con el color de fondo de la pantalla.
    - E. Fondo de pantalla completo, uso de espacios en blanco, márgenes y espacios adecuados.
    - F. Botones de tamaño adecuado para tocarse con el dedo.
    - G. Que el contenido no se corte en pantallas chicas (ScrollView donde haga falta).
    - H. Realizar la interfaz amigable, usable y con uso de colores y aspectos visuales adecuados a la temática.
    - I. **NOTA: El ID no debe ser mostrado en ninguna parte de la UI.**
    - J. Se puede realizar todo en inglés o todo en español, pero **sin mezclar idiomas**.
    - K. **Sin faltas de ortografía.**
    - L. Aplicar las buenas prácticas vistas en clase (`@State private`, `if let` en lugar de `!`, etc.).

## 📦 Entregables

1. **ZIP del proyecto completo** en Xcode 26, subido a CANVAS entre 10:30 y 10:50.
   La aplicación deberá cumplir los requerimientos funcionales y NO funcionales, ejecutarse correctamente y
   aplicar los lineamientos de UI/UX vistos en clase.

> **NOTA:** Una aplicación que funciona correctamente no garantiza por sí sola una calificación alta. Se evaluará
> también la calidad de la solución y el dominio que el estudiante demuestre sobre lo que entregó.
> La profesora podrá pedir que **expliques, justifiques o modifiques** cualquier parte del código.

## 📊 Rúbrica (estimada, basada en el formato de tus tareas)

| Criterio | Puntos |
|---|---|
| Cumplimiento funcional | 40 |
| Calidad técnica de la solución | 20 |
| Dominio y defensa técnica | 20 |
| UI/UX y usabilidad | 20 |
| **Total** | **100** (+5 extra por la foto en el formulario) |

---
---

# ⬇️ PARTE 2 · Guía con el repo (ábrela solo al terminar o si te atoras)

## Plan de tiempo sugerido (180 min)

| Min | Qué hacer |
|---|---|
| 0–15 | Proyecto nuevo, carpetas `Model/ Views/ Components/ Utils/`, 4+ imágenes en Assets, paleta, modelo y ModelData |
| 15–35 | `ContentView` con el TabView y la lista en `@State` (las 5 pestañas vacías con su `.tabItem`) |
| 35–75 | Lista: renglón componente, detalle con `@Binding`, formulario de agregar con validación |
| 75–100 | Inicio: fecha, carrusel, 3 tarjetas, sorpresa |
| 100–120 | Buscador: patrón 6C + pantalla de resultados |
| 120–140 | Estadísticas: barras, dona y ProgressView |
| 140–160 | Perfil: PhotosPicker, CamaraPicker y permiso de cámara |
| 160–180 | Revisión: ortografía, contraste, que no se vea el id, sin `!`, correr todo una vez, ZIP |

## Dónde está cada requisito en el repo

| Requisito | Archivo del repo | Qué copiar / ojo con |
|---|---|---|
| 1 · Crear el proyecto | `00_INDICE.md` → "Pasos de Xcode" | iOS → App, `tec.mx`, SwiftUI, Swift |
| 2 · Modelo Identifiable + propiedad calculada | `08_ModelosYListas/Model/Jugador.swift` | `var estrellas: String { … }` como `nombreCompleto` |
| 2H · Campo `Date` | `01_SwiftBasico/FechasYNumerosView.swift` bloque 1 | En ModelData basta con `fecha: Date()` |
| 3 · ModelData | `08_ModelosYListas/Model/ModelDataJugadores.swift` | `func cargar…() -> Array<…>` |
| 4 · TabView con lista compartida | `00_AppCompleta/Views/AppCompletaView.swift` y `07_TabView/TabDatosCompartidosView.swift` | El `@State` de la lista vive en la vista del TabView; con `$` a quien modifica, sin `$` a quien solo lee |
| 4 · Un `NavigationStack` por pestaña | `07_TabView/TabConNavegacionView.swift` | **Dentro** de cada pestaña, nunca afuera del TabView |
| 5A · Fecha de hoy en español | `01_SwiftBasico/FechasYNumerosView.swift` bloques 1 y 3 | Bloque 1: estilo `.long` ("15 de octubre de 2026"). Bloque 3 (`fechaConFormato`): `dateFormat = "EEEE, d 'de' MMMM"` → "jueves, 15 de octubre". Las dos con `locale = Locale(identifier: "es_MX")` |
| 5B · Carrusel | `07_TabView/CarruselView.swift` bloque 1 | `.tabViewStyle(.page)` + `.indexViewStyle(…)` + `.frame(height:)` |
| 5C · 3 tarjetas iguales (componente) | `00_AppCompleta/Components/TarjetaResumenMascotas.swift` y `05_Layouts/PartesIgualesView.swift` | `.frame(maxWidth: .infinity)` en cada tarjeta dentro de un `HStack` |
| 5C · Contar favoritos y sacar promedio | `08_ModelosYListas/Views/ListaEditableView.swift` (`totalFavoritos`) y `00_AppCompleta/Views/InicioMascotasView.swift` | `for` + `if`; promedio con `specifier: "%.1f"`; cuidado con dividir entre 0 |
| 5D · Elemento al azar | `01_SwiftBasico/ArreglosYCiclosView.swift` bloque 5 | `randomElement()` con `if let` |
| 6A · Renglón componente | `08_ModelosYListas/Components/JugadorRow.swift` | `var item` sin `@State`; **sin padding al HStack** |
| 6B · Precio en pesos | `01_SwiftBasico/FechasYNumerosView.swift` bloques 6–7 | `Text(precio, format: .currency(code: "MXN"))` |
| 6B–C · Detalle que modifica | `08_ModelosYListas/Views/ListaEditableView.swift` + `EditarJugadorView.swift` | `List($lista) { $item in }` + `@Binding`; preview con `.constant(...)` |
| 6C · Cambiar la calificación | `03_ElementosUI/PickersView.swift` bloque 2 | Picker `.segmented` con tags 1…5 |
| 6D · Botón regresar | `06_MultiplesPantallas/PantallaDestinoView.swift` | `@Environment(\.dismiss) private var dismiss` |
| 6E–F · Formulario de agregar con validación | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` + `AgregarJugadorView.swift` y `00_AppCompleta/Views/AgregarMascotaView.swift` | `.sheet` + `@Binding` de la lista + `append` + `dismiss()`; id nuevo = mayor + 1; un `else if` por error |
| 6E · Picker con "Selecciona…" | `00_AppCompleta/Views/AgregarMascotaView.swift` bloque 3 | `.tag("")` y validar `isEmpty` |
| 6E · Texto → número | `01_SwiftBasico/OpcionalesView.swift` bloque 4 | `if let precio = Double(precioTexto)` |
| Extra · Foto en el formulario | `00_AppCompleta/Views/AgregarMascotaView.swift` bloque 1 | ⚠️ guardar `UIImage?` en el modelo no se vio en clase |
| 7B · Botón que valida y navega (6C) | `06_MultiplesPantallas/NavegacionConValidacionView.swift` bloque 1 | `isValid` + `Button` + `.alert` + `.navigationDestination(isPresented:)` pegados al botón |
| 7C · Pasar valores a Resultados | `06_MultiplesPantallas/PasoDeValoresView.swift` + `RecibeValoresView.swift` | En Resultados `var presupuesto: Double` sin `private` ni `@State` |
| 7C · Filtrar por categoría y precio | `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` (`jugadoresFiltrados`) | Propiedad calculada con `for` + `if` + `append` |
| 7C · Mensaje si no hay resultados | `00_AppCompleta/Views/ListaMascotasView.swift` bloque 1 | `if lista.isEmpty { … } else { List … }` |
| 7D · Esconder el teclado | `03_ElementosUI/TextFieldsView.swift` | `@FocusState` + `.onTapGesture` en el **Stack principal** |
| 8A · Barras por categoría | `09_Graficas/GraficaDesdeListaView.swift` y `00_AppCompleta/Views/EstadisticasMascotasView.swift` | Contar con `for`; `import Charts` |
| 8B · Pastel / dona | `09_Graficas/PastelYDonaView.swift` bloques 2–3 | `innerRadius: .ratio(0.5)` |
| 8C · ProgressView | `09_Graficas/ProgressViewEjemplosView.swift` bloque 1 | `.scaleEffect(x: 1, y: 3)` |
| 8E · Qué gráfica usar | `09_Graficas/DashboardGraficasView.swift` (encabezado) | Barras = categorías · pastel/dona = partes de un total · **nunca líneas para categorías** |
| 9A–B · Foto de perfil galería + cámara | `10_FotosYCamara/FotoPerfilView.swift` | Copia también `CamaraPicker.swift`; `import PhotosUI` |
| 9B · Permiso de cámara | `10_FotosYCamara/TomarFotoView.swift` (encabezado) | Info → Add Row → Privacy - Camera Usage Description. El simulador no tiene cámara |
| 9C · Renglones etiqueta/valor | `04_Componentes/Components/FilaDato.swift` | Componente con parámetros |
| 10C · Paleta en Utils | `00_AppCompleta/Utils/PaletaMascotas.swift` | `let` globales, sin `static` |
| 10E · Fondo completo | `02_PrimeraApp/ColoresYFondosView.swift` | `ZStack { color.ignoresSafeArea() … }` |

## Trampas que te pueden quitar tiempo

- **Dos barras de navegación:** pusiste `NavigationStack` afuera del TabView y otra vez adentro. Va solo dentro de cada pestaña.
- **Los cambios no se ven en otra pestaña:** la lista no está en un solo `@State` en la vista del TabView, o pasaste una copia sin `$`.
- **`Missing argument` en el `#Preview`:** las vistas con `@Binding` necesitan `.constant(...)`; las de valores, un dato de prueba.
- **Cámara en el simulador:** no hay cámara. Prueba la galería; el código de la cámara queda igual.
- **`Cannot find 'Chart'` / `PhotosPicker`:** falta `import Charts` / `import PhotosUI`.
- **El id aparece en pantalla:** revisa que ningún `Text` lo muestre.

## Autoevaluación al terminar

- [ ] Hice todo sin copiar la `00_AppCompleta` completa (si la copiaste, ¿puedes explicar cada línea?).
- [ ] Cada requisito del 1 al 10 funciona en el simulador.
- [ ] Puedo explicar: `@State` vs `@Binding`, por qué la lista vive en la vista del TabView, el patrón 6C, por qué barras y no líneas.
- [ ] ¿Qué tuve que buscar fuera del repo o qué no encontré? → eso es lo que hay que agregar al repo hoy.
