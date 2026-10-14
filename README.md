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
| Saber qué copiar además | Lee la línea `NECESITA:` del encabezado del archivo |
| Saber si algo NO se vio en clase | Busca `⚠️ NO VISTO EN CLASE` — prepárate para explicarlo o no lo uses |

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
| **Agregar una imagen** | `Assets.xcassets` → arrastra la imagen → el nombre del set es el que usas en `Image("nombre")` |
| **Permiso de cámara** | Proyecto → Target → pestaña **Info** → clic derecho en la última fila → **Add Row** → `Privacy - Camera Usage Description` → escribe el mensaje. Sin esto la app truena al abrir la cámara |
| **Agregar un .mp3 / .json** | Arrástralo al navegador de Xcode → marca **Copy items if needed** y tu **target** |
| **Agregar CamaraPicker** | Copia `10_FotosYCamara/CamaraPicker.swift` (es el de la profesora, no lo modifiques) |
| **Gráficas** | `import Charts` arriba del archivo |
| **PhotosPicker** | `import PhotosUI` arriba del archivo |
| Probar la **cámara** | El simulador no tiene cámara: usa un iPhone físico o prueba con la galería |

## Errores típicos al pegar código

| Error | Qué significa | Arreglo |
|---|---|---|
| `Cannot find 'X' in scope` | Falta un archivo del que depende | Revisa `NECESITA:` y copia ese archivo (modelo, componente) |
| `Invalid redeclaration of 'X'` | Ya tienes otro struct con ese nombre | Renombra uno de los dos (⌘ clic → Rename) |
| `Missing argument for parameter 'x'` | La vista recibe un dato | Pásaselo al llamarla: `DetalleView(x: valor)`. En el `#Preview` usa un valor de prueba o `.constant(...)` si es `@Binding` |
| `Cannot find type 'Chart'` / `PhotosPicker` | Falta el import | `import Charts` / `import PhotosUI` |
| `Type 'X' does not conform to protocol 'Identifiable'` | El struct de la lista no tiene `id` | Agrega `: Identifiable` y `var id: Int` (o `let id = UUID()`) |
| La imagen no aparece | El nombre no coincide con el asset | Revisa mayúsculas en `Assets.xcassets` |
| Dos barras de navegación | Pusiste un `NavigationStack` dentro de otro | Deja solo el de la pantalla raíz |
| El preview truena pero la app no | El preview no tiene los datos | Envuelve el preview en `NavigationStack { }` o pásale datos de prueba |

## Checklist de UI/UX (rúbrica del curso)

- [ ] Fondo de pantalla completa (`ZStack { Color….ignoresSafeArea() }`)
- [ ] Colores en una paleta (`Utils/`), monocromática o análoga, con buen contraste
- [ ] `spacing` en los stacks y `padding` en los contenedores
- [ ] Botones grandes (`.controlSize(.large)` o `.padding()` ≥ 44 pt de alto)
- [ ] `ScrollView` si el contenido puede no caber
- [ ] Validación con alertas y mensaje **específico** por cada error
- [ ] Todo el texto en español, sin faltas ni acentos faltantes
- [ ] Estructura `Model/ Views/ Components/ Utils/`

---

## Mapa del repo

| Carpeta | Tema | Lo más útil |
|---|---|---|
| `00_AppCompleta/` | App "Mis Mascotas" que junta todo | Cópiala entera y renombra (ver `LEEME_AppCompleta.md`) |
| `01_SwiftBasico/` | Variables, opcionales, arreglos, funciones, fechas, structs | `CalculadoraIMCView` (TextField → número → resultado) |
| `02_PrimeraApp/` | Textos, imágenes, stacks, colores, fondos | `TarjetaPerfilView` (pantalla "acerca de mí") |
| `03_ElementosUI/` | TextField, botones, pickers, slider, toggle, alertas | `FormularioValidacionView` (validación con alertas) |
| `04_Componentes/` | Vistas reutilizables con parámetros | `Components/` (tarjeta, botón, fila, tile, campo con @Binding) |
| `05_Layouts/` | Dividir la pantalla, cuadrículas, renglones, alineación | `MitadesView`, `PartesIgualesView`, `DashboardView` |
| `06_MultiplesPantallas/` | NavigationStack, paso de valores, @Binding, sheets | `LoginView`, `MenuPrincipalView` |
| `07_TabView/` | Pestañas, carrusel, datos compartidos | `TabDatosCompartidosView`, `CarruselView` |
| `08_ModelosYListas/` | Modelos, List, detalle, editar, agregar, buscar, JSON | `ListaEditableView`, `ListaAgregarBorrarView` |
| `09_Graficas/` | Barras, líneas, puntos, pastel, dona, ProgressView | `GraficaInteractivaView`, `GraficaDesdeListaView` |
| `10_FotosYCamara/` | PhotosPicker, CamaraPicker, permisos | `FotoPerfilView`, `RegistroConFotoView` |
| `11_Extras/` | @AppStorage, UserDefaults, sonido | `AppStorageView` |
| `_Menu/` + `ContentView.swift` | Menú de este repo | **No se copian** |

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
| Renglón de lista con foto, textos e ícono a la derecha | `00_AppCompleta/Components/MascotaRow.swift` | |
| Renglón "etiqueta ……… valor" | `00_AppCompleta/Components/FilaDatoMascota.swift` | `Spacer()` empuja el valor |
| Un botón reutilizable de ancho completo | `00_AppCompleta/Components/BotonPrincipalMascotas.swift` | ⚠️ recibe `accion: () -> Void` |
| Contar cuántos hay por categoría y graficarlo | `00_AppCompleta/Views/EstadisticasMascotasView.swift` | `conteoPorEspecie()` con dos `for` |
| Barras horizontales | `00_AppCompleta/Views/EstadisticasMascotasView.swift` bloque 2 | número en `x`, categoría en `y` |
| Dona / pastel con colores propios | `00_AppCompleta/Views/EstadisticasMascotasView.swift` bloque 3 | `innerRadius` + `.chartForegroundStyleScale` |
| Porcentaje con ProgressView | `00_AppCompleta/Views/EstadisticasMascotasView.swift` bloque 4 | `.scaleEffect(x: 1, y: 3)` |
| Perfil que se guarda al cerrar la app | `00_AppCompleta/Views/PerfilDuenoView.swift` | `@AppStorage("nombreDueno")`; la misma llave en Inicio |
| Guardar un color elegido por el usuario | `00_AppCompleta/Views/PerfilDuenoView.swift` | Se guarda el nombre (String) y `colorFavoritoDueno()` lo convierte |
| Agregar la cámara a la app completa | `00_AppCompleta/Views/PerfilDuenoView.swift` encabezado | 4 pasos + CamaraPicker de `10_FotosYCamara` |


