# Examen Móviles — Índice del repo

Repo de consulta para el examen final (VIE 16 Oct). Todo funciona **sin internet**.
Cada ejemplo es un archivo `.swift` que se copia y se pega. Lo que hay que cambiar está marcado con `✏️`.

## Cómo encontrar algo en 10 segundos

| Quiero… | Haz esto |
|---|---|
| Buscar por **nombre de archivo** | `⌘⇧O` (Open Quickly) y escribe, ej. `Botones`, `Mitades`, `Dona` |
| Buscar por **palabra clave** | `⌘⇧F` (Find in Project), ej. `dividir`, `alerta`, `camara`, `binding`. Cada archivo tiene una línea `BUSCA:` con palabras en español e inglés |
| **Ver** cómo se ve | Corre la app (`⌘R`). Cada renglón del menú dice el archivo donde vive ese ejemplo |
| Ver solo un archivo | Ábrelo y usa el Canvas (`⌥⌘↩`). Todos traen `#Preview` |
| Copiar "la forma de la profe" | Tabla **Lo que enseñó la profesora, clase por clase** (abajo) |
| Saber qué copiar además | Lee la línea `NECESITA:` del encabezado del archivo |
| Saber si algo NO se vio en clase | Busca `⚠️ NO VISTO EN CLASE` — prepárate para explicarlo o no lo uses. Las marcas se revisaron contra las presentaciones de la profesora |

## Cómo copiar un ejemplo a tu app del examen

1. En tu proyecto: clic derecho en la carpeta (`Views/`, `Components/`, `Model/`) → **New File from Template → SwiftUI View** → mismo nombre del archivo.
2. Borra todo lo que trae y **pega el archivo completo** (o solo el bloque `// ── N. … ──` que quieras dentro de tu `body`).
3. Copia también lo que diga `NECESITA:` (modelo, componente, imagen, permiso).
4. Cambia lo marcado con `✏️`.
5. Para que sea la primera pantalla: en `TuAppApp.swift` cambia `ContentView()` por la vista que pegaste.

> Los comentarios del repo también se copian. Si no los quieres en tu entrega, bórralos al final (o déjalos solo donde te ayuden a explicar).

## Estructura de carpetas que pide el curso (se califica)

```
TuApp/
├── Model/        structs + datos fijos (ModelData.swift)
├── Views/        pantallas completas
├── Components/   piezas reutilizables (renglones, tarjetas)
└── Utils/        paleta de colores
```
`00_AppCompleta/` ya viene así: puedes copiar la carpeta entera (ver su `LEEME_AppCompleta.md`).

## Pasos de Xcode que siempre se olvidan

| Necesito | Pasos |
|---|---|
| **Crear el proyecto nuevo** | File → New → Project → pestaña **iOS** → **App** → Product Name, Organization Identifier `tec.mx`, **Interface: SwiftUI**, **Language: Swift**, Testing System: None, Storage: None (Clase 2, lámina 5) |
| **Crear una vista nueva** (pantalla o componente) | File → New → File from Template... → sección **User Interface** → **SwiftUI View** → Next → nombre → Create (Clase 5A) |
| **Ver el Canvas / la librería de objetos** | Canvas: menú Editor → Canvas. Librería de objetos: `⇧⌘L` (arrastra o doble clic) (Clase 3) |
| **Agregar una imagen** | Navegador del proyecto → `Assets.xcassets` → arrastra y suelta la imagen → el nombre del set es el que usas en `Image("nombre")` (Clase 3) |
| **Permiso de cámara** | Navegador del proyecto → selecciona el proyecto → pestaña **Info** → clic derecho en la última fila de "Custom iOS Target Properties" → **Add Row** → `Privacy - Camera Usage Description` → en **Value** escribe el mensaje. Obligatorio desde iOS 10: sin esto la app truena al abrir la cámara (Clase 17) |
| **Agregar un .mp3 / .json** | Arrástralo al navegador de Xcode → marca **Copy items if needed** y tu **target** |
| **Agregar CamaraPicker** | Copia `10_FotosYCamara/CamaraPicker.swift` (es el de la profesora, de Canvas: se hace una COPIA y no se modifica) |
| **Gráficas** | `import Charts` arriba del archivo |
| **PhotosPicker** | `import PhotosUI` arriba del archivo |
| Probar la **cámara** | El simulador no tiene cámara. La prueba final se hace en un **iPhone físico** (tutorial en Canvas). En el simulador prueba con la galería |

## Errores típicos al pegar código

| Error | Qué significa | Arreglo |
|---|---|---|
| `Cannot find 'X' in scope` | Falta un archivo del que depende | Revisa `NECESITA:` y copia ese archivo (modelo, componente) |
| `Invalid redeclaration of 'X'` | Ya tienes otro struct con ese nombre | Renombra uno de los dos (⌘ clic → Rename) |
| `Missing argument for parameter 'x'` | La vista recibe un dato | Pásaselo al llamarla: `DetalleView(x: valor)`. En el `#Preview` usa un valor de prueba o `.constant(...)` si es `@Binding` |
| `Cannot find type 'Chart'` / `PhotosPicker` | Falta el import | `import Charts` / `import PhotosUI` |
| `Type 'X' does not conform to protocol 'Identifiable'` | El struct de la lista no tiene `id` | Agrega `: Identifiable` y `var id: Int` (o `let id = UUID()`) |
| La imagen no aparece | El nombre no coincide con el asset | Revisa mayúsculas en `Assets.xcassets` |
| La imagen sale gigante | Falta `.resizable` | Orden de clase: `.resizable(resizingMode: .stretch)` → `.aspectRatio(contentMode: .fit)` → `.frame(width: 200)` |
| Dos barras de navegación | Pusiste un `NavigationStack` dentro de otro | Deja solo el de la pantalla raíz |
| El preview truena pero la app no | El preview no tiene los datos | Envuelve el preview en `NavigationStack { }` o pásale datos de prueba |
| `Image(uiImage: foto)` no compila | La foto es opcional (`UIImage?`) | `if let fotoBien = foto { Image(uiImage: fotoBien) }` (paso F de la Clase 17) |

## Checklist de UI/UX (rúbrica del curso)

- [ ] Fondo de pantalla completa (`ZStack { Color….ignoresSafeArea() }`)
- [ ] Colores en una paleta (`Utils/`), monocromática o análoga, con buen contraste
- [ ] `spacing` en los stacks y `padding` en los contenedores
- [ ] Botones grandes (`.controlSize(.large)` o `.padding()` ≥ 44 pt de alto)
- [ ] `ScrollView` si el contenido puede no caber
- [ ] Validación con alertas y mensaje **específico** por cada error
- [ ] Todo el texto en español, sin faltas ni acentos faltantes
- [ ] Estructura `Model/ Views/ Components/ Utils/`

## Reglas que dijo la profesora (cúmplelas)

| Regla | Clase |
|---|---|
| `@State private var …`: Apple recomienda que sea privada | 3 |
| Esconder el teclado al tocar fuera: `.onTapGesture { campoEnFoco = false }` va en el **Stack principal** | 3 y 4 |
| Antes de usar `.frame(maxWidth: .infinity, alignment: .leading)`, intenta acomodar todo dentro del VStack | 3 |
| Desempaca opcionales con `if let` (recomendado por Swift). `!` solo si ya revisaste que no es `nil` | 2 |
| Segmented: máximo 3-4 opciones | 4 |
| Paso de valores de ida: en la pantalla 2 una `var` **sin** `private` y **sin** `@State` | 6B |
| Ida y vuelta: `@Binding` sin `private` y sin valor inicial; en la base `@State private`; al llamar, con `$`. En el `#Preview`: `.constant(...)` | 6B |
| Navegar con validación: `Button` (no `NavigationLink`) dentro de un `NavigationStack`, con `.alert` y `.navigationDestination(isPresented:)` pegados al botón | 6C |
| Carpetas: `Model/` (structs y datos), `Views/` (pantallas), `Components/` (renglones) | 10 |
| En el renglón de una lista (`Row`) **no agregues padding al stack**. En la pantalla de detalle sí puedes | 10 |
| Lista dinámica: el modelo lleva `Identifiable` y se usa `.listStyle(.inset)` | 10 |
| Gráfica de líneas solo para tendencias en el tiempo. **Nunca** para comparar categorías (para eso, barras) | 15 |
| Cámara: `CamaraPicker.swift` se copia de Canvas sin cambios, se abre con `.sheet`, lleva el permiso y se prueba en iPhone físico | 17 |

---

## Mapa del repo

| Carpeta | Tema | Lo más útil |
|---|---|---|
| `00_AppCompleta/` | App "Mis Mascotas" que junta todo | Cópiala entera y renombra (ver `LEEME_AppCompleta.md`) |
| `01_SwiftBasico/` | Variables, opcionales, arreglos, funciones, fechas, structs | `CalculadoraIMCView` (TextField → número → resultado) |
| `02_PrimeraApp/` | La app de la Clase 3, textos, imágenes, stacks, colores, fondos | `MiPrimeraAppView` (la app de clase), `TarjetaPerfilView` (pantalla "acerca de mí") |
| `03_ElementosUI/` | TextField, botones, pickers, slider, toggle, alertas | `FormularioValidacionView` (validación con alertas) |
| `04_Componentes/` | Vistas reutilizables con parámetros | `PokemonEjemploView` (el ejemplo de la Clase 5A), `Components/` (tarjeta, botón, fila, tile, campo con @Binding) |
| `05_Layouts/` | Dividir la pantalla, cuadrículas, renglones, alineación | `MitadesView`, `PartesIgualesView`, `DashboardView` |
| `06_MultiplesPantallas/` | NavigationStack, paso de valores, @Binding, sheets | `NavegacionConValidacionView` (código de la Clase 6C), `LoginView`, `MenuPrincipalView` |
| `07_TabView/` | Pestañas, carrusel, datos compartidos | `TabViewBasicoView` (el de la Clase 7), `TabDatosCompartidosView`, `CarruselView` |
| `08_ModelosYListas/` | Modelos, List, detalle, editar, agregar, buscar, JSON | `ListaConDetalleView` (el de la Clase 10), `ListaEditableView`, `ListaAgregarBorrarView` |
| `09_Graficas/` | Barras, líneas, puntos, pastel, dona, ProgressView | `GraficaInteractivaView`, `GraficaDesdeListaView` |
| `10_FotosYCamara/` | PhotosPicker, CamaraPicker, permisos | `FotoPerfilView`, `RegistroConFotoView` |
| `11_Extras/` | @AppStorage, UserDefaults, sonido | `AppStorageView` |
| `_Menu/` + `ContentView.swift` | Menú de este repo | **No se copian** |

## Lo que enseñó la profesora, clase por clase

Cuando quieras "la forma de la profe", copia de la última columna: ese código es igual al de la lámina.

| Clase (PDF) | Qué enseña | Dónde está el código idéntico a la lámina |
|---|---|---|
| 2 · Conceptos básicos | Crear proyecto, Playground y `print`, tipos, `var`/`let`, strings, opcionales, `!` e `if let` | `01_SwiftBasico/TiposYVariablesView.swift` (bloques 1–3, 8) · `01_SwiftBasico/OpcionalesView.swift` (bloques 1–3) |
| 3 · Mi primera app | App HelloWorld, partes de Xcode, stacks y alineación, `@State private`, TextField, 3 formas de Button, imagen de Assets, 2 fondos, alerta en 3 pasos, teclado | `02_PrimeraApp/MiPrimeraAppView.swift` · `02_PrimeraApp/StacksBasicosView.swift` · `02_PrimeraApp/FondoPantallaCompletaView.swift` · `03_ElementosUI/BotonesView.swift` bloques 1–3 · `03_ElementosUI/AlertasView.swift` bloque 1 |
| 3B · Fechas y formatos | `Date`, `DateFormatter` (3 pasos, estilos, `es_MX`, `dateFormat`), sumar con `DateComponents`, formato de números en `Text` y en `String` | `01_SwiftBasico/FechasYNumerosView.swift` (bloques 1–4, 6, 9) |
| 4 · Elementos UI | Picker `.wheel` y `.segmented` + `.onChange`, Slider, Toggle + `.onChange`, `Color` RGB y opacity, herramientas de color, mostrar/ocultar teclado | `03_ElementosUI/PickersView.swift` bloques 1–2 · `03_ElementosUI/SliderYToggleView.swift` bloques 1 y 4 · `02_PrimeraApp/ColoresYFondosView.swift` (bloques 2–3) · `03_ElementosUI/TextFieldsView.swift` bloque 8 |
| 5A · Vistas como componentes | Ejemplo Pokémon: vistas en archivos separados, ZStack + `.offset`, foto circular con borde y sombra, `Spacer().frame(maxWidth: .infinity)`, `Divider` | `04_Componentes/PokemonEjemploView.swift` · `04_Componentes/Components/PokeImagenView.swift` |
| 6A · Múltiples pantallas | `NavigationStack`, 2 formas de `NavigationLink`, aspecto de botón, `dismiss()`, `.toolbar(.hidden)` | `06_MultiplesPantallas/NavegacionBasicaView.swift` bloques 1, 2, 4 · `06_MultiplesPantallas/PantallaDestinoView.swift` · `06_MultiplesPantallas/ToolbarView.swift` bloque 3 |
| 6B · Paso de valores | Ida (`var` sin `private`), ida y vuelta (`@State` + `@Binding` + `$`), `.constant` en el preview | `06_MultiplesPantallas/PasoDeValoresView.swift` · `06_MultiplesPantallas/BindingIdaYVueltaView.swift` · `06_MultiplesPantallas/EditarNicknameView.swift` |
| 6C · Botón con validación | `isValid` + `Button` + `.alert` + `.navigationDestination(isPresented:)` | `06_MultiplesPantallas/NavegacionConValidacionView.swift` bloque 1 |
| 7 · TabView | 3 vistas en `Views/`, `TabView` con `.tabItem { Label }`, `.tint`, carrusel `.page` | `07_TabView/TabViewBasicoView.swift` · `07_TabView/CarruselView.swift` bloque 1 |
| 10 · Modelos y listas | `Model/Jugador`, ModelData (función `Array<Jugador>` + `var`), `JugadorRow` sin padding, `List` estática y dinámica, `.listStyle(.inset)`, detalle con `NavigationLink`, `AsyncImage` | `08_ModelosYListas/Model/ModelDataJugadores.swift` · `08_ModelosYListas/Components/JugadorRow.swift` · `08_ModelosYListas/Views/ListaSimpleView.swift` · `08_ModelosYListas/Views/ListaConDetalleView.swift` · `08_ModelosYListas/Views/DetalleJugadorView.swift` bloque 2 · `08_ModelosYListas/Views/ImagenRemotaView.swift` bloques 1–2 |
| 15 · Gráficas | `BarMark` (a mano, con arreglo, colores A/B/C), `LineMark` (solo tiempo), `PointMark` (con `$0`), `SectorMark` pastel y dona, `ProgressView` | `09_Graficas/BarrasView.swift` bloques 1–5 · `09_Graficas/LineasView.swift` bloques 1–2 · `09_Graficas/PuntosView.swift` bloques 1–2 · `09_Graficas/PastelYDonaView.swift` bloques 1–3 · `09_Graficas/ProgressViewEjemplosView.swift` bloque 1 |
| 17 · Fotos y cámara | PhotosPicker pasos A–F, `CamaraPicker` en `.sheet`, permiso de cámara, probar en iPhone | `10_FotosYCamara/SeleccionarFotoView.swift` · `10_FotosYCamara/TomarFotoView.swift` · `10_FotosYCamara/CamaraPicker.swift` (archivo de la profesora, sin cambios) |

---

## 00 · App Completa "Mis Mascotas" (copiar la carpeta entera)
Instrucciones paso a paso: `00_AppCompleta/LEEME_AppCompleta.md`

| Quiero… | Archivo | Notas |
|---|---|---|
| Una app completa de 4 pestañas lista para adaptar | `00_AppCompleta/` (toda la carpeta) | Copia Model, Utils, Components, Views. En TuAppApp.swift pon `AppCompletaView()`. Luego Find & Replace `Mascota` → `TuModelo` |
| El TabView raíz que comparte la lista entre pestañas | `00_AppCompleta/Views/AppCompletaView.swift` | `@State` aquí; con `$` a la pestaña que modifica, sin `$` a la que solo lee |
| Cambiar de pestaña desde un botón | `00_AppCompleta/Views/AppCompletaView.swift` + `InicioMascotasView.swift` bloque 4 | ⚠️ `TabView(selection:)` + `.tag` |
| Un modelo Identifiable con propiedad calculada (switch) | `00_AppCompleta/Model/Mascota.swift` | `iconoEspecie`, `textoEdad` |
| Datos fijos de arranque + opciones del Picker | `00_AppCompleta/Model/ModelDataMascotas.swift` | `cargarMascotas()` y `especiesMascotas` |
| Una paleta de colores centralizada con contraste verificado | `00_AppCompleta/Utils/PaletaMascotas.swift` | `let` globales, sin static |
| Pantalla de inicio / dashboard con saludo y totales | `00_AppCompleta/Views/InicioMascotasView.swift` | Contar y promediar con `for` |
| Dividir en 3 tarjetas del mismo ancho | `00_AppCompleta/Components/TarjetaResumenMascotas.swift` | `.frame(maxWidth: .infinity)` dentro de la tarjeta + HStack |
| Mostrar solo los elementos que cumplen algo (filtrar) | `00_AppCompleta/Views/InicioMascotasView.swift` bloque 3 | `ForEach` + `if !mascota.vacunada` |
| Lista que se edita, agrega y borra (CRUD) | `00_AppCompleta/Views/ListaMascotasView.swift` | `ForEach($mascotas) { $mascota in }` + `.onDelete` ⚠️ |
| Mensaje cuando la lista está vacía | `00_AppCompleta/Views/ListaMascotasView.swift` bloque 1 | `if mascotas.isEmpty` |
| Botón fijo abajo que abre una sheet | `00_AppCompleta/Views/ListaMascotasView.swift` bloque 3 | `.sheet(isPresented:)` |
| Detalle que modifica el elemento y se ve en la lista | `00_AppCompleta/Views/DetalleMascotaView.swift` | `@Binding var mascota`, `$mascota.vacunada` |
| Formulario de alta con validación campo por campo | `00_AppCompleta/Views/AgregarMascotaView.swift` | `guardarMascota()`: un mensaje por error, `Int(texto)` con `if let` |
| Picker con opción "Selecciona" (vacía) | `00_AppCompleta/Views/AgregarMascotaView.swift` bloque 3 | `.tag("")` y validar `especie.isEmpty` |
| Generar un id nuevo sin repetir | `00_AppCompleta/Views/AgregarMascotaView.swift` | `siguienteIdMascota()`: el mayor + 1 |
| Elegir foto de la galería y guardarla en el modelo | `00_AppCompleta/Views/AgregarMascotaView.swift` bloque 1 | PhotosPicker → `UIImage` → `foto:` |
| Foto circular que usa foto, asset o ícono según haya | `00_AppCompleta/Components/FotoMascotaView.swift` | `if let` / `else if` / `else` |
| Renglón de lista con foto, textos e ícono a la derecha | `00_AppCompleta/Components/MascotaRow.swift` | Sin padding al HStack (Clase 10: "No agregues padding al stack") |
| Renglón "etiqueta ……… valor" | `00_AppCompleta/Components/FilaDatoMascota.swift` | `Spacer()` empuja el valor |
| Un botón reutilizable de ancho completo | `00_AppCompleta/Components/BotonPrincipalMascotas.swift` | ⚠️ recibe `accion: () -> Void` |
| Contar cuántos hay por categoría y graficarlo | `00_AppCompleta/Views/EstadisticasMascotasView.swift` | `conteoPorEspecie()` con dos `for` |
| Barras horizontales | `00_AppCompleta/Views/EstadisticasMascotasView.swift` bloque 2 | número en `x`, categoría en `y` ⚠️ no viene en las láminas |
| Dona / pastel con colores propios | `00_AppCompleta/Views/EstadisticasMascotasView.swift` bloque 3 | `innerRadius: .ratio(0.5)` (Clase 15) + `.chartForegroundStyleScale` |
| Porcentaje con ProgressView | `00_AppCompleta/Views/EstadisticasMascotasView.swift` bloque 4 | `.scaleEffect(x: 1, y: 3)` |
| Perfil que se guarda al cerrar la app | `00_AppCompleta/Views/PerfilDuenoView.swift` | `@AppStorage("nombreDueno")`; la misma llave en Inicio |
| Guardar un color elegido por el usuario | `00_AppCompleta/Views/PerfilDuenoView.swift` | Se guarda el nombre (String) y `colorFavoritoDueno()` lo convierte |
| Agregar la cámara a la app completa | `00_AppCompleta/Views/PerfilDuenoView.swift` encabezado | 4 pasos + CamaraPicker de `10_FotosYCamara` |
| Saber qué partes de la App Completa son idénticas a clase y cuáles no | `00_AppCompleta/LEEME_AppCompleta.md` → §4 y §5 | Lista de ⚠️ y de formas exactas de clase |
| Qué gráfica usar para cada dato (app completa) | `00_AppCompleta/Views/EstadisticasMascotasView.swift` → encabezado | Barras = categorías, dona = proporciones; NUNCA líneas para categorías (Clase 15) |