## 01 · Swift básico
| Quiero… | Archivo | Notas |
|---|---|---|
| Recordar var vs let y los tipos (Int, Double, Bool, String, Character) | `01_SwiftBasico/TiposYVariablesView.swift` → bloques 1 y 2 | `let` no se puede reasignar |
| Meter una variable dentro de un texto / unir textos | `01_SwiftBasico/TiposYVariablesView.swift` → bloque 3 | `"Hola \(nombre)"` y `+` / `+=` |
| Hacer operaciones, división con decimales, residuo | `01_SwiftBasico/TiposYVariablesView.swift` → bloque 4 | `7 / 2 = 3` (Int); usa `Double(a) / Double(b)` |
| Convertir Int ↔ String ↔ Double | `01_SwiftBasico/TiposYVariablesView.swift` → bloque 5 | `Int("123")` es opcional → `if let` |
| Usar && \|\| ! o el ternario `? :` | `01_SwiftBasico/TiposYVariablesView.swift` → bloques 6 y 7 | `esFavorito ? "heart.fill" : "heart"` |
| Validar que lo que escribió el usuario sea número | `01_SwiftBasico/OpcionalesView.swift` → bloque 4 + `convertirNumero()` | Vacío → alerta; no es número → alerta |
| Entender opcionales, `if let`, por qué no usar `!` | `01_SwiftBasico/OpcionalesView.swift` → bloques 1–3 | `??` y `guard let` en bloques 5–6 (⚠️ no vistos) |
| Agregar / quitar elementos de un arreglo desde la pantalla | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 6 + `agregarFruta()` | `append`, `remove(at:)`, valida vacío y repetidos |
| Mostrar un arreglo de Strings en pantalla | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 6 | `ForEach(arreglo, id: \.self)`; para modelos usa tema 08 |
| Sacar suma, promedio, máximo y mínimo | `01_SwiftBasico/ArreglosYCiclosView.swift` → `ejemploCalculos()` | Revisa `isEmpty` antes de dividir |
| Leer una posición del arreglo sin que truene | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 2 | `if indice >= 0 && indice < lista.count` |
| Ciclo for, rangos `1...5` y `0..<n` | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 3 | `..<` no incluye el último |
| Elegir algo al azar / número aleatorio | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 5 | `randomElement()` con `if let`; `Int.random(in: 1...100)` |
| Diccionario, filtrar u ordenar | `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 7 | ⚠️ no visto en clase |
| Escribir funciones con parámetros y return | `01_SwiftBasico/FuncionesYCondicionesView.swift` → bloque 1 | `Button("…", action: miFuncion)` para funciones sin return |
| Clasificar con if / else if (calificación → letra) | `01_SwiftBasico/FuncionesYCondicionesView.swift` → `letraCalificacion()` | |
| switch con rangos o con textos | `01_SwiftBasico/FuncionesYCondicionesView.swift` → `clasificarEdad()` / `colorDesdeNombre()` | Siempre lleva `default` |
| Cambiar la imagen o el color según un Slider | `01_SwiftBasico/FuncionesYCondicionesView.swift` → bloque 4 + `iconoBateria` / `colorNivel` | Propiedad calculada `var x: String { }` |
| Mostrar la fecha de hoy en español | `01_SwiftBasico/FechasYNumerosView.swift` → `fechaDeHoy()` | `locale = Locale(identifier: "es_MX")` |
| Fecha con formato tipo dd/MM/yyyy | `01_SwiftBasico/FechasYNumerosView.swift` → `fechaConFormato()` | `MMMM` = mes con letra, `EEEE` = día |
| Sumar días o meses a una fecha | `01_SwiftBasico/FechasYNumerosView.swift` → `fechaFutura()` | Regresa opcional → `if let` |
| Calcular edad o días entre fechas | `01_SwiftBasico/FechasYNumerosView.swift` → `diferenciaDeFechas()` | ⚠️ `dateComponents(from:to:)` no visto |
| Mostrar precio en pesos, 2 decimales o porcentaje | `01_SwiftBasico/FechasYNumerosView.swift` → bloques 6 y 7 | `.currency(code: "MXN")`, `specifier: "%.2f"` |
| Que un año no salga "2,026" | `01_SwiftBasico/FechasYNumerosView.swift` → bloque 8 | `.number.grouping(.never)` |
| Crear mi propio struct con método y propiedad calculada | `01_SwiftBasico/StructsYClasesView.swift` → `struct Libro` | Init automático |
| Crear una clase con init y métodos (depositar/retirar) | `01_SwiftBasico/StructsYClasesView.swift` → `class CuentaBancaria` | Las clases necesitan `init` escrito |
| Explicar copia (struct) vs referencia (class) | `01_SwiftBasico/StructsYClasesView.swift` → bloque 3 | |
| Una calculadora completa con validación y alertas | `01_SwiftBasico/CalculadoraIMCView.swift` | Pantalla lista: cambia fórmula y textos |
| Esconder el teclado al tocar fuera | `01_SwiftBasico/CalculadoraIMCView.swift` → `@FocusState` + `.onTapGesture` | |


## 02 · Mi primera app
| Quiero… | Archivo | Notas |
|---|---|---|
| Cambiar el tamaño de un texto (título, subtítulo, chico) | `02_PrimeraApp/TextosView.swift` → bloque 1 | `.largeTitle` … `.caption2` |
| Un tamaño exacto de letra | `02_PrimeraApp/TextosView.swift` → bloque 2 | `.font(.system(size: 21))` |
| Negritas, cursiva, color del texto | `02_PrimeraApp/TextosView.swift` → bloques 3 y 4 | `.foregroundStyle(.secondary)` para subtítulos |
| Centrar un texto largo o limitar líneas | `02_PrimeraApp/TextosView.swift` → bloque 5 | `.multilineTextAlignment(.center)` |
| Un texto con fondo tipo etiqueta o chip | `02_PrimeraApp/TextosView.swift` → bloque 6 | Primero `.padding()`, luego `.background` |
| Texto con ícono | `02_PrimeraApp/TextosView.swift` → bloque 7 | `Label("Texto", systemImage: "star.fill")` |
| Poner una imagen de Assets | `02_PrimeraApp/ImagenesView.swift` → bloque 1 | Orden: `.resizable(resizingMode: .stretch)` → `.aspectRatio(.fit)` → `.frame` |
| Que la imagen llene un cuadro sin deformarse | `02_PrimeraApp/ImagenesView.swift` → bloque 2 | `.fill` + `.clipped()` (⚠️) |
| Foto circular con borde y sombra | `02_PrimeraApp/ImagenesView.swift` → bloque 3 | Usa imagen cuadrada |
| Imagen con esquinas redondeadas y borde | `02_PrimeraApp/ImagenesView.swift` → bloque 4 | Mismo `cornerRadius` en clip y borde |
| Íconos del sistema (SF Symbols) | `02_PrimeraApp/ImagenesView.swift` → bloque 5 | Tamaño con `.font(.system(size:))` |
| Texto encima de una imagen | `02_PrimeraApp/ImagenesView.swift` → bloque 6 | `ZStack` + sombra al texto |
| Cambiar la imagen según lo que elige el usuario | `02_PrimeraApp/ImagenesView.swift` → bloque 7 | `Image(variable)`, el `.tag` = nombre del asset |
| Acomodar cosas vertical / horizontal / encimadas | `02_PrimeraApp/StacksBasicosView.swift` → bloque 1 | |
| Alinear a la izquierda / derecha dentro de un stack | `02_PrimeraApp/StacksBasicosView.swift` → bloques 2, 3, 4 y 9 | `.frame(maxWidth: .infinity, alignment: .leading)` |
| Separar elementos (spacing, Spacer, Divider) | `02_PrimeraApp/StacksBasicosView.swift` → bloques 5, 6 y 7 | `Spacer().frame(height: 30)` = fijo |
| Márgenes solo de un lado | `02_PrimeraApp/StacksBasicosView.swift` → bloque 8 | `.padding(.horizontal, 30)` |
| Un renglón ícono + título + subtítulo + flecha | `02_PrimeraApp/StacksBasicosView.swift` → bloque 10 | Más renglones en `05_Layouts` |
| Colores propios con RGB | `02_PrimeraApp/ColoresYFondosView.swift` → bloque 2 | Divide entre 255 |
| Hacer una paleta monocromática o análoga | `02_PrimeraApp/ColoresYFondosView.swift` → `let` arriba del body + bloques 4 y 5 | Sin `static`: `let` dentro del struct |
| Revisar contraste de texto y fondo | `02_PrimeraApp/ColoresYFondosView.swift` → bloque 6 | coolors.co/contrast-checker |
| Fondo degradado | `02_PrimeraApp/ColoresYFondosView.swift` → bloque 8 | ⚠️ `LinearGradient` no visto |
| Fondo que cubra TODA la pantalla (opción ZStack) | `02_PrimeraApp/FondoPantallaCompletaView.swift` → `FondoCompletoZStackView` | `Color.x.ignoresSafeArea()` hasta atrás |
| Fondo que cubra TODA la pantalla (opción .background) | `02_PrimeraApp/FondoPantallaCompletaView.swift` → `FondoCompletoBackgroundView` | `frame(maxWidth/maxHeight: .infinity)` + `.background` + `.ignoresSafeArea()` |
| Entender por qué cambia el resultado al mover un modificador | `02_PrimeraApp/ModificadoresView.swift` → bloque 1 | padding→background vs background→padding |
| Esquinas redondeadas, cápsula o círculo | `02_PrimeraApp/ModificadoresView.swift` → bloque 2 | `.clipShape(...)` |
| Bordes y sombras | `02_PrimeraApp/ModificadoresView.swift` → bloques 3 y 4 | Borde con `.overlay(RoundedRectangle(...).stroke(...))` |
| Mover un elemento, hacerlo más grande o girarlo | `02_PrimeraApp/ModificadoresView.swift` → bloques 6 y 8 | `.offset`, `.scaleEffect`, `.rotationEffect` (⚠️) |
| Una tarjeta blanca con sombra | `02_PrimeraApp/ModificadoresView.swift` → bloque 9 | |
| Pantalla de perfil / "acerca de mí" completa | `02_PrimeraApp/TarjetaPerfilView.swift` | Ya trae tus datos; cambia lo ✏️ |
| Alerta con varias líneas de texto | `02_PrimeraApp/TarjetaPerfilView.swift` → `.alert(...) { } message: { }` | |


## 03 · Elementos UI

| Quiero… | Archivo | Notas |
|---|---|---|
| Un campo de texto normal | `03_ElementosUI/TextFieldsView.swift` → bloque 1 | `TextField("Nombre", text: $nombre)` + `.textFieldStyle(.roundedBorder)` |
| Un campo de texto con borde/fondo propio | `03_ElementosUI/TextFieldsView.swift` → bloque 3 | `.padding` + `.background` + `.cornerRadius` + `.overlay(RoundedRectangle…stroke)` con el mismo radio |
| Un campo de contraseña (puntitos) | `03_ElementosUI/TextFieldsView.swift` → bloque 4 | `SecureField` ⚠️ no visto en clase |
| Que salga el teclado de solo números | `03_ElementosUI/TextFieldsView.swift` → bloque 5 | `.keyboardType(.numberPad)` / `.decimalPad` ⚠️ |
| Convertir lo escrito a número (Int/Double) | `03_ElementosUI/TextFieldsView.swift` → bloque 5 | `if let edad = Int(edadTexto) { }` — nunca `!` |
| Mostrar en vivo lo que el usuario escribe | `03_ElementosUI/TextFieldsView.swift` → bloque 6 | `Text("Hola, \(nombre)")` |
| Limitar caracteres / contador "12/40" | `03_ElementosUI/TextFieldsView.swift` → bloque 7 | `.onChange(of:) { oldValue, newValue in }` regresa al texto anterior |
| Esconder el teclado | `03_ElementosUI/TextFieldsView.swift` → bloque 8 | `@FocusState` + `.focused($campoEnFoco)` + `campoEnFoco = false` + `.onTapGesture` |
| Las 3 formas de hacer un botón | `03_ElementosUI/BotonesView.swift` → bloques 1-3 | código directo / `action: funcion` / `action:` + `Label` |
| Cambiar estilo, color o tamaño de un botón | `03_ElementosUI/BotonesView.swift` → bloques 4-5 | `.buttonStyle(.borderedProminent)` `.tint(.orange)` `.controlSize(.large)` |
| Un botón que ocupe todo el ancho | `03_ElementosUI/BotonesView.swift` → bloque 6 | `.frame(maxWidth: .infinity)` va DENTRO del label |
| Un botón con mi propio fondo de color | `03_ElementosUI/BotonesView.swift` → bloque 7 | `.background(Color.indigo)` + `.cornerRadius(12)` dentro del label |
| Un botón que sea solo un ícono (+ / -) | `03_ElementosUI/BotonesView.swift` → bloque 8 | `Image(systemName:)` con `.font(.system(size: 44))` |
| Desactivar el botón si falta un dato | `03_ElementosUI/BotonesView.swift` → bloque 9 | `.disabled(nombre.isEmpty)` ⚠️ |
| Un botón rojo de borrar | `03_ElementosUI/BotonesView.swift` → bloque 10 | `role: .destructive` ⚠️ |
| Un Picker de ruleta | `03_ElementosUI/PickersView.swift` → bloque 1 | `Picker(selection: $x, label: Text("…"))` + `.pickerStyle(.wheel)`; Text = se ve, tag = se guarda |
| Un Picker de botones en fila (segmentos) | `03_ElementosUI/PickersView.swift` → bloque 2 | `.pickerStyle(.segmented)`, tags String |
| Un Picker desplegable con opciones de un arreglo | `03_ElementosUI/PickersView.swift` → bloque 3 | `ForEach(arreglo, id: \.self) { o in Text(o).tag(o) }` + `.pickerStyle(.menu)` |
| Opción "Selecciona…" y validar que eligió algo | `03_ElementosUI/PickersView.swift` → bloque 4 | `Text("Selecciona…").tag("")` y `if carrera == ""` → alerta |
| Un Picker que cambia según otro (país → ciudad) | `03_ElementosUI/PickersDependientesView.swift` | propiedad calculada con las opciones + `.onChange` que resetea `ciudad = ""` |
| Usar oldValue y newValue de .onChange | `03_ElementosUI/PickersDependientesView.swift` → bloque 1 | "Cambiaste de X a Y" |
| Un Slider y mostrar su valor sin decimales | `03_ElementosUI/SliderYToggleView.swift` → bloque 1 | `Text("\(Int(volumen))")` |
| Slider de 1 en 1 / saber si lo están moviendo | `03_ElementosUI/SliderYToggleView.swift` → bloque 2 | `step: 1`, `onEditingChanged: { editing in }` |
| Slider que cambia tamaño u opacidad | `03_ElementosUI/SliderYToggleView.swift` → bloque 3 | `.font(.system(size: tamano))`, `.opacity(opacidad)` |
| Un Toggle (switch) | `03_ElementosUI/SliderYToggleView.swift` → bloque 4 | `Toggle("Texto", isOn: $bool)` + `.tint` |
| Toggle de favorito con corazón | `03_ElementosUI/SliderYToggleView.swift` → bloque 5 | `Label("Favorita", systemImage: esFavorito ? "heart.fill" : "heart")` |
| Mostrar u ocultar algo con un Toggle | `03_ElementosUI/SliderYToggleView.swift` → bloque 6 | `if mostrarDetalles { … }` |
| Cambiar el fondo (modo oscuro) con un Toggle | `03_ElementosUI/SliderYToggleView.swift` → bloque 7 | ternario en el `Color` del ZStack |
| Cambiar la imagen según un valor (como Goku) | `03_ElementosUI/ImagenSegunValorView.swift` → bloque 1 | `var imagenSegunNivel: String { if … return "foto4" … }` |
| Cambiar ícono/color según un valor (batería, semáforo) | `03_ElementosUI/ImagenSegunValorView.swift` → bloque 3 | propiedades calculadas que regresan `String` y `Color` |
| Botones + / - para una cantidad | `03_ElementosUI/OtrosControlesView.swift` → bloque 1 | `Stepper(…, value: $cantidad, in: 1...10)` ⚠️ |
| Elegir una fecha y mostrarla en español | `03_ElementosUI/OtrosControlesView.swift` → bloques 2-3 | `DatePicker` ⚠️ + `DateFormatter` con `es_MX` (como en clase) |
| Calendario que solo deja fechas futuras | `03_ElementosUI/OtrosControlesView.swift` → bloque 3 | `in: Date()...` + `.datePickerStyle(.graphical)` ⚠️ |
| Que el usuario elija un color | `03_ElementosUI/OtrosControlesView.swift` → bloque 4 | `ColorPicker` ⚠️ |
| Barra de progreso que se mueve con un Slider | `03_ElementosUI/OtrosControlesView.swift` → bloque 5 | `ProgressView(value:total:)` + `.scaleEffect(x: 1, y: 3)` |
| Un botón que abra una página web | `03_ElementosUI/OtrosControlesView.swift` → bloque 6 | `Link` ⚠️ con `if let url = URL(string:)` |
| Una alerta básica | `03_ElementosUI/AlertasView.swift` → bloque 1 | 3 pasos: `@State Bool` → `.alert(…, isPresented:)` → `showAlert.toggle()` |
| Una alerta cuyo texto cambia según el error | `03_ElementosUI/AlertasView.swift` → bloque 2 | `@State alertMessage` como título |
| Alerta con título y mensaje de varias líneas | `03_ElementosUI/AlertasView.swift` → bloque 3 | bloque `message:` + `"""` |
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

Cada componente vive en su propio archivo dentro de `04_Componentes/Components/`. Para crearlo en tu proyecto: File → New → File from Template → SwiftUI View → carpeta `Components/`, y pegas el archivo. Los parámetros son `var` sin `@State` (el componente solo los muestra). Los que traen valor por defecto (`color: Color = .purple`) los puedes omitir.

| Quiero… | Archivo | Notas |
|---|---|---|
| Ver cómo se arma una pantalla completa con componentes | `04_Componentes/ComponentesDemoView.swift` | Perfil con todos los componentes juntos |
| Una tarjeta con ícono, título y subtítulo | `04_Componentes/Components/TarjetaInfo.swift` | `TarjetaInfo(icono:titulo:subtitulo:color:)` |
| Un botón reutilizable de todo el ancho que haga lo que yo le diga | `04_Componentes/Components/BotonGrande.swift` | La acción va entre llaves `{ contador += 1 }` o `accion: miFuncion` · ⚠️ closure como parámetro |
| Una foto redonda con borde y sombra (avatar, perfil) | `04_Componentes/Components/ImagenCircular.swift` | Patrón PokeImagenView; `.fill` + `clipShape(.circle)` |
| El mismo encabezado en todas mis pantallas | `04_Componentes/Components/EncabezadoPantalla.swift` | Ícono + título + subtítulo centrados |
| Renglón "Etiqueta …… Valor" para pantallas de detalle | `04_Componentes/Components/FilaDato.swift` | Números → `"\(edad)"`; decimales → `.formatted(.number.precision(.fractionLength(2)))` (`specifier:` solo sirve dentro de `Text`) |
| Una etiqueta/chip de color (categoría, estado) | `04_Componentes/Components/EtiquetaChip.swift` | Usa colores oscuros: el texto es blanco |
| Un cuadro con número grande para dashboard | `04_Componentes/Components/TileEstadistica.swift` | 3 en un `HStack` quedan del mismo ancho (`maxWidth: .infinity`) |
| Un campo de texto con etiqueta que cambie la variable de mi pantalla | `04_Componentes/Components/CampoConEtiqueta.swift` | `@Binding`: en el padre `@State private var x = ""` y lo llamas con `texto: $x` |
| Mostrar estrellas de calificación (★★★½☆) | `04_Componentes/Components/EstrellasRating.swift` | `EstrellasRating(calificacion: 3.5)`; si es Int: `Double(miInt)` |
| Pasar una función a un componente (no código directo) | `04_Componentes/ComponentesDemoView.swift` → bloque 7 | `BotonGrande(..., accion: saludar)` |


## 05 · Layouts (dividir la pantalla, renglones, acomodo)

Casi todos los ejemplos traen un `.frame(height: …)` marcado `✏️ DEMO` para que quepan varios en una pantalla. **Bórralo** y el bloque ocupa toda la pantalla. La regla de fondo: los hijos que llevan `.frame(maxWidth: .infinity, maxHeight: .infinity)` se reparten el espacio en partes iguales; `spacing: 0` quita el hueco entre ellos.

| Quiero… | Archivo | Notas |
|---|---|---|
| Dividir la pantalla en 2 (arriba / abajo) | `05_Layouts/MitadesView.swift` → bloque 1 | `VStack(spacing: 0)` + cada mitad con `maxWidth/maxHeight: .infinity` |
| Dividir la pantalla en 2 (izquierda / derecha) | `05_Layouts/MitadesView.swift` → bloque 2 | Igual pero con `HStack` |
| Imagen en la mitad de arriba y datos abajo | `05_Layouts/MitadesView.swift` → bloque 3 | |
| Dos tarjetas lado a lado del mismo tamaño | `05_Layouts/MitadesView.swift` → bloque 4 | `HStack(spacing: 12)` + esquinas redondas |
| Dividir en 3 o 4 columnas iguales | `05_Layouts/PartesIgualesView.swift` → bloques 1 y 2 | ¿5 partes? copia otra zona igual |
| Dividir en 3 renglones iguales | `05_Layouts/PartesIgualesView.swift` → bloque 3 | |
| Renglones con distinto número de columnas adentro | `05_Layouts/PartesIgualesView.swift` → bloque 4 | |
| 3 botones del mismo ancho en fila | `05_Layouts/PartesIgualesView.swift` → bloque 5 | El `.frame(maxWidth: .infinity)` va DENTRO del label |
| Dividir en 4 cuadros (2x2) | `05_Layouts/CuadriculaView.swift` → bloque 1 | VStack con 2 HStack |
| Cuadrícula 3x3 numerada | `05_Layouts/CuadriculaView.swift` → bloque 2 | Dos `ForEach` anidados |
| Galería de fotos en 2 columnas | `05_Layouts/CuadriculaView.swift` → bloque 3 | ⚠️ `LazyVGrid` + `GridItem(.flexible())` |
| Menú de íconos en 3 columnas | `05_Layouts/CuadriculaView.swift` → bloque 4 | ⚠️ `LazyVGrid` |
| Que una parte ocupe 1/3 y la otra 2/3 | `05_Layouts/ProporcionesView.swift` → bloque 1 | ⚠️ `GeometryReader`: `geo.size.height / 3` |
| 30% / 70% lado a lado (barra lateral + contenido) | `05_Layouts/ProporcionesView.swift` → bloque 2 | ⚠️ `GeometryReader`: `geo.size.width * 0.3` |
| Arriba un alto fijo y abajo todo lo demás (sin GeometryReader) | `05_Layouts/ProporcionesView.swift` → bloques 3 y 4 | `.frame(height: 120)` + el otro con `maxHeight: .infinity` |
| Formulario con encabezado fijo, scroll en medio y botón Guardar siempre visible abajo | `05_Layouts/EncabezadoCuerpoPieView.swift` | Incluye validación con alerta y esconder teclado |
| Renglones "Etiqueta …… Valor" con líneas separadoras | `05_Layouts/RenglonesView.swift` → bloque 1 | `HStack { Text; Spacer(); Text }` + `Divider()` |
| Renglones estilo Ajustes (ícono + texto + flecha >) | `05_Layouts/RenglonesView.swift` → bloque 2 | `Image(systemName: "chevron.right")` |
| Renglón con foto, título, subtítulo y precio | `05_Layouts/RenglonesView.swift` → bloque 3 | Mismo diseño que un `JugadorRow` |
| Una tabla con columnas alineadas y encabezado | `05_Layouts/RenglonesView.swift` → bloque 4 | Mismo `.frame(width:)` por columna en encabezado y filas; copia `FilaTablaLayout` |
| Renglones con color alternado (cebra) | `05_Layouts/RenglonesView.swift` → bloque 4 | `indice % 2 == 0 ? color : Color.clear` |
| Poner algo en una esquina o al centro | `05_Layouts/AlineacionView.swift` → bloque 1 | `.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)` |
| El botón pegado hasta abajo | `05_Layouts/AlineacionView.swift` → bloque 2 | Un solo `Spacer()` entre el contenido y el botón |
| Todo centrado vertical y horizontal | `05_Layouts/AlineacionView.swift` → bloque 3 | `Spacer()` arriba y abajo |
| Un texto a la izquierda / derecha | `05_Layouts/AlineacionView.swift` → bloque 4 | `.frame(maxWidth: .infinity, alignment: .leading)` |
| Entender `VStack(alignment: .leading)` | `05_Layouts/AlineacionView.swift` → bloque 5 | Alinea a los hijos, no al stack |
| Un numerito rojo en la esquina de un ícono | `05_Layouts/AlineacionView.swift` → bloque 6 | ⚠️ `.overlay(alignment: .topTrailing)` · sin ⚠️: `CapasZStackView` bloque 2 |
| Un carrusel de tarjetas que se desliza de lado | `05_Layouts/ScrollHorizontalView.swift` → bloque 1 | `ScrollView(.horizontal)` + `HStack` |
| Chips de categorías para elegir una (filtro) | `05_Layouts/ScrollHorizontalView.swift` → bloque 2 | Guarda la elegida en `@State` y la pinta distinto |
| Que la pantalla haga scroll hacia abajo | `05_Layouts/ScrollHorizontalView.swift` → bloque 3 | `ScrollView { VStack { … } }` |
| Texto encima de una imagen | `05_Layouts/CapasZStackView.swift` → bloque 1 | En `ZStack` lo primero queda atrás |
| Insignia/badge en la esquina de una foto o ícono | `05_Layouts/CapasZStackView.swift` → bloque 2 | `ZStack(alignment: .topTrailing)` |
| Tarjeta con foto de fondo y texto que se lea | `05_Layouts/CapasZStackView.swift` → bloque 3 | ⚠️ `LinearGradient` para oscurecer |
| Una imagen como fondo de toda la pantalla | `05_Layouts/CapasZStackView.swift` → bloque 4 | `.aspectRatio(contentMode: .fill)` + `.ignoresSafeArea()` |
| Fondo de color con una tarjeta encima | `05_Layouts/CapasZStackView.swift` → bloque 5 | Patrón de clase: `ZStack { Color…ignoresSafeArea() … }` |
| Una pantalla de inicio/dashboard completa | `05_Layouts/DashboardView.swift` | Encabezado + 3 tiles + 2x2 + renglones + botón; no depende de otros archivos |


## 06 · Múltiples pantallas

| Quiero… | Archivo | Notas |
|---|---|---|
| Pasar de una pantalla a otra (lo básico) | `06_MultiplesPantallas/NavegacionBasicaView.swift` → bloques 1, 2 y 3 | Un solo `NavigationStack` en la pantalla raíz. Las 3 formas de `NavigationLink` de la clase |
| Un NavigationLink que se vea como botón | `06_MultiplesPantallas/NavegacionBasicaView.swift` → bloques 4 y 5 | `.buttonStyle(.borderedProminent)` + `.tint`. Para ancho completo el `.frame` va DENTRO del label |
| Un renglón/tarjeta que navega al tocarla | `06_MultiplesPantallas/NavegacionBasicaView.swift` → bloque 3 | `NavigationLink { destino } label: { HStack… }` |
| Poner título a la pantalla | `06_MultiplesPantallas/NavegacionBasicaView.swift` (al final) | `.navigationTitle` va sobre el contenido, no sobre el `NavigationStack` |
| Un botón "Regresar" que vuelva a la pantalla anterior | `06_MultiplesPantallas/PantallaDestinoView.swift` | `@Environment(\.dismiss) private var dismiss` + `dismiss()` |
| Mandar datos a la siguiente pantalla (solo mostrar) | `06_MultiplesPantallas/PasoDeValoresView.swift` + `RecibeValoresView.swift` | En la pantalla 2: `var nombre: String` sin `@State` ni `private` |
| Que la otra pantalla CAMBIE un dato y se vea al regresar | `06_MultiplesPantallas/BindingIdaYVueltaView.swift` + `EditarNicknameView.swift` | `@State` en la base, `@Binding` en el detalle, llamar con `$` |
| Preview de una vista con `@Binding` | `06_MultiplesPantallas/EditarNicknameView.swift` (abajo) | `.constant("valor")` |
| Validar que no esté vacío ANTES de navegar | `06_MultiplesPantallas/NavegacionConValidacionView.swift` | `Button` + `.navigationDestination(isPresented:)` + alerta con mensaje según el campo |
| Una pantalla de login (usuario y contraseña) | `06_MultiplesPantallas/LoginView.swift` + `BienvenidaView.swift` | Credenciales fijas "admin"/"1234". `SecureField` ⚠️ |
| Esconder el teclado al tocar fuera | `06_MultiplesPantallas/LoginView.swift` | `@FocusState` + `.focused` + `.onTapGesture` |
| Cerrar sesión / quitar la flecha "<" | `06_MultiplesPantallas/BienvenidaView.swift` | `.navigationBarBackButtonHidden(true)` ⚠️ + botón con `dismiss()` |
| Mostrar la fecha de hoy en español | `06_MultiplesPantallas/BienvenidaView.swift` → `fechaHoy` | `DateFormatter` con `es_MX` |
| Un menú de inicio con 4 botones grandes (2x2) | `06_MultiplesPantallas/MenuPrincipalView.swift` | Dos `HStack`, cada botón con `.frame(maxWidth: .infinity)` |
| Una ventana que sube desde abajo (sheet / modal) | `06_MultiplesPantallas/SheetView.swift` → bloque 1 | Bool + `.sheet(isPresented:)` + `toggle()` |
| Que la sheet me regrese un valor elegido | `06_MultiplesPantallas/SheetView.swift` → bloque 2 + `SheetSeleccionFrutaView` | Mismo patrón que la cámara: `@Binding` + `dismiss()` |
| Sheet a media pantalla | `06_MultiplesPantallas/SheetView.swift` → bloque 3 | `.presentationDetents([.medium, .large])` ⚠️ |
| Mostrar una pantalla completa encima (sin navegar) | `06_MultiplesPantallas/SheetView.swift` → bloque 4 | `.fullScreenCover` ⚠️, necesita botón para cerrar |
| Esconder la barra de navegación | `06_MultiplesPantallas/ToolbarView.swift` → bloque 3 | `.toolbar(.hidden)` (visto en clase) |
| Un botón "+" arriba en la barra | `06_MultiplesPantallas/ToolbarView.swift` → bloque 2 | `.toolbar { ToolbarItem(placement: .topBarTrailing) {…} }` ⚠️ |
| Título chico centrado | `06_MultiplesPantallas/ToolbarView.swift` → bloque 1 | `.navigationBarTitleDisplayMode(.inline)` ⚠️ |


## 07 · TabView

| Quiero… | Archivo | Notas |
|---|---|---|
| Pestañas abajo (Inicio / Lista / Perfil) | `07_TabView/TabViewBasicoView.swift` | `.tabItem { Label("…", systemImage: "…") }` + `.tint` sobre el `TabView` |
| Pestañas que además navegan a un detalle | `07_TabView/TabConNavegacionView.swift` | Un `NavigationStack` DENTRO de cada pestaña, no afuera del `TabView` |
| Que dos pestañas usen la misma lista | `07_TabView/TabDatosCompartidosView.swift` | `@State` en la vista del `TabView`; con `$` modifica, sin `$` solo lee |
| Agregar elementos a una lista desde un TextField | `07_TabView/TareasListaTabView.swift` → bloque 1 | `tareas.append(...)` + alerta si está vacío |
| Marcar/desmarcar elementos de una List con Toggle | `07_TabView/TareasListaTabView.swift` → bloque 2 | `List($tareas) { $tarea in Toggle(isOn: $tarea.completada) }` |
| Contar cuántos cumplen algo / sacar porcentaje | `07_TabView/TareasResumenTabView.swift` | Propiedad calculada con `for`. Cuidado con dividir entre 0 |
| Barra de progreso (ProgressView) | `07_TabView/TareasResumenTabView.swift` → bloque 2 | `ProgressView(value:total:)` + `.scaleEffect(x: 1, y: 3)` |
| 3 cuadros iguales con números (estadísticas) | `07_TabView/TareasResumenTabView.swift` → `ResumenTabCuadro` | `.frame(maxWidth: .infinity)` en cada cuadro |
| Modelo + datos fijos para una lista | `07_TabView/Model/TareaTab.swift` | `struct …: Identifiable` + `func cargar…() -> [...]` |
| Carrusel de fotos que se desliza | `07_TabView/CarruselView.swift` | `TabView` + `.tabViewStyle(.page)` + `.indexViewStyle(...)` |
| Texto encima de una foto | `07_TabView/CarruselView.swift` → `CarruselPagina` | `ZStack(alignment: .bottom)` |
| Pantallas de bienvenida con botón "Comenzar" | `07_TabView/OnboardingView.swift` | `if yaEmpezo { app } else { páginas }` con `@State` |
| Cambiar de pantalla completa con un if | `07_TabView/OnboardingView.swift` | `var body` puede tener `if/else` |
| Cambiar de pestaña con un botón | `07_TabView/TabSeleccionView.swift` | `TabView(selection: $pestana)` + `.tag(n)` ⚠️; el botón hace `pestana = 2` |
| Numerito rojo en una pestaña | `07_TabView/TabSeleccionView.swift` → pestaña 2 | `.badge(numero)` ⚠️; con 0 no se ve |


## 08 · Modelos y listas

| Quiero… | Archivo | Notas |
|---|---|---|
| Crear el modelo (struct) de mis datos | `08_ModelosYListas/Model/Jugador.swift` | `Identifiable` exige un campo llamado `id`. La imagen se guarda como `String` (nombre del asset) |
| Tener datos de prueba fijos (ModelData) | `08_ModelosYListas/Model/ModelDataJugadores.swift` | `func cargarJugadores() -> [Jugador]`. Se usa con `@State private var jugadores = cargarJugadores()` |
| Un campo que se calcula solo (nombre completo, estrellas…) | `08_ModelosYListas/Model/Jugador.swift` | `var nombreCompleto: String { return ... }` |
| Diseñar el renglón de la lista como componente | `08_ModelosYListas/Components/JugadorRow.swift` | `var jugador: Jugador` sin `@State` ni `private` |
| Mostrar una lista sencilla | `08_ModelosYListas/Views/ListaSimpleView.swift` | `List(lista) { item in }` + `.listStyle(.inset)` (otros: `.plain`, `.grouped`, `.insetGrouped`) |
| Tocar un renglón y abrir su detalle | `08_ModelosYListas/Views/ListaConDetalleView.swift` | `NavigationLink { Detalle } label: { Row }` dentro de `NavigationStack` |
| Pantalla de detalle (solo ver) | `08_ModelosYListas/Views/DetalleJugadorView.swift` | `var jugador: Jugador` (sin `@State`). Trae 3 cuadritos de igual ancho y renglones etiqueta/valor |
| Editar un elemento en el detalle y que la lista se actualice | `08_ModelosYListas/Views/ListaEditableView.swift` + `EditarJugadorView.swift` | `List($lista) { $item in }` y `@Binding var jugador` en el detalle. Explica por qué una variable global NO sirve |
| Marcar favorito con un Toggle / cambiar un número con Stepper | `08_ModelosYListas/Views/EditarJugadorView.swift` → bloques 2 y 4 | `Toggle(isOn: $jugador.esFavorito)`; Stepper ⚠️ no visto en clase |
| Contar cuántos cumplen algo (ej. favoritos) | `08_ModelosYListas/Views/ListaEditableView.swift` → `totalFavoritos` | Propiedad calculada con `for` + `if` |
| Agregar elementos con un formulario | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` + `AgregarJugadorView.swift` | `.sheet` + `@Binding var jugadores` + `append`. El id nuevo = mayor + 1 |
| Validar que no esté vacío / que sea número (con alerta) | `08_ModelosYListas/Views/AgregarJugadorView.swift` → `guardar()` | `if nombre.isEmpty`… `else if let numero = Int(numeroTexto)` + mensaje específico |
| Borrar deslizando el renglón | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` → bloque 2 | `List { ForEach(lista) { } .onDelete(perform:) }` ⚠️ no visto en clase |
| Borrar todo con confirmación | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` → bloque 5 | `.alert` con `Button("Borrar", role: .destructive)` + `removeAll()` |
| Mostrar "no hay datos" si la lista está vacía | `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` → bloque 1 | `if lista.isEmpty { mensaje } else { List }` |
| Buscar por nombre | `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` | `.searchable(text:)` ⚠️ + propiedad calculada `jugadoresFiltrados` |
| Filtrar por categoría con botones | `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` → bloque 1 | `Picker` `.segmented` con opción "Todas" |
| Ordenar la lista | `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` → `jugadoresFiltrados` | `resultado.sort { a, b in a.numero < b.numero }` ⚠️ |
| Agrupar la lista en secciones con título | `08_ModelosYListas/Views/ListaSeccionesView.swift` | `Section { ForEach } header: { } footer: { }` ⚠️ + `.listStyle(.insetGrouped)` |
| Cambiar el color de fondo de la lista y de los renglones | `08_ModelosYListas/Views/ListaFondoPersonalizadoView.swift` | `.listRowBackground` (dentro) + `.scrollContentBackground(.hidden)` + `.background` (sobre el List) |
| Lista con diseño libre (tarjetas grandes con foto) | `08_ModelosYListas/Views/ListaTarjetasView.swift` | `ScrollView` + `ForEach` + `NavigationLink` con `.buttonStyle(.plain)` |
| Hacer un protocolo y 2-3 clases que lo cumplan | `08_ModelosYListas/Model/Personaje.swift` | `{ get }` vs `{ get set }`, `init`, misma función con lógica distinta |
| Usar esas clases en una pantalla (botones que cambian valores) | `08_ModelosYListas/Views/ProtocolosView.swift` | Las clases no avisan a SwiftUI: se cambia un `@State` (`turno`) para redibujar |
| Barra de vida / avance | `08_ModelosYListas/Views/ProtocolosView.swift` → `PersonajeTarjetaView` | `ProgressView(value:total:)` |
| Convertir mi lista a JSON o XML | `08_ModelosYListas/Model/Empleado.swift` → bloques 3 y 4 | `JSONEncoder` / `PropertyListEncoder` con `do { try } catch` |
| Leer un texto JSON y convertirlo a lista | `08_ModelosYListas/Model/Empleado.swift` → bloque 5 | `JSONDecoder().decode([Empleado].self, from: data)` |
| Que `print(objeto)` se vea bonito | `08_ModelosYListas/Model/Empleado.swift` → bloque 1 | `CustomStringConvertible` + `var description: String` |
| Ver JSON/XML en pantalla | `08_ModelosYListas/Views/CodableView.swift` | `Text` con `.font(.system(size: 13, design: .monospaced))` |
| Cargar datos de un archivo .json que viene en la app | `08_ModelosYListas/Model/Pelicula.swift` + `Views/JSONLocalView.swift` | `Bundle.main.url(forResource:withExtension:)` ⚠️. El .json debe estar en el target |
| Mostrar un año sin coma ("2017", no "2,017") | `08_ModelosYListas/Views/JSONLocalView.swift` | `Text("\(anio, format: .number.grouping(.never))")` |
| Mostrar una imagen desde una URL | `08_ModelosYListas/Views/ImagenRemotaView.swift` | `AsyncImage` NECESITA INTERNET. En el examen usa assets: `Image("foto1")` |


## 09 · Gráficas

Todas llevan `import Charts`. Cada archivo trae su propio struct + datos + vista: se copia solo. Pastel/dona (`SectorMark`) pide iOS 17.

| Quiero… | Archivo | Notas |
|---|---|---|
| Una gráfica de barras sencilla | `09_Graficas/BarrasView.swift` → bloque 2 | `Chart(arreglo) { item in BarMark(x:, y:) }` — el modelo es `Identifiable` |
| Barras escritas a mano, sin arreglo | `09_Graficas/BarrasView.swift` → bloque 1 | Varios `BarMark` sueltos dentro de `Chart { }` |
| Todas las barras de un color | `09_Graficas/BarrasView.swift` → bloque 3 | `.foregroundStyle(.purple)` en el `BarMark` |
| Un color distinto por categoría (con leyenda) | `09_Graficas/BarrasView.swift` → bloque 4 | `.foregroundStyle(by: .value("Comida", item.tipo))` |
| Escoger yo los colores de cada categoría | `09_Graficas/BarrasView.swift` → bloque 5 | `.chartForegroundStyleScale([...])` va sobre el `Chart`; nombres idénticos a los datos |
| Barras acostadas (horizontales) | `09_Graficas/BarrasView.swift` → bloque 6 | Solo intercambia `x` y `y` |
| El número escrito encima de cada barra | `09_Graficas/BarrasView.swift` → bloque 7 | `.annotation(position: .top)` ⚠️ no visto en clase |
| Una gráfica de línea (tendencia en el tiempo) | `09_Graficas/LineasView.swift` → bloque 1 | `LineMark`; el id puede ser `var id: Int { return mes }` |
| Línea con puntitos en cada dato | `09_Graficas/LineasView.swift` → bloque 2 | `LineMark` + `PointMark` dentro del mismo `Chart` |
| Varias líneas (una por tienda/persona) | `09_Graficas/LineasView.swift` → bloque 3 | `.foregroundStyle(by:)` separa las series solo |
| Una línea de promedio / meta / límite | `09_Graficas/LineasView.swift` → bloque 4 | `RuleMark` + `ForEach` dentro de `Chart` ⚠️ (lo usaste en tu tarea graficas) |
| Línea curva (suavizada) | `09_Graficas/LineasView.swift` → bloque 5 | `.interpolationMethod(.catmullRom)` ⚠️ |
| Gráfica de puntos / dispersión | `09_Graficas/PuntosView.swift` → bloques 1-2 | `PointMark`; color por grupo con `foregroundStyle(by:)` |
| Puntos con distinta forma y tamaño | `09_Graficas/PuntosView.swift` → bloque 3 | `.symbol(by:)` y `.symbolSize(120)` ⚠️ |
| Gráfica de pastel | `09_Graficas/PastelYDonaView.swift` → bloque 1 | `SectorMark(angle:)` + `.chartLegend(position: .bottom, alignment: .center)` |
| Gráfica de dona | `09_Graficas/PastelYDonaView.swift` → bloque 2 | `innerRadius: .ratio(0.5)` |
| Dona con rebanadas separadas | `09_Graficas/PastelYDonaView.swift` → bloque 3 | `angularInset: 2` + `.cornerRadius(5)` ⚠️ |
| Texto/total en el centro de la dona | `09_Graficas/PastelYDonaView.swift` → bloque 4 | `ZStack { Chart; VStack{Text} }` + `.chartLegend(.hidden)` ⚠️ |
| Porcentaje escrito en cada rebanada + mis colores | `09_Graficas/PastelYDonaView.swift` → bloque 5 | `.annotation(position: .overlay)` ⚠️; porcentaje = valor / total * 100 |
| Una barra de avance (porcentaje) | `09_Graficas/ProgressViewEjemplosView.swift` → bloques 1-2 | `ProgressView(value: 75, total: 100)`, `.scaleEffect(x: 1, y: 3)` la engrosa |
| Barra de avance que cambia con un valor | `09_Graficas/ProgressViewEjemplosView.swift` → bloque 3 | `@State` + Slider; color con ternario (verde ≥ 70) |
| Varias metas con su barra | `09_Graficas/ProgressViewEjemplosView.swift` → bloque 4 | `ForEach(metas)` ⚠️ + tarjeta con fondo |
| El circulito de "cargando" | `09_Graficas/ProgressViewEjemplosView.swift` → bloque 5 | `ProgressView()` sin valor ⚠️ |
| Que el eje Y vaya siempre de 0 a 100 | `09_Graficas/EjesYEstiloView.swift` → bloque 1 | `.chartYScale(domain: 0 ... 100)` ⚠️ |
| Ponerle título a los ejes | `09_Graficas/EjesYEstiloView.swift` → bloque 2 | `.chartXAxisLabel("...")` / `.chartYAxisLabel("...")` ⚠️ |
| Quitar los ejes (gráfica mini) | `09_Graficas/EjesYEstiloView.swift` → bloque 3 | `.chartXAxis(.hidden)` / `.chartYAxis(.hidden)` ⚠️ |
| Meter la gráfica en una tarjeta bonita | `09_Graficas/EjesYEstiloView.swift` → bloque 4 | VStack + `.padding()` + `.background(...)` + `.clipShape(RoundedRectangle(cornerRadius: 12))` |
| Barras verdes si aprobó y rojas si no | `09_Graficas/EjesYEstiloView.swift` → bloque 5 | `.foregroundStyle(cond ? Color.green : Color.red)` + `RuleMark` en 70 |
| El usuario captura datos y se ven en la gráfica | `09_Graficas/GraficaInteractivaView.swift` | `@State` arreglo + TextField + validación con alertas + `append` |
| Cambiar entre barras / línea / pastel con un Picker | `09_Graficas/GraficaInteractivaView.swift` → bloques 1-2 | `Picker` `.segmented` con tags 1/2/3 + `if tipoGrafica == 1 { Chart } else if …` |
| Convertir el texto del TextField a número y validar | `09_Graficas/GraficaInteractivaView.swift` → `agregarGasto()` | `if let cantidad = Double(cantidadTexto)`; mensaje distinto por cada error |
| Graficar los datos de MI LISTA (contar por categoría) | `09_Graficas/GraficaDesdeListaView.swift` → bloques 2-3 | Computed property con `for` + `contains`; llámala `GraficaDesdeListaView(registros: miLista)` |
| Sumar un campo por categoría y graficarlo | `09_Graficas/GraficaDesdeListaView.swift` → bloque 4 | Propiedad `sumas` (mismo patrón que `conteos`) |
| Una pantalla de resumen/estadísticas con varias gráficas | `09_Graficas/DashboardGraficasView.swift` | 3 tarjetas de números + cuadrícula 2x2 + meta con ProgressView; fondo completo con ZStack |
| Dividir en 3 (o 2) tarjetas del mismo ancho | `09_Graficas/DashboardGraficasView.swift` → bloque 1 | Cada tarjeta con `.frame(maxWidth: .infinity)` dentro del HStack |
| Sacar un total o promedio de un arreglo | `09_Graficas/LineasView.swift` (`promedio`) / `PastelYDonaView.swift` (`total`) | `var total: Double { var suma = 0.0; for … { suma += … }; return suma }` |


## 10 · Fotos y cámara
| Quiero… | Archivo | Notas |
|---|---|---|
| Que el usuario escoja UNA foto de su galería | `10_FotosYCamara/SeleccionarFotoView.swift` | Pasos A–F de clase: `PhotosPickerItem?` → `.onChange` + `Task` + `loadTransferable` → `UIImage?` → `Image(uiImage:)`. No pide permiso |
| Abrir la cámara y tomar una foto | `10_FotosYCamara/TomarFotoView.swift` | `.sheet` con `CamaraPicker(selectedImageFromCamera: $foto)`. Si no hay cámara (simulador) sale alerta en vez de tronar |
| Poner el permiso de cámara (si no, truena) | `10_FotosYCamara/TomarFotoView.swift` → encabezado | Target → Info → Add Row → "Privacy - Camera Usage Description" |
| El archivo de la cámara de la profesora | `10_FotosYCamara/CamaraPicker.swift` | Se copia TAL CUAL ("Copy items if needed"). No se modifica |
| Foto de perfil redonda con borde (galería o cámara) | `10_FotosYCamara/FotoPerfilView.swift` | Las dos fuentes llenan la MISMA `@State UIImage?`. `.aspectRatio(.fill)` + `.clipShape(.circle)` |
| Mostrar un ícono mientras no hay foto | `10_FotosYCamara/FotoPerfilView.swift` → bloque 1 | `if let foto { Image(uiImage:) } else { Image(systemName: "person.crop.circle") }` |
| Quitar / borrar la foto | `10_FotosYCamara/SeleccionarFotoView.swift` → bloque Extra | Poner la imagen y el item en `nil` |
| Escoger VARIAS fotos y verlas en cuadrícula | `10_FotosYCamara/VariasFotosView.swift` | ⚠️ `maxSelectionCount` + `[PhotosPickerItem]` + `LazyVGrid` (no vistos en clase) |
| Formulario que registra algo CON FOTO y lo agrega a una lista | `10_FotosYCamara/RegistroConFotoView.swift` (+ Nuevo…, Detalle…, Row, modelo) | 5 archivos. Lista `@State` → formulario con `@Binding` → `append` + `dismiss()` |
| Validar que llenó nombre, descripción y foto | `10_FotosYCamara/NuevoRegistroConFotoView.swift` → `guardarRegistro()` | `if / else if` con mensaje específico en `alertMessage` + `showAlert.toggle()` |
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
| Reproducir música / un mp3 | `11_Extras/SonidoView.swift` | `AVAudioPlayer` + `Bundle.main.url(forResource:withExtension:)`. El mp3 se arrastra con el target palomeado |
| Botones Play / Pausa / Stop y volumen | `11_Extras/SonidoView.swift` | `.play()`, `.pause()`, `.stop()` + `currentTime = 0`; `volume` es `Float` 0…1 |
| Silenciar con un Toggle | `11_Extras/SonidoView.swift` | `.onChange(of: silencio) { oldValue, newValue in }` → `volume = silencio ? 0 : volumen` |