## 01 · Swift básico
| Quiero… | Archivo | Notas |
|---|---|---|
| Recordar var vs let y los tipos (Int, Double, Bool, String, Character) | `01_SwiftBasico/TiposYVariablesView.swift` → bloques 1 y 2 | Ejemplos de la lámina: `var numeroPaginas: Int` (sin valor), `let precio: Double = 60.45`. `let` solo se asigna una vez |
| Meter una variable dentro de un texto / unir textos | `01_SwiftBasico/TiposYVariablesView.swift` → bloque 3 | `"Hola \(nombre)"` y `+` / `+=`. La `\` se escribe con option + ' |
| Hacer operaciones, división con decimales, residuo | `01_SwiftBasico/TiposYVariablesView.swift` → bloque 4 | `7 / 2 = 3` (Int); usa `Double(a) / Double(b)` |
| Convertir Int ↔ String ↔ Double | `01_SwiftBasico/TiposYVariablesView.swift` → bloque 5 | `Int("123")` es opcional → `if let` |
| Usar && \|\| ! o el ternario `? :` | `01_SwiftBasico/TiposYVariablesView.swift` → bloques 6 y 7 | `esFavorito ? "heart.fill" : "heart"` |
| Imprimir un valor en la consola (como en Playground) | `01_SwiftBasico/TiposYVariablesView.swift` → bloque 8 | `print(greeting)`; sale en la consola de Xcode |
| Entender opcionales, unwrapping con `!` e `if let` | `01_SwiftBasico/OpcionalesView.swift` → bloques 1–3 | 1 declarar con `?`, 2 `!` + `if numero != nil` (lámina), 3 `if let` = optional binding (recomendado por Swift) |
| Validar que lo que escribió el usuario sea número | `01_SwiftBasico/OpcionalesView.swift` → bloque 4 + `convertirNumero()` | Vacío → alerta; no es número → alerta |
| Un valor por defecto si es nil / salir antes si falta | `01_SwiftBasico/OpcionalesView.swift` → bloques 5 y 6 | `??` y `guard let` ⚠️ no vistos |
| Agregar / quitar elementos de un arreglo desde la pantalla | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 6 + `agregarFruta()` | `append`, `remove(at:)`, valida vacío y repetidos (`.contains` ⚠️) |
| Mostrar un arreglo de Strings en pantalla | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 6 | ⚠️ `ForEach(arreglo, id: \.self)` (no viene en las láminas); para modelos usa `List` del tema 08 |
| Sacar suma, promedio, máximo y mínimo | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 4 + `ejemploCalculos()` | Revisa `isEmpty` antes de dividir |
| Leer una posición del arreglo sin que truene | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 2 | `if indice >= 0 && indice < lista.count` |
| Ciclo for, rangos `1...5` y `0..<n` | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 3 | `..<` no incluye el último |
| Elegir algo al azar / número aleatorio | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 5 | `randomElement()` con `if let`; `Int.random(in: 1...100)` |
| Diccionario, filtrar u ordenar | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 7 | ⚠️ no visto en clase |
| Escribir funciones con parámetros y return | `01_SwiftBasico/FuncionesYCondicionesView.swift` → bloque 1 | `Button("…", action: miFuncion)` para funciones sin return |
| Clasificar con if / else if (calificación → letra) | `01_SwiftBasico/FuncionesYCondicionesView.swift` → bloque 2 + `letraCalificacion()` | |
| switch con rangos o con textos | `01_SwiftBasico/FuncionesYCondicionesView.swift` → bloques 3 y 5 (`clasificarEdad()` / `colorDesdeNombre()`) | Siempre lleva `default` |
| Cambiar la imagen o el color según un Slider | `01_SwiftBasico/FuncionesYCondicionesView.swift` → bloque 4 + `iconoBateria` / `colorNivel` | Propiedad calculada `var x: String { }` |
| Mostrar la fecha de hoy en español | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 1 `fechaDeHoy()` | 3 pasos de la Clase 3B + `locale = Locale(identifier: "es_MX")` |
| Estilos de fecha (.short, .medium, .long, .full) | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 2 | Tabla de la Clase 3B |
| Mostrar solo la hora (9:54 p.m.) | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 2 `horaConEstilo()` | `dateStyle = .none` + `timeStyle = .short` |
| Fecha con formato tipo dd/MM/yyyy | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 3 `fechaConFormato()` | `MMMM` = mes con letra, `EEEE` = día |
| Sumar días o meses a una fecha | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 4 `fechaFutura()` | Regresa opcional ("solo aguas") → `if let` |
| Calcular edad o días entre fechas | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 5 `diferenciaDeFechas()` | ⚠️ `date(from:)` y `dateComponents(from:to:)` no vistos |
| Mostrar precio en pesos, 2 decimales o porcentaje | `01_SwiftBasico/FechasYNumerosView.swift` → bloques 6, 7 y 9 | Nombres de la lámina: `numeroBase`, `precioBase`; `.currency(code: "MXN")`, `specifier: "%.2f"` |
| Que un año no salga "2,026" | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 8 | `.number.grouping(.never)` |
| Número con letra u ordinal (123 → "ciento veintitrés", 3 → "3.º") | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 10 `numeroConEstilo()` | ⚠️ `NumberFormatter()`; los estilos vienen en la tabla de la Clase 3B |
| Crear mi propio struct con método y propiedad calculada | `01_SwiftBasico/StructsYClasesView.swift` → bloque 1 (`struct Libro`) | Init automático |
| Crear una clase con init y métodos (depositar/retirar) | `01_SwiftBasico/StructsYClasesView.swift` → bloque 2 (`class CuentaBancaria`) | Las clases necesitan `init` escrito |
| Explicar copia (struct) vs referencia (class) | `01_SwiftBasico/StructsYClasesView.swift` → bloque 3 | |
| Una calculadora completa con validación y alertas | `01_SwiftBasico/CalculadoraIMCView.swift` | Pantalla lista: cambia fórmula y textos |
| Esconder el teclado al tocar fuera | `01_SwiftBasico/CalculadoraIMCView.swift` → `@FocusState` + `.onTapGesture` | `.onTapGesture` en el Stack principal |


## 02 · Mi primera app
| Quiero… | Archivo | Notas |
|---|---|---|
| La app de la clase: escribir nombre → botón → "Hola nombre" | `02_PrimeraApp/MiPrimeraAppView.swift` | 2 Text + TextField + Button, imagen, fondo, alerta y teclado. El encabezado trae los pasos de Xcode (crear proyecto, Canvas, ⇧⌘L) |
| Cambiar el tamaño de un texto (título, subtítulo, chico) | `02_PrimeraApp/TextosView.swift` → bloque 1 | `.largeTitle` … `.caption2` |
| Un tamaño exacto de letra | `02_PrimeraApp/TextosView.swift` → bloque 2 | `.font(.system(size: 21))` (tip de la Clase 5A) |
| Negritas, cursiva, color del texto | `02_PrimeraApp/TextosView.swift` → bloques 3 y 4 | `.foregroundStyle(.secondary)` para subtítulos |
| Centrar un texto largo o limitar líneas | `02_PrimeraApp/TextosView.swift` → bloque 5 | `.multilineTextAlignment(.center)`; `.lineLimit` ⚠️ |
| Un texto con fondo tipo etiqueta o chip | `02_PrimeraApp/TextosView.swift` → bloque 6 | Primero `.padding()`, luego `.background` |
| Texto con ícono | `02_PrimeraApp/TextosView.swift` → bloque 7 | `Label("Texto", systemImage: "star.fill")` |
| Poner una imagen de Assets | `02_PrimeraApp/ImagenesView.swift` → bloque 1 | Orden de clase: `.resizable(resizingMode: .stretch)` → `.aspectRatio(contentMode: .fit)` → `.frame(width: 200)` |
| Que la imagen llene un cuadro sin deformarse | `02_PrimeraApp/ImagenesView.swift` → bloque 2 | `.fill` + `.clipped()` ⚠️ (en clase solo `.fit`) |
| Foto circular con borde y sombra | `02_PrimeraApp/ImagenesView.swift` → bloque 3 | Usa imagen cuadrada |
| Imagen con esquinas redondeadas y borde | `02_PrimeraApp/ImagenesView.swift` → bloque 4 | Mismo `cornerRadius` en clip y borde |
| Íconos del sistema (SF Symbols) | `02_PrimeraApp/ImagenesView.swift` → bloque 5 | Tamaño con `.font(.system(size:))` |
| Cómo viene el ContentView nuevo (globe, `.imageScale`, `.tint`) | `02_PrimeraApp/ImagenesView.swift` → bloque 5 | `.imageScale(.large)` + `.foregroundStyle(.tint)` |
| Texto encima de una imagen | `02_PrimeraApp/ImagenesView.swift` → bloque 6 | `ZStack` + sombra al texto |
| Cambiar la imagen según lo que elige el usuario | `02_PrimeraApp/ImagenesView.swift` → bloque 7 | `Image(variable)`, el `.tag` = nombre del asset |
| Acomodar cosas vertical / horizontal / encimadas | `02_PrimeraApp/StacksBasicosView.swift` → bloque 1 | |
| Alinear a la izquierda / derecha dentro de un VStack | `02_PrimeraApp/StacksBasicosView.swift` → bloque 2 | `VStack(alignment: .leading / .trailing / .center)` |
| HStack con hijos arriba / abajo / en medio | `02_PrimeraApp/StacksBasicosView.swift` → bloque 3 | `.top` `.bottom` `.center` |
| Alinear TODO un VStack a la izquierda | `02_PrimeraApp/StacksBasicosView.swift` → bloque 9 | `.frame(maxWidth: .infinity, alignment: .leading)`; primero intenta sin `.frame` |
| Separar elementos (spacing, Spacer, Divider) | `02_PrimeraApp/StacksBasicosView.swift` → bloques 5, 6 y 7 | `Spacer().frame(height: 30)` = fijo |
| Márgenes solo de un lado | `02_PrimeraApp/StacksBasicosView.swift` → bloque 8 | `.padding(.horizontal, 30)` |
| Un renglón ícono + título + subtítulo + flecha | `02_PrimeraApp/StacksBasicosView.swift` → bloque 10 | Más renglones en `05_Layouts` |
| Colores propios con RGB | `02_PrimeraApp/ColoresYFondosView.swift` → bloque 2 | Divide entre 255 (Clase 4) |
| Color con transparencia | `02_PrimeraApp/ColoresYFondosView.swift` → bloque 3 | `opacity:` o `.opacity(0.5)` |
| Hacer una paleta monocromática o análoga | `02_PrimeraApp/ColoresYFondosView.swift` → `let` arriba del body + bloques 4 y 5 | Sin `static`: `let` dentro del struct |
| Revisar contraste de texto y fondo | `02_PrimeraApp/ColoresYFondosView.swift` → bloque 6 | coolors.co/contrast-checker · paleta desde una imagen: coolors.co/image-picker · códigos: flatuicolors.com |
| Fondo degradado | `02_PrimeraApp/ColoresYFondosView.swift` → bloque 8 | ⚠️ `LinearGradient` no visto |
| Fondo que cubra TODA la pantalla (opción 1 de clase: ZStack) | `02_PrimeraApp/FondoPantallaCompletaView.swift` → `FondoCompletoZStackView` | `Color.x.ignoresSafeArea()` hasta atrás |
| Fondo que cubra TODA la pantalla (opción 2 de clase: .background) | `02_PrimeraApp/FondoPantallaCompletaView.swift` → `FondoCompletoBackgroundView` | `frame(maxWidth/maxHeight: .infinity)` + `.background` + `.ignoresSafeArea()` |
| Entender por qué cambia el resultado al mover un modificador | `02_PrimeraApp/ModificadoresView.swift` → bloque 1 | padding→background vs background→padding |
| Esquinas redondeadas, cápsula o círculo | `02_PrimeraApp/ModificadoresView.swift` → bloque 2 | `.clipShape(...)`; también vale `.cornerRadius(12)` (forma de la Clase 17) |
| Bordes y sombras | `02_PrimeraApp/ModificadoresView.swift` → bloques 3 y 4 | Borde con `.overlay(RoundedRectangle(...).stroke(...))` |
| Mover un elemento, hacerlo más grande o girarlo | `02_PrimeraApp/ModificadoresView.swift` → bloques 6 y 8 | `.offset` (Clase 5A), `.scaleEffect`, `.rotationEffect` ⚠️ |
| Una tarjeta blanca con sombra | `02_PrimeraApp/ModificadoresView.swift` → bloque 9 | |
| Pantalla de perfil / "acerca de mí" completa | `02_PrimeraApp/TarjetaPerfilView.swift` | Ya trae tus datos; cambia lo ✏️ |
| Alerta con varias líneas de texto | `02_PrimeraApp/TarjetaPerfilView.swift` → bloque 5 | `.alert(...) { } message: { }` ⚠️ (la Clase 3 solo usa título y botones) |


## 03 · Elementos UI

| Quiero… | Archivo | Notas |
|---|---|---|
| Un campo de texto normal | `03_ElementosUI/TextFieldsView.swift` → bloque 1 | `TextField("Nombre", text: $nombre)` + `.textFieldStyle(.roundedBorder)` |
| Un campo de texto de ancho fijo | `03_ElementosUI/TextFieldsView.swift` → bloque 2 | `.frame(width: 200)` (en la Clase 3: `.frame(width: 300)`) |
| Un campo de texto con borde/fondo propio | `03_ElementosUI/TextFieldsView.swift` → bloque 3 | `.padding` + `.background` + `.cornerRadius` + `.overlay(RoundedRectangle…stroke)` con el mismo radio |
| Un campo de contraseña (puntitos) | `03_ElementosUI/TextFieldsView.swift` → bloque 4 | `SecureField` ⚠️ no visto en clase |
| Que salga el teclado de solo números | `03_ElementosUI/TextFieldsView.swift` → bloque 5 | `.keyboardType(.numberPad)` / `.decimalPad` ⚠️ |
| Convertir lo escrito a número (Int/Double) | `03_ElementosUI/TextFieldsView.swift` → bloque 5 | `if let edad = Int(edadTexto) { }` — nunca `!` |
| Mostrar en vivo lo que el usuario escribe | `03_ElementosUI/TextFieldsView.swift` → bloque 6 | `Text("Hola, \(nombre)")` |
| Limitar caracteres / contador "12/40" | `03_ElementosUI/TextFieldsView.swift` → bloque 7 | `.onChange(of:) { oldValue, newValue in }` regresa al texto anterior |
| Esconder el teclado (botón y al tocar fuera) | `03_ElementosUI/TextFieldsView.swift` → bloque 8 | 3 pasos de clase: `@FocusState` + `.focused($campoEnFoco)` + `campoEnFoco = false`. `.onTapGesture` en el **Stack principal** (ZStack) |
| Las 3 formas de hacer un botón | `03_ElementosUI/BotonesView.swift` → bloques 1-3 | código directo / `action: funcion` / `action:` + `Label` (Clase 3) |
| Cambiar estilo, color o tamaño de un botón | `03_ElementosUI/BotonesView.swift` → bloques 4-5 | `.buttonStyle(.borderedProminent)` `.tint(.orange)` `.controlSize(.large)` |
| Un botón que ocupe todo el ancho | `03_ElementosUI/BotonesView.swift` → bloque 6 | `.frame(maxWidth: .infinity)` va DENTRO del label |
| Un botón con mi propio fondo de color | `03_ElementosUI/BotonesView.swift` → bloque 7 | `.background(Color.indigo)` + `.cornerRadius(12)` dentro del label |
| Un botón que sea solo un ícono (+ / -) | `03_ElementosUI/BotonesView.swift` → bloque 8 | `Image(systemName:)` con `.font(.system(size: 44))` |
| Desactivar el botón si falta un dato | `03_ElementosUI/BotonesView.swift` → bloque 9 | `.disabled(nombre.isEmpty)` ⚠️ |
| Un botón rojo de borrar | `03_ElementosUI/BotonesView.swift` → bloque 10 | `role: .destructive` ⚠️ |
| Un Picker de ruleta ("select") que haga algo cuando cambia | `03_ElementosUI/PickersView.swift` → bloque 1 | `Picker(selection: $x, label: Text("…"))` + `.pickerStyle(.wheel)` + `.onChange(of:) { oldValue, newValue in }` (Clase 4). Text = se ve, tag = se guarda |
| Un segment control | `03_ElementosUI/PickersView.swift` → bloque 2 | `.pickerStyle(.segmented)`; la profe recomienda máximo 3-4 opciones |
| Opciones del Picker desde un arreglo (menú desplegable) | `03_ElementosUI/PickersView.swift` → bloque 3 | `.pickerStyle(.menu)` + ⚠️ `ForEach(arreglo, id: \.self)`; la forma de clase es escribir cada `Text().tag()` |
| Opción "Selecciona…" y validar que eligió algo | `03_ElementosUI/PickersView.swift` → bloque 4 | `Text("Selecciona…").tag("")` y `if carrera == ""` → alerta |
| Un Picker que cambia según otro (país → ciudad) | `03_ElementosUI/PickersDependientesView.swift` | propiedad calculada con las opciones + `.onChange` que resetea `ciudad = ""` |
| Usar oldValue y newValue de .onChange | `03_ElementosUI/PickersDependientesView.swift` → bloque 1 | "Cambiaste de X a Y" |
| Un Slider exactamente como en clase | `03_ElementosUI/SliderYToggleView.swift` → bloque 1 | `Slider(value:, in: 0 ... 100, onEditingChanged: { editing in })` + `.tint(.purple)`; el valor sin decimales con `Int(valor)` |
| Un Slider que avance de 1 en 1 | `03_ElementosUI/SliderYToggleView.swift` → bloque 2 | ⚠️ `step: 1` |
| Slider que cambia tamaño u opacidad | `03_ElementosUI/SliderYToggleView.swift` → bloque 3 | `.font(.system(size: tamano))`, `.opacity(opacidad)` |
| Un Toggle y hacer algo cuando se prende/apaga | `03_ElementosUI/SliderYToggleView.swift` → bloque 4 | `Toggle("Activar Música", isOn: $isOnVal)` + `.onChange(of: isOnVal) { oldValue, newValue in }` (Clase 4) |
| Toggle de favorito con corazón | `03_ElementosUI/SliderYToggleView.swift` → bloque 5 | `Label("Favorita", systemImage: esFavorito ? "heart.fill" : "heart")` |
| Mostrar u ocultar algo con un Toggle | `03_ElementosUI/SliderYToggleView.swift` → bloque 6 | `if mostrarDetalles { … }` |
| Cambiar el fondo (modo oscuro) con un Toggle | `03_ElementosUI/SliderYToggleView.swift` → bloque 7 | ternario en el `Color` del ZStack |
| Cambiar la imagen según un valor (como Goku) | `03_ElementosUI/ImagenSegunValorView.swift` → bloque 1 | `var imagenSegunNivel: String { if … return "foto4" … }` |
| Cambiar ícono/color según un valor (batería, semáforo) | `03_ElementosUI/ImagenSegunValorView.swift` → bloque 3 | propiedades calculadas que regresan `String` y `Color` |
| Botones + / - para una cantidad | `03_ElementosUI/OtrosControlesView.swift` → bloque 1 | `Stepper(…, value: $cantidad, in: 1...10)` ⚠️ |
| Elegir una fecha y mostrarla en español | `03_ElementosUI/OtrosControlesView.swift` → bloques 2-3 | `DatePicker` ⚠️ + `DateFormatter` con `es_MX` (como en la Clase 3B) |
| Calendario que solo deja fechas futuras | `03_ElementosUI/OtrosControlesView.swift` → bloque 3 | `in: Date()...` + `.datePickerStyle(.graphical)` ⚠️ |
| Que el usuario elija un color | `03_ElementosUI/OtrosControlesView.swift` → bloque 4 | `ColorPicker` ⚠️ |
| Barra de progreso que se mueve con un Slider | `03_ElementosUI/OtrosControlesView.swift` → bloque 5 | `ProgressView(value:total:)` + `.scaleEffect(x: 1, y: 3)` (Clase 15) |
| Un botón que abra una página web | `03_ElementosUI/OtrosControlesView.swift` → bloque 6 | `Link` ⚠️ con `if let url = URL(string:)` |
| Una alerta básica | `03_ElementosUI/AlertasView.swift` → bloque 1 | 3 pasos de la Clase 3: `@State Bool` → `.alert(…, isPresented:)` → `showAlert.toggle()` |
| Una alerta cuyo texto cambia según el error | `03_ElementosUI/AlertasView.swift` → bloque 2 | `@State alertMessage` como título |
| Alerta con título y mensaje de varias líneas | `03_ElementosUI/AlertasView.swift` → bloque 3 | bloque `message:` + `"""` (la Clase 3 solo usa título y botones) |
| Preguntar "¿Seguro que quieres borrar?" | `03_ElementosUI/AlertasView.swift` → bloque 4 | `Button("Cancelar", role: .cancel)` + `Button("Borrar", role: .destructive)` ⚠️ |
| Dos alertas distintas en el mismo botón (error/éxito) | `03_ElementosUI/AlertasView.swift` → bloque 5 | cada `.alert` con su propia `Bool` |
| Alerta que pide escribir un dato | `03_ElementosUI/AlertasView.swift` → bloque 6 | `TextField` dentro del `.alert` ⚠️ |
| Menú de opciones que sale desde abajo | `03_ElementosUI/AlertasView.swift` → bloque 7 | `.confirmationDialog` ⚠️ |
| Formulario completo con validación y alertas | `03_ElementosUI/FormularioValidacionView.swift` | cadena de `else if` con mensaje específico por error; resumen al final |
| Validar campo vacío / no es número / fuera de rango | `03_ElementosUI/FormularioValidacionView.swift` → `validarFormulario()` | `isEmpty`, `Int(texto) == nil`, `edad < min \|\| edad > max` |
| Validar que el correo tenga @ | `03_ElementosUI/FormularioValidacionView.swift` → `validarFormulario()` | `!correo.contains("@")` ⚠️ |
| Validar que aceptó términos | `03_ElementosUI/FormularioValidacionView.swift` → bloque 7 | `Toggle` + `if !aceptaTerminos` |
| Botón para limpiar el formulario | `03_ElementosUI/FormularioValidacionView.swift` → `limpiarFormulario()` | regresa cada `@State` a su valor inicial |
| Mostrar una tarjeta con el resultado al terminar | `03_ElementosUI/FormularioValidacionView.swift` → bloque 9 | `if registroCompleto { … }` |


## 04 · Componentes (vistas reutilizables)

Cada componente vive en su propio archivo dentro de `04_Componentes/Components/`. Para crearlo en tu proyecto (pasos de la Clase 5A): File → New → File from Template... → sección **User Interface** → **SwiftUI View** → Next → nombre → Create, y pegas el archivo. Los parámetros son `var` sin `@State` (el componente solo los muestra). Los que traen valor por defecto (`color: Color = .purple`) los puedes omitir.

| Quiero… | Archivo | Notas |
|---|---|---|
| Hacer el ejemplo Pokémon de clase (portada + foto circular + datos + evoluciones) | `04_Componentes/PokemonEjemploView.swift` | Necesita PokeImagenView, PokeDatosView y PokeMasDatosView |
| Foto circular con borde y sombra, idéntica a clase (PokeImagenView) | `04_Componentes/Components/PokeImagenView.swift` | `.clipShape(.circle)` + `.overlay { Circle().stroke(.orange, lineWidth: 5) }` + `.shadow(color: .orange, radius: 5)` |
| Poner una foto encima de la portada, bajada a la orilla | `04_Componentes/PokemonEjemploView.swift` → PASO 1 y 2.3 | ZStack + `.frame(width: 150)` + `.offset(y: 120)`; lo de abajo lleva `.padding(.top)` |
| Bloque de nombre + etiqueta de tipo + descripción (DatosView) | `04_Componentes/Components/PokeDatosView.swift` | Tip de clase: `.font(.system(size: 21))` |
| Dos imágenes con su nombre, cada una en su mitad (MasDatosView) | `04_Componentes/Components/PokeMasDatosView.swift` | Cada VStack con `.frame(maxWidth: .infinity)` |
| Una imagen SOLO en la mitad izquierda | `04_Componentes/Components/PokeMasDatosView.swift` → `PokeUnaEvolucionView` | `Spacer().frame(maxWidth: .infinity)` = "elemento complementario" |
| Ver cómo se arma una pantalla completa con componentes | `04_Componentes/ComponentesDemoView.swift` | Perfil con todos los componentes juntos |
| Una tarjeta con ícono, título y subtítulo | `04_Componentes/Components/TarjetaInfo.swift` | `TarjetaInfo(icono:titulo:subtitulo:color:)` |
| Un botón reutilizable de todo el ancho que haga lo que yo le diga | `04_Componentes/Components/BotonGrande.swift` | La acción va entre llaves `{ contador += 1 }` o `accion: miFuncion` · ⚠️ closure como parámetro |
| Una foto redonda con parámetros (nombre, ancho, color) | `04_Componentes/Components/ImagenCircular.swift` | `ImagenCircular(nombreImagen:ancho:colorBorde:)`. Igual que PokeImagenView: `.fit` + `.clipShape(.circle)` + borde de 5 |
| El mismo encabezado en todas mis pantallas | `04_Componentes/Components/EncabezadoPantalla.swift` | Ícono + título + subtítulo centrados |
| Renglón "Etiqueta …… Valor" para pantallas de detalle | `04_Componentes/Components/FilaDato.swift` | Números → `"\(edad)"`; decimales → `.formatted(.number.precision(.fractionLength(2)))` (`specifier:` solo sirve dentro de `Text`) |
| Una etiqueta/chip de color (categoría, estado) | `04_Componentes/Components/EtiquetaChip.swift` | Usa colores oscuros: el texto es blanco. Esquinas con `.cornerRadius(50)` |
| Un cuadro con número grande para dashboard | `04_Componentes/Components/TileEstadistica.swift` | 3 en un `HStack` quedan del mismo ancho (`maxWidth: .infinity`) |
| Un campo de texto con etiqueta que cambie la variable de mi pantalla | `04_Componentes/Components/CampoConEtiqueta.swift` | `@Binding`: en el padre `@State private var x = ""` y lo llamas con `texto: $x` |
| Mostrar estrellas de calificación (★★★½☆) | `04_Componentes/Components/EstrellasRating.swift` | `EstrellasRating(calificacion: 3.5)`; si es Int: `Double(miInt)`. ⚠️ `ForEach` |
| Pasar una función a un componente (no código directo) | `04_Componentes/ComponentesDemoView.swift` → bloque 7 | `BotonGrande(..., accion: saludar)` |


## 05 · Layouts (dividir la pantalla, renglones, acomodo)

Casi todos los ejemplos traen un `.frame(height: …)` marcado `✏️ DEMO` para que quepan varios en una pantalla. **Bórralo** y el bloque ocupa toda la pantalla. La regla de fondo: los hijos que llevan `.frame(maxWidth: .infinity, maxHeight: .infinity)` se reparten el espacio en partes iguales; `spacing: 0` quita el hueco entre ellos. Las esquinas redondeadas usan `.cornerRadius(N)` (forma de la Clase 17).

| Quiero… | Archivo | Notas |
|---|---|---|
| Dividir la pantalla en 2 (arriba / abajo) | `05_Layouts/MitadesView.swift` → bloque 1 | `VStack(spacing: 0)` + cada mitad con `maxWidth/maxHeight: .infinity` |
| Dividir la pantalla en 2 (izquierda / derecha) | `05_Layouts/MitadesView.swift` → bloque 2 | Igual pero con `HStack` |
| Imagen en la mitad de arriba y datos abajo | `05_Layouts/MitadesView.swift` → bloque 3 | |
| Dos tarjetas lado a lado del mismo tamaño | `05_Layouts/MitadesView.swift` → bloque 4 | `HStack(spacing: 12)` + `.cornerRadius` |
| Poner una imagen en la mitad izquierda | `05_Layouts/MitadesView.swift` → bloque 5 | `Spacer().frame(maxWidth: .infinity)` (técnica de la Clase 5A) |
| Dividir en 3 o 4 columnas iguales | `05_Layouts/PartesIgualesView.swift` → bloques 1 y 2 | ¿5 partes? copia otra zona igual |
| Dividir en 3 renglones iguales | `05_Layouts/PartesIgualesView.swift` → bloque 3 | |
| Renglones con distinto número de columnas adentro | `05_Layouts/PartesIgualesView.swift` → bloque 4 | |
| 3 botones del mismo ancho en fila | `05_Layouts/PartesIgualesView.swift` → bloque 5 | El `.frame(maxWidth: .infinity)` va DENTRO del label |
| Dividir en 4 cuadros (2x2) | `05_Layouts/CuadriculaView.swift` → bloque 1 | VStack con 2 HStack (sin nada extra) |
| Cuadrícula 3x3 numerada | `05_Layouts/CuadriculaView.swift` → bloque 2 | Dos `ForEach` anidados ⚠️ |
| Galería de fotos en 2 columnas | `05_Layouts/CuadriculaView.swift` → bloque 3 | ⚠️ `LazyVGrid` + `GridItem(.flexible())` |
| Menú de íconos en 3 columnas | `05_Layouts/CuadriculaView.swift` → bloque 4 | ⚠️ `LazyVGrid` |
| Que una parte ocupe 1/3 y la otra 2/3 | `05_Layouts/ProporcionesView.swift` → bloque 1 | ⚠️ `GeometryReader`: `geo.size.height / 3` |
| 30% / 70% lado a lado (barra lateral + contenido) | `05_Layouts/ProporcionesView.swift` → bloque 2 | ⚠️ `GeometryReader`: `geo.size.width * 0.3` |
| Arriba un alto fijo y abajo todo lo demás (sin GeometryReader) | `05_Layouts/ProporcionesView.swift` → bloques 3 y 4 | `.frame(height: 120)` + el otro con `maxHeight: .infinity` |
| Formulario con encabezado fijo, scroll en medio y botón Guardar siempre visible abajo | `05_Layouts/EncabezadoCuerpoPieView.swift` | Incluye validación con alerta y esconder teclado |
| Renglones "Etiqueta …… Valor" con líneas separadoras | `05_Layouts/RenglonesView.swift` → bloque 1 | `HStack { Text; Spacer(); Text }` + `Divider()` |
| Renglones estilo Ajustes (ícono + texto + flecha >) | `05_Layouts/RenglonesView.swift` → bloque 2 | `Image(systemName: "chevron.right")` |
| Renglón con foto, título, subtítulo y precio | `05_Layouts/RenglonesView.swift` → bloque 3 | Imagen con `.fit`, como en clase |
| Una tabla con columnas alineadas y encabezado | `05_Layouts/RenglonesView.swift` → bloque 4 | Mismo `.frame(width:)` por columna en encabezado y filas; copia `FilaTablaLayout`. ⚠️ `ForEach` |
| Renglones con color alternado (cebra) | `05_Layouts/RenglonesView.swift` → bloque 4 | `indice % 2 == 0 ? color : Color.clear` |
| Poner algo en una esquina o al centro | `05_Layouts/AlineacionView.swift` → bloque 1 | `.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)` |
| El botón pegado hasta abajo | `05_Layouts/AlineacionView.swift` → bloque 2 | Un solo `Spacer()` entre el contenido y el botón |
| Todo centrado vertical y horizontal | `05_Layouts/AlineacionView.swift` → bloque 3 | `Spacer()` arriba y abajo |
| Un texto a la izquierda / derecha | `05_Layouts/AlineacionView.swift` → bloque 4 | `.frame(maxWidth: .infinity, alignment: .leading)` |
| Entender `VStack(alignment: .leading)` | `05_Layouts/AlineacionView.swift` → bloque 5 | Alinea a los hijos, no al stack |
| Un numerito rojo en la esquina de un ícono | `05_Layouts/AlineacionView.swift` → bloque 6 | ⚠️ `.overlay(alignment: .topTrailing)` · otra forma: `CapasZStackView` bloque 2 (⚠️ `ZStack(alignment:)`) |
| Alinear hijos arriba / en medio / abajo en un HStack | `05_Layouts/AlineacionView.swift` → bloque 7 | `HStack(alignment: .top / .center / .bottom)` |
| Pegar todo un VStack a la izquierda (forma de clase) | `05_Layouts/AlineacionView.swift` → bloque 8 | `.frame(maxWidth: .infinity, alignment: .leading)`; primero intenta dentro del VStack |
| Un carrusel de tarjetas que se desliza de lado | `05_Layouts/ScrollHorizontalView.swift` → bloque 1 | ⚠️ `ScrollView(.horizontal)` + `HStack` + `ForEach` |
| Chips de categorías para elegir una (filtro) | `05_Layouts/ScrollHorizontalView.swift` → bloque 2 | Guarda la elegida en `@State` y la pinta distinto |
| Que la pantalla haga scroll hacia abajo | `05_Layouts/ScrollHorizontalView.swift` → bloque 3 | `ScrollView { VStack { … } }` (no viene en las láminas, pero la rúbrica pide scroll si no cabe) |
| Texto encima de una imagen | `05_Layouts/CapasZStackView.swift` → bloque 1 | En `ZStack` lo primero queda atrás |
| Insignia/badge en la esquina de una foto o ícono | `05_Layouts/CapasZStackView.swift` → bloque 2 | ⚠️ `ZStack(alignment: .topTrailing)` y `Circle().fill` |
| Tarjeta con foto de fondo y texto que se lea | `05_Layouts/CapasZStackView.swift` → bloque 3 | ⚠️ `LinearGradient` para oscurecer y `.fill` |
| Una imagen como fondo de toda la pantalla | `05_Layouts/CapasZStackView.swift` → bloque 4 | ⚠️ `.aspectRatio(contentMode: .fill)` + `.ignoresSafeArea()` |
| Fondo de color con una tarjeta encima | `05_Layouts/CapasZStackView.swift` → bloque 5 | Patrón de clase: `ZStack { Color…ignoresSafeArea() … }` |
| Portada con foto circular encima (offset) | `05_Layouts/CapasZStackView.swift` → bloque 6 | ZStack + `.offset(y:)`; pantalla completa en `04_Componentes/PokemonEjemploView.swift` |
| Una pantalla de inicio/dashboard completa | `05_Layouts/DashboardView.swift` | Encabezado + 3 tiles + 2x2 + renglones + botón; no depende de otros archivos. ⚠️ `.preferredColorScheme(.light)` |


## 06 · Múltiples pantallas

| Quiero… | Archivo | Notas |
|---|---|---|
| Pasar de una pantalla a otra (lo básico) | `06_MultiplesPantallas/NavegacionBasicaView.swift` → bloques 1 y 2 | Las 2 formas de `NavigationLink` de la Clase 6A. Un solo `NavigationStack` en la pantalla raíz |
| Saber qué dice la clase de NavigationStack (pila, raíz, Back) | `06_MultiplesPantallas/NavegacionBasicaView.swift` → encabezado | Teoría de la lámina 3 de la Clase 6A |
| Un renglón/tarjeta que navega al tocarla | `06_MultiplesPantallas/NavegacionBasicaView.swift` → bloque 3 | `NavigationLink { destino } label: { HStack… }` (la forma de listas, Clase 10) |
| Un NavigationLink que se vea como botón | `06_MultiplesPantallas/NavegacionBasicaView.swift` → bloques 4 y 5 | Paso 3 de la Clase 6A: `.buttonStyle(.borderedProminent)` + `.tint(.purple)`. Para ancho completo el `.frame` va DENTRO del label |
| Poner título a la pantalla | `06_MultiplesPantallas/NavegacionBasicaView.swift` (al final) | `.navigationTitle` va sobre el contenido, no sobre el `NavigationStack` |
| Un botón "Regresar" que vuelva a la pantalla anterior | `06_MultiplesPantallas/PantallaDestinoView.swift` | `@Environment(\.dismiss) private var dismiss` + `dismiss()` (DismissAction existe desde iOS 15) |
| Mandar datos a la siguiente pantalla (solo mostrar) | `06_MultiplesPantallas/PasoDeValoresView.swift` + `RecibeValoresView.swift` | En la pantalla 2: `var nombre: String` sin `@State` ni `private`. Ej. de la lámina: `DetalleView(nombreDetalle: "Cristina")` |
| Que la otra pantalla CAMBIE un dato y se vea al regresar | `06_MultiplesPantallas/BindingIdaYVueltaView.swift` + `EditarNicknameView.swift` | `@State` en la base, `@Binding` en el detalle, llamar con `$` |
| Explicar @State vs @Binding / fuente de verdad / Observer | `06_MultiplesPantallas/BindingIdaYVueltaView.swift` → encabezado | Texto de la Clase 6B + nota de `@Observable` ("no lo utilizaremos todavía") |
| Preview de una vista con `@Binding` | `06_MultiplesPantallas/EditarNicknameView.swift` (abajo) | `.constant("valor")` |
| Navegar con botón solo si es válido (código EXACTO de la lámina 6C) | `06_MultiplesPantallas/NavegacionConValidacionView.swift` → bloque 1 | `isValid` + `Button("Ir a detalle")` + `.alert` + `.navigationDestination(isPresented:)` en el botón |
| Lo mismo con varios campos y mensaje específico por error | `06_MultiplesPantallas/NavegacionConValidacionView.swift` → bloque 2 | ⚠️ `.contains("@")` |
| Una pantalla de login (usuario y contraseña) | `06_MultiplesPantallas/LoginView.swift` + `BienvenidaView.swift` | Patrón 6C con `isValid`: `.alert` y `.navigationDestination` van en el botón "Entrar". Credenciales fijas "admin"/"1234". `SecureField` ⚠️ |
| Esconder el teclado al tocar fuera | `06_MultiplesPantallas/LoginView.swift` | `@FocusState` + `.focused` + `.onTapGesture` en el Stack principal |
| Cerrar sesión / quitar la flecha "<" | `06_MultiplesPantallas/BienvenidaView.swift` | `.navigationBarBackButtonHidden(true)` ⚠️ + botón con `dismiss()` |
| Mostrar la fecha de hoy en español | `06_MultiplesPantallas/BienvenidaView.swift` → `fechaHoy` | `DateFormatter` con `es_MX` |
| Un menú de inicio con 4 botones grandes (2x2) | `06_MultiplesPantallas/MenuPrincipalView.swift` → bloque 2 | Dos `HStack`, cada botón con `.frame(maxWidth: .infinity)` |
| Una ventana que sube desde abajo (sheet / modal) | `06_MultiplesPantallas/SheetView.swift` → bloque 1 | Bool + `.sheet(isPresented:)` (la Clase 17 la usa para abrir la cámara) |
| Que la sheet me regrese un valor elegido | `06_MultiplesPantallas/SheetView.swift` → bloque 2 + `SheetSeleccionFrutaView` | Mismo patrón que la cámara: `@Binding` + `dismiss()` |
| Sheet a media pantalla | `06_MultiplesPantallas/SheetView.swift` → bloque 3 | `.presentationDetents([.medium, .large])` ⚠️ |
| Mostrar una pantalla completa encima (sin navegar) | `06_MultiplesPantallas/SheetView.swift` → bloque 4 | `.fullScreenCover` ⚠️, necesita botón para cerrar |
| Esconder la barra de navegación | `06_MultiplesPantallas/ToolbarView.swift` → bloque 3 | `.toolbar(.hidden)` en el Stack principal (Clase 6A) |
| Un botón "+" en la barra | `06_MultiplesPantallas/ToolbarView.swift` → bloque 2 | `.toolbar { ToolbarItem(placement: …) {…} }` ⚠️ |
| Título chico centrado | `06_MultiplesPantallas/ToolbarView.swift` → bloque 1 | `.navigationBarTitleDisplayMode(.inline)` ⚠️ |


## 07 · TabView

| Quiero… | Archivo | Notas |
|---|---|---|
| Pestañas abajo como en clase (cada pestaña su propia vista) | `07_TabView/TabViewBasicoView.swift` | `VStack { TabView { PrincipalView().tabItem { Label("…", systemImage: "…") } … } }` + `.tint(.orange)` |
| Las 3 vistas del ejemplo de clase (Charmander) | `07_TabView/PrincipalView.swift`, `07_TabView/DetallesView.swift`, `07_TabView/EvolucionesView.swift` | Imagen circular encimada con `.offset`, datos con `Divider`, etiquetas de color, 2 imágenes lado a lado |
| Encabezado que se repite en varias pestañas | `07_TabView/PokemonEncabezado.swift` | Componente: `PokemonEncabezado(nombre:icono:)` |
| Pestañas rápidas en un solo archivo | `07_TabView/TabViewUnArchivoView.swift` | El contenido de cada pestaña va dentro del `TabView` |
| Cambiar el color del ícono de la pestaña | `07_TabView/TabViewBasicoView.swift` | `.tint(.orange)` sobre el `TabView` |
| Pestañas que además navegan a un detalle | `07_TabView/TabConNavegacionView.swift` | Un `NavigationStack` DENTRO de cada pestaña, no afuera del `TabView` |
| Que dos pestañas usen la misma lista | `07_TabView/TabDatosCompartidosView.swift` | `@State` en la vista del `TabView`; con `$` modifica, sin `$` solo lee |
| Agregar elementos a una lista desde un TextField | `07_TabView/TareasListaTabView.swift` → bloque 1 | `tareas.append(...)` + alerta si está vacío |
| Marcar/desmarcar elementos de una List con Toggle | `07_TabView/TareasListaTabView.swift` → bloque 2 | `List($tareas) { $tarea in Toggle(isOn: $tarea.completada) }` |
| Contar cuántos cumplen algo / sacar porcentaje | `07_TabView/TareasResumenTabView.swift` | Propiedad calculada con `for`. Cuidado con dividir entre 0 |
| Barra de progreso (ProgressView) | `07_TabView/TareasResumenTabView.swift` → bloque 2 | `ProgressView(value:total:)` + `.scaleEffect(x: 1, y: 3)` |
| 3 cuadros iguales con números (estadísticas) | `07_TabView/TareasResumenTabView.swift` → bloque 1 (`ResumenTabCuadro`) | `.frame(maxWidth: .infinity)` en cada cuadro |
| Modelo + datos fijos para una lista | `07_TabView/Model/TareaTab.swift` | `struct …: Identifiable` + `func cargar…() -> [...]` |
| Carrusel de fotos que se desliza (código de clase) | `07_TabView/CarruselView.swift` → bloque 1 | `TabView` + `.tabViewStyle(.page)` + `.indexViewStyle(.page(backgroundDisplayMode: .always))` + `.frame(height: 430)`; imágenes con `.frame(height: 300)` |
| Carrusel con mis fotos y texto encima | `07_TabView/CarruselView.swift` → bloque 2 | `CarruselPagina` con `ZStack(alignment: .bottom)` |
| Texto encima de una foto | `07_TabView/CarruselView.swift` → `CarruselPagina` | `ZStack(alignment: .bottom)` |
| Pantallas de bienvenida con botón "Comenzar" | `07_TabView/OnboardingView.swift` | `if yaEmpezo { app } else { páginas }` con `@State` |
| Cambiar de pantalla completa con un if | `07_TabView/OnboardingView.swift` | `var body` puede tener `if/else` |
| Cambiar de pestaña con un botón | `07_TabView/TabSeleccionView.swift` | `TabView(selection: $pestana)` + `.tag(n)` ⚠️; el botón hace `pestana = 2` |
| Numerito rojo en una pestaña | `07_TabView/TabSeleccionView.swift` → pestaña 2 | `.badge(numero)` ⚠️; con 0 no se ve |


## 08 · Modelos y listas

| Quiero… | Archivo | Notas |
|---|---|---|
| Crear el modelo (struct) de mis datos | `08_ModelosYListas/Model/Jugador.swift` | Pasos de clase: primero el struct; para la lista dinámica agrégale `Identifiable` (exige un campo `id`). La imagen se guarda como `String` (nombre del asset) |
| Tener datos de prueba fijos (ModelData) | `08_ModelosYListas/Model/ModelDataJugadores.swift` | Como en clase: `func cargarJugadores() -> Array<Jugador>` + `var listaJugadores = cargarJugadores()`. Si la pantalla modifica la lista usa `@State private var jugadores = cargarJugadores()` |
| Un campo que se calcula solo (nombre completo, estrellas…) | `08_ModelosYListas/Model/Jugador.swift` | `var nombreCompleto: String { return ... }` |
| Diseñar el renglón de la lista como componente | `08_ModelosYListas/Components/JugadorRow.swift` | Diseño de clase: número grande rojo + nombre + "Mide: x mts". `var jugador: Jugador` sin `@State` ni `private`. **Sin padding al HStack** (regla de clase) |
| Renglón con foto a la izquierda | `08_ModelosYListas/Components/JugadorRow.swift` → `JugadorConImagenRow` | Imagen 50x50 + nombre + subtítulo + corazón |
| Lista estática, renglón por renglón (primer paso de clase) | `08_ModelosYListas/Views/ListaSimpleView.swift` → `ListaEstaticaJugadoresView` | `List{ JugadorRow(jugador: listaJugadores[0]) … }` |
| Mostrar una lista sencilla (dinámica) | `08_ModelosYListas/Views/ListaSimpleView.swift` → bloques 1 y 2 | `List(listaJugadores){ jugadorItem in JugadorRow(jugador: jugadorItem) }.listStyle(.inset)` (otros: `.plain`, `.grouped`, `.insetGrouped`). En clase se llamó ListaJugadoresView |
| Tocar un renglón y abrir su detalle | `08_ModelosYListas/Views/ListaConDetalleView.swift` | Como la lámina 17: `NavigationStack` + `List(listaJugadores)` + `NavigationLink { DetalleView(jugador:) } label: { JugadorRow(jugador:) }` |
| Pantalla de detalle (solo ver) | `08_ModelosYListas/Views/DetalleJugadorView.swift` → bloque 2 | En clase: DetalleView. `var jugador: Jugador` (sin `@State`). Bloque 2 = diseño de la lámina (Número / Nombre / Estatura). Aquí sí van paddings |
| Editar un elemento en el detalle y que la lista se actualice | `08_ModelosYListas/Views/ListaEditableView.swift` + `EditarJugadorView.swift` | `List($lista) { $item in }` y `@Binding var jugador` en el detalle. Explica por qué una variable global NO sirve |
| Marcar favorito con un Toggle / cambiar un número con Stepper | `08_ModelosYListas/Views/EditarJugadorView.swift` → bloques 2 y 4 | `Toggle(isOn: $jugador.esFavorito)`; Stepper ⚠️ no visto en clase |
| Contar cuántos cumplen algo (ej. favoritos) | `08_ModelosYListas/Views/ListaEditableView.swift` → bloque 1 (`totalFavoritos`) | Propiedad calculada con `for` + `if` |
| Agregar elementos con un formulario | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` + `AgregarJugadorView.swift` | `.sheet` + `@Binding var jugadores` + `append`. El id nuevo = mayor + 1 |
| Validar que no esté vacío / que sea número (con alerta) | `08_ModelosYListas/Views/AgregarJugadorView.swift` → `guardar()` | `if nombre.isEmpty`… `else if let numero = Int(numeroTexto)` + mensaje específico |
| Borrar deslizando el renglón | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` → bloque 2 | `List { ForEach(lista) { } .onDelete(perform:) }` ⚠️ no visto en clase |
| Borrar todo con confirmación | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` → bloque 5 | `.alert` con `Button("Borrar", role: .destructive)` ⚠️ + `removeAll()` |
| Mostrar "no hay datos" si la lista está vacía | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` → bloque 1 | `if lista.isEmpty { mensaje } else { List }` |
| Buscar por nombre | `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` → bloque 4 | `.searchable(text:)` ⚠️ + propiedad calculada `jugadoresFiltrados` |
| Filtrar por categoría con botones | `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` → bloque 1 | `Picker` `.segmented` con opción "Todas" |
| Ordenar la lista | `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` → bloque 2 + `jugadoresFiltrados` | `resultado.sort { a, b in a.numero < b.numero }` ⚠️ |
| Agrupar la lista en secciones con título | `08_ModelosYListas/Views/ListaSeccionesView.swift` | `Section { ForEach } header: { } footer: { }` ⚠️ + `.listStyle(.insetGrouped)` |
| Cambiar el color de fondo de la lista y de los renglones | `08_ModelosYListas/Views/ListaFondoPersonalizadoView.swift` | `.listRowBackground` (dentro) + `.scrollContentBackground(.hidden)` + `.background` (sobre el List) |
| Lista con diseño libre (tarjetas grandes con foto) | `08_ModelosYListas/Views/ListaTarjetasView.swift` | `ScrollView` + `ForEach` + `NavigationLink` con `.buttonStyle(.plain)` ⚠️ |
| Hacer un protocolo y 2-3 clases que lo cumplan | `08_ModelosYListas/Model/Personaje.swift` | `{ get }` vs `{ get set }`, `init`, misma función con lógica distinta |
| Usar esas clases en una pantalla (botones que cambian valores) | `08_ModelosYListas/Views/ProtocolosView.swift` | Las clases no avisan a SwiftUI: se cambia un `@State` (`turno`) para redibujar |
| Barra de vida / avance | `08_ModelosYListas/Views/ProtocolosView.swift` → `PersonajeTarjetaView` | `ProgressView(value:total:)` |
| Convertir mi lista a JSON o XML | `08_ModelosYListas/Model/Empleado.swift` → bloques 3 y 4 | `JSONEncoder` / `PropertyListEncoder` con `do { try } catch` |
| Leer un texto JSON y convertirlo a lista | `08_ModelosYListas/Model/Empleado.swift` → bloque 5 | `JSONDecoder().decode([Empleado].self, from: data)` |
| Que `print(objeto)` se vea bonito | `08_ModelosYListas/Model/Empleado.swift` → bloque 1 | `CustomStringConvertible` + `var description: String` |
| Ver JSON/XML en pantalla | `08_ModelosYListas/Views/CodableView.swift` | `Text` con `.font(.system(size: 13, design: .monospaced))` |
| Cargar datos de un archivo .json que viene en la app | `08_ModelosYListas/Model/Pelicula.swift` + `Views/JSONLocalView.swift` | `Bundle.main.url(forResource:withExtension:)` ⚠️. El .json debe estar en el target |
| Mostrar un año sin coma ("2017", no "2,017") | `08_ModelosYListas/Views/JSONLocalView.swift` | `Text("\(anio, format: .number.grouping(.never))")` |
| Mostrar una imagen desde una URL | `08_ModelosYListas/Views/ImagenRemotaView.swift` → bloques 1 y 2 | Las 2 formas del Anexo A de la Clase 10 (`scale: 3` y con `placeholder` + `.frame(height: 100)`). NECESITA INTERNET; en el examen usa assets. Bloque 3 ⚠️ |


## 09 · Gráficas

Todas llevan `import Charts`. Cada archivo trae su propio struct + datos + vista: se copia solo. Pastel/dona (`SectorMark`) pide iOS 17.

| Quiero… | Archivo | Notas |
|---|---|---|
| ¿Qué gráfica uso? | `09_Graficas/DashboardGraficasView.swift` (encabezado) | Clase 15: barras = comparar categorías · líneas = tendencia en el tiempo (NUNCA para comparar categorías) · puntos = relación entre 2 variables · pastel/dona = proporciones de un total |
| Barras escritas a mano, sin arreglo | `09_Graficas/BarrasView.swift` → bloque 1 | Varios `BarMark` sueltos dentro de `Chart { }`, idéntico a la lámina |
| Una gráfica de barras sencilla | `09_Graficas/BarrasView.swift` → bloque 2 | `Chart(arreglo) { item in BarMark(x:, y:) }` — el modelo es `Identifiable` (en la lámina: `Comida` y `dataBarChart`) |
| Todas las barras de un color | `09_Graficas/BarrasView.swift` → bloque 3 | Opción A de clase: `.foregroundStyle(.purple)` en el `BarMark` |
| Un color distinto por categoría (con leyenda) | `09_Graficas/BarrasView.swift` → bloque 4 | Opción B: `.foregroundStyle(by: .value("Comida", item.tipo))` |
| Escoger yo los colores de cada categoría | `09_Graficas/BarrasView.swift` → bloque 5 | Opción C (además de la B): `.chartForegroundStyleScale([...])` sobre el `Chart`; nombres idénticos a los datos |
| Barras acostadas (horizontales) | `09_Graficas/BarrasView.swift` → bloque 6 | Solo intercambia `x` y `y` ⚠️ no viene en las láminas |
| El número escrito encima de cada barra | `09_Graficas/BarrasView.swift` → bloque 7 | `.annotation(position: .top)` ⚠️ no visto en clase |
| Una línea escrita a mano (sin arreglo) | `09_Graficas/LineasView.swift` → bloque 1 | Varios `LineMark` dentro de `Chart { }`, idéntico a la lámina |
| Una gráfica de línea (tendencia en el tiempo) | `09_Graficas/LineasView.swift` → bloque 2 | `Chart(arreglo) { item in LineMark(x: .value("Meses", item.x), y: .value("Votos", item.y)) }`; id `var id: Int { return x }` como en la lámina |
| Línea con puntitos en cada dato | `09_Graficas/LineasView.swift` → bloque 3 | `LineMark` + `PointMark` en el mismo `Chart` ⚠️ (la lámina los muestra por separado) |
| Varias líneas (una por tienda/persona) | `09_Graficas/LineasView.swift` → bloque 4 | `.foregroundStyle(by:)` separa las series solo |
| Una línea de promedio / meta / límite | `09_Graficas/LineasView.swift` → bloque 5 | `RuleMark` + `ForEach` dentro de `Chart` ⚠️ (lo usaste en tu tarea graficas) |
| Línea curva (suavizada) | `09_Graficas/LineasView.swift` → bloque 6 | `.interpolationMethod(.catmullRom)` ⚠️ |
| Gráfica de puntos / dispersión | `09_Graficas/PuntosView.swift` → bloques 1 y 3 | `PointMark` (= LineMark que no une los puntos); color por grupo con `foregroundStyle(by:)` |
| PointMark con `$0` (otra forma de la lámina) | `09_Graficas/PuntosView.swift` → bloque 2 | `Chart(arreglo) { PointMark(x: .value("…", $0.campo), …) }` — `$0` = el elemento actual |
| Puntos con distinta forma y tamaño | `09_Graficas/PuntosView.swift` → bloque 4 | `.symbol(by:)` y `.symbolSize(120)` ⚠️ |
| Gráfica de pastel escrita a mano | `09_Graficas/PastelYDonaView.swift` → bloque 1 | Dos `SectorMark` sueltos, idéntico a la lámina |
| Gráfica de pastel | `09_Graficas/PastelYDonaView.swift` → bloque 2 | `SectorMark(angle:)` + `.foregroundStyle(by:)` + `.chartLegend(position: .bottom, alignment: .center)`; iOS 17+ |
| Gráfica de dona | `09_Graficas/PastelYDonaView.swift` → bloque 3 | Segunda propiedad en SectorMark: `innerRadius: .ratio(0.5)` |
| Dona con rebanadas separadas | `09_Graficas/PastelYDonaView.swift` → bloque 4 | `angularInset: 2` + `.cornerRadius(5)` ⚠️ |
| Texto/total en el centro de la dona | `09_Graficas/PastelYDonaView.swift` → bloque 5 | `ZStack { Chart; VStack{Text} }` + `.chartLegend(.hidden)` ⚠️ |
| Porcentaje escrito en cada rebanada + mis colores | `09_Graficas/PastelYDonaView.swift` → bloque 6 | `.annotation(position: .overlay)` ⚠️; porcentaje = valor / total * 100 |
| Una barra de avance (porcentaje) | `09_Graficas/ProgressViewEjemplosView.swift` → bloque 1 | Idéntico a la lámina: `Text("Avance:")` + `ProgressView(value: 75, total: 100).scaleEffect(x: 1, y: 3)` |
| Barra de avance gruesa y de color | `09_Graficas/ProgressViewEjemplosView.swift` → bloque 2 | `.tint(...)` |
| Barra de avance que cambia con un valor | `09_Graficas/ProgressViewEjemplosView.swift` → bloque 3 | `@State` + Slider; color con ternario (verde ≥ 70) |
| Varias metas con su barra | `09_Graficas/ProgressViewEjemplosView.swift` → bloque 4 | `ForEach(metas)` ⚠️ + tarjeta con fondo |
| El circulito de "cargando" | `09_Graficas/ProgressViewEjemplosView.swift` → bloque 5 | `ProgressView()` sin valor ⚠️ |
| Que el eje Y vaya siempre de 0 a 100 | `09_Graficas/EjesYEstiloView.swift` → bloque 1 | `.chartYScale(domain: 0 ... 100)` ⚠️ |
| Ponerle título a los ejes | `09_Graficas/EjesYEstiloView.swift` → bloque 2 | `.chartXAxisLabel("...")` / `.chartYAxisLabel("...")` ⚠️ |
| Quitar los ejes (gráfica mini) | `09_Graficas/EjesYEstiloView.swift` → bloque 3 | Barras + `.chartXAxis(.hidden)` / `.chartYAxis(.hidden)` ⚠️ |
| Meter la gráfica en una tarjeta bonita | `09_Graficas/EjesYEstiloView.swift` → bloque 4 | VStack + `.padding()` + `.background(...)` + `.clipShape(RoundedRectangle(cornerRadius: 12))` |
| Barras verdes si aprobó y rojas si no | `09_Graficas/EjesYEstiloView.swift` → bloque 5 | `.foregroundStyle(cond ? Color.green : Color.red)` + `RuleMark` en 70 ⚠️ |
| El usuario captura datos y se ven en la gráfica | `09_Graficas/GraficaInteractivaView.swift` → bloque 3 | `@State` arreglo + TextField + validación con alertas + `append` |
| Cambiar entre barras / pastel / dona con un Picker | `09_Graficas/GraficaInteractivaView.swift` → bloques 1-2 | `Picker` `.segmented` con tags 1/2/3 + `if tipoGrafica == 1 { Chart } else if …`. Sin línea: los datos son categorías |
| Convertir el texto del TextField a número y validar | `09_Graficas/GraficaInteractivaView.swift` → `agregarGasto()` | `if let cantidad = Double(cantidadTexto)`; mensaje distinto por cada error |
| Graficar los datos de MI LISTA (contar por categoría) | `09_Graficas/GraficaDesdeListaView.swift` → bloques 2-3 | Computed property con `for` + `contains`; llámala `GraficaDesdeListaView(registros: miLista)` |
| Sumar un campo por categoría y graficarlo | `09_Graficas/GraficaDesdeListaView.swift` → bloque 4 | Propiedad `sumas` (mismo patrón que `conteos`) |
| Una pantalla de resumen/estadísticas con varias gráficas | `09_Graficas/DashboardGraficasView.swift` | 3 tarjetas de números + cuadrícula 2x2 + meta con ProgressView; fondo completo con ZStack |
| Dividir en 3 (o 2) tarjetas del mismo ancho | `09_Graficas/DashboardGraficasView.swift` → bloque 1 | Cada tarjeta con `.frame(maxWidth: .infinity)` dentro del HStack |
| Sacar un total o promedio de un arreglo | `09_Graficas/LineasView.swift` (`promedio`) / `PastelYDonaView.swift` (`total`) | `var total: Double { var suma = 0.0; for … { suma += … }; return suma }` |


## 10 · Fotos y cámara
| Quiero… | Archivo | Notas |
|---|---|---|
| Los pasos A–F de la Clase 17 para escoger UNA foto de la galería | `10_FotosYCamara/SeleccionarFotoView.swift` | Idéntico a las láminas 5–9 (`selectedItem`, `selectedImage`, `selectedImageBien`): `PhotosPickerItem?` → `.onChange` + `Task` + `loadTransferable` → `UIImage?` → `Image(uiImage:)`. No pide permiso |
| Abrir la cámara y tomar una foto | `10_FotosYCamara/TomarFotoView.swift` → bloque 2 | Como la lámina 19: `Button("Abrir Cámara", systemImage: "camera.fill") { showCamara = true }` + `.sheet` con `CamaraPicker(selectedImageFromCamera: $selectedImage)`. Si no hay cámara (simulador) sale alerta en vez de tronar ⚠️ |
| Pasos del permiso de cámara (Info → Add Row → Privacy - Camera Usage Description) | `10_FotosYCamara/TomarFotoView.swift` → encabezado | Obligatorio desde iOS 10; prueba final en iPhone físico |
| El archivo de la cámara de la profesora | `10_FotosYCamara/CamaraPicker.swift` | Se copia TAL CUAL ("Copy items if needed"). No se modifica |
| Foto de perfil redonda con borde (galería o cámara) | `10_FotosYCamara/FotoPerfilView.swift` | Las dos fuentes llenan la MISMA `@State UIImage?`. `.aspectRatio(.fill)` + `.clipShape(.circle)` |
| Mostrar un ícono mientras no hay foto | `10_FotosYCamara/FotoPerfilView.swift` → bloque 1 | `if let foto { Image(uiImage:) } else { Image(systemName: "person.crop.circle") }` |
| Quitar / borrar la foto | `10_FotosYCamara/SeleccionarFotoView.swift` → bloque Extra | Poner la imagen y el item en `nil` (`role: .destructive` ⚠️) |
| Escoger VARIAS fotos y verlas en cuadrícula | `10_FotosYCamara/VariasFotosView.swift` | ⚠️ `maxSelectionCount`, `LazyVGrid`, `ForEach` por índice: no vistos en clase |
| Formulario que registra algo CON FOTO y lo agrega a una lista | `10_FotosYCamara/RegistroConFotoView.swift` (+ Nuevo…, Detalle…, Row, modelo) | 5 archivos. Lista `@State` → formulario con `@Binding` → `append` + `dismiss()` |
| Validar que llenó nombre, descripción y foto | `10_FotosYCamara/NuevoRegistroConFotoView.swift` → bloque 4 `guardarRegistro()` | `if / else if` con mensaje específico en `alertMessage` + `showAlert.toggle()` |
| Guardar una foto dentro de un struct del modelo | `10_FotosYCamara/RegistroConFoto.swift` | ⚠️ `var foto: UIImage?` con `import UIKit`. En clase el modelo guarda el NOMBRE del asset (String) |
| Renglón de lista con miniatura de foto | `10_FotosYCamara/RegistroConFotoRow.swift` | Foto 55×55 redondeada o ícono si no hay |
| Detalle con la foto grande | `10_FotosYCamara/DetalleRegistroConFotoView.swift` | Paso de valores de ida: `var registro: RegistroConFoto` |


## 11 · Extras (persistencia y sonido)
| Quiero… | Archivo | Notas |
|---|---|---|
| Que un dato NO se borre al cerrar la app (nombre, color, volumen) | `11_Extras/AppStorageView.swift` | `@AppStorage("llave") private var x = valorInicial` — se usa igual que `@State` pero se guarda solo |
| Pantalla de ajustes / preferencias | `11_Extras/AppStorageView.swift` | TextField, Picker segmented, Toggle y Slider ligados directo a `@AppStorage` |
| Cambiar el color de fondo según una opción guardada | `11_Extras/AppStorageView.swift` → `colorDeFondoAjustes()` | `switch` de String a `Color` |
| Pasar un dato entre pantallas sin Binding | `11_Extras/AppStorageView.swift` → encabezado | Dos vistas con la MISMA llave de `@AppStorage` comparten el valor |
| Contar cuántas veces se abrió algo | `11_Extras/AppStorageView.swift` | `visitas += 1` en `.onAppear` |
| Guardar / leer / borrar con botones (UserDefaults a mano) | `11_Extras/UserDefaultsView.swift` | `.set(valor, forKey:)`, `.string(forKey:)` (opcional → `if let`), `.integer`, `.bool`, `.removeObject(forKey:)` |
| Saber qué guardar dónde (@State vs UserDefaults vs Keychain) | `11_Extras/AppStorageView.swift` → encabezado | Contraseñas y tokens NUNCA en UserDefaults → Keychain |
| Convertir texto a número y validar | `11_Extras/UserDefaultsView.swift` → `guardarDatos()` | `if let edad = Int(edadTexto)` + alerta si no es número |
| Reproducir música / un mp3 | `11_Extras/SonidoView.swift` | ⚠️ `AVAudioPlayer` no viene en las presentaciones (viene de tu tarea ejemploMusica) + `Bundle.main.url(forResource:withExtension:)`. El mp3 se arrastra con el target palomeado |
| Botones Play / Pausa / Stop y volumen | `11_Extras/SonidoView.swift` | `.play()`, `.pause()`, `.stop()` + `currentTime = 0`; `volume` es `Float` 0…1 |
| Silenciar con un Toggle | `11_Extras/SonidoView.swift` | `.onChange(of: silencio) { oldValue, newValue in }` → `volume = silencio ? 0 : volumen` |

