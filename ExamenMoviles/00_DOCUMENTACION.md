# Documentación completa · Examen Móviles (SwiftUI)

> Busca con ⌘F. Hecho para el examen final de Móviles (TC2007B). Todo funciona sin internet.

## Contenido

- [0. Cómo usar este documento](#0-cómo-usar-este-documento)
  - [0.1 Cómo buscar](#01-cómo-buscar)
  - [0.2 Leyenda](#02-leyenda)
  - [0.3 Qué hay en cada parte](#03-qué-hay-en-cada-parte)
  - [0.4 Las 15 reglas que más importan mañana](#04-las-15-reglas-que-más-importan-mañana)
- [1. Xcode y el proyecto](#1-xcode-y-el-proyecto)
  - [1.1 Crear el proyecto nuevo](#11-crear-el-proyecto-nuevo)
  - [1.2 Los archivos que trae un proyecto nuevo](#12-los-archivos-que-trae-un-proyecto-nuevo)
  - [1.3 Cambiar la pantalla inicial](#13-cambiar-la-pantalla-inicial)
  - [1.4 Partes de la ventana de Xcode](#14-partes-de-la-ventana-de-xcode)
  - [1.5 Carpetas: crear y organizar](#15-carpetas-crear-y-organizar)
  - [1.6 Crear archivos nuevos: SwiftUI View vs Swift File](#16-crear-archivos-nuevos-swiftui-view-vs-swift-file)
  - [1.7 Renombrar y borrar archivos](#17-renombrar-y-borrar-archivos)
  - [1.8 Imágenes en Assets](#18-imágenes-en-assets)
  - [1.9 Agregar otros archivos (mp3, json)](#19-agregar-otros-archivos-mp3-json)
  - [1.10 Canvas y #Preview](#110-canvas-y-preview)
  - [1.11 El simulador](#111-el-simulador)
  - [1.12 La consola y `print()` para encontrar errores](#112-la-consola-y-print-para-encontrar-errores)
  - [1.13 Breakpoints (pausar la app en una línea)](#113-breakpoints-pausar-la-app-en-una-línea)
  - [1.14 Permisos (cámara) en la pestaña Info](#114-permisos-cámara-en-la-pestaña-info)
  - [1.15 Build Settings vs Info vs General](#115-build-settings-vs-info-vs-general)
  - [1.16 Cuando Xcode se traba: Clean Build Folder y DerivedData](#116-cuando-xcode-se-traba-clean-build-folder-y-deriveddata)
  - [1.17 Entregar: comprimir el proyecto en ZIP para Canvas](#117-entregar-comprimir-el-proyecto-en-zip-para-canvas)
  - [1.18 Atajos de teclado (todos los útiles)](#118-atajos-de-teclado-todos-los-útiles)
  - [1.19 Lo que se califica en general (rúbrica de las tareas)](#119-lo-que-se-califica-en-general-rúbrica-de-las-tareas)
- [2. Swift: el lenguaje](#2-swift-el-lenguaje)
  - [2.1 Reglas básicas de escritura](#21-reglas-básicas-de-escritura)
  - [2.2 Dónde puede ir el código (y el error "Expressions are not allowed at the top level")](#22-dónde-puede-ir-el-código-y-el-error-expressions-are-not-allowed-at-the-top-level)
  - [2.3 Tipos de datos](#23-tipos-de-datos)
  - [2.4 `var` y `let` (variables y constantes)](#24-var-y-let-variables-y-constantes)
  - [2.5 Operadores](#25-operadores)
  - [2.6 Conversiones entre tipos y matemáticas](#26-conversiones-entre-tipos-y-matemáticas)
  - [2.7 Strings (texto)](#27-strings-texto)
  - [2.8 Opcionales (`?`, `nil`, `!`, `if let`, `guard let`, `??`)](#28-opcionales--nil--if-let-guard-let-)
  - [2.9 Arrays (arreglos / listas)](#29-arrays-arreglos--listas)
  - [2.10 Diccionarios ⚠️](#210-diccionarios-)
  - [2.11 Sets (conjuntos) ⚠️](#211-sets-conjuntos-)
  - [2.12 Condicionales: `if`, `switch` y ternario](#212-condicionales-if-switch-y-ternario)
  - [2.13 Ciclos: `for`, `while` y recetas](#213-ciclos-for-while-y-recetas)
  - [2.14 Funciones](#214-funciones)
  - [2.15 Closures (bloques de código como valor)](#215-closures-bloques-de-código-como-valor)
  - [2.16 Structs (modelos)](#216-structs-modelos)
  - [2.17 Classes (clases)](#217-classes-clases)
  - [2.18 Enums (enumeraciones) ⚠️](#218-enums-enumeraciones-)
  - [2.19 Extensions ⚠️](#219-extensions-)
  - [2.20 Protocolos (Identifiable, Codable, CustomStringConvertible…)](#220-protocolos-identifiable-codable-customstringconvertible)
  - [2.21 Fechas: Date, DateFormatter y Calendar](#221-fechas-date-dateformatter-y-calendar)
  - [2.22 Formato de números (decimales, pesos, porcentaje)](#222-formato-de-números-decimales-pesos-porcentaje)
  - [2.23 Números y elementos al azar (random)](#223-números-y-elementos-al-azar-random)
  - [2.24 `async`, `await`, `Task` y `try` (lo necesario para PhotosPicker)](#224-async-await-task-y-try-lo-necesario-para-photospicker)
  - [2.25 Errores con `do` / `try` / `catch` y JSON](#225-errores-con-do--try--catch-y-json)
  - [2.26 Chuleta de Swift (resumen de una página)](#226-chuleta-de-swift-resumen-de-una-página)
- [3. SwiftUI: vistas, diseño y layout](#3-swiftui-vistas-diseño-y-layout)
  - [3.1 Anatomía de una vista](#31-anatomía-de-una-vista)
  - [3.2 Dónde va cada cosa dentro del struct](#32-dónde-va-cada-cosa-dentro-del-struct)
  - [3.3 Usar una vista dentro de otra](#33-usar-una-vista-dentro-de-otra)
  - [3.4 if, switch, ternario y ForEach dentro del body](#34-if-switch-ternario-y-foreach-dentro-del-body)
  - [3.5 `#Preview` a fondo](#35-preview-a-fondo)
  - [3.6 Modificadores y por qué importa el orden](#36-modificadores-y-por-qué-importa-el-orden)
  - [3.7 Modificadores con condición y modificadores que heredan los hijos](#37-modificadores-con-condición-y-modificadores-que-heredan-los-hijos)
  - [3.8 Text](#38-text)
  - [3.9 Label](#39-label)
  - [3.10 Image de Assets](#310-image-de-assets)
  - [3.11 SF Symbols (íconos del sistema)](#311-sf-symbols-íconos-del-sistema)
  - [3.12 Image(uiImage:) (fotos de la galería o de la cámara)](#312-imageuiimage-fotos-de-la-galería-o-de-la-cámara)
  - [3.13 Colores](#313-colores)
  - [3.14 Paleta de colores en Utils (sin static)](#314-paleta-de-colores-en-utils-sin-static)
  - [3.15 Fondo de pantalla completa y safe area](#315-fondo-de-pantalla-completa-y-safe-area)
  - [3.16 Degradados ⚠️](#316-degradados-)
  - [3.17 Modo oscuro y `.preferredColorScheme` ⚠️](#317-modo-oscuro-y-preferredcolorscheme-)
  - [3.18 Stacks: VStack, HStack, ZStack](#318-stacks-vstack-hstack-zstack)
  - [3.19 alignment (alineación)](#319-alignment-alineación)
  - [3.20 spacing](#320-spacing)
  - [3.21 Spacer](#321-spacer)
  - [3.22 Divider](#322-divider)
  - [3.23 padding (márgenes)](#323-padding-márgenes)
  - [3.24 frame (tamaño)](#324-frame-tamaño)
  - [3.25 Recetas de layout (dividir la pantalla y más)](#325-recetas-de-layout-dividir-la-pantalla-y-más)
  - [3.26 ScrollView](#326-scrollview)
  - [3.27 Formas y esquinas redondeadas](#327-formas-y-esquinas-redondeadas)
  - [3.28 Tabla de otros modificadores + animaciones](#328-tabla-de-otros-modificadores--animaciones)
  - [3.29 Componentes reutilizables (Clase 5A)](#329-componentes-reutilizables-clase-5a)
  - [3.30 Ejemplo Pokémon completo (Clase 5A)](#330-ejemplo-pokémon-completo-clase-5a)
  - [3.31 Errores comunes de diseño (síntoma → arreglo)](#331-errores-comunes-de-diseño-síntoma--arreglo)
- [4. Estado, controles y formularios](#4-estado-controles-y-formularios)
  - [4.1 Por qué una variable normal no cambia la pantalla](#41-por-qué-una-variable-normal-no-cambia-la-pantalla)
  - [4.2 `@State`](#42-state)
  - [4.3 `@Binding` (resumen; lo de pantallas completo está en la Parte 5)](#43-binding-resumen-lo-de-pantallas-completo-está-en-la-parte-5)
  - [4.4 Constantes (`let`) y propiedades calculadas dentro de la vista](#44-constantes-let-y-propiedades-calculadas-dentro-de-la-vista)
  - [4.5 El teclado y `@FocusState`](#45-el-teclado-y-focusstate)
  - [4.6 `@Environment(\.dismiss)` — cerrar o regresar por código](#46-environmentdismiss--cerrar-o-regresar-por-código)
  - [4.7 `@AppStorage` (resumen; completo en la Parte 9)](#47-appstorage-resumen-completo-en-la-parte-9)
  - [4.8 Lo que NO se usa en el curso (y por qué)](#48-lo-que-no-se-usa-en-el-curso-y-por-qué)
  - [4.9 `Button`](#49-button)
  - [4.10 `TextField`](#410-textfield)
  - [4.11 `SecureField` (contraseñas) ⚠️](#411-securefield-contraseñas-)
  - [4.12 `TextEditor` (texto largo) ⚠️](#412-texteditor-texto-largo-)
  - [4.13 Convertir lo que escribe el usuario a número](#413-convertir-lo-que-escribe-el-usuario-a-número)
  - [4.14 `Toggle` (switch)](#414-toggle-switch)
  - [4.15 `Slider`](#415-slider)
  - [4.16 `Stepper` (botones + y −) ⚠️](#416-stepper-botones--y--)
  - [4.17 `Picker`](#417-picker)
  - [4.18 Picker que depende de otro (país → ciudad)](#418-picker-que-depende-de-otro-país--ciudad)
  - [4.19 `DatePicker` (elegir fecha y hora) ⚠️](#419-datepicker-elegir-fecha-y-hora-)
  - [4.20 `ColorPicker` ⚠️](#420-colorpicker-)
  - [4.21 `ProgressView` (barra de avance y "cargando")](#421-progressview-barra-de-avance-y-cargando)
  - [4.22 `Label` (texto + ícono)](#422-label-texto--ícono)
  - [4.23 `Link` (abrir una página web) ⚠️](#423-link-abrir-una-página-web-)
  - [4.24 `Menu` (menú de opciones) ⚠️](#424-menu-menú-de-opciones-)
  - [4.25 `Gauge` (medidor) ⚠️](#425-gauge-medidor-)
  - [4.26 Alertas (`.alert`)](#426-alertas-alert)
  - [4.27 `confirmationDialog` (menú que sale de abajo) ⚠️](#427-confirmationdialog-menú-que-sale-de-abajo-)
  - [4.28 `.sheet` (pantalla que sube desde abajo)](#428-sheet-pantalla-que-sube-desde-abajo)
  - [4.29 Más presentaciones: tamaño de la sheet, `sheet(item:)`, `fullScreenCover` ⚠️](#429-más-presentaciones-tamaño-de-la-sheet-sheetitem-fullscreencover-)
  - [4.30 Eventos y ciclo de vida: `onAppear`, `onDisappear`, `onChange`, `task`](#430-eventos-y-ciclo-de-vida-onappear-ondisappear-onchange-task)
  - [4.31 Gestos: tocar, doble toque, mantener presionado](#431-gestos-tocar-doble-toque-mantener-presionado)
  - [4.32 FORMULARIO CON VALIDACIÓN (receta completa)](#432-formulario-con-validación-receta-completa)
  - [4.33 Botón apagado hasta que el formulario sea válido ⚠️](#433-botón-apagado-hasta-que-el-formulario-sea-válido-)
  - [4.34 `Form` y `Section` (pantalla tipo Ajustes) ⚠️](#434-form-y-section-pantalla-tipo-ajustes-)
  - [4.35 Chuleta de la Parte 4 (todo en una tabla)](#435-chuleta-de-la-parte-4-todo-en-una-tabla)
- [5. Navegación, múltiples pantallas y TabView](#5-navegación-múltiples-pantallas-y-tabview)
  - [5.1 NavigationStack: las pantallas son una pila](#51-navigationstack-las-pantallas-son-una-pila)
  - [5.2 Crear la segunda pantalla (un archivo nuevo)](#52-crear-la-segunda-pantalla-un-archivo-nuevo)
  - [5.3 NavigationLink: el enlace a otra pantalla](#53-navigationlink-el-enlace-a-otra-pantalla)
  - [5.4 Título y barra de navegación](#54-título-y-barra-de-navegación)
  - [5.5 Regresar por código: dismiss()](#55-regresar-por-código-dismiss)
  - [5.6 Paso de valores de ida (Pantalla 1 → Pantalla 2)](#56-paso-de-valores-de-ida-pantalla-1--pantalla-2)
  - [5.7 Paso de valores de ida y vuelta (@Binding)](#57-paso-de-valores-de-ida-y-vuelta-binding)
  - [5.8 Navegar con un botón que valida (Clase 6C)](#58-navegar-con-un-botón-que-valida-clase-6c)
  - [5.9 Otras formas de mostrar una pantalla: sheet, fullScreenCover e if](#59-otras-formas-de-mostrar-una-pantalla-sheet-fullscreencover-e-if)
  - [5.10 TabView: pestañas abajo (Clase 7)](#510-tabview-pestañas-abajo-clase-7)
  - [5.11 Flujos típicos de examen (código completo)](#511-flujos-típicos-de-examen-código-completo)
  - [5.12 Problemas típicos: síntoma → causa → arreglo](#512-problemas-típicos-síntoma--causa--arreglo)
  - [5.13 Resumen de una línea (acordeón)](#513-resumen-de-una-línea-acordeón)
- [6. Modelos, listas y datos](#6-modelos-listas-y-datos)
  - [6.1 ¿Qué es un modelo? (el struct como "molde")](#61-qué-es-un-modelo-el-struct-como-molde)
  - [6.2 Cómo crear el modelo paso a paso (forma de la Clase 10)](#62-cómo-crear-el-modelo-paso-a-paso-forma-de-la-clase-10)
  - [6.3 Identifiable y el `id`](#63-identifiable-y-el-id)
  - [6.4 Propiedades calculadas en el modelo](#64-propiedades-calculadas-en-el-modelo)
  - [6.5 Imágenes dentro del modelo](#65-imágenes-dentro-del-modelo)
  - [6.6 ModelData: los datos fijos de la app](#66-modeldata-los-datos-fijos-de-la-app)
  - [6.7 List: lista estática y lista dinámica](#67-list-lista-estática-y-lista-dinámica)
  - [6.8 Estilos de lista (`.listStyle`)](#68-estilos-de-lista-liststyle)
  - [6.9 Lista que navega al detalle (código exacto de la lámina)](#69-lista-que-navega-al-detalle-código-exacto-de-la-lámina)
  - [6.10 ForEach (y cuándo usarlo en lugar de List)](#610-foreach-y-cuándo-usarlo-en-lugar-de-list)
  - [6.11 Componente de renglón (Row)](#611-componente-de-renglón-row)
  - [6.12 Pantalla de detalle (solo ver)](#612-pantalla-de-detalle-solo-ver)
  - [6.13 Editar desde el detalle y que la lista se actualice (@Binding)](#613-editar-desde-el-detalle-y-que-la-lista-se-actualice-binding)
  - [6.14 Personalizar la lista: secciones, fondo, separadores, lista vacía](#614-personalizar-la-lista-secciones-fondo-separadores-lista-vacía)
  - [6.15 Lista sin `List`: tarjetas con ScrollView + ForEach](#615-lista-sin-list-tarjetas-con-scrollview--foreach)
  - [6.16 Receta: agregar un elemento con formulario (CRUD — Crear)](#616-receta-agregar-un-elemento-con-formulario-crud--crear)
  - [6.17 Receta: borrar elementos (CRUD — Borrar)](#617-receta-borrar-elementos-crud--borrar)
  - [6.18 Receta: buscar y filtrar](#618-receta-buscar-y-filtrar)
  - [6.19 Receta: ordenar (⚠️)](#619-receta-ordenar-)
  - [6.20 Receta: contar, sumar, promedio, porcentaje, máximo y mínimo](#620-receta-contar-sumar-promedio-porcentaje-máximo-y-mínimo)
  - [6.21 Receta: elemento al azar (recomendación sorpresa)](#621-receta-elemento-al-azar-recomendación-sorpresa)
  - [6.22 Receta: encontrar un elemento por su id (o su posición)](#622-receta-encontrar-un-elemento-por-su-id-o-su-posición)
  - [6.23 Protocolos en modelos (Clase 8, resumen)](#623-protocolos-en-modelos-clase-8-resumen)
  - [6.24 Codable y JSON](#624-codable-y-json)
  - [6.25 Cargar un archivo .json incluido en la app (⚠️)](#625-cargar-un-archivo-json-incluido-en-la-app-)
  - [6.26 AsyncImage: imágenes desde internet (Anexo A de la Clase 10)](#626-asyncimage-imágenes-desde-internet-anexo-a-de-la-clase-10)
  - [6.27 Resumen de errores de modelos y listas](#627-resumen-de-errores-de-modelos-y-listas)
- [7. Gráficas (Swift Charts)](#7-gráficas-swift-charts)
  - [7.1 Lo básico: `import Charts`, `Chart` y las "marcas"](#71-lo-básico-import-charts-chart-y-las-marcas)
  - [7.2 ¿Qué gráfica uso? (la tabla de la profe)](#72-qué-gráfica-uso-la-tabla-de-la-profe)
  - [7.3 El modelo de datos para una gráfica (struct `Identifiable`)](#73-el-modelo-de-datos-para-una-gráfica-struct-identifiable)
  - [7.4 Gráfica de barras (`BarMark`)](#74-gráfica-de-barras-barmark)
  - [7.5 Colores de la gráfica (opciones A, B y C de la clase)](#75-colores-de-la-gráfica-opciones-a-b-y-c-de-la-clase)
  - [7.6 Gráfica de líneas (`LineMark`)](#76-gráfica-de-líneas-linemark)
  - [7.7 Gráfica de puntos / dispersión (`PointMark`)](#77-gráfica-de-puntos--dispersión-pointmark)
  - [7.8 Gráfica de pastel y dona (`SectorMark`)](#78-gráfica-de-pastel-y-dona-sectormark)
  - [7.9 Línea de promedio o meta (`RuleMark`) ⚠️](#79-línea-de-promedio-o-meta-rulemark-)
  - [7.10 Gráfica de área (`AreaMark`) ⚠️](#710-gráfica-de-área-areamark-)
  - [7.11 La leyenda](#711-la-leyenda)
  - [7.12 Ejes y escala](#712-ejes-y-escala)
  - [7.13 Tamaño, padding y fondo (gráfica dentro de una tarjeta)](#713-tamaño-padding-y-fondo-gráfica-dentro-de-una-tarjeta)
  - [7.14 Gráficas que se actualizan solas (`@State`)](#714-gráficas-que-se-actualizan-solas-state)
  - [7.15 RECETA: graficar los datos de tu lista (contar y sumar por categoría)](#715-receta-graficar-los-datos-de-tu-lista-contar-y-sumar-por-categoría)
  - [7.16 RECETA: cambiar el tipo de gráfica con un Picker](#716-receta-cambiar-el-tipo-de-gráfica-con-un-picker)
  - [7.17 RECETA: dashboard con 4 gráficas (cuadrícula 2x2)](#717-receta-dashboard-con-4-gráficas-cuadrícula-2x2)
  - [7.18 Barra de avance (`ProgressView`) y porcentaje en texto](#718-barra-de-avance-progressview-y-porcentaje-en-texto)
  - [7.19 Errores comunes con gráficas (resumen)](#719-errores-comunes-con-gráficas-resumen)
  - [7.20 Hoja rápida de Charts (todo en una tabla)](#720-hoja-rápida-de-charts-todo-en-una-tabla)
- [8. Fotos y cámara](#8-fotos-y-cámara)
  - [8.1 `Image` vs `UIImage` (lo primero que hay que entender)](#81-image-vs-uiimage-lo-primero-que-hay-que-entender)
  - [8.2 PhotosPicker paso a paso (A–F, forma EXACTA de la clase)](#82-photospicker-paso-a-paso-af-forma-exacta-de-la-clase)
  - [8.3 Darle estilo al botón del PhotosPicker](#83-darle-estilo-al-botón-del-photospicker)
  - [8.4 Varias fotos a la vez ⚠️](#84-varias-fotos-a-la-vez-)
  - [8.5 Mostrar la foto bonita (circular, con borde, que llene el cuadro)](#85-mostrar-la-foto-bonita-circular-con-borde-que-llene-el-cuadro)
  - [8.6 CamaraPicker: qué es y cómo se agrega](#86-camarapicker-qué-es-y-cómo-se-agrega)
  - [8.7 Permiso de cámara (si no lo pones, la app TRUENA)](#87-permiso-de-cámara-si-no-lo-pones-la-app-truena)
  - [8.8 Abrir la cámara con `.sheet` (forma de clase)](#88-abrir-la-cámara-con-sheet-forma-de-clase)
  - [8.9 El simulador NO tiene cámara](#89-el-simulador-no-tiene-cámara)
  - [8.10 RECETA: foto de perfil con galería y cámara](#810-receta-foto-de-perfil-con-galería-y-cámara)
  - [8.11 RECETA: guardar la foto dentro de un modelo (formulario con foto) ⚠️](#811-receta-guardar-la-foto-dentro-de-un-modelo-formulario-con-foto-)
  - [8.12 RECETA: mostrar la foto del modelo, o la del asset, o un ícono](#812-receta-mostrar-la-foto-del-modelo-o-la-del-asset-o-un-ícono)
  - [8.13 Quitar o cambiar la foto](#813-quitar-o-cambiar-la-foto)
  - [8.14 Errores comunes con fotos y cámara (resumen)](#814-errores-comunes-con-fotos-y-cámara-resumen)
- [9. Persistencia y sonido](#9-persistencia-y-sonido)
  - [9.1 ¿Qué pasa con los datos al cerrar la app? (qué guardar dónde)](#91-qué-pasa-con-los-datos-al-cerrar-la-app-qué-guardar-dónde)
  - [9.2 UserDefaults (guardar y leer a mano)](#92-userdefaults-guardar-y-leer-a-mano)
  - [9.3 `@AppStorage` (lo más fácil: como `@State` pero que se guarda)](#93-appstorage-lo-más-fácil-como-state-pero-que-se-guarda)
  - [9.4 Patrón de tu tarea DefaultsApp: guardar con un botón](#94-patrón-de-tu-tarea-defaultsapp-guardar-con-un-botón)
  - [9.5 Guardar una LISTA completa (JSON dentro de `@AppStorage`) ⚠️](#95-guardar-una-lista-completa-json-dentro-de-appstorage-)
  - [9.6 Keychain (para contraseñas y tokens)](#96-keychain-para-contraseñas-y-tokens)
  - [9.7 Sonido con `AVAudioPlayer` ⚠️ (de tu tarea ejemploMusica)](#97-sonido-con-avaudioplayer--de-tu-tarea-ejemplomusica)
  - [9.8 Errores comunes de persistencia (resumen)](#98-errores-comunes-de-persistencia-resumen)
- [10. Recetas de examen (paso a paso, código completo)](#10-recetas-de-examen-paso-a-paso-código-completo)
  - [10.1 Quiero armar el proyecto desde cero en 15 minutos](#101-quiero-armar-el-proyecto-desde-cero-en-15-minutos)
  - [10.2 Quiero la app completa mínima (TabView + Lista + Detalle editable + Agregar + Buscador + Estadísticas + Perfil)](#102-quiero-la-app-completa-mínima-tabview--lista--detalle-editable--agregar--buscador--estadísticas--perfil)
  - [10.3 Quiero un saludo con la fecha de hoy en español](#103-quiero-un-saludo-con-la-fecha-de-hoy-en-español)
  - [10.4 Quiero que cada antojo tenga una fecha distinta en ModelData](#104-quiero-que-cada-antojo-tenga-una-fecha-distinta-en-modeldata)
  - [10.5 Quiero mostrar un precio en pesos y una fecha bonita](#105-quiero-mostrar-un-precio-en-pesos-y-una-fecha-bonita)
  - [10.6 Quiero 3 tarjetas del mismo tamaño con un componente](#106-quiero-3-tarjetas-del-mismo-tamaño-con-un-componente)
  - [10.7 Quiero una recomendación al azar con todos sus datos](#107-quiero-una-recomendación-al-azar-con-todos-sus-datos)
  - [10.8 Quiero recomendar según el mes de nacimiento (idea de la tarea Movil02)](#108-quiero-recomendar-según-el-mes-de-nacimiento-idea-de-la-tarea-movil02)
  - [10.9 Quiero un carrusel de imágenes](#109-quiero-un-carrusel-de-imágenes)
  - [10.10 Quiero una lista con renglón componente y un detalle que modifique el elemento](#1010-quiero-una-lista-con-renglón-componente-y-un-detalle-que-modifique-el-elemento)
  - [10.11 Quiero agregar un elemento con un formulario validado](#1011-quiero-agregar-un-elemento-con-un-formulario-validado)
  - [10.12 Quiero un botón para limpiar el formulario](#1012-quiero-un-botón-para-limpiar-el-formulario)
  - [10.13 Quiero esconder el teclado al tocar fuera](#1013-quiero-esconder-el-teclado-al-tocar-fuera)
  - [10.14 Quiero un buscador que valide y me lleve a otra pantalla con resultados (Clase 6C)](#1014-quiero-un-buscador-que-valide-y-me-lleve-a-otra-pantalla-con-resultados-clase-6c)
  - [10.15 Quiero un mensaje cuando la lista está vacía](#1015-quiero-un-mensaje-cuando-la-lista-está-vacía)
  - [10.16 Quiero una lista con buscador](#1016-quiero-una-lista-con-buscador)
  - [10.17 Quiero filtrar la lista por categoría](#1017-quiero-filtrar-la-lista-por-categoría)
  - [10.18 Quiero ordenar la lista (por nombre, precio o calificación)](#1018-quiero-ordenar-la-lista-por-nombre-precio-o-calificación)
  - [10.19 Quiero contar favoritos, sacar promedio, porcentaje, suma, el más caro y el más barato](#1019-quiero-contar-favoritos-sacar-promedio-porcentaje-suma-el-más-caro-y-el-más-barato)
  - [10.20 Quiero las estadísticas: barras por categoría, dona de favoritos y ProgressView](#1020-quiero-las-estadísticas-barras-por-categoría-dona-de-favoritos-y-progressview)
  - [10.21 Quiero cambiar el color o el ícono según un valor](#1021-quiero-cambiar-el-color-o-el-ícono-según-un-valor)
  - [10.22 Quiero una foto de perfil de la galería o de la cámara](#1022-quiero-una-foto-de-perfil-de-la-galería-o-de-la-cámara)
  - [10.23 Quiero una pantalla "Acerca de mí"](#1023-quiero-una-pantalla-acerca-de-mí)
  - [10.24 Quiero un login antes de entrar a la app (sin NavigationStack dentro de otro)](#1024-quiero-un-login-antes-de-entrar-a-la-app-sin-navigationstack-dentro-de-otro)
  - [10.25 Quiero una bienvenida (onboarding) con páginas antes de la app](#1025-quiero-una-bienvenida-onboarding-con-páginas-antes-de-la-app)
  - [10.26 Quiero un menú principal con botones grandes que lleven a distintas pantallas](#1026-quiero-un-menú-principal-con-botones-grandes-que-lleven-a-distintas-pantallas)
  - [10.27 Quiero cambiar de pestaña con un botón](#1027-quiero-cambiar-de-pestaña-con-un-botón)
  - [10.28 Quiero una calculadora (texto → número → operación → resultado)](#1028-quiero-una-calculadora-texto--número--operación--resultado)
  - [10.29 Quiero un convertidor de moneda con Picker](#1029-quiero-un-convertidor-de-moneda-con-picker)
  - [10.30 Quiero una calculadora de IMC](#1030-quiero-una-calculadora-de-imc)
  - [10.31 Quiero elegir un número con Slider o Stepper](#1031-quiero-elegir-un-número-con-slider-o-stepper)
  - [10.32 Quiero una ventana (sheet) que me regrese un valor elegido](#1032-quiero-una-ventana-sheet-que-me-regrese-un-valor-elegido)
  - [10.33 Quiero borrar con confirmación (y borrar deslizando)](#1033-quiero-borrar-con-confirmación-y-borrar-deslizando)
  - [10.34 Quiero dividir la pantalla en partes iguales](#1034-quiero-dividir-la-pantalla-en-partes-iguales)
  - [10.35 Quiero una imagen circular con borde y sombra](#1035-quiero-una-imagen-circular-con-borde-y-sombra)
  - [10.36 Quiero un dashboard (resumen con tarjetas, gráfica y lista)](#1036-quiero-un-dashboard-resumen-con-tarjetas-gráfica-y-lista)
  - [10.37 Quiero guardar un dato aunque se cierre la app](#1037-quiero-guardar-un-dato-aunque-se-cierre-la-app)
  - [10.38 Quiero validar un correo, una edad en rango y una contraseña](#1038-quiero-validar-un-correo-una-edad-en-rango-y-una-contraseña)
  - [10.39 Quiero puntos extra: foto opcional en el formulario de agregar](#1039-quiero-puntos-extra-foto-opcional-en-el-formulario-de-agregar)
  - [10.40 Quiero ir a otra pantalla con NavigationLink (lo más simple) y regresar](#1040-quiero-ir-a-otra-pantalla-con-navigationlink-lo-más-simple-y-regresar)
  - [10.41 Quiero agregar imágenes a Assets y usarlas](#1041-quiero-agregar-imágenes-a-assets-y-usarlas)
  - [10.42 Quiero poner el permiso de cámara y probarla](#1042-quiero-poner-el-permiso-de-cámara-y-probarla)
  - [10.43 Quiero entregar: hacer el ZIP del proyecto para Canvas](#1043-quiero-entregar-hacer-el-zip-del-proyecto-para-canvas)
  - [10.44 Quiero centralizar mis colores en una paleta](#1044-quiero-centralizar-mis-colores-en-una-paleta)
  - [10.45 Quiero que salga el título de la pantalla (navigationTitle) y no sale](#1045-quiero-que-salga-el-título-de-la-pantalla-navigationtitle-y-no-sale)
- [11. Defensa del código: preguntas que te puede hacer la profe](#11-defensa-del-código-preguntas-que-te-puede-hacer-la-profe)
  - [11.1 Estado y datos (@State, @Binding, $)](#111-estado-y-datos-state-binding-)
  - [11.2 Modelo y lista](#112-modelo-y-lista)
  - [11.3 Navegación y pantallas](#113-navegación-y-pantallas)
  - [11.4 Swift básico](#114-swift-básico)
  - [11.5 Vistas, diseño y modificadores](#115-vistas-diseño-y-modificadores)
  - [11.6 Gráficas, fotos y cámara](#116-gráficas-fotos-y-cámara)
  - [11.7 Calidad técnica: performance, memoria, batería, datos, seguridad, mantenibilidad](#117-calidad-técnica-performance-memoria-batería-datos-seguridad-mantenibilidad)
  - [11.8 Modificaciones en vivo (cómo hacerlas rápido)](#118-modificaciones-en-vivo-cómo-hacerlas-rápido)
- [12. UI/UX y rúbrica](#12-uiux-y-rúbrica)
  - [12.1 Cómo califica la profe (rúbrica de la tarea Movil02)](#121-cómo-califica-la-profe-rúbrica-de-la-tarea-movil02)
  - [12.2 Checklist antes de entregar](#122-checklist-antes-de-entregar)
  - [12.3 Lineamientos de UI/UX que se revisaron en clase](#123-lineamientos-de-uiux-que-se-revisaron-en-clase)
  - [12.4 Qué control usar para cada dato](#124-qué-control-usar-para-cada-dato)
  - [12.5 Paletas listas para copiar (monocromáticas y análoga)](#125-paletas-listas-para-copiar-monocromáticas-y-análoga)
  - [12.6 Tamaños de letra, espacios y botones](#126-tamaños-de-letra-espacios-y-botones)
  - [12.7 Cómo hacer que la UI se vea "bonita" rápido](#127-cómo-hacer-que-la-ui-se-vea-bonita-rápido)
  - [12.8 Errores de UI que bajan puntos](#128-errores-de-ui-que-bajan-puntos)
- [13. Errores de Xcode: mensaje → causa → arreglo](#13-errores-de-xcode-mensaje--causa--arreglo)
  - [13.1 Cómo leer un error](#131-cómo-leer-un-error)
  - [13.2 Errores de "dónde va el código" y llaves](#132-errores-de-dónde-va-el-código-y-llaves)
  - [13.3 Nombres, parámetros y llamadas](#133-nombres-parámetros-y-llamadas)
  - [13.4 Tipos y conversiones](#134-tipos-y-conversiones)
  - [13.5 Opcionales (`?`, `nil`, `if let`)](#135-opcionales--nil-if-let)
  - [13.6 let, var y "no se puede modificar"](#136-let-var-y-no-se-puede-modificar)
  - [13.7 Errores de vistas (SwiftUI)](#137-errores-de-vistas-swiftui)
  - [13.8 `@State`, `@Binding` y `$`](#138-state-binding-y-)
  - [13.9 Listas, `ForEach` e `Identifiable`](#139-listas-foreach-e-identifiable)
  - [13.10 Faltan `import`](#1310-faltan-import)
  - [13.11 Funciones, `return` y `switch`](#1311-funciones-return-y-switch)
  - [13.12 `throws`, `try` y `async`](#1312-throws-try-y-async)
  - [13.13 Warnings (amarillo) que vas a ver](#1313-warnings-amarillo-que-vas-a-ver)
  - [13.14 La app truena (crash) o la consola se queja](#1314-la-app-truena-crash-o-la-consola-se-queja)
  - [13.15 Errores de Xcode (build, firma, preview)](#1315-errores-de-xcode-build-firma-preview)
  - [13.16 No sale error, pero "no funciona" (síntomas)](#1316-no-sale-error-pero-no-funciona-síntomas)
- [14. Glosario](#14-glosario)
  - [14.1 Símbolos](#141-símbolos)
  - [14.2 A – C](#142-a--c)
  - [14.3 D – H](#143-d--h)
  - [14.4 I – M](#144-i--m)
  - [14.5 N – P](#145-n--p)
  - [14.6 R – S](#146-r--s)
  - [14.7 T – Z](#147-t--z)

---

# 0. Cómo usar este documento

🔎 como usar, ayuda, leyenda, buscar, indice, contenido, empezar

Este archivo explica **todo** lo que puedes necesitar en el examen de Móviles: Xcode, Swift, SwiftUI, pantallas,
listas, gráficas, fotos, errores y cómo defender tu código. No se lee de corrido: **se busca**.

## 0.1 Cómo buscar

🔎 buscar, cmd f, command f, encontrar, find

| Quiero encontrar… | Busca con ⌘F… |
|---|---|
| Algo de lo que sé el nombre | El nombre tal cual: `Picker`, `navigationTitle`, `DateFormatter`, `append` |
| Algo que no sé cómo se llama | Lo que quieres hacer, en español: `dividir`, `fecha`, `al azar`, `validar`, `foto`, `promedio` |
| Un error de Xcode | Un pedazo del mensaje en inglés: `top level`, `in scope`, `unwrapped`, `Identifiable` |
| Una receta completa | `Receta` + el tema: `Receta buscador`, `Receta login` |
| Qué contestar si la profe pregunta | `¿Por qué` + el tema, o ve a la parte 11 |
| Una palabra que no entiendes | Ve al Glosario (parte 14) |

Cada sección empieza con una línea `🔎` con palabras clave en español e inglés (también sin acentos), para que ⌘F
la encuentre aunque no escribas el nombre exacto.

## 0.2 Leyenda

🔎 leyenda, simbolos, visto en clase, no visto, iconos

| Símbolo | Significa |
|---|---|
| ✅ Clase N | Lo enseñó la profesora en esa clase. Es la forma más segura de usar |
| ⚠️ No visto en clase | Funciona, pero no viene en las láminas. Si lo usas, prepárate para explicarlo |
| 🟡 Básico | No sale en una lámina, pero es sintaxis básica de cualquier lenguaje (`for`, `%`, `&&`). Se puede usar y defender fácil |
| `// ❌ esto NO compila:` | Ejemplo de lo que NO se debe hacer |
| En el repo: | Archivo del repo donde está ese ejemplo funcionando (rutas desde `ExamenMoviles/`) |

Todo el código de este documento se compiló antes de ponerlo aquí (iOS 17, Swift 6, Xcode 26).

## 0.3 Qué hay en cada parte

🔎 partes, contenido, temario, tabla de contenido

| Parte | Tema |
|---|---|
| 1 | Xcode y el proyecto: crear, carpetas, archivos, Assets, Canvas, simulador, atajos, ZIP |
| 2 | Swift: tipos, strings, opcionales, arreglos, ciclos, funciones, structs, fechas, formatos |
| 3 | SwiftUI: vistas, Text, Image, colores, stacks, layout, componentes |
| 4 | Estado y controles: @State, botones, TextField, Picker, Slider, alertas, sheets, formularios |
| 5 | Navegación: NavigationStack, paso de valores, @Binding, validación 6C, TabView |
| 6 | Modelos y listas: struct, ModelData, List, agregar, editar, borrar, buscar, JSON |
| 7 | Gráficas: barras, líneas, puntos, pastel, dona, ProgressView |
| 8 | Fotos y cámara: PhotosPicker, CamaraPicker, permisos |
| 9 | Persistencia y sonido: UserDefaults, @AppStorage, Keychain, AVAudioPlayer |
| 10 | Recetas de examen paso a paso |
| 11 | Defensa del código: preguntas de la profe y respuestas |
| 12 | UI/UX y rúbrica: checklist antes de entregar |
| 13 | Errores de Xcode: mensaje → causa → arreglo |
| 14 | Glosario |

Otros archivos del repo que te sirven:
- `00_INDICE.md`: "Quiero… → archivo del repo" para copiar ejemplos que ya funcionan.
- `00_PRACTICA_EXAMEN.md`: el simulacro de examen.

## 0.4 Las 15 reglas que más importan mañana

🔎 reglas, importante, resumen, lo basico, no olvidar, tips examen

1. Las variables que cambian la pantalla van con `@State private var`.
2. Si otra pantalla debe **modificar** el dato: `@Binding` en esa pantalla y `$` al pasarlo.
3. Nunca `!` para sacar un opcional: usa `if let`.
4. El código que *hace* cosas (asignar, llamar funciones) va **dentro** de una `func` o del `body`, nunca suelto en el archivo.
5. Cada elemento de una lista necesita un `id` **distinto** (`Identifiable`).
6. `.navigationTitle` solo aparece si la vista está dentro de un `NavigationStack`.
7. Un `NavigationStack` por pestaña, **dentro** de cada pestaña. Nunca uno dentro de otro.
8. Navegar después de validar: `Button` + `.alert` + `.navigationDestination(isPresented:)` (Clase 6C).
9. Imágenes: `.resizable(resizingMode: .stretch)` → `.aspectRatio(contentMode: .fit)` → `.frame(...)`, en ese orden.
10. Gráficas: barras para comparar categorías; **nunca líneas para categorías** (Clase 15).
11. Fotos: `import PhotosUI`. Gráficas: `import Charts`. Cámara: `CamaraPicker.swift` + permiso de cámara.
12. Esconder el teclado: `@FocusState` + `.onTapGesture` en el Stack **principal**.
13. Alertas: `@State private var showAlert = false` → `.alert(...)` → `showAlert.toggle()`.
14. Carpetas: `Model/`, `Views/`, `Components/`, `Utils/` (paleta de colores).
15. Todo el texto en un solo idioma, sin faltas de ortografía, y el `id` nunca se muestra en pantalla.

---

# 1. Xcode y el proyecto

Todo lo que pasa **fuera del código**: crear el proyecto, dónde va cada archivo, cómo ver tu app, cómo depurar y cómo entregarla.

## 1.1 Crear el proyecto nuevo
🔎 crear proyecto, nuevo proyecto, new project, empezar app, iOS App, tec.mx, organization identifier, bundle identifier, interface swiftui, language swift, testing none, storage none

**Qué es:** el primer paso del examen. Xcode te arma una app vacía que ya corre.

**Cómo se hace (forma de clase, Clase 2 y Clase 3):**

1. Abre Xcode → **File → New → Project…** (o en la ventana de bienvenida: **Create New Project…**). Atajo: **⇧⌘N**.
2. Arriba elige la pestaña **iOS** → selecciona **App** → **Next**.
3. Llena las opciones:

| Campo | Qué poner | Para qué sirve |
|---|---|---|
| **Product Name** | El nombre de tu app, sin espacios ni acentos. Ej. `MisAntojos` | Es el nombre del proyecto y de la carpeta |
| **Team** | Tu *Personal Team* (o None) | Solo importa para correr en un iPhone físico |
| **Organization Identifier** | `tec.mx` | Así lo pide la profe |
| **Bundle Identifier** | Sale solo: `tec.mx.MisAntojos` | Es el "nombre único" de la app en el iPhone |
| **Interface** | **SwiftUI** | ⚠️ NO elijas Storyboard |
| **Language** | **Swift** | |
| **Testing System** | **None** | No vamos a hacer pruebas automáticas |
| **Storage** | **None** | Nada de SwiftData / Core Data |

4. **Next** → elige dónde guardarlo (ej. Escritorio) → **Create**.

**Errores comunes:**
- Elegir **Storyboard** en Interface → el proyecto sale con UIKit y nada de la clase funciona. Bórralo y crea otro.
- Poner espacios o acentos en Product Name (`Mis Antojos`, `Añoranza`) → funciona, pero luego el nombre del struct de la App sale raro. Usa `MisAntojos`.
- Crear un **Playground** en lugar de **App** → un Playground no es una app (no tiene simulador ni pantallas). Los Playgrounds (**File → New → Playground…**, ⌥⇧⌘N) solo sirven para probar código Swift suelto.

**¿Visto en clase?** ✅ Clase 2 (lámina 5) y Clase 3 (láminas 3–4).

**En el repo:** `02_PrimeraApp/MiPrimeraAppView.swift` → encabezado (pasos de Xcode).

## 1.2 Los archivos que trae un proyecto nuevo
🔎 archivos del proyecto, App.swift, ContentView, Assets, xcassets, @main, WindowGroup, entry point, punto de entrada, preview content, project navigator

En Xcode 26 un proyecto nuevo trae esto:

```
MisAntojos/                 ← carpeta del proyecto (la que se comprime en ZIP)
├── MisAntojos.xcodeproj    ← "el proyecto": ajustes, target, firma. Doble clic para abrir.
└── MisAntojos/             ← TU CÓDIGO va aquí
    ├── MisAntojosApp.swift ← punto de entrada (@main)
    ├── ContentView.swift   ← la primera pantalla (ejemplo)
    └── Assets.xcassets     ← imágenes, colores, ícono de la app
```

| Archivo | Qué es | ¿Lo toco? |
|---|---|---|
| `MisAntojosApp.swift` | El **archivo principal / entry point** (Clase 3). Tiene `@main`: es lo primero que corre. Dice qué pantalla se abre al iniciar. | Solo para cambiar la pantalla inicial |
| `ContentView.swift` | Una **vista** (pantalla) de ejemplo, "código front y back" (Clase 3). | Sí: puedes usarla o reemplazarla |
| `Assets.xcassets` | El **folder de assets**: imágenes, fotos, colores, ícono. | Sí: aquí arrastras tus imágenes |
| `MisAntojos.xcodeproj` | El proyecto en sí (configuración). | Solo para abrirlo; no lo edites a mano |
| `Preview Content` | En versiones viejas de Xcode venía una carpeta así para datos de preview. **En Xcode 26 ya no viene**. | — |

### 1.2.1 El archivo App (`@main`)

```swift
import SwiftUI

@main
struct MisAntojosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

- `@main` = "aquí empieza la app". Solo puede haber **uno** en todo el proyecto.
- `App` = protocolo para el struct principal. Su `body` es una `Scene` (una ventana), no una `View`.
- `WindowGroup { }` = la ventana de la app. Lo que pongas adentro es **la primera pantalla**.

### 1.2.2 El ContentView que viene por default

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

La Clase 3 explica: el ContentView declara **1 estructura** que describe contenido y diseño, y "hereda" de `View` (en realidad se **conforma** al protocolo `View`). Dentro de `body` van los elementos (textos, imágenes, campos, botones) y sus propiedades se cambian con **modificadores**.

**En el repo:** `02_PrimeraApp/ImagenesView.swift` → bloque 5 (el globo de ContentView explicado).

## 1.3 Cambiar la pantalla inicial
🔎 pantalla inicial, primera pantalla, root view, vista raiz, cambiar ContentView, abrir con otra vista, WindowGroup, que abra mi TabView

**Opción A (la más simple):** en el archivo App cambia `ContentView()` por tu vista:

```swift
@main
struct MisAntojosApp: App {
    var body: some Scene {
        WindowGroup {
            TabViewPrincipal()        // ✏️ tu primera pantalla
        }
    }
}
```

**Opción B:** deja `ContentView()` en el App y haz que el `body` de `ContentView` sea tu `TabView`. Así no tocas el App.

**Errores comunes:**
- `Cannot find 'TabViewPrincipal' in scope` → escribiste mal el nombre, o el archivo no está en el target (ver 1.6).
- `Missing argument for parameter 'x' in call` → tu pantalla recibe datos (`var x: Algo`). La primera pantalla no debería recibir nada; dale valores por default o carga los datos adentro con `@State private var lista = cargarDatos()`.
- Pusiste `@main` en otro archivo → `'main' attribute can only apply to one type in a module`. Deja solo el del App.

## 1.4 Partes de la ventana de Xcode
🔎 partes de xcode, navigator, editor, canvas, inspector, consola, debug area, toolbar, panel izquierdo, panel derecho, esconder paneles

Clase 3: **Archivos del proyecto · Editor · Pre-visualización · Consola.**

| Parte | Dónde está | Para qué | Mostrar / esconder |
|---|---|---|---|
| **Navigator** (archivos) | Izquierda | Ver carpetas y archivos | **⌘0** |
| **Editor** | Centro | Escribir código | — |
| **Canvas** (preview) | Derecha del editor | Ver la vista sin correr la app | **⌥⌘↩** o Editor → Canvas |
| **Inspector** | Derecha | Propiedades del archivo / vista seleccionada | **⌥⌘0** |
| **Debug area / Consola** | Abajo | Mensajes de `print()` y errores al correr | **⇧⌘Y** |
| **Toolbar** | Arriba | Botón ▶︎ (correr), ■ (detener), elegir simulador | — |

Las pestañas del Navigator (iconitos arriba a la izquierda):

| Atajo | Pestaña | Para qué |
|---|---|---|
| ⌘1 | Project (carpetita) | Tus archivos |
| ⌘2 | Source Control | Git |
| ⌘3 | Bookmarks | Marcadores |
| ⌘4 | Find (lupa) | Resultados de buscar en todo el proyecto |
| ⌘5 | Issues (triángulo ⚠️) | **Lista de TODOS los errores y warnings**. Úsala cuando no compile |
| ⌘6 | Tests | Pruebas |
| ⌘7 | Debug | Cuando la app se detiene |
| ⌘8 | Breakpoints | Tus puntos de pausa |
| ⌘9 | Reports | Historial de builds |

## 1.5 Carpetas: crear y organizar
🔎 carpetas, folders, grupos, groups, new folder, new group, organizar archivos, estructura de carpetas, Model, Views, Components, Utils, Services, organización de archivos

**Qué es:** el curso **califica** que tus archivos estén en carpetas por tipo.

**Estructura que pide el curso:**

```
MisAntojos/
├── Model/          structs y datos fijos (Antojo.swift, ModelData.swift)
├── Views/          pantallas completas (InicioView, ListaView, DetalleView…)
├── Components/     piezas reutilizables (AntojoRow, TarjetaResumen…)
├── Utils/          paleta de colores, funciones de ayuda
└── Services/       solo si consumes una API (no en este examen)
```

**Cómo crear una carpeta:** clic derecho sobre la carpeta amarilla/azul de tu código (la que se llama como tu app) → **New Folder** → escribe el nombre → Enter.

- En Xcode 26 las carpetas son **carpetas reales** (icono azul). Lo que metas ahí entra solo a la app.
- **New Group** también existe, pero usa **New Folder**: es lo más directo.

**Mover archivos:** arrastra el archivo en el Navigator a la carpeta. No cambia el código.

**Errores comunes:**
- Crear la carpeta **afuera** (al lado del `.xcodeproj`) → los archivos no entran a la app y sale `Cannot find 'X' in scope`. La carpeta va **dentro** de la carpeta de tu código.
- Llamar la carpeta `View` en vez de `Views` → funciona igual, pero el curso usa `Views` (plural).

**¿Visto en clase?** ✅ Clase 10 (Views / Components / Model) y SKILL (Utils, Services).

## 1.6 Crear archivos nuevos: SwiftUI View vs Swift File
🔎 crear archivo, nuevo archivo, new file, file from template, swiftui view, swift file, plantilla, template, crear vista, crear modelo, cmd n

| Quiero crear… | Plantilla | Qué trae |
|---|---|---|
| Una **pantalla** o un **componente** (algo que se ve) | **SwiftUI View** | `import SwiftUI`, `struct X: View`, `body` y `#Preview` |
| Un **modelo** (struct de datos), **ModelData**, paleta, funciones | **Swift File** | Solo `import Foundation` |

**Pasos (Clase 5A):** **File → New → File from Template…** (o clic derecho en la carpeta → **New File from Template…**, atajo **⌘N**) → sección **iOS** → **User Interface** → **SwiftUI View** → **Next** → nombre → **Create**.

Para un Swift File: misma ventana → **Source** → **Swift File**.

**Reglas de nombres:**
- El archivo y el struct se llaman **igual**: `DetalleAntojoView.swift` → `struct DetalleAntojoView: View`.
- Las vistas terminan en `View` (`InicioView`), los renglones en `Row` (`AntojoRow`), los modelos sin sufijo (`Antojo`).
- Empieza con **mayúscula** (UpperCamelCase). Sin espacios ni acentos.

**Errores comunes:**
- Crear un **Swift File** para una pantalla → no trae `import SwiftUI` y sale `Cannot find type 'View' in scope`. Agrega `import SwiftUI` arriba.
- Crear el modelo con **SwiftUI View** → trae un `struct X: View` y un `#Preview` que no necesitas. Bórralos y deja solo tu struct.
- Dos archivos con el mismo struct → `Invalid redeclaration of 'X'`.

## 1.7 Renombrar y borrar archivos
🔎 renombrar archivo, rename, cambiar nombre, borrar archivo, delete, eliminar archivo, refactor rename, move to trash

- **Renombrar el archivo:** clic en el nombre en el Navigator → Enter → escribe → Enter. ⚠️ Esto **NO** cambia el nombre del `struct` de adentro.
- **Renombrar el struct en todo el proyecto:** clic derecho sobre el nombre del struct → **Refactor → Rename…** (o ⌘ clic → Rename). Cambia todos los lugares donde se usa (y también puede renombrar el archivo).
- **Renombrar una variable solo en esta función/vista:** pon el cursor en ella → **⌃⌘E** (Edit All in Scope) → escribe el nombre nuevo.
- **Borrar:** clic derecho → **Delete** → **Move to Trash**.

## 1.8 Imágenes en Assets
🔎 agregar imagen, assets, xcassets, image set, arrastrar imagen, nombre de imagen, 1x 2x 3x, foto en assets, imagen no aparece, mayusculas

**Pasos (Clase 3):** 1) navegador del proyecto → 2) **Assets.xcassets** → 3) **arrastra y suelta** la imagen ahí.

- El **nombre del Image Set** (lo que ves en la lista de la izquierda de Assets) es el que usas en el código: `Image("tacos")`.
- Puedes renombrarlo con doble clic. Usa nombres cortos, **sin espacios, sin acentos, en minúsculas**: `tacospiedra`, `burger1`.
- **Mayúsculas importan:** `Image("Tacos")` ≠ `Image("tacos")`.
- Las casillas **1x / 2x / 3x** son la misma imagen en 3 tamaños. Para el examen basta con soltarla una vez (en cualquiera).
- En el modelo, la imagen se guarda como **String con el nombre del asset**, no como `Image`: `var imagen: String` → `Image(antojo.imagen)`.

**Errores comunes:**
- La imagen no aparece y en la consola sale `No image named 'Tacos' found in asset catalog` → el nombre no coincide (revisa mayúsculas) o la arrastraste fuera de Assets.
- `imagen: ""` en tu ModelData → no muestra nada (mismo mensaje con `''`).
- La imagen sale gigante → te faltan `.resizable(resizingMode: .stretch)` + `.aspectRatio(contentMode: .fit)` + `.frame(...)`.

**En el repo:** `02_PrimeraApp/ImagenesView.swift` → encabezado y bloque 1.

## 1.9 Agregar otros archivos (mp3, json)
🔎 agregar mp3, agregar json, agregar archivo, copy items if needed, target membership, add files, bundle, archivo de sonido, sonido no se encuentra

1. Arrastra el archivo desde Finder **a una carpeta de tu código** en el Navigator (ej. `Model/` para un `.json`).
2. En la ventana que sale: **Copy files to destination** (o "Copy items if needed") ✅ y tu **target** ✅ marcado.
3. Se usa por nombre: `Bundle.main.url(forResource: "MarioBros", withExtension: "mp3")`.

**Errores comunes:**
- No marcaste el target → `Bundle.main.url(...)` regresa `nil` y "no encuentra el archivo".
- Arrastraste "por referencia" sin copiar → al mandar el ZIP, el archivo no va incluido.
- Dos archivos con el mismo nombre en carpetas distintas (ej. dos `README.md`) → `Multiple commands produce '…/README.md'`. Renombra uno.

**En el repo:** `11_Extras/SonidoView.swift` (mp3) y `08_ModelosYListas/Views/JSONLocalView.swift` (json).

## 1.10 Canvas y #Preview
🔎 canvas, preview, #Preview, vista previa, previsualizacion, live preview, refrescar preview, resume, preview crashed, preview no sale, pin preview, variantes, modo oscuro preview, horizontal preview

**Qué es:** ver cómo se ve una vista **sin correr la app**. Cada archivo de vista trae al final:

```swift
#Preview {
    ContentView()
}
```

| Acción | Cómo |
|---|---|
| Mostrar / esconder Canvas | **⌥⌘↩** o menú **Editor → Canvas** |
| Refrescar si se pausó ("Preview paused") | **⌥⌘P** o botón ↻ del canvas |
| Tocar botones en el preview | Modo **Live** (ícono ▶︎ / mano en el canvas) |
| Fijar un preview mientras editas otro archivo | Botón 📌 (**Pin**) abajo a la izquierda del canvas |
| Ver en otro dispositivo | Menú del dispositivo abajo del canvas |
| Ver modo oscuro, tamaños de letra, horizontal | Botón **Variants** abajo del canvas |

**Varios previews en un archivo, con nombre:**

```swift
#Preview {
    TabViewPrincipal()
}

#Preview("Detalle con barra") {
    NavigationStack {                         // para que se vea el navigationTitle
        DetalleAntojo(nombre: "Tacos Piedra")
    }
}

#Preview("Con binding") {
    EditarNombre(nombre: .constant("Tacos Popo"))   // @Binding necesita .constant
}

#Preview("Horizontal", traits: .landscapeLeft) {
    TabViewPrincipal()
}

#Preview("Modo oscuro") {
    TabViewPrincipal()
        .preferredColorScheme(.dark)
}
```

**Reglas del preview:**
- Si la vista **recibe datos** (`var antojo: Antojo`), el preview tiene que dárselos: `DetalleView(antojo: cargarAntojos()[0])`.
- Si recibe un **`@Binding`**, usa `.constant(valor)` (Clase 6B).
- Si la vista usa `.navigationTitle` pero no tiene su propio `NavigationStack`, envuélvela en `NavigationStack { }` **solo en el preview**.

**Errores comunes:**
- "**Cannot preview in this file**" o "**Preview crashed**" → hay un error de compilación en *cualquier* archivo del proyecto, o la vista truena al dibujarse (ej. `lista[0]` con lista vacía). Corre con ⌘B y arregla los errores rojos; luego ⌥⌘P.
- El preview se ve distinto a la app → el preview solo muestra **esa** vista, sin las pantallas de antes (por eso no sale el título ni el botón "<").
- El preview de la cámara no sirve → la cámara solo funciona en iPhone físico.

**¿Visto en clase?** ✅ Clase 3 (Canvas) y Clase 6B (`.constant`). ⚠️ `traits:` y los nombres en `#Preview("…")` no se vieron; son solo para ti, no afectan la app.

## 1.11 El simulador
🔎 simulador, simulator, correr app, run, cmd r, elegir iphone, rotar, girar, teclado simulador, modo oscuro simulador, dark mode, captura de pantalla, fotos en simulador, home

**Correr la app:** elige el dispositivo arriba en la toolbar (ej. **iPhone 17 Pro**, Clase 3) → **⌘R** (o ▶︎). Detener: **⌘.** (o ■).

| En el Simulador | Atajo |
|---|---|
| Ir al Home (salir de la app) | **⇧⌘H** |
| Rotar a la izquierda / derecha | **⌘←** / **⌘→** |
| Mostrar / esconder el **teclado en pantalla** | **⌘K** |
| Conectar / desconectar el teclado de la Mac | **⇧⌘K** (si "no sale el teclado", es esto) |
| Cambiar a **modo oscuro / claro** | **⇧⌘A** (Features → Toggle Appearance) |
| Captura de pantalla | **⌘S** (se guarda en el Escritorio) |
| Agregar fotos para probar PhotosPicker | **Arrastra** una imagen de Finder al simulador → se guarda en Fotos |
| Borrar todo (reiniciar el iPhone virtual) | Device → **Erase All Content and Settings…** |

**Errores comunes:**
- El texto no se ve → el simulador está en **modo oscuro** y tu fondo es claro fijo. Prueba ⇧⌘A o pon colores de tu paleta en todo.
- La cámara truena o no abre → el simulador **no tiene cámara**. Pruébala en un iPhone físico (Clase 17) y en el simulador usa la galería.
- La app se queda con datos viejos de `@AppStorage` → borra la app del simulador (mantén presionado el ícono → Remove App) o Erase All Content.

## 1.12 La consola y `print()` para encontrar errores
🔎 consola, console, print, debug, depurar, imprimir, ver valor de variable, log, mensajes, debug area, por que no funciona

**Qué es:** `print()` escribe un mensaje en la **consola** (abajo, ⇧⌘Y) mientras corre la app. Sirve para saber si un botón sí se presiona o qué vale una variable.

```swift
struct ConsolaPrueba: View {
    @State private var contador = 0
    @State private var precioTexto = "120"

    var body: some View {
        VStack {
            Button("Sumar") {
                contador += 1
                print("contador ahora vale \(contador)")
                if let precio = Double(precioTexto) {
                    print("precio convertido:", precio)
                } else {
                    print("⚠️ no se pudo convertir:", precioTexto)
                }
            }
        }
        .onAppear {
            print("Se abrió ConsolaPrueba")
        }
    }
}
```

- `print("texto \(variable)")` o `print("texto", variable)` (con coma pone un espacio).
- **Va dentro de una acción** (botón, `.onAppear`, una `func`), **nunca suelto dentro de un `VStack`**: ahí sale `Type '()' cannot conform to 'View'`.
- La consola también muestra los **avisos de SwiftUI** (ej. ids repetidos, imágenes que no existen). Léela si algo "no hace nada".
- Borra los `print` antes de entregar (o déjalos si te ayudan a explicar).

**¿Visto en clase?** ✅ Clase 2 (`print(greeting)` en Playground).

**En el repo:** `01_SwiftBasico/TiposYVariablesView.swift` → bloque 8.

## 1.13 Breakpoints (pausar la app en una línea)
🔎 breakpoint, punto de interrupcion, pausar, detener en linea, flecha azul, debugger, po, step over, continuar, app se detuvo sola

**Qué es:** una **flecha azul** en el número de línea. Cuando la app llega ahí, se pausa y puedes ver cuánto vale cada variable.

| Acción | Cómo |
|---|---|
| Poner / quitar breakpoint | Clic en el número de línea, o **⌘\\** |
| Desactivar todos (sin borrarlos) | **⌘Y** |
| Continuar | **⌃⌘Y** o botón ▶︎ de la debug area |
| Ejecutar la siguiente línea | **F6** (Step Over) |
| Ver una variable | Pasa el mouse encima, o escribe `po nombreVariable` en la consola |

**Error común:** "la app se congela y Xcode se pone verde en una línea" → dejaste un breakpoint. Arrástralo fuera de la línea o presiona ⌘Y.

## 1.14 Permisos (cámara) en la pestaña Info
🔎 permiso camara, privacy camera usage description, NSCameraUsageDescription, info.plist, add row, custom ios target properties, crash camara, la app se cierra al abrir camara

**Qué es:** desde **iOS 10**, para usar la cámara la app debe explicar **para qué** la usa. Ese texto aparece en la ventanita "¿Permitir acceso a la cámara?". **Sin esto, la app truena** al abrir la cámara.

**Pasos (Clase 17):**
1. Navegador del proyecto → clic en el **proyecto** (el ícono azul de hasta arriba).
2. En **TARGETS** elige tu app → pestaña **Info**.
3. Clic derecho en la última fila de **Custom iOS Target Properties** → **Add Row**.
4. Escribe/elige **Privacy - Camera Usage Description**.
5. En **Value** escribe el mensaje: `La app usa la cámara para tomar tu foto de perfil.`

- **PhotosPicker (galería) NO necesita permiso.** Solo la cámara.
- La prueba final de la cámara es en un **iPhone físico** (tutorial en Canvas).

**¿Visto en clase?** ✅ Clase 17 (láminas 13–17).

**En el repo:** `10_FotosYCamara/TomarFotoView.swift` → encabezado.

## 1.15 Build Settings vs Info vs General
🔎 build settings, info, general, signing, minimum deployments, version de ios, swift version, team, firma, deployment target

Al hacer clic en el proyecto → **TARGETS → tu app** aparecen pestañas:

| Pestaña | Qué tiene | ¿Cuándo la toco? |
|---|---|---|
| **General** | Nombre, versión, **Minimum Deployments** (iOS mínimo) | Casi nunca |
| **Signing & Capabilities** | **Team** y firma | Si sale error de firma (ver 13.15) |
| **Info** | Llaves del Info.plist (permisos) | Para el permiso de cámara |
| **Build Settings** | Todos los ajustes (Swift version, etc.) | Casi nunca |

- Lo que agregas en **Info** se guarda como `INFOPLIST_KEY_…` en Build Settings (ej. `INFOPLIST_KEY_NSCameraUsageDescription`). Es lo mismo.
- Xcode 26 crea los proyectos con **Default Actor Isolation = MainActor**: todo tu código corre en el hilo principal. Por eso casi nunca tendrás errores de concurrencia.

## 1.16 Cuando Xcode se traba: Clean Build Folder y DerivedData
🔎 xcode trabado, no compila sin razon, errores raros, clean build folder, limpiar, derived data, borrar derived data, preview no carga, reiniciar xcode

Si salen errores que no tienen sentido o el preview no carga, en este orden:

1. **Product → Clean Build Folder** (**⇧⌘K** en Xcode) y vuelve a correr (⌘R).
2. Cierra y abre el Canvas (⌥⌘↩) y refresca (⌥⌘P).
3. Cierra Xcode por completo (⌘Q) y ábrelo otra vez.
4. **Borra DerivedData** (la carpeta donde Xcode guarda lo compilado): Xcode → **Settings…** → **Locations** → junto a *Derived Data* haz clic en la flechita → borra la carpeta de tu proyecto (o todo `DerivedData`). Está en `~/Library/Developer/Xcode/DerivedData`.
5. En el simulador: Device → **Erase All Content and Settings…**

Borrar DerivedData **no borra tu código**. Solo hace que Xcode compile todo desde cero.

## 1.17 Entregar: comprimir el proyecto en ZIP para Canvas
🔎 zip, comprimir, compress, entregar, subir a canvas, entrega, archive, mandar proyecto, que carpeta comprimir

1. Cierra Xcode (⌘Q) para que todo esté guardado.
2. En **Finder**, busca la carpeta **que contiene** el `.xcodeproj` (ej. `MisAntojos/`, la de hasta afuera).
3. Clic derecho sobre **esa carpeta** → **Compress "MisAntojos"** → sale `MisAntojos.zip`.
4. **Verifica:** haz doble clic al ZIP en otro lugar (ej. Descargas), abre el `.xcodeproj` que sale y corre ⌘R. Si corre, está bien.

El ZIP debe tener:

```
MisAntojos.zip
└── MisAntojos/
    ├── MisAntojos.xcodeproj
    └── MisAntojos/          ← tu código, Assets, mp3/json
```

**Errores comunes:**
- Comprimir solo el `.xcodeproj` → **no lleva tu código** (es solo la configuración). Comprime la carpeta de arriba.
- Comprimir solo la carpeta de código → no se puede abrir como proyecto.
- Entregar un `.zip` vacío o de otro proyecto → revisa el nombre y ábrelo antes de subir.
- Si la profe pide video: MP4 (no .MOV, no ligas), máximo 5 min (formato de la Tarea Movil02).

## 1.18 Atajos de teclado (todos los útiles)
🔎 atajos, shortcuts, teclas, comandos de teclado, cmd, comentar codigo, indentar, buscar en proyecto, open quickly, libreria, diagonal invertida, backslash, emoji

### 1.18.1 Correr y compilar

| Atajo | Qué hace |
|---|---|
| **⌘R** | Correr la app en el simulador |
| **⌘B** | Compilar (ver errores sin correr) |
| **⌘.** | Detener la app |
| **⇧⌘K** | Clean Build Folder (en Xcode) |
| **⌥⌘↩** | Mostrar / esconder Canvas |
| **⌥⌘P** | Refrescar el preview |
| **⇧⌘N** | Proyecto nuevo |
| **⌘N** | Archivo nuevo (File from Template) |
| **⌃⌥⌘F** | Fix All Issues (aplica todas las sugerencias "Fix") |

### 1.18.2 Buscar y moverte

| Atajo | Qué hace |
|---|---|
| **⇧⌘O** | **Open Quickly**: abrir cualquier archivo o struct escribiendo su nombre |
| **⌘F** | Buscar en el archivo actual |
| **⌥⌘F** | Buscar y reemplazar en el archivo |
| **⇧⌘F** | **Buscar en todo el proyecto** |
| **⇧⌥⌘F** | Buscar y reemplazar en todo el proyecto |
| **⌘L** | Ir a una línea por número |
| **⌃6** | Lista de funciones / structs del archivo (saltar a uno) |
| **⇧⌘J** | Mostrar el archivo actual en el Navigator |
| **⌘ clic** sobre un nombre | Menú: Jump to Definition, Rename, Show Quick Help… |
| **⌃⌘J** | Ir a la definición de lo que está bajo el cursor |
| **⌥ clic** sobre un nombre | Ayuda rápida (qué es y qué parámetros recibe) |
| **⌃⌘←** / **⌃⌘→** | Regresar / avanzar al archivo anterior |
| **⌘1 … ⌘9** | Pestañas del Navigator (⌘1 archivos, ⌘4 búsqueda, ⌘5 errores) |

### 1.18.3 Editar código

| Atajo | Qué hace |
|---|---|
| **⌘/** | Comentar / descomentar líneas seleccionadas |
| **⌃I** | Re-indentar (acomodar sangrías) la selección. Tip: **⌘A** y luego **⌃I** acomoda todo el archivo |
| **⌘[** / **⌘]** | Mover la selección a la izquierda / derecha |
| **⌥⌘[** / **⌥⌘]** | Subir / bajar la línea actual |
| **⌘D** | Duplicar la línea / selección |
| **⌃⌘E** | Editar todas las apariciones de una variable en este scope |
| Clic derecho → **Refactor → Rename** | Renombrar en todo el proyecto |
| **⌥⌘E** | Seleccionar la siguiente aparición (multi-cursor) |
| **⌃⇧ clic** | Agregar otro cursor donde hagas clic |
| **⌥ arrastrar** | Selección en columna (rectángulo) |
| **⌘Z** / **⇧⌘Z** | Deshacer / rehacer |
| **⇧⌘L** | **Librería** de objetos (vistas, modificadores, SF Symbols) para arrastrar (Clase 3) |
| **⌘+** / **⌘-** | Agrandar / achicar la letra del editor |
| **Esc** | Abrir el autocompletado |

### 1.18.4 Paneles

| Atajo | Qué hace |
|---|---|
| **⌘0** | Mostrar / esconder el Navigator (izquierda) |
| **⌥⌘0** | Mostrar / esconder el Inspector (derecha) |
| **⇧⌘Y** | Mostrar / esconder la consola |
| **⌘\\** | Poner / quitar breakpoint en la línea |

### 1.18.5 Teclado de la Mac (útil para escribir código)

| Quiero escribir | Teclado en español (Latinoamérica) |
|---|---|
| `\` (diagonal invertida, para `\(variable)`) | **⌥ + '** (la tecla junto al 0) — así lo enseñó la clase |
| Emojis (⭐️ ❤️ 🌮) | **⌃⌘Espacio** |
| `{ } [ ] < >` y no sabes dónde están | Menú de idioma (arriba a la derecha) → **Mostrar visor de teclado** y presiona ⌥ o ⇧ para ver dónde quedó cada símbolo |

## 1.19 Lo que se califica en general (rúbrica de las tareas)
🔎 rubrica, calificacion, criterios, que se califica, puntos, cumplimiento funcional, calidad tecnica, dominio, defensa, ui ux, usabilidad

Según el formato de la Tarea Movil02 (y lo que dice la profe):

| Criterio | Qué revisan |
|---|---|
| **Cumplimiento funcional** (35) | Que haga **todo** lo que pide el enunciado, sin tronar |
| **Calidad técnica** (20) | Carpetas `Model/Views/Components/Utils`, buenas prácticas de clase (`@State private`, `if let`, componentes), nada de código repetido sin razón |
| **Dominio y defensa** (20) | Que puedas **explicar, justificar y modificar** cualquier línea. "Una app que funciona no garantiza calificación alta" |
| **UI/UX y usabilidad** (20) | Paleta monocromática o análoga, contraste letra/fondo, márgenes, espacios, tamaño de botones, legibilidad, todo en un idioma, **sin faltas de ortografía** |
| **Fuentes / IA** (5) | Declarar qué usaste |

Reglas que siempre aplican:
- **El ID nunca se muestra** en la pantalla.
- **No mezclar idiomas** (todo español o todo inglés), incluyendo los textos de las pestañas.
- Si usas algo que **no se vio en clase**, puedes, pero debes poder explicar qué es, por qué lo elegiste y sus ventajas/desventajas.

**En el repo:** `00_INDICE.md` → "Checklist de UI/UX" y "Reglas que dijo la profesora".

---

# 2. Swift: el lenguaje

🔎 swift, lenguaje, sintaxis, basico, básico, conceptos basicos, fundamentos, tipos, variables, funciones, structs, fechas, numeros

Esta parte es **todo lo que no es pantalla**: variables, texto, números, opcionales, arreglos, `if`, ciclos,
funciones, structs, clases, protocolos, fechas y formatos. Es lo que escribes dentro de funciones, en tus
modelos (`Model/`) y en tu `ModelData.swift`. Lo de pantallas (Text, Button, List…) está en las partes 3 a 9.

**Cómo leer las marcas de "¿Visto en clase?":**

| Marca | Qué significa |
|---|---|
| ✅ Clase N | Viene en una lámina de la profesora (o en el material del curso). Úsalo sin miedo. |
| 🟡 Básico | No sale en una lámina, pero es sintaxis básica de cualquier lenguaje (`for`, `%`, `&&`). Se puede usar y defender fácil. |
| ⚠️ No visto | No se vio en clase. Funciona, pero si lo usas debes poder explicarlo. Junto a cada uno va una frase para explicarlo. |

---

## 2.1 Reglas básicas de escritura

🔎 comentarios, comentario, //, /* */, print, consola, punto y coma, ;, mayusculas, minusculas, camelCase, nombres de variables, llaves, indentacion, sangria

**Qué es:** las reglas de "ortografía" de Swift: cómo se escriben comentarios, nombres y cómo se ve algo en la consola.

**Cómo se escribe:**

```swift
// Esto es un comentario de una línea. Swift lo ignora.

/* Esto es un comentario
   de varias líneas. */

func ejemploReglas() {
    let nombreCompleto = "Ana López"   // camelCase: primera palabra en minúscula, las demás con mayúscula
    print(nombreCompleto)              // print escribe en la consola de Xcode (abajo)
    print("Hola", nombreCompleto)      // varios valores separados por coma → "Hola Ana López"
    print("Tengo \(20) años")          // con interpolación
}
```

| Regla | Explicación |
|---|---|
| Mayúsculas importan | `nombre` y `Nombre` son dos cosas distintas. |
| Variables y funciones | `camelCase` empezando con minúscula: `precioTotal`, `cargarAntojos()`. |
| Tipos (struct, class, protocol, enum) | `PascalCase` empezando con mayúscula: `Antojo`, `ListaAntojosView`. |
| Punto y coma `;` | No se usa. Solo sirve si pones dos instrucciones en la misma línea (no lo hagas). |
| Llaves `{ }` | Abren y cierran bloques (funciones, if, ciclos, structs, vistas). Cada `{` necesita su `}`. |
| Sangría (espacios al inicio) | No cambia nada para Swift, pero hace el código legible. En Xcode: selecciona y presiona **⌃I** para acomodarla sola. |
| Acentos y ñ en nombres | Swift los permite (`año`), pero mejor evítalos en nombres de variables: usa `anio`. En los **textos** (`"Año"`) sí van. |

**Dónde ves el `print`:** en la **consola** de Xcode, abajo. Si no la ves: menú **View → Debug Area → Activate Console** (⇧⌘C).
Ojo: el `print` NO sale en la pantalla del iPhone ni en el Canvas, solo en la consola cuando corres la app (⌘R).

**¿Visto en clase?** ✅ Clase 2 (`print` en el Playground: `var greeting = "Hello, playground"` / `print(greeting)`).

**En el repo:** `01_SwiftBasico/TiposYVariablesView.swift` → bloque 8.

---

## 2.2 Dónde puede ir el código (y el error "Expressions are not allowed at the top level")

🔎 donde va el codigo, top level, nivel superior, fuera de la funcion, expressions are not allowed at the top level, expected declaration, dentro de struct, dentro de funcion, dentro del body, codigo suelto

**Qué es:** en Swift no puedes escribir instrucciones en cualquier lado. Hay **declaraciones** (crear algo: `let`, `var`,
`func`, `struct`) e **instrucciones** (hacer algo: asignar, llamar una función, `if`, `for`, `print`).

| Lugar | Qué se puede poner | Qué NO |
|---|---|---|
| Afuera de todo (el "top level" de un archivo) | Declaraciones: `struct`, `class`, `func`, `let`/`var` con su valor inicial, `import` | Instrucciones: `formato.dateFormat = "…"`, `lista.append(…)`, `print(…)`, `if`, `for` |
| Dentro de un `struct` (pero fuera de funciones) | Propiedades (`var`, `let`, `@State`), funciones, propiedades calculadas, `var body` | Instrucciones sueltas |
| Dentro de una `func` | TODO: declaraciones e instrucciones | — |
| Dentro de `var body: some View` | Vistas (`Text`, `VStack`…), `if`/`else`, `ForEach`, `let` | Asignar variables (`x = 5`), `print` suelto, `for` normal |

**El error que tuviste hoy:**

```swift
// ❌ esto NO compila:
import Foundation

let dateFormatter = DateFormatter()          // ✅ esto sí: es una declaración
dateFormatter.dateFormat = "dd/MM/yyyy"      // ❌ es una instrucción fuera de una función
// Error: "Expressions are not allowed at the top level"
```

**La solución:** mete la instrucción dentro de una función:

```swift
import Foundation

func crearFormateador() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"   // ✅ ahora está dentro de una función
    return dateFormatter
}
```

**Errores comunes:**

| Mensaje de Xcode | Por qué | Arreglo |
|---|---|---|
| `Expressions are not allowed at the top level` | Hay una instrucción (asignar, llamar, `print`) fuera de una función | Muévela dentro de una `func` (o dentro de la función que la usa, ej. `cargarAntojos()`) |
| `Expected declaration` | Pusiste una instrucción dentro de un `struct` pero fuera de una función | Métela en una función o en `.onAppear { }` / en la acción de un botón |
| `Type '()' cannot conform to 'View'` | Pusiste una asignación (`x = 5`) o un `print` directo dentro del `body` | Las asignaciones van en acciones: `Button("…") { x = 5 }`, `.onAppear { x = 5 }` |

**¿Visto en clase?** 🟡 Básico (es una regla del lenguaje).

---

## 2.3 Tipos de datos

🔎 tipos de datos, int, double, float, bool, string, character, entero, decimal, booleano, texto, caracter, tipo, type

**Qué es:** el tipo dice qué clase de valor guarda una variable.

| Tipo | Guarda | Ejemplo | Notas |
|---|---|---|---|
| `Int` | Enteros (sin punto) | `let edad = 20` | Para contar, ids, edades, calificaciones 1–5 |
| `Double` | Decimales | `let precio = 189.50` | El que más vas a usar para decimales. `Slider` usa `Double` |
| `Float` | Decimales (menos precisión) | `let volumen: Float = 0.5` | Casi no se usa; AVAudioPlayer usa `Float` |
| `Bool` | `true` o `false` | `let esFavorito = true` | Para Toggle, favoritos, validaciones |
| `String` | Texto | `let nombre = "Tacos Juanito"` | Siempre entre comillas dobles `" "` |
| `Character` | Un solo carácter | `let letra: Character = "A"` | Casi no se usa |
| `Date` | Fecha y hora | `let hoy = Date()` | Ver 2.21 |

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Cannot convert value of type 'Int' to specified type 'String'` | Pusiste un número donde va texto | Convierte: `String(numero)` o usa interpolación `"\(numero)"` |
| `Cannot convert value of type 'Double' to expected argument type 'Int'` | Mezclaste decimales con enteros | Convierte uno: `Int(miDouble)` o `Double(miInt)` (ver 2.6) |
| `Cannot assign value of type 'String' to type 'Int'` | La variable ya es Int y le quieres meter texto | Una variable no cambia de tipo nunca |

**¿Visto en clase?** ✅ Clase 2 (lámina 8: Int, Double, Float, Bool, String, Character).

**En el repo:** `01_SwiftBasico/TiposYVariablesView.swift` → bloque 2.

---

## 2.4 `var` y `let` (variables y constantes)

🔎 var, let, variable, constante, inferencia, inferir tipo, anotacion de tipo, declarar, sin valor inicial, cannot assign to value, is a let constant

**Qué es:** `var` = puede cambiar. `let` = se asigna **una sola vez** y ya no cambia.

**Cómo se escribe (forma de clase):**

```swift
func ejemploVarLet() {
    var cantidad = 38             // infiere el tipo Int
    cantidad = 20                 // ✅ se puede cambiar

    let precio: Double = 60.45    // se define explícitamente el tipo
    // precio = 70                // ❌ ERROR: una constante no cambia

    var numeroPaginas: Int        // declarada SIN valor inicial (hay que darle uno antes de usarla)
    numeroPaginas = 238

    var titulo = "Mensaje inicial"  // infiere el tipo String
    titulo = "Otro mensaje"

    let hora: Int                 // let sin valor: se asigna UNA vez después
    hora = 10

    print(cantidad, precio, numeroPaginas, titulo, hora)
}
```

| Concepto | Qué es |
|---|---|
| **Inferencia** | Swift adivina el tipo por el valor: `var x = 5` → Int, `var y = 5.0` → Double, `var z = "5"` → String. |
| **Anotación de tipo** | Tú dices el tipo: `var x: Double = 5` (aquí 5 se vuelve 5.0). |
| ¿Cuándo `let`? | Cuando el valor no va a cambiar (Xcode te avisa con un warning si usas `var` y nunca cambia: *"Variable was never mutated; consider changing to 'let'"*). |
| ¿Cuándo `var`? | Cuando el valor va a cambiar (contadores, arreglos a los que agregas, campos de un struct que se editan). |

**En SwiftUI:** si una variable de una pantalla cambia y la pantalla debe redibujarse, NO basta con `var`: necesita
`@State private var` (ver parte 4).

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Cannot assign to value: 'precio' is a 'let' constant` | Intentaste cambiar un `let` | Cámbialo a `var` si de verdad debe cambiar |
| `Variable 'x' used before being initialized` | Declaraste `var x: Int` sin valor y la usaste antes de asignarle | Dale un valor antes de usarla, o al declararla |
| `Type annotation missing in pattern` | `var x` sin tipo y sin valor | Pon el tipo (`var x: Int`) o un valor (`var x = 0`) |

**¿Visto en clase?** ✅ Clase 2 (láminas 9–11).

**En el repo:** `01_SwiftBasico/TiposYVariablesView.swift` → bloque 1.

---

## 2.5 Operadores

🔎 operadores, suma, resta, multiplicacion, division, modulo, residuo, %, +=, -=, comparar, igual, ==, !=, mayor, menor, &&, ||, and, or, not, negacion, ternario, rangos, ..., ..<

### 2.5.1 Aritméticos y de asignación

| Operador | Qué hace | Ejemplo | Resultado |
|---|---|---|---|
| `+` | Suma (y une textos) | `5 + 2` / `"Ho" + "la"` | `7` / `"Hola"` |
| `-` | Resta | `5 - 2` | `3` |
| `*` | Multiplica | `5 * 2` | `10` |
| `/` | Divide | `7 / 2` → **3** (Int corta los decimales) · `7.0 / 2` → **3.5** | ojo con enteros |
| `%` | Residuo (lo que sobra al dividir), solo Int | `7 % 2` → `1` | Par: `n % 2 == 0` |
| `=` | Asigna | `x = 5` | |
| `+=` `-=` `*=` `/=` | Opera y asigna | `total += precio` | igual a `total = total + precio` |

**División entera vs decimal (pasa mucho en promedios):**

```swift
func ejemploDivision() {
    let suma = 7
    let cantidad = 2
    let malo = suma / cantidad                    // 3  ← Int / Int corta los decimales
    let bueno = Double(suma) / Double(cantidad)   // 3.5 ← convierte ANTES de dividir
    print(malo, bueno)
}
```

### 2.5.2 Comparación y lógicos

| Operador | Significa | Ejemplo |
|---|---|---|
| `==` | Igual a | `nombre == "Ana"` |
| `!=` | Diferente de | `numero != nil` |
| `>` `<` `>=` `<=` | Mayor, menor, mayor o igual, menor o igual | `edad >= 18` |
| `&&` | Y (las dos deben ser verdad) | `edad >= 18 && tieneINE` |
| `\|\|` | O (al menos una) | `categoria == "Tacos" \|\| categoria == "Tortas"` |
| `!` | NO (lo contrario) | `!esFavorito` · `!texto.isEmpty` |

### 2.5.3 Ternario (un if en una línea)

```swift
func ejemploTernario(calificacion: Int, esFavorito: Bool) -> String {
    let estado = calificacion >= 70 ? "Aprobado" : "Reprobado"   // condición ? siVerdad : siFalso
    let icono = esFavorito ? "heart.fill" : "heart"              // MUY usado en vistas
    return "\(estado) \(icono)"
}
```

En vistas: `Image(systemName: antojo.esFavorito ? "heart.fill" : "heart")` y
`.foregroundStyle(valido ? .green : .red)`.

### 2.5.4 Rangos

| Rango | Incluye | Ejemplo |
|---|---|---|
| `1...5` | 1, 2, 3, 4, 5 (cerrado) | `Int.random(in: 1...5)`, `Slider(value: $x, in: 0...100)` |
| `0..<5` | 0, 1, 2, 3, 4 (sin el último) | `for i in 0..<lista.count` |
| `...10` / `5...` | Hasta 10 / desde 5 (en `switch`) | `case ...17:` |

**¿Visto en clase?** 🟡 Básico (`/` y `!=` salen en la Clase 2; los rangos `0 ... 100` en la Clase 4 con Slider; lo demás es sintaxis básica). Ternario: ✅ usado en las vistas del curso (`esFavorita ? "heart.fill" : "heart"`).

**En el repo:** `01_SwiftBasico/TiposYVariablesView.swift` → bloques 4, 6 y 7.

---

## 2.6 Conversiones entre tipos y matemáticas

🔎 convertir, conversion, casting, int a string, string a int, texto a numero, numero a texto, double a int, int a double, redondear, round, rounded, truncar, abs, valor absoluto, min, max, pow, potencia, raiz, sqrt

**Qué es:** Swift **nunca** mezcla tipos solo. Si quieres sumar un Int con un Double, o mostrar un número en texto,
tienes que convertir.

| Quiero | Código | Resultado | Ojo |
|---|---|---|---|
| Int → Double | `Double(5)` | `5.0` | Siempre funciona |
| Double → Int | `Int(3.9)` | `3` | **Corta** (no redondea). `Int(-3.9)` = `-3` |
| Número → String | `String(42)` o `"\(42)"` | `"42"` | Siempre funciona |
| String → Int | `Int("12")` | `Optional(12)` | Regresa **opcional**: puede ser `nil` |
| String → Double | `Double("3.5")` | `Optional(3.5)` | `Double("3,5")` = `nil` (coma no) |
| Texto vacío → Int | `Int("")` | `nil` | |
| Texto con espacios → Int | `Int(" 12")` | `nil` | Limpia antes con `trimmingCharacters` |
| Texto decimal → Int | `Int("12.5")` | `nil` | Usa `Double("12.5")` |
| Bool → String | `String(true)` | `"true"` | Para "Sí/No": `x ? "Sí" : "No"` |

**Por qué `Int("…")` regresa opcional:** porque el texto puede no ser número (`"hola"`). Swift te obliga a revisar con
`if let` (ver 2.8). Este es EL caso típico de examen: lo que escribe el usuario en un `TextField` es `String`.

```swift
func ejemploConvertir(textoDelUsuario: String) -> String {
    if let edad = Int(textoDelUsuario) {
        return "En 5 años tendrás \(edad + 5)"
    } else {
        return "Eso no es un número"
    }
}
```

**Redondear y matemáticas:**

| Función | Qué hace | Ejemplo | Resultado |
|---|---|---|---|
| `.rounded()` | Redondea al más cercano (0.5 sube) | `(2.5).rounded()` | `3.0` |
| `.rounded(.down)` | Hacia abajo | `(3.9).rounded(.down)` | `3.0` |
| `.rounded(.up)` | Hacia arriba | `(3.1).rounded(.up)` | `4.0` |
| `Int(x.rounded())` | Redondear y quedarte con Int | `Int((4.6).rounded())` | `5` |
| `abs(x)` | Valor absoluto | `abs(-5)` | `5` |
| `min(a, b)` / `max(a, b)` | El menor / mayor de dos | `max(3, 8)` | `8` |
| `pow(base, exp)` | Potencia (Double) | `pow(2.0, 3.0)` | `8.0` |
| `sqrt(x)` | Raíz cuadrada (Double) | `sqrt(16.0)` | `4.0` |
| `x.truncatingRemainder(dividingBy: y)` | `%` pero para Double | `(7.5).truncatingRemainder(dividingBy: 2)` | `1.5` |

Para **mostrar** con cierto número de decimales NO redondees el número: dale formato al mostrarlo (ver 2.22).

```swift
func ejemploIMC(peso: Double, estatura: Double) -> Double {
    let imc = peso / pow(estatura, 2)     // peso / estatura²
    return imc
}
```

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Binary operator '/' cannot be applied to operands of type 'Int' and 'Double'` | Mezclaste Int y Double | `Double(miInt) / miDouble` |
| `Value of optional type 'Int?' must be unwrapped` | Usaste `Int(texto)` directo como número | `if let n = Int(texto) { … }` |
| `No exact matches in call to initializer` | `Int(algo)` con un tipo que no se puede convertir | Revisa el tipo de `algo` |

**¿Visto en clase?** ✅ Clase 2 (`Int(DatoTxt!)`, `Int(CantidadPesosTxt!)`). Redondeo y funciones matemáticas: 🟡 Básico.

**En el repo:** `01_SwiftBasico/TiposYVariablesView.swift` → bloque 5 · `01_SwiftBasico/CalculadoraIMCView.swift`.

---

## 2.7 Strings (texto)

🔎 string, texto, cadena, interpolacion, concatenar, unir texto, \( ), isEmpty, vacio, count, contar letras, contains, contiene, mayusculas, minusculas, lowercased, uppercased, capitalized, trim, quitar espacios, trimmingCharacters, replacingOccurrences, reemplazar, split, separar, components, prefix, suffix, multilinea, emojis, comparar texto

**Qué es:** texto entre comillas dobles. Es lo que guardan los `TextField` y lo que muestran los `Text`.

### 2.7.1 Interpolación y concatenación (forma de clase)

```swift
func ejemploStrings() {
    // Interpolación: \( ) mete el valor de una variable dentro del texto
    let paginas = 78
    let mensaje = "El libro tiene \(paginas) páginas"

    // Concatenación con + y +=
    var saludo = "Hola"
    let signo = "!!!"
    saludo += " Daniel" + signo          // "Hola Daniel!!!"

    // Strings con emojis, sin problema
    let otro = "Este es otro 😎😬🤓🤪 string"

    // Cuentas dentro de la interpolación
    let precio = 120.0
    let resumen = "Total con propina: \(precio * 1.10)"

    print(mensaje, saludo, otro, resumen)
}
```

**Atajo:** la diagonal invertida `\` en teclado Mac en español: **option + '** (Clase 2).

### 2.7.2 Texto de varias líneas

```swift
func ejemploMultilinea(nombre: String, carrera: String) -> String {
    let perfil = """
    Nombre: \(nombre)
    Carrera: \(carrera)
    """
    return perfil
}
```

Las tres comillas `"""` van solas en su línea. Útil para el mensaje de una alerta.

### 2.7.3 Todos los métodos útiles

| Método / propiedad | Qué hace | Ejemplo | Resultado |
|---|---|---|---|
| `.isEmpty` | ¿Está vacío? | `"".isEmpty` | `true` |
| `.count` | Cuántos caracteres | `"Hola".count` | `4` (un emoji cuenta 1) |
| `.contains("x")` ⚠️ | ¿Contiene ese texto? (distingue mayúsculas) | `"Tacos".contains("co")` | `true` |
| `.hasPrefix("x")` ⚠️ | ¿Empieza con? | `"Monterrey".hasPrefix("Mon")` | `true` |
| `.hasSuffix("x")` ⚠️ | ¿Termina con? | `"foto.png".hasSuffix(".png")` | `true` |
| `.lowercased()` ⚠️ | Todo a minúsculas | `"HoLa".lowercased()` | `"hola"` |
| `.uppercased()` ⚠️ | Todo a mayúsculas | `"Hola".uppercased()` | `"HOLA"` |
| `.capitalized` ⚠️ | Primera letra de cada palabra en mayúscula | `"tacos de trompo".capitalized` | `"Tacos De Trompo"` |
| `.trimmingCharacters(in: .whitespaces)` ⚠️ | Quita espacios al inicio y al final | `"  Hola  "` | `"Hola"` |
| `.trimmingCharacters(in: .whitespacesAndNewlines)` ⚠️ | Quita espacios y saltos de línea | | |
| `.replacingOccurrences(of: "a", with: "b")` ⚠️ | Reemplaza | `"hola".replacingOccurrences(of: "o", with: "0")` | `"h0la"` |
| `.components(separatedBy: ",")` ⚠️ | Separa en arreglo de Strings | `"a,b,c"` | `["a", "b", "c"]` |
| `.split(separator: " ")` ⚠️ | Separa (da `Substring`) | `"a b c"` | `["a", "b", "c"]` |
| `.first` / `.last` ⚠️ | Primer / último carácter (opcional) | `"Mty".first` | `Optional("M")` |
| `String(texto.prefix(3))` ⚠️ | Los primeros 3 caracteres | `"Monterrey"` | `"Mon"` |
| `String(texto.suffix(4))` ⚠️ | Los últimos 4 | `"Monterrey"` | `"rrey"` |
| `String(repeating: "⭐️", count: 3)` | Repite un texto | | `"⭐️⭐️⭐️"` |
| `==` / `!=` | Igual / diferente (exacto) | `"ana" == "Ana"` | `false` |
| `<` / `>` | Orden alfabético | `"Ana" < "Beto"` | `true` |
| `Array(texto)` ⚠️ | Arreglo de caracteres | `Array("abc")` | `["a", "b", "c"]` |

Los que tienen ⚠️ no salen en las láminas. `isEmpty` sí (Clase 6C: `if username.isEmpty`), y `String(repeating:count:)`
lo usaste en tu tarea de canciones (`estrellas`).

**Recetas:**

```swift
func recetasTexto(texto: String, busqueda: String) {
    // ¿El usuario escribió solo espacios? (vacío "de verdad")
    let limpio = texto.trimmingCharacters(in: .whitespaces)
    if limpio.isEmpty {
        print("Escribe algo")
    }

    // Buscar sin importar mayúsculas (para un buscador)
    if texto.lowercased().contains(busqueda.lowercased()) {
        print("Coincide")
    }

    // Validar un correo sencillo
    if texto.contains("@") && texto.contains(".") {
        print("Parece correo")
    }

    // Mínimo de caracteres
    if texto.count < 3 {
        print("El nombre debe tener al menos 3 letras")
    }
}
```

**Errores comunes:**

| Mensaje / síntoma | Por qué | Arreglo |
|---|---|---|
| `Cannot convert value of type 'Substring' to expected argument type 'String'` | `prefix`, `suffix`, `split` regresan `Substring` | Envuélvelo: `String(texto.prefix(3))` |
| `Unterminated string literal` | Te faltó cerrar comillas | Cierra con `"` |
| `"\(precio)"` muestra `120.0` | Así se ve un Double por default | Usa formato (2.22): `precio.formatted(.number.precision(.fractionLength(2)))` |
| `specifier:` no funciona en un `String` | `specifier` solo existe dentro de `Text("…")` | Para String usa `.formatted(...)` |
| La búsqueda no encuentra "tacos" cuando dice "Tacos" | `contains` distingue mayúsculas | Compara todo con `.lowercased()` |

**¿Visto en clase?** ✅ Clase 2 (comillas, emojis, interpolación `\( )`, `+` y `+=`). Métodos marcados ⚠️: no vistos.

**En el repo:** `01_SwiftBasico/TiposYVariablesView.swift` → bloque 3 · búsqueda: `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift`.

---

## 2.8 Opcionales (`?`, `nil`, `!`, `if let`, `guard let`, `??`)

🔎 opcional, optional, nil, nulo, null, ?, !, unwrapping, desempacar, force unwrap, if let, optional binding, guard let, ??, valor por defecto, nil coalescing, ?., optional chaining, unexpectedly found nil, must be unwrapped

**Qué es:** un opcional es una variable que **puede tener un valor o no tener nada** (`nil`). Se declara con `?`.
`nil` NO es `0` ni `""`: es "no hay nada".

**Cuándo aparece:** cuando algo puede fallar o faltar: convertir texto a número, la foto que todavía no se elige,
`randomElement()` de una lista vacía, sumar a una fecha, `first` de un arreglo, un dato que el usuario no ha llenado.

### 2.8.1 Declarar (forma de clase)

```swift
func ejemploDeclararOpcionales() {
    var segundoNombre: String?      // empieza en nil
    var edad: Int?
    var estatura: Float?

    segundoNombre = "Luis"          // ahora tiene valor
    edad = nil                      // se puede regresar a nil
    estatura = 1.75

    print(segundoNombre ?? "", edad ?? 0, estatura ?? 0)
}
```

Ejemplos en SwiftUI: `@State private var selectedImage: UIImage? = nil` (la foto que no se ha elegido),
`@State private var recomendacion: Antojo? = nil` (todavía no se genera).

### 2.8.2 `!` — sacar el valor a la fuerza (unwrapping)

```swift
func ejemploUnwrapping(datoTxt: String) {
    let numero = Int(datoTxt)          // Int? (opcional)
    if numero != nil {                 // se tiene que incluir la comparación
        print("El valor numérico es \(numero!).")
    }
}
```

**Por qué casi nunca se usa:** *si haces unwrap (`!`) de un opcional que tiene `nil`, el programa truena* (Clase 2).
Error en la consola: `Fatal error: Unexpectedly found nil while unwrapping an Optional value`.

### 2.8.3 `if let` — la forma recomendada (optional binding)

```swift
func ejemploIfLet(cantidadPesosTxt: String) {
    let tipoDeCambio = 18
    if let cantidadPesos = Int(cantidadPesosTxt) {
        // aquí dentro cantidadPesos YA NO es opcional: es un Int normal
        let cantidadDolares = cantidadPesos / tipoDeCambio
        print("\(cantidadPesos) pesos = \(cantidadDolares) dólares")
    } else {
        // si la variable opcional es nula se va aquí
        print("Escribe un número válido")
    }
}
```

**Puntos clave:**
- Se escribe solo el nombre de la nueva constante (`cantidadPesos`), sin `?` ni `!`.
- La constante **solo existe dentro de las llaves** del `if`.
- "Recomendado por Swift" (Clase 2): no puede tronar.
- En la lámina dice `Int(CantidadPesosTxt!)` porque en UIKit el texto de un campo era opcional. En SwiftUI el texto
  de un `TextField` es `String` normal, así que va **sin** `!`.

**Varios a la vez:**

```swift
func ejemploVariosIfLet(pesoTxt: String, estaturaTxt: String) -> String {
    if let peso = Double(pesoTxt), let estatura = Double(estaturaTxt) {
        return "IMC: \(peso / (estatura * estatura))"
    }
    return "Revisa los datos"
}
```

**En una vista (mostrar la foto solo si existe):**

```swift
import SwiftUI
import UIKit

struct EjemploFotoOpcional: View {
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        if let selectedImageBien = selectedImage {
            Image(uiImage: selectedImageBien)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
        } else {
            Text("Seleccionar imagen")
                .foregroundStyle(.gray)
        }
    }
}
```

### 2.8.4 `if let x {` — forma corta ⚠️

```swift
func ejemploIfLetCorto(apodo: String?) {
    if let apodo {                 // igual que: if let apodo = apodo
        print("Hola, \(apodo)")
    }
}
```

⚠️ No visto: es lo mismo que `if let apodo = apodo`, solo más corto (Swift 5.7). Usa la forma larga de clase.

### 2.8.5 `guard let` — salir temprano

```swift
func ejemploGuard(textoPrecio: String) -> String {
    guard let precio = Double(textoPrecio) else {
        return "El precio no es un número"     // si es nil, SALE de la función aquí
    }
    // de aquí para abajo, precio ya es Double normal
    return "Con IVA: \(precio * 1.16)"
}
```

**Diferencia con `if let`:** con `guard`, la constante sigue viva **después** del guard (no solo dentro de llaves).
Útil para validar al principio de una función. El `else` **debe** salir (`return`, `throw`, `break`).

**¿Visto?** ✅ Clase 12 (Servicios REST: `guard let url = URL(string: …) else { throw … }`). No sale en la Clase 2.

### 2.8.6 `??` — valor por defecto ⚠️

```swift
func ejemploDefault(textoEdad: String) -> Int {
    let edad = Int(textoEdad) ?? 0      // si no se puede convertir, usa 0
    return edad
}
```

⚠️ No visto. Cómo explicarlo: *"`??` significa: si lo de la izquierda es nil, usa lo de la derecha"*.
Cuidado: con `?? 0` ya no sabes si el usuario escribió 0 o algo inválido. Para validar formularios usa `if let`.

### 2.8.7 `?.` — optional chaining ⚠️

```swift
func ejemploChaining(nombres: [String]) -> Int {
    let letras = nombres.first?.count ?? 0   // si no hay primero, todo da nil → 0
    return letras
}
```

⚠️ No visto: *"`?.` sigue solo si no es nil; si es nil, el resultado es nil"*. Lo verás en
`newItem?.loadTransferable(...)` del PhotosPicker (Clase 17) y en `audioPlayer?.play()`.

### 2.8.8 ¿Qué cosas regresan opcional? (tabla para no sorprenderte)

| Código | Regresa | Por qué |
|---|---|---|
| `Int("12")`, `Double("3.5")` | `Int?`, `Double?` | El texto puede no ser número |
| `lista.first`, `lista.last` | `Elemento?` | La lista puede estar vacía |
| `lista.randomElement()` | `Elemento?` | La lista puede estar vacía |
| `lista.firstIndex(where: …)` | `Int?` | Puede no encontrarlo |
| `lista.min()`, `lista.max()` | `Elemento?` | Lista vacía |
| `diccionario["llave"]` | `Valor?` | La llave puede no existir |
| `Calendar.current.date(byAdding:to:)` | `Date?` | Clase 3B: "Solo aguas… es OPCIONAL" |
| `formato.date(from: "15/04/2024")` | `Date?` | El texto puede no tener el formato |
| `UIImage(data: data)` | `UIImage?` | Los datos pueden no ser imagen |
| `URL(string: "…")` | `URL?` | El texto puede no ser una URL válida |
| `UserDefaults.standard.string(forKey:)` | `String?` | Puede no haber nada guardado |

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Value of optional type 'Int?' must be unwrapped to a value of type 'Int'` | Usaste un opcional como si fuera normal | `if let x = opcional { … }` |
| `Fatal error: Unexpectedly found nil while unwrapping` (la app truena) | Usaste `!` y era nil | Cambia el `!` por `if let` |
| `Initializer for conditional binding must have Optional type` | Hiciste `if let x = algo` y `algo` NO es opcional | Quita el `if let`, úsalo directo |
| `'nil' cannot be assigned to type 'String'` | Quisiste poner nil en una variable que no es opcional | Declárala con `?`: `var x: String? = nil` |

**¿Visto en clase?** ✅ Clase 2 (láminas 14–18: `?`, nil, `!` unwrapping, `if let` optional binding). `guard let` ✅ Clase 12. `??`, `?.`, `if let x {` ⚠️.

**En el repo:** `01_SwiftBasico/OpcionalesView.swift` → bloques 1 (declarar), 2 (`!`), 3 (`if let`), 4 (TextField → número), 5 (`??`), 6 (`guard let`).

---
## 2.9 Arrays (arreglos / listas)

🔎 array, arreglo, lista, arreglos, [Int], Array<, append, agregar, insert, remove, quitar, borrar, eliminar, removeAll, count, cuantos, isEmpty, first, last, contains, firstIndex, indices, enumerated, sorted, ordenar, reversed, filter, filtrar, map, reduce, sumar, min, max, randomElement, shuffled, joined, index out of range, indice

**Qué es:** una lista ordenada de valores **del mismo tipo**. Cada uno tiene una posición (índice) que **empieza en 0**.
Es lo que usas para tu lista de antojos, de jugadores, de canciones.

### 2.9.1 Crear un arreglo (3 formas iguales)

```swift
struct AntojoArreglo {
    var nombre: String
    var precio: Double
}

func ejemploCrearArreglos() {
    var numeros = [3, 8, 1]                       // literal: Swift infiere [Int]
    var nombres: [String] = []                    // vacío, con tipo
    var antojos = Array<AntojoArreglo>()          // vacío, forma de la Clase 10 (Array<Jugador>)
    var otros = [AntojoArreglo]()                 // vacío, otra forma

    numeros.append(5)
    nombres.append("Ana")
    antojos.append(AntojoArreglo(nombre: "Tacos", precio: 120))
    otros = antojos
    print(numeros, nombres, otros.count)
}
```

`[Antojo]` y `Array<Antojo>` son **exactamente lo mismo**. La profe usa `Array<Jugador>` (Clase 10).

### 2.9.2 Todos los métodos útiles

Suponiendo `var lista = [10, 20, 30]`:

| Método / propiedad | Qué hace | Ejemplo | Resultado |
|---|---|---|---|
| `lista[i]` | Elemento en la posición i (empieza en 0) | `lista[0]` | `10` (si i no existe, **truena**) |
| `.count` | Cuántos hay | `lista.count` | `3` |
| `.isEmpty` | ¿Está vacío? | `lista.isEmpty` | `false` |
| `.append(x)` | Agrega al final | `lista.append(40)` | `[10, 20, 30, 40]` |
| `.insert(x, at: i)` | Agrega en una posición | `lista.insert(5, at: 0)` | `[5, 10, 20, 30]` |
| `.remove(at: i)` | Quita el de esa posición | `lista.remove(at: 1)` | `[10, 30]` |
| `.removeLast()` / `.removeFirst()` | Quita el último / primero | | Truena si está vacía |
| `.removeAll()` | Vacía la lista | | `[]` |
| `.first` / `.last` | Primero / último (opcional) | `lista.first` | `Optional(10)` |
| `.contains(x)` ⚠️ | ¿Está ese valor? | `lista.contains(20)` | `true` |
| `.contains(where: { … })` ⚠️ | ¿Alguno cumple? | `lista.contains(where: { $0 > 25 })` | `true` |
| `.firstIndex(of: x)` ⚠️ | Posición de ese valor (opcional) | `lista.firstIndex(of: 30)` | `Optional(2)` |
| `.firstIndex(where: { … })` ⚠️ | Posición del primero que cumple | `antojos.firstIndex(where: { $0.id == 3 })` | `Int?` |
| `.indices` | Todos los índices válidos | `lista.indices` | `0..<3` |
| `.enumerated()` ⚠️ | Pares (índice, elemento) para un `for` | `for (i, x) in lista.enumerated()` | |
| `.sorted()` ⚠️ | Copia ordenada (menor a mayor) | `[3, 1, 2].sorted()` | `[1, 2, 3]` |
| `.sorted { $0.precio < $1.precio }` ⚠️ | Ordena por un campo | | |
| `.sort()` ⚠️ | Ordena la misma lista (no copia) | `lista.sort()` | |
| `.reversed()` ⚠️ | Al revés | `Array(lista.reversed())` | `[30, 20, 10]` |
| `.filter { … }` ⚠️ | Solo los que cumplen | `lista.filter { $0 > 15 }` | `[20, 30]` |
| `.map { … }` ⚠️ | Transforma cada uno | `lista.map { $0 * 2 }` | `[20, 40, 60]` |
| `.reduce(0, +)` ⚠️ | Suma todos | `lista.reduce(0, +)` | `60` |
| `.min()` / `.max()` ⚠️ | El menor / mayor (opcional) | `lista.max()` | `Optional(30)` |
| `.randomElement()` | Uno al azar (opcional) | `lista.randomElement()` | ej. `Optional(20)` |
| `.shuffled()` | Copia revuelta | `lista.shuffled()` | ej. `[30, 10, 20]` |
| `.joined(separator: ", ")` ⚠️ | Une un arreglo de Strings | `["a", "b"].joined(separator: ", ")` | `"a, b"` |
| `Array(lista.prefix(3))` ⚠️ | Los primeros 3 | | |

Lo que no tiene ⚠️ sale en el curso (`randomElement` en el material de Swift básico; `count`, `append`, `remove(at:)` en las tareas).
Lo que tiene ⚠️ (filter, map, sorted…) se puede hacer **con un `for`** (ver recetas en 2.13), que es la forma más defendible.

### 2.9.3 Acceso por índice SEGURO

```swift
func elementoSeguro(lista: [String], indice: Int) -> String {
    if indice >= 0 && indice < lista.count {      // ¿existe esa posición?
        return lista[indice]
    }
    return "No existe"
}
```

Si haces `lista[5]` y la lista tiene 3 elementos: `Fatal error: Index out of range` (la app truena).

### 2.9.4 Modificar un elemento de un arreglo de structs

```swift
struct AntojoEditable {
    var nombre: String
    var esFavorito: Bool
}

func ejemploModificar() {
    var antojos = [
        AntojoEditable(nombre: "Tacos", esFavorito: false),
        AntojoEditable(nombre: "Tortas", esFavorito: false)
    ]

    antojos[0].esFavorito = true                  // ✅ por índice sí se puede

    for i in antojos.indices {                    // ✅ recorrer por índices para modificar
        antojos[i].nombre = antojos[i].nombre.uppercased()
    }

    // ❌ for antojo in antojos { antojo.esFavorito = true }
    //    Error: "Cannot assign to property: 'antojo' is a 'let' constant"
    //    En un for normal, cada elemento es una COPIA de solo lectura.
    print(antojos)
}
```

En SwiftUI, para modificar desde otra pantalla se usa `List($antojos) { $antojo in … }` y `@Binding` (parte 6).

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Fatal error: Index out of range` | Pediste una posición que no existe (o la lista está vacía) | Revisa `indice < lista.count`; usa `first` / `randomElement()` con `if let` |
| `Cannot use mutating member on immutable value: 'lista' is a 'let' constant` | Hiciste `append` a un `let` | Declárala con `var` (o `@State private var` en una vista) |
| `Cannot assign to property: 'x' is a 'let' constant` | Modificaste el elemento dentro de un `for x in lista` | Usa `for i in lista.indices { lista[i].campo = … }` |
| `Heterogeneous collection literal could only be inferred to '[Any]'` | Mezclaste tipos en un arreglo (`[1, "dos"]`) | Todos los elementos deben ser del mismo tipo |
| `Referencing instance method 'contains' requires that 'Antojo' conform to 'Equatable'` | `contains(x)` con structs | Usa `contains(where: { $0.id == x.id })` o un `for` |

**¿Visto en clase?** ✅ Clase 10 (`Array<Jugador>`, lista fija en ModelData, `listaJugadores[0]`). `append`, `count`, `randomElement`: material del curso y tus tareas. Métodos con ⚠️: no vistos.

**En el repo:** `01_SwiftBasico/ArreglosYCiclosView.swift` → bloques 1 (crear/agregar/quitar), 2 (índice seguro), 5 (al azar), 6 (agregar desde la pantalla), 7 (filter/sorted ⚠️).

---

## 2.10 Diccionarios ⚠️

🔎 diccionario, dictionary, llave, valor, key, value, [String: Int], mapa, contar por categoria, default

**Qué es:** guarda pares **llave → valor**. En lugar de buscar por posición (0, 1, 2), buscas por llave ("Tacos").
**No tiene orden.**

```swift
func ejemploDiccionario() {
    var precios: [String: Double] = ["Tacos": 120, "Tortas": 90]

    precios["Pizza"] = 200                 // agregar o cambiar
    precios["Tortas"] = nil                // borrar

    if let precioTacos = precios["Tacos"] {   // leer regresa OPCIONAL (la llave puede no existir)
        print("Tacos cuestan \(precioTacos)")
    }

    for (llave, valor) in precios {        // recorrer (sin orden fijo)
        print(llave, valor)
    }

    print(precios.count, precios.keys, precios.values, precios.isEmpty)
}
```

**Receta: contar cuántos hay por categoría (útil para la gráfica de barras):**

```swift
func contarPorCategoria(categorias: [String]) -> [String: Int] {
    var conteo: [String: Int] = [:]
    for categoria in categorias {
        conteo[categoria, default: 0] += 1     // si no existe, empieza en 0
    }
    return conteo                              // ej. ["Tacos": 3, "Postres": 1]
}
```

| Método | Qué hace |
|---|---|
| `dic["llave"]` | Lee (opcional) |
| `dic["llave"] = valor` | Agrega o cambia |
| `dic["llave"] = nil` / `dic.removeValue(forKey: "llave")` | Borra |
| `dic["llave", default: 0]` | Lee con valor por defecto si no existe |
| `dic.keys` / `dic.values` | Todas las llaves / todos los valores |
| `dic.count` / `dic.isEmpty` | Cuántos pares / ¿vacío? |

⚠️ No visto en clase. Cómo explicarlo: *"es como un arreglo pero en lugar de posición uso un nombre (llave)"*.
Para una gráfica, la forma de clase es un arreglo de structs `Identifiable` (ver parte 7); el diccionario solo te ayuda a contar.

**En el repo:** `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 7.

---

## 2.11 Sets (conjuntos) ⚠️

🔎 set, conjunto, sin repetidos, unicos, unique, insert

**Qué es:** como un arreglo, pero **sin repetidos y sin orden**.

```swift
func ejemploSet() {
    var categorias: Set<String> = []
    categorias.insert("Tacos")
    categorias.insert("Tacos")              // no se repite
    categorias.insert("Postres")
    print(categorias.count)                 // 2
    print(categorias.contains("Tacos"))     // true
    let ordenadas = categorias.sorted()     // a arreglo ordenado: ["Postres", "Tacos"]
    print(ordenadas)
}
```

⚠️ No visto. Úsalo solo si necesitas "las categorías sin repetir". Con un `for` + `if !lista.contains(x)` también se puede.

---

## 2.12 Condicionales: `if`, `switch` y ternario

🔎 if, else, else if, condicional, condicion, switch, case, default, rangos en switch, varios casos, ternario, decidir, si entonces

### 2.12.1 `if` / `else if` / `else`

```swift
func clasificarCalificacion(calificacion: Int) -> String {
    if calificacion >= 90 {
        return "Excelente"
    } else if calificacion >= 70 {
        return "Aprobado"
    } else {
        return "Reprobado"
    }
}
```

- Se revisa **en orden**; entra al **primero** que se cumpla y ya no revisa los demás. Por eso en validaciones de
  formularios se usa una cadena de `else if`: así se muestra solo el primer error.
- La condición NO lleva paréntesis obligatorios: `if edad >= 18 {` (con paréntesis también funciona).
- Las llaves `{ }` SÍ son obligatorias aunque sea una sola línea.

### 2.12.2 `switch`

```swift
func textoCategoria(categoria: String) -> String {
    switch categoria {
    case "Tacos":
        return "🌮"
    case "Hamburguesas", "Hot dogs":       // varios casos juntos con coma
        return "🍔"
    case "Postres":
        return "🍰"
    default:                               // OBLIGATORIO si no cubres todos los valores posibles
        return "🍽️"
    }
}

func clasificarIMC(imc: Double) -> String {
    switch imc {
    case ..<18.5:
        return "Bajo peso"
    case 18.5..<25:
        return "Normal"
    case 25..<30:
        return "Sobrepeso"
    default:
        return "Obesidad"
    }
}

func colorDeFondo(nombre: String) -> String {
    switch nombre {
    case "Amarillo":
        return "amarillo"
    case "Azul":
        return "azul"
    default:
        return "verde"
    }
}
```

| Regla del switch | Detalle |
|---|---|
| Debe cubrir **todos** los casos | Con Strings e Ints casi siempre necesitas `default:` |
| No se "cae" al siguiente caso | No hace falta `break` como en C/Java |
| Cada `case` necesita al menos una instrucción | Si no quieres hacer nada: `break` |
| Rangos | `case 0..<18:`, `case 90...100:`, `case ..<0:` |

### 2.12.3 Ternario (ver 2.5.3)

`condicion ? valorSiVerdad : valorSiFalso` — para elegir entre dos valores en una línea (íconos, colores, textos).

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Switch must be exhaustive` | Faltan casos | Agrega `default:` |
| `'case' label in a 'switch' must have at least one executable statement` | Un `case` vacío | Pon `break` |
| `Expected '{' after 'if' condition` | Te faltó la llave | `if x > 0 {` |
| `Use of '=' in a boolean context, did you mean '=='?` | Pusiste `=` en lugar de `==` | `if x == 5` |

**¿Visto en clase?** `if/else` ✅ Clase 2 y 6C. `switch` ✅ lo usaste en la práctica de clase DefaultsApp (`colorDeFondo`, Clase 11). Rangos en `switch`: 🟡 Básico.

**En el repo:** `01_SwiftBasico/FuncionesYCondicionesView.swift` → bloques 2 (if), 3 (switch con rangos), 4 (imagen y color según un valor), 5 (switch con textos) · `01_SwiftBasico/CalculadoraIMCView.swift`.

---

## 2.13 Ciclos: `for`, `while` y recetas

🔎 for, for in, ciclo, loop, bucle, recorrer, iterar, while, repeat, stride, enumerated, indices, break, continue, sumar todos, promedio, maximo, minimo, contar, buscar, filtrar a mano, porcentaje

### 2.13.1 Formas del `for`

```swift
func ejemplosFor() {
    let nombres = ["Ana", "Beto", "Caro"]

    for nombre in nombres {                       // cada elemento
        print(nombre)
    }

    for i in 1...5 {                              // 1, 2, 3, 4, 5
        print(i)
    }

    for i in 0..<nombres.count {                  // índices 0, 1, 2
        print(i, nombres[i])
    }

    for i in nombres.indices {                    // lo mismo, más seguro
        print(i, nombres[i])
    }

    for (posicion, nombre) in nombres.enumerated() {   // ⚠️ posición y elemento juntos
        print("\(posicion + 1). \(nombre)")
    }

    for i in stride(from: 0, to: 10, by: 2) {     // ⚠️ 0, 2, 4, 6, 8 (de 2 en 2)
        print(i)
    }

    for _ in 1...3 {                              // repetir 3 veces sin usar el número
        print("Hola")
    }
}
```

### 2.13.2 `while`, `repeat`, `break`, `continue`

```swift
func ejemplosWhile() {
    var contador = 0
    while contador < 3 {          // revisa ANTES de entrar
        contador += 1
    }

    repeat {                      // ⚠️ entra al menos una vez y revisa al final
        contador -= 1
    } while contador > 0

    for n in 1...10 {
        if n == 3 { continue }    // salta este y sigue con el siguiente
        if n == 6 { break }       // termina el ciclo
        print(n)                  // 1, 2, 4, 5
    }
}
```

Cuidado: un `while` cuya condición nunca se vuelve falsa **congela la app** (ciclo infinito).

### 2.13.3 Recetas con `for` (las más útiles para el examen)

```swift
struct ProductoReceta {
    var nombre: String
    var categoria: String
    var precio: Double
    var calificacion: Int
    var esFavorito: Bool
}

// SUMAR
func sumaPrecios(lista: [ProductoReceta]) -> Double {
    var total = 0.0
    for producto in lista {
        total += producto.precio
    }
    return total
}

// PROMEDIO (cuidado con dividir entre 0 si la lista está vacía)
func promedioCalificacion(lista: [ProductoReceta]) -> Double {
    if lista.isEmpty {
        return 0
    }
    var suma = 0
    for producto in lista {
        suma += producto.calificacion
    }
    return Double(suma) / Double(lista.count)
}

// CONTAR los que cumplen algo
func contarFavoritos(lista: [ProductoReceta]) -> Int {
    var cuantos = 0
    for producto in lista {
        if producto.esFavorito {
            cuantos += 1
        }
    }
    return cuantos
}

// PORCENTAJE (0 a 100)
func porcentajeFavoritos(lista: [ProductoReceta]) -> Double {
    if lista.isEmpty {
        return 0
    }
    return Double(contarFavoritos(lista: lista)) / Double(lista.count) * 100
}

// MÁXIMO (el más caro). Regresa opcional porque la lista puede estar vacía.
func masCaro(lista: [ProductoReceta]) -> ProductoReceta? {
    var mayor: ProductoReceta? = nil
    for producto in lista {
        if let actual = mayor {
            if producto.precio > actual.precio {
                mayor = producto
            }
        } else {
            mayor = producto
        }
    }
    return mayor
}

// BUSCAR uno por nombre
func buscar(nombre: String, lista: [ProductoReceta]) -> ProductoReceta? {
    for producto in lista {
        if producto.nombre == nombre {
            return producto           // en cuanto lo encuentra, sale
        }
    }
    return nil
}

// FILTRAR a mano (sin .filter): categoría + presupuesto
func filtrar(categoria: String, presupuesto: Double, lista: [ProductoReceta]) -> [ProductoReceta] {
    var resultado: [ProductoReceta] = []
    for producto in lista {
        if producto.categoria == categoria && producto.precio <= presupuesto {
            resultado.append(producto)
        }
    }
    return resultado
}

// CONTAR POR CATEGORÍA sin diccionario (para una gráfica)
struct ConteoCategoria: Identifiable {
    var id: String { return categoria }
    var categoria: String
    var cantidad: Int
}

func conteoPorCategoria(lista: [ProductoReceta], categorias: [String]) -> [ConteoCategoria] {
    var resultado: [ConteoCategoria] = []
    for categoria in categorias {
        var cuantos = 0
        for producto in lista {
            if producto.categoria == categoria {
                cuantos += 1
            }
        }
        resultado.append(ConteoCategoria(categoria: categoria, cantidad: cuantos))
    }
    return resultado
}
```

Estas funciones también pueden ir **dentro** de tu vista como propiedades calculadas
(`var totalFavoritos: Int { … }`) para que se recalculen solas cuando la lista cambia (ver 2.16.4).

**¿Visto en clase?** 🟡 Básico (`for` no sale como tema en una lámina, pero es sintaxis básica de cualquier lenguaje y fácil de defender). `enumerated`, `stride`, `repeat` ⚠️.

**En el repo:** `01_SwiftBasico/ArreglosYCiclosView.swift` → bloques 3 (ciclos y rangos) y 4 (suma, promedio, máximo) · `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` (filtrar con for) · `09_Graficas/GraficaDesdeListaView.swift` (contar por categoría).

---

## 2.14 Funciones

🔎 funcion, funciones, func, metodo, parametros, argumentos, etiqueta, label, _, guion bajo, return, regresar, valor por defecto, default, inout, llamar funcion, missing argument label, extraneous argument label

**Qué es:** un bloque de código con nombre que puedes llamar las veces que quieras. Puede recibir datos
(parámetros) y regresar un resultado (`return`).

### 2.14.1 Formas

```swift
// Sin parámetros, sin return
func saludar() {
    print("Hola")
}

// Con parámetros y return
func sumar(a: Int, b: Int) -> Int {
    return a + b
}

// Sin etiqueta al llamar: _ (guion bajo + ESPACIO)
func cuadrado(_ numero: Int) -> Int {
    return numero * numero
}

// Etiqueta externa distinta del nombre interno
func mover(desde origen: Int, hasta destino: Int) -> Int {
    return destino - origen
}

// Valor por defecto
func saludarA(nombre: String, veces: Int = 1) -> String {
    return String(repeating: "Hola \(nombre)! ", count: veces)
}

// Varios return (sale en el primero que se ejecuta)
func signo(numero: Int) -> String {
    if numero > 0 {
        return "positivo"
    }
    if numero < 0 {
        return "negativo"
    }
    return "cero"
}

// Regresa opcional
func buscarPosicion(nombre: String, lista: [String]) -> Int? {
    for i in lista.indices {
        if lista[i] == nombre {
            return i
        }
    }
    return nil
}

func ejemploLlamarFunciones() {
    saludar()
    let s = sumar(a: 2, b: 3)              // con etiquetas a: y b:
    let c = cuadrado(4)                    // sin etiqueta por el _
    let m = mover(desde: 1, hasta: 5)
    let h1 = saludarA(nombre: "Ana")       // veces usa su default (1)
    let h2 = saludarA(nombre: "Ana", veces: 2)
    print(s, c, m, h1, h2, signo(numero: -3))
    if let pos = buscarPosicion(nombre: "Beto", lista: ["Ana", "Beto"]) {
        print("Está en la posición \(pos)")
    }
}
```

| Parte | Qué es |
|---|---|
| `func nombre(...)` | Declara la función |
| `(nombre: Tipo)` | Parámetro: al llamarla escribes `nombre:` |
| `(_ nombre: Tipo)` | El `_` **con espacio** quita la etiqueta al llamarla |
| `(_nombre: Tipo)` | ¡Ojo! Sin espacio, `_nombre` es solo un nombre raro y SÍ se escribe al llamarla: `f(_nombre: x)` |
| `-> Tipo` | Lo que regresa. Si no regresa nada, no se pone |
| `return valor` | Regresa el valor y **sale** de la función |

### 2.14.2 Funciones dentro de una vista vs globales

```swift
import SwiftUI

// GLOBAL: fuera de todo struct. Se puede usar desde cualquier archivo.
// No puede ver los @State de ninguna vista.
func textoPrecio(precio: Double) -> String {
    return precio.formatted(.currency(code: "MXN"))
}

struct EjemploFuncionesEnVista: View {
    @State private var contador = 0

    // DENTRO de la vista: SÍ puede leer y cambiar los @State de esta vista.
    func incrementar() {
        contador += 1
    }

    var body: some View {
        VStack {
            Text("Contador: \(contador)")
            Text(textoPrecio(precio: 185))
            Button("Sumar", action: incrementar)   // llamar una función existente (Clase 3)
        }
    }
}
```

| Dónde ponerla | Cuándo |
|---|---|
| Dentro del struct de la vista | Si usa o cambia los `@State` de esa pantalla (validar, calcular, agregar) |
| Global (archivo aparte, ej. `Utils/`) | Si la usan varias pantallas y no depende de ninguna (formatear fecha, `cargarAntojos()`) |
| Dentro del struct del modelo | Si es algo del dato (mejor como propiedad calculada: `antojo.estrellas`) |

### 2.14.3 `inout` ⚠️

```swift
func duplicar(_ numero: inout Int) {
    numero = numero * 2           // cambia la variable ORIGINAL
}

func ejemploInout() {
    var x = 5
    duplicar(&x)                  // se llama con &
    print(x)                      // 10
}
```

⚠️ No visto. Casi nunca lo necesitas en SwiftUI: para que otra pantalla cambie un dato se usa `@Binding`.

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Missing argument label 'nombre:' in call` | Llamaste sin la etiqueta | `f(nombre: x)` (o declara con `_ nombre`) |
| `Extraneous argument label 'nombre:' in call` | Pusiste etiqueta y la función usa `_` | Quita la etiqueta al llamar |
| `Missing return in global function expected to return 'Int'` | Hay un camino que no regresa nada | Asegura un `return` al final |
| `Cannot find 'x' in scope` | La variable no existe en ese lugar (ej. función global usando un `@State`) | Pásala como parámetro o mueve la función dentro de la vista |
| `Missing argument for parameter 'b' in call` | Faltó un parámetro | Pásalos todos (o dale valor por defecto) |
| `Argument 'b' must precede argument 'a'` | Los pasaste en otro orden | Mismo orden que en la declaración |

**¿Visto en clase?** ✅ Clase 3 (`Button("Aceptar", action: CalcularValor)`: llamar una función existente), Clase 3B y en todo el curso. `_`, etiquetas externas y valores por defecto: 🟡 Básico. `inout` ⚠️.

**En el repo:** `01_SwiftBasico/FuncionesYCondicionesView.swift` → bloque 1.

---

## 2.15 Closures (bloques de código como valor)

🔎 closure, closures, clausura, bloque, { }, trailing closure, () -> Void, accion, action, $0, $1, in, callback

**Qué es:** un bloque de código `{ }` que se guarda o se pasa como si fuera un dato, para ejecutarse después.
**Ya los usas sin saber:** la acción de un `Button`, el `.onChange`, el `.alert`, el `ForEach`, el `Task`.

```swift
import SwiftUI

struct EjemploClosures: View {
    @State private var mensaje = ""

    var body: some View {
        VStack {
            // El { } después de Button("…") es un closure: lo que pasa al tocar.
            Button("Saludar") {
                mensaje = "Hola"
            }

            // Componente que RECIBE un closure como parámetro
            BotonReutilizable(titulo: "Borrar") {
                mensaje = ""
            }

            Text(mensaje)
        }
    }
}

struct BotonReutilizable: View {
    var titulo: String
    var accion: () -> Void          // tipo "función que no recibe nada y no regresa nada"

    var body: some View {
        Button(titulo) {
            accion()                // ejecuta lo que le mandaron
        }
        .buttonStyle(.borderedProminent)
    }
}
```

| Forma | Qué significa |
|---|---|
| `() -> Void` | Tipo de un closure sin parámetros que no regresa nada |
| `(Int) -> String` | Recibe un Int, regresa un String |
| `{ oldValue, newValue in … }` | Closure con 2 parámetros (en `.onChange`); `in` separa parámetros del código |
| `{ $0.precio < $1.precio }` | `$0` = primer parámetro, `$1` = segundo (forma corta) |
| `Button("x") { … }` | "Trailing closure": el último parámetro closure va afuera de los paréntesis |

**¿Visto en clase?** ✅ Los closures en `Button`, `.alert`, `.onChange { oldValue, newValue in }` (Clase 4) y `$0` en `PointMark` (Clase 15). Recibir `var accion: () -> Void` en un componente ⚠️ (en la Clase 5A se define como "la acción es un método o una propiedad de cierre").

**En el repo:** `04_Componentes/Components/BotonGrande.swift` (componente con `accion`).

---
## 2.16 Structs (modelos)

🔎 struct, estructura, modelo, model, molde, ficha, propiedades, init, inicializador, memberwise, constructor, metodo, mutating, propiedad calculada, computed property, valores por defecto, copia, missing argument for parameter, extra argument

**Qué es:** un **molde** que agrupa varios datos que van juntos. Por ejemplo, un antojo tiene nombre, precio,
categoría y si es favorito. El struct **no guarda datos por sí solo**: define cómo es cada ficha. Las fichas de
verdad se crean después (en tu `ModelData.swift`).

**Cuándo usarlo:** para tu modelo (`Model/Antojo.swift`, `Model/Jugador.swift`, `Model/Cancion.swift`). En
SwiftUI, cada pantalla también es un struct (`struct ContentView: View`).

### 2.16.1 Declarar y crear (forma de clase)

```swift
import Foundation

struct Antojo: Identifiable {
    var id: Int
    var nombre: String
    var descripcion: String
    var categoria: String          // "Tacos", "Hamburguesas" o "Postres"
    var imagen: String             // NOMBRE de la imagen en Assets (no la imagen)
    var calificacion: Int          // 1 a 5
    var precio: Double
    var fecha: Date
    var esFavorito: Bool

    // Propiedad calculada: no se guarda, se calcula cada vez que la pides
    var estrellas: String {
        return String(repeating: "⭐️", count: calificacion)
    }
}

func ejemploCrearAntojo() {
    // Init automático (memberwise): los datos van EN EL MISMO ORDEN en que los declaraste
    var antojo = Antojo(id: 1, nombre: "Tacos Juanito", descripcion: "Trompo con piña",
                        categoria: "Tacos", imagen: "foto1", calificacion: 5,
                        precio: 120, fecha: Date(), esFavorito: true)

    print(antojo.nombre)          // leer con punto
    print(antojo.estrellas)       // "⭐️⭐️⭐️⭐️⭐️"
    antojo.esFavorito = false     // cambiar (porque antojo es var y esFavorito es var)
}
```

| Concepto | Qué es |
|---|---|
| **Propiedad** | Cada dato del struct (`var nombre: String`) |
| **Init automático (memberwise)** | Swift crea solo `Antojo(id:nombre:…)` con TODAS las propiedades guardadas, **en el orden en que las declaraste** |
| **Propiedad calculada** | `var x: Tipo { return … }` — no va en el init, se calcula al pedirla |
| **Imagen en el modelo** | Guarda el **nombre** del asset (`String`), no un `Image`. "El modelo guarda datos; la vista decide cómo mostrarlos" |
| `Identifiable` | Obliga a tener `id`; es lo que necesita `List` (ver 2.20 y parte 6) |

### 2.16.2 Valores por defecto (para no tener que pasarlos)

```swift
struct Tarea {
    var titulo: String
    var completada: Bool = false     // valor por defecto
}

func ejemploDefault() {
    let t1 = Tarea(titulo: "Estudiar")                     // completada = false
    let t2 = Tarea(titulo: "Comer", completada: true)     // o lo pasas si quieres
    print(t1, t2)
}
```

Ojo: si la propiedad es `let` con valor (`let tipo = "Fuego"`), NO se puede pasar en el init.

### 2.16.3 init propio (opcional)

```swift
struct Empleado {
    var id: Int
    var nombre: String
    var apellidos: String
    var depto: String

    init(id: Int, nombre: String, apellidos: String, depto: String) {
        self.id = id                 // self.id = la propiedad; id = el parámetro
        self.nombre = nombre
        self.apellidos = apellidos
        self.depto = depto
    }
}
```

El `init` explícito es **opcional**: si no lo escribes, Swift crea el automático (Clase 8). Escríbelo solo si
quieres calcular algo al crear o tener otro orden.

### 2.16.4 Propiedades calculadas (las más útiles)

```swift
import Foundation

struct Jugador {
    var nombre: String
    var apellido: String
    var calificacion: Double
    var precio: Double
    var fecha: Date

    var nombreCompleto: String {
        return "\(nombre) \(apellido)"
    }

    var estrellas: String {                       // como en tu Cancion de Movil2
        return String(repeating: "⭐️", count: Int(calificacion))
    }

    var precioTexto: String {
        return precio.formatted(.currency(code: "MXN"))
    }

    var fechaTexto: String {                      // fecha en español, lista para un Text
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.long
        formato.timeStyle = DateFormatter.Style.none
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: fecha)
    }

    var esCaro: Bool {
        return precio > 200
    }
}
```

Así, en cualquier vista solo escribes `Text(jugador.fechaTexto)` o `Text(jugador.nombreCompleto)`.
También se usan **dentro de una vista** para totales que se recalculan solos:
`var totalFavoritos: Int { … }` (ver 2.13.3).

### 2.16.5 Métodos y `mutating` ⚠️

```swift
struct Contador {
    var valor = 0

    func describir() -> String {          // lee: normal
        return "Valor: \(valor)"
    }

    mutating func incrementar() {         // CAMBIA una propiedad: necesita mutating
        valor += 1
    }
}

func ejemploMutating() {
    var c = Contador()
    c.incrementar()
    print(c.describir())                  // "Valor: 1"
}
```

⚠️ `mutating` no visto. Cómo explicarlo: *"un struct es un valor; para que una función suya lo cambie, Swift pide
marcarla `mutating`"*. En las vistas NO se usa: ahí los cambios van a `@State`.

### 2.16.6 Un struct es una COPIA

```swift
struct Punto {
    var x: Int
}

func ejemploCopia() {
    var a = Punto(x: 1)
    var b = a          // b es una COPIA independiente
    b.x = 99
    print(a.x)         // 1  ← a no cambió
    a.x = 5
    print(b.x)         // 99
}
```

Por eso, cuando pasas un antojo a otra pantalla con `var antojo: Antojo`, esa pantalla recibe una copia: si lo
cambia, la lista original NO se entera. Para que se entere: `@Binding` (parte 5).

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Missing argument for parameter 'precio' in call` | No pasaste todas las propiedades al crear | Pásalas todas (o dales valor por defecto) |
| `Argument 'nombre' must precede argument 'categoria'` | Las pasaste en otro orden | Mismo orden que en el struct |
| `Extra argument 'estrellas' in call` | Pasaste una propiedad calculada al init | Las calculadas NO se pasan |
| `Incorrect argument label in call (have 'favorito:', expected 'esFavorito:')` | El nombre no coincide con el struct | Usa exactamente el mismo nombre |
| `Cannot assign to property: 'antojo' is a 'let' constant` | El struct está en un `let` | Usa `var` (o `@State` / `@Binding` en vistas) |
| `Type 'Antojo' does not conform to protocol 'Identifiable'` | Falta la propiedad `id` | Agrega `var id: Int` |

**¿Visto en clase?** ✅ Clase 8 (struct `Empleado` con init) y Clase 10 (struct `Jugador: Identifiable`, imagen como String). Propiedad calculada: ✅ Clase 8 (`description`) y Clase 15 (`var id: Int { return x }`). `mutating` ⚠️.

**En el repo:** `08_ModelosYListas/Model/Jugador.swift` · `01_SwiftBasico/StructsYClasesView.swift` → bloques 1 y 3 · `00_AppCompleta/Model/Mascota.swift`.

---

## 2.17 Classes (clases)

🔎 class, clase, clases, objeto, instancia, init obligatorio, referencia, struct vs class, diferencia struct class, self

**Qué es:** parecido a un struct, pero se comparte **por referencia**: si dos variables apuntan a la misma clase,
un cambio se ve en las dos.

```swift
class CuentaBancaria {
    var titular: String
    var saldo: Double

    init(titular: String, saldo: Double) {     // en una class el init es OBLIGATORIO
        self.titular = titular                 // (si alguna propiedad no tiene valor)
        self.saldo = saldo
    }

    func depositar(cantidad: Double) {         // sin mutating: las clases sí pueden cambiarse
        saldo += cantidad
    }

    func retirar(cantidad: Double) -> Bool {
        if cantidad > saldo {
            return false                       // no alcanza
        }
        saldo -= cantidad
        return true
    }
}

func ejemploClase() {
    let cuenta = CuentaBancaria(titular: "Ana", saldo: 100)
    let otra = cuenta                      // NO es copia: apunta a la MISMA cuenta
    otra.depositar(cantidad: 50)
    print(cuenta.saldo)                    // 150 ← cambió en las dos
}
```

| | `struct` | `class` |
|---|---|---|
| Al asignar o pasar | Se **copia** | Se **comparte** (referencia) |
| `init` | Automático (memberwise) | Lo escribes tú (si hay propiedades sin valor) |
| Funciones que cambian datos | Necesitan `mutating` | No necesitan nada |
| `let` | Nada se puede cambiar | Las propiedades `var` sí se pueden cambiar |
| Herencia | No | Sí (`class Mago: Personaje`) |
| En SwiftUI | **Lo recomendado** para modelos y vistas | SwiftUI **no se entera** cuando cambia una propiedad de una clase |

**Por qué SwiftUI prefiere structs:** `@State` detecta cuando un struct cambia y redibuja. Con una clase, si cambias
`cuenta.saldo`, la pantalla NO se actualiza sola (haría falta `ObservableObject`/`@Observable`, que **no se usan en
el curso**). En el repo, `ProtocolosView` usa un contador `@State` extra para forzar el redibujo con clases.

**¿Visto en clase?** ✅ Clase 8 (`class EquipoBasketball: EquipoDeportivo` con `init`).

**En el repo:** `01_SwiftBasico/StructsYClasesView.swift` → bloques 2 y 3 · `08_ModelosYListas/Model/Personaje.swift`.

---

## 2.18 Enums (enumeraciones) ⚠️

🔎 enum, enumeracion, case, rawValue, CaseIterable, allCases, opciones fijas, categorias fijas

**Qué es:** un tipo con una **lista fija de opciones**. Evita errores de escritura ("Taco" vs "Tacos").

```swift
enum CategoriaAntojo: String, CaseIterable {
    case tacos = "Tacos"
    case hamburguesas = "Hamburguesas"
    case postres = "Postres"
}

func ejemploEnum() {
    let categoria = CategoriaAntojo.tacos
    print(categoria.rawValue)                  // "Tacos" (el texto asociado)

    for c in CategoriaAntojo.allCases {        // todas las opciones (gracias a CaseIterable)
        print(c.rawValue)
    }

    switch categoria {                         // con enums el switch NO necesita default
    case .tacos:
        print("🌮")
    case .hamburguesas:
        print("🍔")
    case .postres:
        print("🍰")
    }
}
```

⚠️ No visto en clase. Cómo explicarlo: *"es una lista cerrada de opciones; `rawValue` es el texto de cada una y
`allCases` me da todas para un Picker"*. **Forma de clase equivalente** (más fácil de defender): un arreglo de Strings
`let categorias = ["Tacos", "Hamburguesas", "Postres"]` y guardar la categoría como `String`.

---

## 2.19 Extensions ⚠️

🔎 extension, extender, agregar funciones a un tipo

**Qué es:** agrega cosas (propiedades calculadas, funciones) a un tipo que ya existe, sin tocar su declaración.

```swift
extension Double {
    var enPesos: String {
        return self.formatted(.currency(code: "MXN"))
    }
}

func ejemploExtension() {
    let precio = 185.0
    print(precio.enPesos)          // "$185.00" (o "MX$185.00" si el simulador está en inglés)
}
```

⚠️ No visto. No lo necesitas: lo mismo se hace con una función normal `func textoPesos(precio: Double) -> String`
o con una propiedad calculada en tu struct.

---

## 2.20 Protocolos (Identifiable, Codable, CustomStringConvertible…)

🔎 protocolo, protocol, conformar, conforma, interfaz, interface, { get }, { get set }, Identifiable, Codable, Encodable, Decodable, CustomStringConvertible, description, Equatable, Hashable, Comparable, does not conform to protocol

**Qué es:** una **lista de requisitos** (propiedades y funciones) que un struct o clase promete cumplir. Cuando lo
cumple se dice que **se conforma al protocolo**. Es el equivalente a las "interfaces" de otros lenguajes (Clase 8).

### 2.20.1 Tu propio protocolo

```swift
protocol EquipoDeportivo {
    var nombreDeporte: String { get }           // { get } = basta con poder leerla (puede ser let)
    var nombreEquipo: String { get set }        // { get set } = debe poder cambiarse (tiene que ser var)
    var partidosGanados: Int { get set }

    func mostrarReglas() -> String
    func calcularPuntos() -> Int
}

class EquipoBasketball: EquipoDeportivo {
    let nombreDeporte = "Basketball"
    var nombreEquipo: String
    var partidosGanados: Int

    init(nombre: String) {
        self.nombreEquipo = nombre
        self.partidosGanados = 0
    }

    func mostrarReglas() -> String {
        return "Gana quien anote más puntos. No hay empates."
    }

    func calcularPuntos() -> Int {
        return partidosGanados * 2
    }
}

struct EquipoFutbol: EquipoDeportivo {          // un struct también puede conformarse
    let nombreDeporte = "Fútbol"
    var nombreEquipo: String
    var partidosGanados: Int

    func mostrarReglas() -> String {
        return "Gana quien meta más goles."
    }

    func calcularPuntos() -> Int {
        return partidosGanados * 3                // misma función, otra lógica
    }
}
```

### 2.20.2 Protocolos de Swift que vas a usar

| Protocolo | Para qué | Qué exige | ¿Visto? |
|---|---|---|---|
| `View` | Que un struct sea una pantalla o componente | `var body: some View` | ✅ Clase 3 |
| `Identifiable` | Que `List`, `ForEach` y `Chart` distingan cada elemento | Una propiedad llamada exactamente `id` (única) | ✅ Clase 10 y 15 |
| `Codable` | Convertir a/desde JSON | Que todas sus propiedades sean Codable (String, Int, Double, Bool, Date, arreglos…) | ✅ Clase 8 |
| `CustomStringConvertible` | Cómo se ve al hacer `print` | `var description: String` | ✅ Clase 8 |
| `Equatable` | Poder comparar con `==` (y usar `contains(x)`, `firstIndex(of:)`, `.onChange` con un struct) | Nada si todas sus propiedades son Equatable | ⚠️ |
| `Hashable` | Usarlo en un `Set`, como llave de diccionario o en `ForEach(…, id: \.self)` | Nada si todas sus propiedades son Hashable | ⚠️ |
| `Comparable` | Usar `<` y `sorted()` directo | `static func <` | ⚠️ |
| `CaseIterable` | En un enum, tener `allCases` | Nada | ⚠️ |

**Ejemplo con varios:**

```swift
import Foundation

struct EmpleadoCodable: Identifiable, Codable, CustomStringConvertible, Equatable {
    var id: Int
    var nombre: String
    var depto: String

    var description: String {
        return "ID=\(id) NOMBRE = \(nombre)"
    }
}

func ejemploProtocolos() {
    let e = EmpleadoCodable(id: 1, nombre: "Perla", depto: "Ventas")
    print(e)                                                   // usa description: "ID=1 NOMBRE = Perla"
    print(e == EmpleadoCodable(id: 1, nombre: "Perla", depto: "Ventas"))   // true (Equatable)
}
```

### 2.20.3 Formas del `id` para Identifiable

```swift
import Foundation

struct ConIdEntero: Identifiable {        // 1. Int fijo (el más común en clase)
    var id: Int
    var nombre: String
}

struct ConUUID: Identifiable {            // 2. UUID automático: cuando no hay un id natural (Clase 15)
    let id = UUID()
    var nombre: String
}

struct ConIdCalculado: Identifiable {     // 3. Calculado de un campo que ya es único (Clase 15)
    var id: Int { return x }
    let x: Int
    let y: Double
}

func ejemploIds() {
    let a = ConIdEntero(id: 1, nombre: "Ana")
    let b = ConUUID(nombre: "Beto")       // el id NO se pasa: se genera solo
    let c = ConIdCalculado(x: 1, y: 20)
    print(a.id, b.id, c.id)
}
```

**El `id` debe ser único.** Si dos elementos tienen el mismo `id`, la `List` se confunde: muestra renglones
repetidos o al tocar uno abre otro. Y el `id` **nunca se muestra** en la pantalla (lo piden las tareas).

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Type 'X' does not conform to protocol 'Identifiable'` | Falta `id` | Agrega `var id: Int` (o `let id = UUID()`) |
| `Type 'X' does not conform to protocol 'Codable'` | Alguna propiedad no es Codable (ej. `UIImage`, `Color`) | Quita esa propiedad o guarda un `String` en su lugar |
| `Type 'X' does not conform to protocol 'EquipoDeportivo'` | Te faltó una propiedad o función del protocolo | Xcode ofrece "Fix" → "Add stubs" |
| `Cannot assign to property: 'nombreDeporte' is a 'let' constant` | El protocolo pide `{ get set }` y la hiciste `let` | Hazla `var` |
| `Referencing instance method 'contains' requires that 'X' conform to 'Equatable'` | `contains(x)` / `firstIndex(of:)` sin Equatable | Agrega `: Equatable` o usa `contains(where:)` |

**¿Visto en clase?** ✅ Clase 8 (protocolos propios, `{ get }`/`{ get set }`, class y struct conformándose, Codable, CustomStringConvertible), ✅ Clase 10 (Identifiable). Equatable/Hashable/Comparable ⚠️.

**En el repo:** `08_ModelosYListas/Model/Personaje.swift` + `Views/ProtocolosView.swift` · `08_ModelosYListas/Model/Empleado.swift` + `Views/CodableView.swift`.

---

## 2.21 Fechas: Date, DateFormatter y Calendar

🔎 fecha, fechas, date, Date(), hoy, ahora, now, DateFormatter, formato de fecha, dateStyle, timeStyle, dateFormat, locale, es_MX, español, dia, mes, año, hora, DateComponents, Calendar, sumar dias, restar dias, sumar meses, fecha especifica, fecha exacta, date(from:), diferencia entre fechas, edad, dias entre, comparar fechas, fechaTexto

### 2.21.1 `Date()` = este momento

```swift
func ejemploDate() {
    let fechaActual = Date()      // constructor vacío = fecha y hora ACTUAL (de este instante)
    let otraForma = Date.now      // lo mismo (⚠️ forma más nueva; la de clase es Date())
    print(fechaActual, otraForma)
}
```

**Importante:** si en tu `ModelData.swift` pones `fecha: Date()` en todos los elementos, todos quedan con la fecha
y hora en que se abrió la app (todos iguales). Para fechas distintas usa 2.21.4.

`print(Date())` sale en inglés y en hora UTC (`2026-10-16 03:54:36 +0000`). Eso es normal: para mostrarla bonita
**siempre** usa un `DateFormatter`.

### 2.21.2 DateFormatter: los 3 pasos de clase

```swift
import Foundation

func fechaDeHoy() -> String {
    let fechaActual = Date()

    let formato = DateFormatter()                     // 1. generar el formateador
    formato.dateStyle = DateFormatter.Style.long      // 2. elegir el estilo de fecha
    formato.timeStyle = DateFormatter.Style.none      //    .none = no muestra la hora
    formato.locale = Locale(identifier: "es_MX")      //    español de México

    return formato.string(from: fechaActual)          // 3. obtener el String
}
```

**Salidas reales con `es_MX`** (para el jueves 15 de octubre de 2026, 9:54:36 p.m.):

| `dateStyle` | Resultado | `timeStyle` | Resultado |
|---|---|---|---|
| `.short` | `15/10/26` | `.short` | `9:54 p.m.` |
| `.medium` | `15 oct 2026` | `.medium` | `9:54:36 p.m.` |
| `.long` | `15 de octubre de 2026` | `.long` | `9:54:36 p.m. GMT-6` |
| `.full` | `jueves, 15 de octubre de 2026` | `.full` | `9:54:36 p.m. hora estándar central` |
| `.none` | (no muestra fecha) | `.none` | (no muestra hora) |

**Sin `locale`** sale en el idioma del simulador (normalmente inglés: `October 15, 2026`). Por eso SIEMPRE pon
`formato.locale = Locale(identifier: "es_MX")`.

### 2.21.3 Formato a la medida: `dateFormat`

```swift
import Foundation

func fechaConFormato(formato: String) -> String {
    let formateador = DateFormatter()
    formateador.dateFormat = formato                   // ✅ es una PROPIEDAD: se asigna con =
    formateador.locale = Locale(identifier: "es_MX")
    return formateador.string(from: Date())
}
// fechaConFormato(formato: "EEE, dd 'de' MMMM")  → "jue, 15 de octubre"
```

**Error típico:** `formateador.dateFormat("dd/MM/yyyy")` ❌ → *"Cannot call value of non-function type 'String?'"*.
`dateFormat` no es una función: va con `=`. Y recuerda que esa línea debe ir **dentro de una función** (2.2).

**Símbolos (resultado real con `es_MX`, 15/oct/2026 21:54:36):**

| Símbolo | Significa | Resultado |
|---|---|---|
| `d` / `dd` | Día (sin cero / con cero) | `15` / `15` (el 5 sería `5` / `05`) |
| `M` / `MM` | Mes en número | `10` / `10` |
| `MMM` | Mes corto | `oct` |
| `MMMM` | Mes completo | `octubre` |
| `yy` / `yyyy` | Año | `26` / `2026` |
| `EEE` | Día de la semana corto | `jue` |
| `EEEE` | Día de la semana completo | `jueves` |
| `HH` | Hora 0–23 | `21` |
| `h` / `hh` | Hora 1–12 | `9` / `09` |
| `mm` | Minutos (¡minúscula! `MM` es mes) | `54` |
| `ss` | Segundos | `36` |
| `a` | a.m. / p.m. | `p.m.` |
| `'de'` | Texto literal entre comillas simples | `de` |

| Formato | Resultado |
|---|---|
| `"dd/MM/yyyy"` | `15/10/2026` |
| `"dd/MMMM/yyyy"` (lámina) | `15/octubre/2026` |
| `"EEE, dd 'de' MMMM"` (lámina) | `jue, 15 de octubre` |
| `"EEEE, d 'de' MMMM"` | `jueves, 15 de octubre` |
| `"d 'de' MMMM 'de' yyyy"` | `15 de octubre de 2026` |
| `"h:mm a"` | `9:54 p.m.` |
| `"HH:mm"` | `21:54` |

### 2.21.4 Sumar o restar a una fecha (forma de clase)

```swift
import Foundation

func fechaFutura() -> String {
    let currentDate = Date()
    var dateComponent = DateComponents()
    dateComponent.month = 2                  // + 2 meses (también .day, .year, .hour, .minute)

    // OJO: regresa OPCIONAL ("Solo aguas… esta constante es OPCIONAL", Clase 3B)
    if let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate) {
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.long
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: futureDate)
    }
    return "No se pudo calcular"
}

// Para fechas DISTINTAS en tu ModelData: "hace X días" con números negativos
func fechaHaceDias(dias: Int) -> Date {
    var dateComponent = DateComponents()
    dateComponent.day = -dias                // negativo = hacia atrás
    if let fecha = Calendar.current.date(byAdding: dateComponent, to: Date()) {
        return fecha
    }
    return Date()
}
// En ModelData: fecha: fechaHaceDias(dias: 3)
```

### 2.21.5 Una fecha exacta (ej. 15/04/2024) ⚠️

```swift
import Foundation

// Opción A: desde un texto con DateFormatter
func crearFecha(texto: String) -> Date {
    let formato = DateFormatter()
    formato.dateFormat = "dd/MM/yyyy"          // el texto DEBE venir con este formato
    if let fecha = formato.date(from: texto) { // ⚠️ date(from:) = texto → fecha (opcional)
        return fecha
    }
    return Date()
}

// Opción B: con DateComponents (año, mes, día)
func crearFechaComponentes(anio: Int, mes: Int, dia: Int) -> Date {
    var componentes = DateComponents()
    componentes.year = anio
    componentes.month = mes
    componentes.day = dia
    if let fecha = Calendar.current.date(from: componentes) {   // ⚠️ opcional
        return fecha
    }
    return Date()
}
// crearFecha(texto: "15/04/2024")  ·  crearFechaComponentes(anio: 2026, mes: 9, dia: 2)
```

⚠️ No visto: en clase solo se vio fecha → texto (`string(from:)`), no al revés. Cómo explicarlo:
*"`date(from:)` lee un texto usando el `dateFormat`; regresa opcional porque el texto puede venir mal escrito"*.

**Trampa:** si al formateador NO le pones `dateFormat`, `date(from: "15/04/2024")` regresa `nil` y con `?? Date()`
termina siendo HOY sin avisarte. Y si el texto no coincide con el formato (`"2024-04-15"` con `"dd/MM/yyyy"`) → `nil`.

### 2.21.6 Diferencia entre fechas, comparar y ordenar ⚠️

```swift
import Foundation

func diasEntre(inicio: Date, fin: Date) -> Int {
    let componentes = Calendar.current.dateComponents([.day], from: inicio, to: fin)
    if let dias = componentes.day {          // opcional
        return dias
    }
    return 0
}
// Edad en años: dateComponents([.year], from: nacimiento, to: Date()).year

func ejemploCompararFechas(a: Date, b: Date) {
    if a < b {
        print("a es antes que b")             // las fechas se comparan con < > ==
    }
    if a > Date() {
        print("a está en el futuro")
    }
}
```

Ordenar una lista por fecha (más reciente primero): `lista.sorted { $0.fecha > $1.fecha }` ⚠️.

### 2.21.7 Elegir una fecha en la pantalla

Eso es el control `DatePicker` (⚠️ no visto): ver parte 4 · `03_ElementosUI/OtrosControlesView.swift` → bloques 2–3.

**Errores comunes:**

| Mensaje / síntoma | Por qué | Arreglo |
|---|---|---|
| `Cannot call value of non-function type 'String?'` | `dateFormat("…")` | `dateFormat = "…"` |
| `Expressions are not allowed at the top level` | Configuraste el formateador fuera de una función | Muévelo dentro de la función |
| `Value of optional type 'Date?' must be unwrapped` | `date(byAdding:)` / `date(from:)` son opcionales | `if let fecha = … { }` |
| La fecha sale en inglés | Falta `locale` | `formato.locale = Locale(identifier: "es_MX")` |
| Todas las fechas salen iguales | Pusiste `Date()` en todas, o `date(from:)` falló y cayó al `?? Date()` | Usa `fechaHaceDias` o revisa el `dateFormat` |
| Sale el mes donde iban minutos | Usaste `MM` (mes) en vez de `mm` (minutos) | `HH:mm` |

**¿Visto en clase?** ✅ Clase 3B (`Date()`, DateFormatter en 3 pasos, estilos, `locale`, `dateFormat`, sumar con DateComponents). `date(from:)`, `Calendar.current.date(from:)`, `dateComponents(_:from:to:)`, ordenar por fecha ⚠️.

**En el repo:** `01_SwiftBasico/FechasYNumerosView.swift` → bloques 1 (hoy), 2 (estilos), 3 (a la medida), 4 (sumar), 5 (días entre fechas ⚠️) · `06_MultiplesPantallas/BienvenidaView.swift` (`fechaHoy`).

---

## 2.22 Formato de números (decimales, pesos, porcentaje)

🔎 formato numero, formatear, decimales, 2 decimales, redondear para mostrar, moneda, pesos, MXN, currency, dinero, precio, porcentaje, percent, %, specifier, %.2f, %.1f, formatted, grouping, año sin coma, separador de miles, NumberFormatter, spellOut, numero con letra, ordinal, MX$

### 2.22.1 Dentro de un `Text` (forma de clase)

```swift
import SwiftUI

struct EjemploFormatoNumeros: View {
    let numeroBase = 1234.5678
    let precioBase = 185.0
    let calificacion = 4.256
    let anio = 2026

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(numeroBase, format: .number)                                // 1,234.5678
            Text(numeroBase, format: .number.precision(.fractionLength(2)))  // 1,234.57
            Text(precioBase, format: .currency(code: "MXN"))                 // $185.00 (MX$185.00 en simulador en inglés)
            Text("\(calificacion, specifier: "%.1f") ⭐️")                    // 4.3 ⭐️
            Text("\(anio, format: .number.grouping(.never))")                // 2026 (sin coma)
        }
    }
}
```

### 2.22.2 Convertido a `String` (forma de clase)

```swift
import Foundation

func ejemploNumerosString() {
    let numeroBase = 1234.5678
    let precioBase = 185.0

    let a = numeroBase.formatted(.number)                                   // "1,234.5678"
    let b = numeroBase.formatted(.number.precision(.fractionLength(2)))     // "1,234.57"
    let c = precioBase.formatted(.currency(code: "MXN"))                    // "$185.00" o "MX$185.00"

    // ⚠️ Forzar el formato de México (sale "$" aunque el simulador esté en inglés):
    let d = precioBase.formatted(.currency(code: "MXN").locale(Locale(identifier: "es_MX")))   // "$185.00"

    print(a, b, c, d)
}
```

### 2.22.3 Tabla rápida

| Quiero | En un `Text` | En un `String` | Resultado |
|---|---|---|---|
| Número normal | `Text(x, format: .number)` | `x.formatted(.number)` | `1,234.5678` |
| 2 decimales | `Text(x, format: .number.precision(.fractionLength(2)))` | `x.formatted(.number.precision(.fractionLength(2)))` | `1,234.57` |
| 1 decimal con specifier | `Text("\(x, specifier: "%.1f")")` | ❌ no existe en String → usa `.formatted` | `4.3` |
| Pesos | `Text(x, format: .currency(code: "MXN"))` | `x.formatted(.currency(code: "MXN"))` | `$1,234.57` (o `MX$…`) |
| Porcentaje (valor de 0 a 1) | `Text(0.75, format: .percent)` ⚠️ | `(0.75).formatted(.percent)` | `75%` |
| Porcentaje (valor de 0 a 100) | `Text("\(Int(porcentaje))%")` | `"\(Int(porcentaje))%"` | `75%` |
| Año sin coma | `Text("\(anio, format: .number.grouping(.never))")` | `anio.formatted(.number.grouping(.never))` | `2026` |
| Entero sin decimales de un Double | `Text("\(Int(x))")` | `String(Int(x))` | `1234` (corta) |

**Trampas reales (probadas):**
- **`MX$` en lugar de `$`:** el simulador está en inglés (región EE. UU.). No es error. Para que salga `$` en un String usa
  `.locale(Locale(identifier: "es_MX"))`, o cambia la región del simulador: Settings → General → Language & Region → Región: México.
- **`.percent` multiplica por 100:** `(75.0).formatted(.percent)` = **`7,500%`**. Si tu porcentaje ya va de 0 a 100,
  NO uses `.percent`: usa `"\(Int(porcentaje))%"` o `Text("\(porcentaje, specifier: "%.1f")%")`.
- **`specifier` solo funciona dentro de `Text("…")`**, no en un `String` normal.
- **`"\(precio)"` sin formato** muestra `185.0`: dale formato siempre que sea dinero.

### 2.22.4 Tabla de `specifier`

| Specifier | Para | Ejemplo | Resultado |
|---|---|---|---|
| `"%.0f"` | Double sin decimales | 2.6 | `3` |
| `"%.1f"` | Double con 1 decimal | 4.256 | `4.3` |
| `"%.2f"` | Double con 2 decimales | 3.14159 | `3.14` |
| `"%05.1f"` | 5 caracteres, relleno con ceros | 3.14159 | `003.1` |
| `"%d"` | Int | 42 | `42` |

⚠️ `String(format: "%.2f", x)` hace lo mismo para un String (no visto; usa `.formatted`).

### 2.22.5 NumberFormatter (estilos de la tabla de la Clase 3B) ⚠️

```swift
import Foundation

func numeroConEstilo(numero: Double, estilo: NumberFormatter.Style) -> String {
    let formato = NumberFormatter()                    // mismos pasos que DateFormatter
    formato.numberStyle = estilo
    formato.locale = Locale(identifier: "es_MX")
    if let texto = formato.string(from: NSNumber(value: numero)) {   // regresa opcional
        return texto
    }
    return ""
}
```

| Estilo | Ejemplo (`es_MX`) |
|---|---|
| `.none` | 1234.5678 → `1235` |
| `.decimal` | 1234.5678 → `1,234.568` |
| `.percent` | 0.12 → `12%` |
| `.scientific` | 1234.5678 → `1.2345678E3` |
| `.spellOut` | 123 → `ciento veintitrés` |
| `.ordinal` | 3 → `3º.` |
| `.currency` | 1234.5678 → `$1,234.57` |

⚠️ La tabla de estilos sale en la Clase 3B, pero el código `NumberFormatter()` no se escribió en clase.

**¿Visto en clase?** ✅ Clase 3B (`format: .number`, `.precision(.fractionLength(2))`, `.currency(code: "MXN")`, `.formatted(...)`, tabla de NumberFormatter.Style). `specifier` y `.grouping(.never)` ✅ material del curso. `.percent` como FormatStyle, `.locale(...)` y `String(format:)` ⚠️.

**En el repo:** `01_SwiftBasico/FechasYNumerosView.swift` → bloques 6 (en Text), 7 (dentro de un texto), 8 (años sin coma), 9 (a String), 10 (NumberFormatter ⚠️).

---

## 2.23 Números y elementos al azar (random)

🔎 random, aleatorio, azar, al azar, Int.random, Double.random, Bool.random, randomElement, shuffled, revolver, sorpresa, recomendacion aleatoria

```swift
func ejemplosRandom() {
    let dado = Int.random(in: 1...6)                 // entero entre 1 y 6 (incluye ambos)
    let suerte = Int.random(in: 1...100)
    let decimal = Double.random(in: 0...1)           // decimal entre 0 y 1
    let moneda = Bool.random()                       // true o false

    let comidas = ["Tacos", "Pizza", "Sushi"]
    if let recomendacion = comidas.randomElement() { // opcional: la lista podría estar vacía
        print("Hoy toca: \(recomendacion)")
    }

    let revueltas = comidas.shuffled()               // copia en otro orden
    let indice = Int.random(in: 0..<comidas.count)   // un índice válido al azar (truena si la lista está vacía)
    print(dado, suerte, decimal, moneda, revueltas, comidas[indice])
}
```

**Receta "Recomendación sorpresa" en una vista:** guarda el resultado en `@State private var sorpresa: Antojo? = nil`,
en el botón `sorpresa = antojos.randomElement()`, y en el body `if let antojo = sorpresa { … }`.

**¿Visto en clase?** ✅ material del curso (`Int.random(in: 1...100)`, `lista.randomElement()`). `Double.random`, `Bool.random`, `shuffled` 🟡.

**En el repo:** `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 5 · tu tarea Movil2 (`SorpresaView`).

---

## 2.24 `async`, `await`, `Task` y `try` (lo necesario para PhotosPicker)

🔎 async, await, task, Task { }, asincrono, asíncrono, esperar, try, try?, throws, loadTransferable, concurrencia, segundo plano

**Qué es:** algunas operaciones **tardan** (cargar una foto, descargar de internet). Si la app se quedara esperando,
la pantalla se congelaría. Con `async`/`await` la app "espera sin congelarse".

| Palabra | Qué significa |
|---|---|
| `async` | "Esta función tarda; hay que esperarla" |
| `await` | "Aquí espero el resultado (sin congelar la pantalla)" |
| `Task { … }` | Crea un espacio donde se puede usar `await`. Se necesita porque la acción de un botón o un `.onChange` **no** son async |
| `throws` | "Esta función puede fallar (lanzar un error)" |
| `try` | "Llamo algo que puede fallar" (debe ir dentro de `do { } catch { }`) |
| `try?` | "Si falla, dame `nil` en vez de un error" (más corto; se combina con `if let`) |

**El ejemplo de la Clase 17 (PhotosPicker), explicado:**

```swift
import SwiftUI
import PhotosUI

struct EjemploAsyncFoto: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
            Label("Seleccionar Foto", systemImage: "photo.on.rectangle")
        }
        .onChange(of: selectedItem) { oldItem, newItem in
            Task {                                                          // 1. espacio async
                if let data = try? await newItem?.loadTransferable(type: Data.self),   // 2. espera los datos; si falla → nil
                   let uiImage = UIImage(data: data) {                     // 3. convierte a imagen; si no se puede → nil
                    selectedImage = uiImage                                 // 4. si TODO salió bien, la guarda
                }
            }
        }
    }
}
```

Léelo así: *"cuando cambia la foto elegida, en una tarea asíncrona intenta cargar sus datos; si pudo cargarlos y
convertirlos a UIImage, guárdala en la variable"*.

**¿Visto en clase?** ✅ Clase 17 (este código exacto) y Clase 12 (`async throws`, `try await`, `Task`).

**En el repo:** `10_FotosYCamara/SeleccionarFotoView.swift` (pasos A–F).

---

## 2.25 Errores con `do` / `try` / `catch` y JSON

🔎 do, try, catch, error, throws, manejo de errores, JSON, JSONEncoder, JSONDecoder, codificar, decodificar, encode, decode, Codable, json a struct, struct a json, PropertyListEncoder, plist, xml

**Qué es:** cuando una función puede fallar (`throws`), se llama con `try` dentro de un `do`, y si falla se va al `catch`.

### 2.25.1 Struct → JSON (Clase 8)

```swift
import Foundation

struct EmpleadoJSON: Codable {
    var id: Int
    var nombre: String
    var depto: String
}

func convertirAJSON() {
    let listaEmpleados = [
        EmpleadoJSON(id: 123, nombre: "Perla", depto: "Ventas"),
        EmpleadoJSON(id: 456, nombre: "Jorge", depto: "Merca")
    ]

    let jsonEncoder = JSONEncoder()
    do {
        let jsonData = try jsonEncoder.encode(listaEmpleados)       // puede fallar → try
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)       // [{"id":123,"nombre":"Perla","depto":"Ventas"},…]
        }
    } catch {
        print("Error inesperado \(error)")                          // aquí cae si falló
    }
}
```

### 2.25.2 JSON → struct

```swift
import Foundation

struct PeliculaJSON: Codable, Identifiable {
    var id: Int
    var titulo: String
    var anio: Int
}

func leerJSON() -> [PeliculaJSON] {
    let texto = """
    [
      {"id": 1, "titulo": "Coco", "anio": 2017},
      {"id": 2, "titulo": "Up", "anio": 2009}
    ]
    """
    if let data = texto.data(using: .utf8) {
        do {
            let peliculas = try JSONDecoder().decode([PeliculaJSON].self, from: data)
            return peliculas
        } catch {
            print("No se pudo leer: \(error)")
        }
    }
    return []
}
```

- `[PeliculaJSON].self` le dice al decoder "espero un **arreglo** de PeliculaJSON". Para uno solo: `PeliculaJSON.self`.
- Los nombres de las propiedades deben ser **iguales** a las llaves del JSON (`"titulo"` ↔ `var titulo`).
- Si un campo puede venir `null` en el JSON, decláralo opcional (`var anio: Int?`) o falla todo.

### 2.25.3 `try` vs `try?` vs `try!`

| Forma | Qué pasa si falla | Úsalo |
|---|---|---|
| `try` dentro de `do { } catch { }` | Se va al `catch` con el error | Cuando quieres saber qué falló |
| `try?` | Da `nil` | Con `if let` (ej. PhotosPicker) |
| `try!` | **Truena la app** | Nunca (igual que `!`) |

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `Call can throw but is not marked with 'try'` | Llamaste algo que puede fallar sin `try` | `do { try … } catch { }` o `try?` |
| `Errors thrown from here are not handled` | Pusiste `try` fuera de un `do`/`catch` | Envuélvelo en `do { } catch { }` |
| `keyNotFound` / `typeMismatch` en la consola | El JSON no coincide con tu struct (nombre o tipo) | Revisa nombres y tipos; usa opcionales para campos que pueden faltar |
| `'async' call in a function that does not support concurrency` | Usaste `await` en un botón u `.onChange` | Envuélvelo en `Task { }` |

**¿Visto en clase?** ✅ Clase 8 (`JSONEncoder`, `PropertyListEncoder`, `do/try/catch`), ✅ Clase 12 (`JSONDecoder`, `Task` + `do/catch`). Leer un `.json` incluido en la app: ⚠️ (ver parte 6).

**En el repo:** `08_ModelosYListas/Views/CodableView.swift` + `Model/Empleado.swift` · `08_ModelosYListas/Views/JSONLocalView.swift` + `Model/Pelicula.swift`.

---

## 2.26 Chuleta de Swift (resumen de una página)

🔎 chuleta, resumen, cheat sheet, acordeon, sintaxis rapida, recordar

| Quiero | Código |
|---|---|
| Variable / constante | `var x = 5` · `let y = 5` · `var z: Double = 0` |
| Texto con valor | `"Tengo \(edad) años"` |
| Texto → número | `if let n = Int(texto) { … } else { … }` |
| Opcional | `var foto: UIImage? = nil` · `if let f = foto { … }` |
| Valor por defecto ⚠️ | `Int(texto) ?? 0` |
| if | `if a > b { … } else if a == b { … } else { … }` |
| switch | `switch x { case 1: … case 2, 3: … default: … }` |
| Ternario | `esFavorito ? "heart.fill" : "heart"` |
| for | `for item in lista { … }` · `for i in 0..<lista.count { … }` · `for i in lista.indices { … }` |
| Arreglo | `var lista = Array<Antojo>()` · `lista.append(x)` · `lista.remove(at: 0)` · `lista.count` |
| Uno al azar | `if let x = lista.randomElement() { … }` |
| Función | `func sumar(a: Int, b: Int) -> Int { return a + b }` → `sumar(a: 1, b: 2)` |
| Struct | `struct Antojo: Identifiable { var id: Int; var nombre: String }` |
| Propiedad calculada | `var estrellas: String { return String(repeating: "⭐️", count: calificacion) }` |
| Fecha de hoy en español | `DateFormatter` + `dateStyle = .long` + `locale = Locale(identifier: "es_MX")` + `string(from: Date())` |
| Sumar días | `var dc = DateComponents(); dc.day = 3; if let f = Calendar.current.date(byAdding: dc, to: Date()) { … }` |
| 2 decimales | `Text(x, format: .number.precision(.fractionLength(2)))` · `Text("\(x, specifier: "%.2f")")` |
| Pesos | `Text(precio, format: .currency(code: "MXN"))` |
| Al azar | `Int.random(in: 1...10)` |
| Promedio sin truncar | `Double(suma) / Double(lista.count)` (revisa que `count > 0`) |
| JSON | `try JSONEncoder().encode(x)` · `try JSONDecoder().decode([T].self, from: data)` dentro de `do { } catch { }` |
| Esperar algo async | `Task { if let d = try? await algo() { … } }` |

---

---

# 3. SwiftUI: vistas, diseño y layout

Esta parte explica **cómo se arma una pantalla**: qué es una vista, qué es un modificador, cómo se escriben textos,
imágenes y colores, y cómo se acomodan las cosas (stacks, espacios, márgenes, dividir la pantalla, cuadrículas,
componentes). Los controles (botones, campos, pickers, alertas) están en la **parte 4**. La navegación en la **parte 5**.
Las listas a fondo en la **parte 6**.

**Leyenda:** ✅ = se vio en clase (y en qué clase). ⚠️ = no se vio en clase: si lo usas, tienes que poder explicarlo.

**Mapa de esta parte**

| # | Tema | # | Tema |
|---|---|---|---|
| 3.1 | Anatomía de una vista | 3.17 | Modo oscuro |
| 3.2 | Dónde va cada cosa dentro del struct | 3.18 | Stacks: VStack, HStack, ZStack |
| 3.3 | Usar una vista dentro de otra | 3.19 | alignment (alineación) |
| 3.4 | if, switch, ternario y ForEach en el body | 3.20 | spacing |
| 3.5 | #Preview a fondo | 3.21 | Spacer |
| 3.6 | Modificadores y por qué importa el orden | 3.22 | Divider |
| 3.7 | Modificadores con condición y que heredan los hijos | 3.23 | padding |
| 3.8 | Text | 3.24 | frame |
| 3.9 | Label | 3.25 | Recetas de layout (dividir la pantalla, etc.) |
| 3.10 | Image de Assets | 3.26 | ScrollView |
| 3.11 | SF Symbols (íconos) | 3.27 | Formas (Rectangle, Circle…) y esquinas |
| 3.12 | Image(uiImage:) | 3.28 | Tabla de otros modificadores + animaciones |
| 3.13 | Colores | 3.29 | Componentes reutilizables (Clase 5A) |
| 3.14 | Paleta de colores en Utils | 3.30 | Ejemplo Pokémon completo (Clase 5A) |
| 3.15 | Fondo de pantalla completa y safe area | 3.31 | Errores comunes de diseño |
| 3.16 | Degradados | | |

---

## 3.1 Anatomía de una vista

🔎 vista, view, pantalla, struct View, body, some View, anatomia, estructura de una vista, ContentView, import SwiftUI, partes de una vista, que es una vista

**Qué es:** una **vista** es un pedazo de interfaz: una pantalla completa, un renglón, un botón con diseño propio.
En SwiftUI cada vista es un `struct` que "hereda de `View`" (así lo dice la profe; técnicamente se dice que
*se conforma* al protocolo `View`). Lo único que `View` le exige es tener una propiedad llamada `body`.

**Cómo se escribe (el ContentView que trae un proyecto nuevo, Clase 3):**

```swift
import SwiftUI                       // 1. trae todo SwiftUI (Text, Image, VStack…)

struct ContentView: View {           // 2. el struct se llama como el archivo y "hereda de View"
    var body: some View {            // 3. body = lo que se dibuja en pantalla
        VStack {                     // 4. un solo contenedor raíz
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hola Mundo")
        }
        .padding()
    }
}

#Preview {                           // 5. lo que se ve en el Canvas (no afecta la app)
    ContentView()
}
```

| Parte | Qué es | Detalle |
|---|---|---|
| `import SwiftUI` | Trae el framework | Sin esto no existe `Text`, `View`, etc. Archivos de puro modelo usan `import Foundation` |
| `struct ContentView: View` | Declara la vista | El nombre empieza con mayúscula. Por convención termina en `View` |
| `var body: some View` | El contenido | Es una **propiedad calculada**: SwiftUI la vuelve a leer cada vez que cambia un `@State` |
| `some View` | "Alguna vista" | No tienes que escribir el tipo exacto (sería larguísimo, tipo `VStack<TupleView<…>>`). Swift lo calcula solo |
| `#Preview { }` | Vista previa | Solo para el Canvas de Xcode. Se abre con **⌥⌘↩** o Editor → Canvas |

**¿Por qué un solo elemento raíz?** Dentro de `body` puedes poner varias vistas sueltas y compila, pero entonces
quien las contenga decide cómo acomodarlas (en el Canvas hasta salen como previews separados). Por eso la regla
práctica es: **mete todo en UN contenedor** (`VStack`, `ZStack`, `ScrollView`, `NavigationStack`…).

```swift
// 🙁 compila, pero no controlas cómo se acomodan
var body: some View {
    Text("Uno")
    Text("Dos")
}

// 🙂 forma recomendada: un contenedor
var body: some View {
    VStack {
        Text("Uno")
        Text("Dos")
    }
}
```

**La App (el archivo `TuAppApp.swift`):** es el *entry point* (punto de entrada) de la app. Dice cuál es la primera pantalla.

```swift
import SwiftUI

@main                                // marca dónde arranca la app (solo uno en todo el proyecto)
struct MiAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()            // ✏️ cambia esto por la pantalla que quieras que abra primero
        }
    }
}
```

| Archivo del proyecto nuevo (Clase 3) | Para qué es |
|---|---|
| `TuAppApp.swift` | Archivo principal / *entry point*. Tiene el `@main` |
| `ContentView.swift` | Una vista (pantalla). Código de diseño (front) y de lógica (back) |
| `Assets.xcassets` | Carpeta de imágenes, fotos, colores e ícono de la app |

**Errores comunes:**

| Error / síntoma | Por qué | Arreglo |
|---|---|---|
| `Type 'X' does not conform to protocol 'View'` | Te falta `var body: some View` o lo escribiste mal (`Body`, `bodi`) | Escribe exactamente `var body: some View { … }` |
| `'main' attribute can only apply to one type in a module` | Tienes dos archivos con `@main` (pegaste otra App) | Deja solo uno |
| `Cannot find 'ContentView' in scope` en la App | Renombraste o borraste ContentView | Cambia el `WindowGroup` a tu pantalla real |
| El Canvas no carga ("Preview paused") | Error de compilación en algún archivo | Arregla los errores rojos y presiona ↻ en el Canvas |

**¿Visto en clase?** ✅ Clase 3 (proyecto nuevo, ContentView, `#Preview`, tipos de archivo).
**En el repo:** `02_PrimeraApp/MiPrimeraAppView.swift` (encabezado: pasos de Xcode) · `ExamenMovilesApp.swift` (la App con `@main`).

---

## 3.2 Dónde va cada cosa dentro del struct

🔎 donde pongo, orden del struct, variables, funciones, propiedades calculadas, fuera del body, top level, expressions are not allowed at the top level, estructura del archivo

**Qué es:** el orden que conviene dentro de una vista para que se lea fácil (y para no meter código donde no va).

```swift
import SwiftUI

struct PerfilView: View {

    // 1. Datos que recibe de otra pantalla (sin @State ni private)
    var nombre: String

    // 2. Estado propio de la pantalla (@State private)
    @State private var contador = 0
    @State private var mostrarAlerta = false

    // 3. Constantes
    let colorPrincipal = Color(red: 108/255, green: 92/255, blue: 231/255)

    // 4. Propiedades calculadas (se recalculan solas)
    var saludo: String {
        return "Hola, \(nombre)"
    }

    // 5. Funciones (lógica: validar, calcular, formatear)
    func sumar() {
        contador += 1
    }

    // 6. El body (lo que se dibuja)
    var body: some View {
        VStack(spacing: 16) {
            Text(saludo)
            Text("Contador: \(contador)")
            Button("Sumar") {
                sumar()
            }
            .buttonStyle(.borderedProminent)
            .tint(colorPrincipal)
        }
    }
}

#Preview {
    PerfilView(nombre: "Ana")
}
```

**Regla de oro:** dentro del `body` solo van **vistas** (y `if`, `switch`, `ForEach`). La lógica (asignar
variables, ciclos para calcular, convertir texto a número) va en **funciones** o en la **acción de un botón**.

**Fuera de cualquier struct o func** (en el "top level" del archivo) solo puedes **declarar** cosas: `struct`,
`func`, `let`, `var`. No puedes **ejecutar** instrucciones.

```swift
// ❌ esto NO compila: "Expressions are not allowed at the top level"
let formato = DateFormatter()
formato.dateFormat = "dd/MM/yyyy"     // ← esto es una instrucción, no una declaración

// ✅ correcto: la instrucción va dentro de una función
func crearFormato() -> DateFormatter {
    let formato = DateFormatter()
    formato.dateFormat = "dd/MM/yyyy"
    return formato
}
```

**Errores comunes:**

| Error | Por qué | Arreglo |
|---|---|---|
| `Expressions are not allowed at the top level` | Una instrucción quedó fuera de toda función | Muévela dentro de una `func` (o del `body` si es una vista) |
| `Cannot assign to property: 'self' is immutable` | Cambias una `var` normal desde la vista | Si cambia con la interfaz, decláralo `@State private var` |
| `Type '()' cannot conform to 'View'` | Pusiste una instrucción (ej. `x = 5`, `print()`) directo en el `body` | Mételo en la acción de un botón, en `.onAppear { }` o en una función |
| `Missing return in getter expecting 'String'` | Propiedad calculada de varias líneas sin `return` | Agrega `return` |

**¿Visto en clase?** ✅ Clase 3 (`@State private`, funciones como acción de botón).
**En el repo:** cualquier pantalla, ej. `03_ElementosUI/FormularioValidacionView.swift` (estado arriba, función `validarFormulario()`, body).

---

## 3.3 Usar una vista dentro de otra

🔎 usar una vista en otra, llamar vista, componente, meter una vista, vista dentro de vista, subvista, separar en archivos, pasar parametros a una vista

**Qué es:** una vista se usa como cualquier elemento, escribiendo su nombre con paréntesis. Así una pantalla se
arma con piezas que viven en otros archivos (Clase 5A).

```swift
import SwiftUI

struct TarjetaSaludo: View {          // pieza reutilizable
    var nombre: String                // dato que recibe

    var body: some View {
        Text("Hola, \(nombre)")
            .padding()
            .background(Color.purple.opacity(0.15))
            .cornerRadius(12)
    }
}

struct PantallaPrincipal: View {
    var body: some View {
        VStack(spacing: 12) {
            TarjetaSaludo(nombre: "Ana")       // se usa como un Text o una Image
            TarjetaSaludo(nombre: "Luis")
        }
    }
}
```

- **Sin parámetros:** `PokeImagenView()`.
- **Con parámetros:** `TarjetaSaludo(nombre: "Ana")`. Los nombres y el **orden** deben ser los del struct.
- Se le pueden poner modificadores desde afuera: `PokeImagenView().frame(width: 150).offset(y: 120)`.

**Errores comunes:** `Missing argument for parameter 'nombre' in call` → la vista pide un dato y no se lo diste.
`Extra argument 'x' in call` → le mandas algo que no declara (si la vista no recibe nada: `Argument passed to call that takes no arguments`). `Argument 'b' must precede argument 'a'` → el orden
no es el de las `var` del struct.

**¿Visto en clase?** ✅ Clase 5A (vistas en archivos separados).
**En el repo:** `04_Componentes/PokemonEjemploView.swift` · más en 3.29.

---

## 3.4 if, switch, ternario y ForEach dentro del body

🔎 if en el body, mostrar u ocultar, condicional en vista, if let en vista, switch en body, operador ternario, ? :, ForEach, repetir vistas, ciclo en el body, for en el body, Group, EmptyView

**Qué es:** el `body` no acepta cualquier código, pero sí acepta estas estructuras para decidir **qué** se dibuja.

### 3.4.1 `if` / `else` (mostrar u ocultar)

```swift
import SwiftUI

struct MensajeCondicional: View {
    @State private var mostrar = false
    @State private var puntos = 72

    var body: some View {
        VStack(spacing: 12) {
            Toggle("Mostrar detalle", isOn: $mostrar)

            if mostrar {
                Text("Este texto solo aparece si el Toggle está prendido")
            }

            if puntos >= 70 {
                Text("Aprobado").foregroundStyle(.green)
            } else if puntos >= 60 {
                Text("De panzazo").foregroundStyle(.orange)
            } else {
                Text("Reprobado").foregroundStyle(.red)
            }
        }
        .padding()
    }
}
```

### 3.4.2 `if let` (mostrar algo solo si el opcional tiene valor)

```swift
import SwiftUI

struct FotoOpcional: View {
    @State private var imagenElegida: UIImage? = nil

    var body: some View {
        if let imagen = imagenElegida {          // dentro, "imagen" ya NO es opcional
            Image(uiImage: imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
        } else {
            Text("Seleccionar imagen")
                .foregroundStyle(.gray)
        }
    }
}
```

### 3.4.3 `switch` en el body

```swift
import SwiftUI

struct IconoCategoria: View {
    var categoria: String

    var body: some View {
        switch categoria {
        case "Tacos":
            Image(systemName: "fork.knife")
        case "Postres":
            Image(systemName: "birthday.cake")
        default:
            Image(systemName: "questionmark.circle")
        }
    }
}
```

### 3.4.4 Ternario `condición ? siEsVerdad : siEsFalso`

Sirve para elegir un **valor** (texto, color, ícono, número) en una sola línea.

```swift
import SwiftUI

struct CorazonFavorito: View {
    @State private var esFavorito = true

    var body: some View {
        HStack {
            Image(systemName: esFavorito ? "heart.fill" : "heart")
                .foregroundStyle(esFavorito ? .red : .gray)
            Text(esFavorito ? "Favorito" : "No favorito")
        }
    }
}
```

> Los dos lados del ternario deben ser **del mismo tipo**: `esFavorito ? .red : .gray` (dos colores) ✅;
> `esFavorito ? Color.red : "gris"` ❌.

### 3.4.5 `ForEach` (repetir una vista por cada elemento) ⚠️

`ForEach` **no** viene en las láminas: la profe usa `List(lista) { }` (parte 6). Pero lo vas a necesitar para
repetir vistas **dentro de un VStack/HStack/ScrollView** o para las opciones de un Picker.

```swift
import SwiftUI

struct ForEachEjemplos: View {
    let frutas = ["Manzana", "Pera", "Uva"]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 1. Arreglo simple (String, Int): id: \.self = "cada texto se identifica por sí mismo"
            ForEach(frutas, id: \.self) { fruta in
                Text("🍎 \(fruta)")
            }

            // 2. Un rango de números
            ForEach(1...5, id: \.self) { numero in
                Text("Renglón \(numero)")
            }

            // 3. Usando el índice (posición) del arreglo
            ForEach(frutas.indices, id: \.self) { i in
                Text("\(i + 1). \(frutas[i])")
            }
        }
    }
}
```

- Con un **modelo `Identifiable`** (struct con `id`) no necesitas `id:` → `ForEach(jugadores) { jugador in … }`.
- `id: \.self` con textos **repetidos** causa renglones raros. Para modelos usa `Identifiable`.
- `ForEach` **no es un ciclo `for`**: no puedes sumar ni asignar variables adentro, solo dibujar vistas.
  Para calcular algo usa un `for` normal en una función (parte 2).

**Cómo explicarlo si la profe pregunta:** "ForEach crea una vista por cada elemento del arreglo; es como `List`
pero sin el diseño de lista, para poder meterlo en un VStack o un HStack con mi propio diseño."

### 3.4.6 `Group` ⚠️ y `EmptyView`

- `Group { … }` junta varias vistas **sin** acomodarlas (no es VStack). Sirve para aplicar un modificador a
  varias a la vez o para devolver vistas distintas en un `if`.
- `EmptyView()` es "nada": una vista vacía. Útil en un `default:` de un `switch` donde no quieres mostrar nada.

**Errores comunes:**

| Error | Por qué | Arreglo |
|---|---|---|
| `Type '()' cannot conform to 'View'` | Pusiste `for`, `x += 1` o `print()` dentro del body | En el body usa `ForEach`; la lógica va en funciones |
| `Generic parameter 'C' could not be inferred` en `ForEach` | Arreglo de algo que no es `Identifiable` y sin `id:` | Agrega `id: \.self` o haz el struct `Identifiable` |
| `Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'X' conform to 'Identifiable'` | Igual que arriba | Igual que arriba |
| `Branches have mismatching types` en un ternario | Los dos lados son de tipo distinto | Que los dos sean `Color`, o los dos `String`… |

**¿Visto en clase?** `if`/`else`, `if let`, ternario: ✅ Clase 2 y 17 (`if let selectedImageBien = selectedImage`).
`switch`: ✅ Clase 2 (Swift). `ForEach`, `Group`: ⚠️.
**En el repo:** `01_SwiftBasico/ArreglosYCiclosView.swift` bloque 6 (ForEach) · `10_FotosYCamara/SeleccionarFotoView.swift` (if let con la foto).

---

## 3.5 `#Preview` a fondo

🔎 preview, canvas, vista previa, #Preview, no se ve el preview, preview con binding, constant, preview con parametros, preview navigationstack, preview paused

**Qué es:** el bloque que alimenta el **Canvas** (panel de la derecha). No se ejecuta en la app; solo te deja ver
la vista mientras programas. Se abre con **⌥⌘↩** (Option+Command+Enter) o Editor → Canvas.

```swift
import SwiftUI

struct DetalleNombreView: View {
    var nombre: String
    @Binding var esFavorito: Bool

    var body: some View {
        VStack {
            Text(nombre).font(.title)
            Toggle("Favorito", isOn: $esFavorito)
        }
        .padding()
        .navigationTitle("Detalle")
    }
}

// 1. Vista que recibe datos → mándale datos de prueba
// 2. Vista con @Binding → .constant(valor) (un binding fijo, de solo lectura)
// 3. Vista que usa navigationTitle o que se abre con NavigationLink → envuélvela en NavigationStack
#Preview {
    NavigationStack {
        DetalleNombreView(nombre: "Tacos Juanito", esFavorito: .constant(true))
    }
}
```

| Quiero ver en el preview… | Escribe |
|---|---|
| Una vista sin parámetros | `#Preview { MiVista() }` |
| Una vista que recibe un texto o número | `#Preview { MiVista(nombre: "Ana", edad: 20) }` |
| Una vista con `@Binding` | `#Preview { MiVista(texto: .constant("Hola")) }` |
| Una vista que recibe un modelo | `#Preview { DetalleView(jugador: listaJugadores[0]) }` o crea uno: `Jugador(id: 1, …)` |
| El `navigationTitle` o la barra | `#Preview { NavigationStack { MiVista() } }` |
| Dos previews (dos pestañas en el Canvas) | Escribe dos bloques `#Preview { … }` |
| Ponerle nombre al preview | `#Preview("Modo grande") { MiVista() }` |

**Errores comunes:**

| Síntoma | Por qué | Arreglo |
|---|---|---|
| `Missing argument for parameter 'x'` en el `#Preview` | Agregaste un parámetro a la vista y el preview no lo manda | Agrégalo en el preview con un valor de prueba |
| `Cannot convert value of type 'String' to expected argument type 'Binding<String>'` | La vista pide `@Binding` y le mandaste un valor normal | Usa `.constant("…")` |
| El título no aparece en el preview | La vista no tiene `NavigationStack` encima | Envuélvela en `NavigationStack { }` **en el preview** |
| El Canvas dice "Preview paused" o no carga | Hay un error de compilación o tardó | Arregla errores y presiona ↻ (o ⌥⌘P) |
| El preview truena y la app no | El preview no tiene los datos que la app sí | Mándale datos de prueba completos |

**¿Visto en clase?** ✅ Clase 3 (`#Preview`), Clase 6B (`.constant` para `@Binding`).
**En el repo:** `06_MultiplesPantallas/EditarNicknameView.swift` (preview con `.constant`).

---

## 3.6 Modificadores y por qué importa el orden

🔎 modificador, modifier, encadenar, orden de modificadores, padding background orden, frame background, por que no se ve el fondo, modifiers order

**Qué es:** los elementos (Text, Image, Button…) tienen propiedades que se cambian con **modificadores**
(Clase 3). Se escriben con punto, uno debajo de otro. **Cada modificador envuelve a todo lo anterior**, así que
el orden cambia el resultado.

```swift
import SwiftUI

struct OrdenModificadores: View {
    var body: some View {
        VStack(spacing: 30) {
            // A) padding ANTES del fondo → el fondo incluye el margen (botón "gordito")
            Text("A) padding → background")
                .padding()
                .background(Color.yellow)

            // B) fondo ANTES del padding → el fondo queda pegado al texto y el margen queda afuera, transparente
            Text("B) background → padding")
                .background(Color.yellow)
                .padding()

            // C) frame ANTES del fondo → el fondo ocupa todo el frame
            Text("C) frame → background")
                .frame(width: 250, height: 60)
                .background(Color.mint)

            // D) fondo ANTES del frame → el fondo solo cubre el texto
            Text("D) background → frame")
                .background(Color.mint)
                .frame(width: 250, height: 60)
        }
    }
}
```

```
A) padding → background        B) background → padding
┌──────────────────────┐
│                      │          ┌────────────────┐
│   A) padding → bg    │          │B) bg → padding │   (margen invisible alrededor)
│                      │          └────────────────┘
└──────────────────────┘
```

**Reglas que se aplican siempre:**

| Regla | Ejemplo |
|---|---|
| Primero el margen, luego el fondo, luego las esquinas | `.padding()` → `.background(color)` → `.cornerRadius(12)` (así lo hace la Clase 17) |
| En imágenes, `.resizable` va **primero** (sin él, `.frame` no hace nada) | `.resizable(resizingMode: .stretch)` → `.aspectRatio(contentMode: .fit)` → `.frame(width: 200)` |
| Si quieres que el fondo de un botón ocupe todo el ancho, el `.frame(maxWidth: .infinity)` va **dentro** del label | ver parte 4 |
| La sombra y el borde van **después** del recorte | `.clipShape(.circle)` → `.overlay { … }` → `.shadow(…)` |

**¿Visto en clase?** ✅ Clase 3 ("Modificadores (Modifiers)"), Clase 5A (orden de la imagen circular), Clase 17 (`.padding(12).background(.purple).foregroundStyle(.white).cornerRadius(12)`).
**En el repo:** `02_PrimeraApp/ModificadoresView.swift` bloque 1 ("El orden importa").

---

## 3.7 Modificadores con condición y modificadores que heredan los hijos

🔎 modificador condicional, cambiar color segun valor, ternario en modificador, aplicar a todos, font al vstack, heredar estilo, environment

**Modificador con condición:** usa un ternario **dentro** del modificador. Así no duplicas la vista.

```swift
import SwiftUI

struct BotonSegunEstado: View {
    @State private var activo = false

    var body: some View {
        Text(activo ? "Activado" : "Desactivado")
            .padding()
            .background(activo ? Color.green : Color.gray)      // color según el estado
            .foregroundStyle(.white)
            .cornerRadius(12)
            .opacity(activo ? 1 : 0.6)                           // número según el estado
            .onTapGesture {
                activo.toggle()
            }
    }
}
```

**Modificadores que heredan los hijos:** algunos modificadores puestos en un contenedor (VStack, HStack) se
aplican a **todo lo de adentro**: `.font`, `.foregroundStyle`, `.bold`, `.tint`, `.multilineTextAlignment`,
`.disabled`. Si un hijo trae su propio modificador, gana el del hijo.

```swift
import SwiftUI

struct HerenciaDeEstilo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Todos en título 2 y morados")
            Text("Yo también")
            Text("Yo soy rojo (mi modificador gana)")
                .foregroundStyle(.red)
        }
        .font(.title2)
        .foregroundStyle(.purple)
    }
}
```

> `.padding`, `.background` y `.frame` **no** se heredan: se aplican al contenedor completo.

**¿Visto en clase?** Ternario: ✅ Clase 2. Herencia de modificadores: ⚠️ (es comportamiento normal de SwiftUI, no se explicó en clase).
**En el repo:** `02_PrimeraApp/TextosView.swift` · `03_ElementosUI/SliderYToggleView.swift` (Label que cambia de ícono con ternario).

---
## 3.8 Text

🔎 text, texto, label de texto, font, fuente, tamaño de letra, negritas, bold, cursiva, italic, subrayado, underline, color de letra, foregroundStyle, foregroundColor, alinear texto, centrar texto, varias lineas, lineLimit, mayusculas, interpolacion, mostrar variable en texto

**Qué es:** muestra texto de solo lectura (no se puede escribir en él; para eso es `TextField`, parte 4).

**Cuándo usarlo:** títulos, etiquetas, resultados, mensajes, cualquier dato que se muestre.

### 3.8.1 Formas de crear un Text

```swift
import SwiftUI

struct FormasDeText: View {
    let nombre = "Ana"
    let edad = 20
    let promedio = 9.456
    let precio = 185.5

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Hola Mundo")                                   // texto fijo
            Text(nombre)                                          // una variable String
            Text("Hola, \(nombre). Tienes \(edad) años")          // interpolación \( )
            Text("Promedio: \(promedio, specifier: "%.1f")")      // Double con 1 decimal → 9.5
            Text(precio, format: .currency(code: "MXN"))          // $185.50
            Text(promedio, format: .number.precision(.fractionLength(2)))   // 9.46
            Text("Año: \(2026, format: .number.grouping(.never))")          // 2026 (sin coma)
        }
    }
}
```

| Quiero mostrar… | Escribe | Resultado |
|---|---|---|
| Un `Int` dentro de texto | `Text("Edad: \(edad)")` | Edad: 20 |
| Un `Double` con 2 decimales | `Text("\(precio, specifier: "%.2f")")` | 185.50 |
| Un `Double` sin decimales | `Text("\(Int(valor))")` | 185 |
| Dinero en pesos | `Text(precio, format: .currency(code: "MXN"))` | $185.50 |
| Porcentaje (0.75 → 75 %) | `Text(0.75, format: .percent)` ⚠️ | 75 % |
| Un año sin coma | `Text("\(anio, format: .number.grouping(.never))")` | 2026 |
| Un Bool como Sí/No | `Text(esFavorito ? "Sí" : "No")` | Sí |
| Una fecha en español | `Text(textoFecha(fecha: miFecha))` con `DateFormatter` (parte 2) | 15 de octubre de 2026 |
| Una fecha rápido ⚠️ | `Text(miFecha, style: .date)` | sale en el idioma del iPhone |
| Un correo sin que se ponga azul | `Text(verbatim: "ana@tec.mx")` ⚠️ | ana@tec.mx (negro) |

> **Ojo:** `specifier:` solo funciona **dentro** de un `Text("…\( )")`. Para armar un `String` con decimales fuera de un Text usa
> `String(format: "%.2f", valor)` ⚠️ o `valor.formatted(.number.precision(.fractionLength(2)))` (Clase 3B).

### 3.8.2 Tamaños de fuente del sistema

Se usan con `.font(.estilo)`. Se adaptan solos si el usuario agranda la letra del iPhone (accesibilidad).

| Estilo | Tamaño aprox. (pt) | Para qué |
|---|---|---|
| `.largeTitle` | 34 | Título principal de pantalla |
| `.title` | 28 | Título |
| `.title2` | 22 | Subtítulo grande / sección |
| `.title3` | 20 | Subtítulo |
| `.headline` | 17, seminegrita | Encabezado de bloque, nombre en un renglón |
| `.body` | 17 | Texto normal (el default) |
| `.callout` | 16 | Texto secundario |
| `.subheadline` | 15 | Subtítulo de un renglón |
| `.footnote` | 13 | Notas |
| `.caption` | 12 | Pie de foto, etiquetas chicas |
| `.caption2` | 11 | Lo más pequeño |

**Tamaño exacto (tip de la Clase 5A):** `.font(.system(size: 21))`.

```swift
import SwiftUI

struct FuentesEjemplo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Tamaño exacto (Clase 5A)")
                .font(.system(size: 21))
            Text("Tamaño + grosor + diseño")
                .font(.system(size: 24, weight: .bold, design: .rounded))       // ⚠️ weight y design
            Text("Solo el grosor")
                .fontWeight(.semibold)                                           // ⚠️
            Text("Estilo del sistema + negritas")
                .font(.title2)
                .bold()
            Text("Monoespaciado 12345")
                .font(.system(.body, design: .monospaced))                       // ⚠️
        }
    }
}
```

| Grosores (`weight:` / `.fontWeight`) ⚠️ | Diseños (`design:`) ⚠️ |
|---|---|
| `.ultraLight`, `.thin`, `.light`, `.regular`, `.medium`, `.semibold`, `.bold`, `.heavy`, `.black` | `.default`, `.rounded` (redondita), `.serif` (con patitas), `.monospaced` (todas las letras del mismo ancho) |

### 3.8.3 Todos los modificadores útiles de Text

| Modificador | Qué hace | Ejemplo | ¿Clase? |
|---|---|---|---|
| `.font(.title)` | Tamaño/estilo | `.font(.largeTitle)` | ✅ |
| `.font(.system(size: 21))` | Tamaño exacto | `.font(.system(size: 36))` | ✅ 5A, 10 |
| `.bold()` | Negritas | `Text("Hola").bold()` | ✅ |
| `.italic()` | Cursiva | `.italic()` | ⚠️ |
| `.underline()` | Subrayado | `.underline(true, color: .blue)` | ⚠️ |
| `.strikethrough()` | Tachado | `.strikethrough(tareaHecha)` | ⚠️ |
| `.foregroundStyle(.red)` | Color de la letra | `.foregroundStyle(.white)` | ✅ 3, 15, 17 |
| `.foregroundColor(.red)` | Color de la letra (forma vieja, igual de válida) | `.foregroundColor(.blue)` | ✅ (skill/tareas) |
| `.multilineTextAlignment(.center)` | Alinea las líneas de un texto largo | `.leading` / `.center` / `.trailing` | ⚠️ |
| `.lineLimit(2)` | Máximo de líneas (corta con "…") | `.lineLimit(1)` | ⚠️ |
| `.lineSpacing(6)` | Espacio entre líneas | `.lineSpacing(4)` | ⚠️ |
| `.kerning(2)` / `.tracking(2)` | Espacio entre letras | `.tracking(1.5)` | ⚠️ |
| `.textCase(.uppercase)` | TODO EN MAYÚSCULAS (o `.lowercase`) | `.textCase(.uppercase)` | ⚠️ |
| `.minimumScaleFactor(0.5)` | Si no cabe, achica la letra hasta 50 % | junto con `.lineLimit(1)` | ⚠️ |
| `.truncationMode(.middle)` | Dónde poner los "…" | `.head` / `.middle` / `.tail` | ⚠️ |
| `.monospaced()` | Letras del mismo ancho | para números o código | ⚠️ |
| `.padding()` | Margen alrededor | `.padding(8)` | ✅ |
| `.background(color)` | Fondo detrás del texto | `.background(.purple)` | ✅ 17 |
| `.frame(maxWidth: .infinity, alignment: .leading)` | Que el texto ocupe todo el ancho y se pegue a la izquierda | | ✅ 3 |

```swift
import SwiftUI

struct TextoLargoEjemplo: View {
    let descripcion = "Una descripción larguísima que no cabe en una sola línea y que necesita acomodarse bien en la pantalla del iPhone."

    var body: some View {
        VStack(spacing: 16) {
            Text(descripcion)
                .multilineTextAlignment(.center)     // líneas centradas
                .lineSpacing(4)

            Text(descripcion)
                .lineLimit(2)                        // máximo 2 líneas, luego "…"

            Text("Etiqueta")
                .font(.caption)
                .bold()
                .textCase(.uppercase)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(Color.orange)
                .foregroundStyle(.white)
                .cornerRadius(8)
        }
        .padding()
    }
}
```

### 3.8.4 Combinar estilos en un mismo renglón

```swift
import SwiftUI

struct TextoCombinado: View {
    let nombre = "Ana"

    var body: some View {
        VStack(spacing: 12) {
            // Opción 1: un HStack con varios Text (la más fácil de explicar)
            HStack(spacing: 4) {
                Text("Hola,")
                Text(nombre).bold().foregroundStyle(.purple)
            }

            // Opción 2: un Text dentro de otro con interpolación ⚠️
            Text("Hola, \(Text(nombre).bold())")
        }
    }
}
```

> ⚠️ Antes se usaba `Text("a") + Text("b")`. En Xcode 26 (iOS 26) sale un **warning amarillo** de que está
> obsoleto ("deprecated"). Usa el HStack o la interpolación.

### 3.8.5 Markdown dentro de un Text ⚠️

Un texto **escrito directo entre comillas** entiende markdown: `Text("**negritas**, *cursiva* y [liga](https://apple.com)")`.
Un `String` guardado en una variable **no** (se ve con los asteriscos). Si escribes un correo como `"ana@tec.mx"`
directo en un `Text` o en un `TextField`, a veces se pone azul como liga: usa `Text(verbatim: "ana@tec.mx")`.

**Errores comunes:**

| Error / síntoma | Por qué | Arreglo |
|---|---|---|
| `No exact matches in call to initializer` en `Text(edad)` | `Text` no acepta un `Int` directo | `Text("\(edad)")` o `Text(edad, format: .number)` |
| `Incorrect argument label in call (have '_:specifier:', expected '_:default:')` | Usaste `specifier:` en un `String`, fuera de un `Text("\( )")` | Ponlo dentro de un `Text`, o usa `valor.formatted(.number.precision(.fractionLength(2)))` |
| El texto sale "Optional("Ana")" | Interpolaste un opcional | Desempácalo con `if let` o da un valor por defecto (parte 2) |
| El texto se corta con "…" | No cabe en el ancho | Quita `.lineLimit`, o usa `.minimumScaleFactor`, o un `ScrollView` |
| Warning: `'+' was deprecated in iOS 26.0` | `Text + Text` | Usa interpolación o un HStack |

**¿Visto en clase?** ✅ Clase 3 (Text, modificadores), Clase 3B (formato de números), Clase 5A (`.font(.system(size: 21))`).
**En el repo:** `02_PrimeraApp/TextosView.swift` (bloques 1–8) · `01_SwiftBasico/FechasYNumerosView.swift` (formatos de números y fechas).

---

## 3.9 Label

🔎 label, icono con texto, texto con icono, Label systemImage, etiqueta con imagen

**Qué es:** un texto con un ícono (SF Symbol) a la izquierda, ya alineados. Se usa mucho en botones y en las
pestañas del `TabView`.

```swift
import SwiftUI

struct LabelEjemplos: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Seleccionar Foto", systemImage: "photo.on.rectangle")     // Clase 17
            Label("Inicio", systemImage: "house.fill")
                .font(.title2)
                .foregroundStyle(.purple)
            Label("Solo el ícono", systemImage: "star.fill")
                .labelStyle(.iconOnly)                                       // ⚠️
            Label("Solo el texto", systemImage: "star.fill")
                .labelStyle(.titleOnly)                                      // ⚠️
        }
    }
}
```

| Uso | Ejemplo |
|---|---|
| En un botón (Clase 3) | `Button(action: CalcularValor) { Label("Add Folder", systemImage: "folder.badge.plus") }` |
| En una pestaña (Clase 7) | `.tabItem { Label("Inicio", systemImage: "house.circle") }` |
| En el PhotosPicker (Clase 17) | `Label("Seleccionar Foto", systemImage: "photo.on.rectangle")` |

**¿Visto en clase?** ✅ Clase 3, 7 y 17. `.labelStyle`: ⚠️.
**En el repo:** `02_PrimeraApp/TextosView.swift` bloque 7 · `03_ElementosUI/BotonesView.swift` bloque 3.

---

## 3.10 Image de Assets

🔎 imagen, image, foto, assets, agregar imagen, resizable, aspectRatio, fit, fill, imagen muy grande, imagen deformada, imagen circular, redonda, borde, sombra, clipShape, scaledToFit, scaledToFill, clipped

**Qué es:** muestra una imagen que agregaste al proyecto (en `Assets.xcassets`).

### 3.10.1 Agregar una imagen (Clase 3)

1. En el navegador del proyecto abre **Assets.xcassets**.
2. **Arrastra y suelta** la imagen (png/jpg) desde Finder.
3. El nombre que aparece en Assets (ej. `Gravity`) es el que escribes en `Image("Gravity")`. **Respeta mayúsculas.**

### 3.10.2 Forma de clase (el orden importa)

```swift
import SwiftUI

struct ImagenDeClase: View {
    var body: some View {
        Image("foto1")                                    // ✏️ nombre exacto del asset
            .resizable(resizingMode: .stretch)            // 1. da PERMISO de cambiar tamaño
            .aspectRatio(contentMode: .fit)               // 2. no se deforma; cabe completa
            .frame(width: 200)                            // 3. tamaño final
    }
}
```

**Por qué ese orden:** una imagen sin `.resizable` se dibuja con su tamaño real (por eso "queda muy grande",
lámina 21) y **`.frame` no la achica**. `.resizable` le da permiso de cambiar de tamaño; `.aspectRatio` cuida que
no se estire feo; `.frame` decide el tamaño.

### 3.10.3 `.fit` vs `.fill`

| `contentMode` | Qué hace | Cuándo |
|---|---|---|
| `.fit` (clase) | Cabe **completa** dentro del frame; puede sobrar espacio a los lados | Fotos de producto, logos, cuando no quieres cortar nada |
| `.fill` ⚠️ | **Llena** todo el frame; lo que sobra se sale (hay que cortarlo con `.clipped()`) | Portadas, fondos, miniaturas cuadradas de fotos rectangulares |

```swift
import SwiftUI

struct FitVsFill: View {
    var body: some View {
        HStack(spacing: 16) {
            Image("foto1")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
                .background(Color.gray.opacity(0.2))      // se ve el espacio que sobra

            Image("foto1")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)          // ⚠️
                .frame(width: 140, height: 140)
                .clipped()                                // ⚠️ corta lo que se sale del frame
        }
    }
}
```

> `.scaledToFit()` = `.aspectRatio(contentMode: .fit)` y `.scaledToFill()` = `.aspectRatio(contentMode: .fill)`.
> Son lo mismo escrito más corto. La profe usa la forma larga.
> `.resizable()` a secas también funciona; la forma de clase es `.resizable(resizingMode: .stretch)`.

### 3.10.4 Imagen circular con borde y sombra (Clase 5A)

```swift
import SwiftUI

struct FotoCircular: View {
    var body: some View {
        Image("perfil")                                   // ✏️
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .clipShape(.circle)                           // recorta en círculo
            .overlay {
                Circle().stroke(.orange, lineWidth: 5)    // borde
            }
            .shadow(color: .orange, radius: 5)            // sombra
            .frame(width: 150)
    }
}
```

> Para que quede un **círculo perfecto** la imagen debe ser cuadrada. Si es rectangular, usa
> `.aspectRatio(contentMode: .fill)` + `.frame(width: 150, height: 150)` + `.clipShape(.circle)`.

### 3.10.5 Esquinas redondeadas con borde

```swift
import SwiftUI

struct FotoEsquinas: View {
    var body: some View {
        Image("foto2")
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: 220)
            .cornerRadius(12)                                         // esquinas (forma de la Clase 17)
            .overlay(
                RoundedRectangle(cornerRadius: 12)                    // MISMO radio que el cornerRadius
                    .stroke(.purple.opacity(0.4), lineWidth: 1)
            )
    }
}
```

> Si el `cornerRadius` y el borde tienen radios distintos, las esquinas no coinciden.

### 3.10.6 Todos los modificadores de Image

| Modificador | Qué hace | ¿Clase? |
|---|---|---|
| `.resizable(resizingMode: .stretch)` | Permite cambiar tamaño (estirando) | ✅ 3 |
| `.resizable(resizingMode: .tile)` | Repite la imagen como mosaico | ⚠️ |
| `.aspectRatio(contentMode: .fit / .fill)` | Mantiene la proporción | ✅ 3 (`.fit`) |
| `.scaledToFit()` / `.scaledToFill()` | Lo mismo, más corto | ⚠️ (tu tarea actSwift) |
| `.frame(width:height:)` | Tamaño | ✅ 3 |
| `.clipped()` | Corta lo que se sale del frame | ⚠️ |
| `.clipShape(.circle)` | Recorta con una forma | ✅ 5A |
| `.cornerRadius(12)` | Esquinas redondas | ✅ 17 |
| `.overlay { Circle().stroke(…) }` | Dibuja algo encima (borde) | ✅ 5A |
| `.shadow(color:radius:)` | Sombra | ✅ 5A |
| `.opacity(0.5)` | Transparencia | ⚠️ (Color con opacity sí es ✅ 4) |
| `.renderingMode(.template)` + `.foregroundStyle(.red)` | Pinta una imagen de un solo color (íconos png) | ⚠️ |

**Errores comunes:**

| Síntoma | Por qué | Arreglo |
|---|---|---|
| La imagen sale gigante y el `.frame` no hace nada | Falta `.resizable` (o va después del frame) | `.resizable(…)` primero |
| La imagen se ve aplastada/estirada | Falta `.aspectRatio` | Agrega `.aspectRatio(contentMode: .fit)` |
| No aparece nada + consola "No image named 'x' found in asset catalog" | El nombre no coincide (mayúsculas, espacios) o `Image("")` | Copia el nombre exacto de Assets |
| Con `.fill` la imagen tapa otras cosas | Lo que sobra se sale del frame | Agrega `.clipped()` |
| El círculo sale ovalado | Imagen rectangular con `.fit` | Usa `.fill` + `.frame(width:height:)` iguales |

**¿Visto en clase?** ✅ Clase 3 (agregar a Assets, orden de modificadores), Clase 5A (circular con borde y sombra), Clase 17 (`.cornerRadius`).
**En el repo:** `02_PrimeraApp/ImagenesView.swift` (bloques 1–7) · `04_Componentes/Components/PokeImagenView.swift` · `04_Componentes/Components/ImagenCircular.swift`.

---

## 3.11 SF Symbols (íconos del sistema)

🔎 sf symbols, iconos, icon, systemName, imagen del sistema, simbolo, icono de corazon, estrella, casa, camara, basura, lapiz, check, flecha, catalogo de iconos, imageScale

**Qué es:** miles de íconos que ya trae iOS. No hay que agregarlos a Assets. Se usan con `Image(systemName:)`.
Catálogo oficial: app **SF Symbols** (https://developer.apple.com/sf-symbols/). Sin internet: escribe el nombre y,
si no existe, no se ve nada (no truena).

> 🔣 **Sin internet tienes TODOS los íconos en el repo** (carpeta `13_SFSymbols/`):
> - En la app: **13 · SF Symbols → Catálogo completo** (7,006 íconos, buscador, categorías, filtro iOS 17). Toca uno y
>   "Copiar nombre": el portapapeles del simulador se comparte con tu Mac, así que lo pegas en Xcode con ⌘V.
> - **¿Qué ícono uso para…?** en español (300+ por uso: pestañas, acciones, comida, viajes, gym…):
>   `13_SFSymbols/SFSymbols_GUIA.md` o en la app.
> - Lista completa para ⌘F: `13_SFSymbols/SFSymbols_TODOS.md` (nombre, categorías, palabras clave en inglés y desde qué iOS existe).

```swift
import SwiftUI

struct IconosEjemplo: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "globe")                    // como viene en un proyecto nuevo (Clase 3)
                .imageScale(.large)
                .foregroundStyle(.tint)

            Image(systemName: "gamecontroller.fill")      // tamaño con .font
                .font(.system(size: 60))
                .foregroundStyle(.purple)

            Image(systemName: "heart.fill")
                .font(.title)
                .foregroundStyle(.red)

            Image(systemName: "cloud.sun.rain.fill")
                .symbolRenderingMode(.multicolor)         // ⚠️ colores originales del símbolo
                .font(.largeTitle)
        }
    }
}
```

| Modificador | Qué hace | ¿Clase? |
|---|---|---|
| `.font(.system(size: 60))` / `.font(.title)` | Tamaño del ícono (un símbolo se comporta como letra) | ✅ (skill) |
| `.imageScale(.small / .medium / .large)` | Tamaño relativo a la letra | ✅ 3 |
| `.foregroundStyle(.red)` | Color | ✅ 3 |
| `.symbolRenderingMode(.multicolor / .hierarchical / .palette)` | Modo de color | ⚠️ |
| `.resizable(resizingMode: .stretch)` + `.aspectRatio(.fit)` + `.frame` | Tamaño exacto como imagen | ✅ 7 (carrusel con `figure.baseball`) |

> Casi todos tienen versión rellena agregando `.fill` al nombre: `heart` → `heart.fill`, `star` → `star.fill`.
> También `.circle` / `.circle.fill`: `plus.circle.fill`, `xmark.circle.fill`.

### 3.11.1 Catálogo de símbolos útiles

| Categoría | Nombres (`systemName:`) |
|---|---|
| Inicio / navegación | `house`, `house.fill`, `house.circle`, `chevron.right`, `chevron.left`, `chevron.down`, `arrow.left`, `arrow.right`, `arrow.up`, `arrow.down`, `arrow.uturn.backward`, `arrow.clockwise` |
| Listas / menú | `list.bullet`, `list.bullet.rectangle`, `line.3.horizontal`, `square.grid.2x2`, `square.grid.3x3`, `rectangle.grid.1x2`, `ellipsis`, `ellipsis.circle` |
| Agregar / editar / borrar | `plus`, `plus.circle.fill`, `minus`, `minus.circle`, `pencil`, `square.and.pencil`, `trash`, `trash.fill`, `xmark`, `xmark.circle.fill` |
| Confirmar / estado | `checkmark`, `checkmark.circle.fill`, `checkmark.seal.fill`, `exclamationmark.triangle.fill`, `exclamationmark.circle`, `info.circle`, `questionmark.circle`, `bell`, `bell.fill`, `bell.badge` |
| Favoritos / calificación | `heart`, `heart.fill`, `star`, `star.fill`, `star.leadinghalf.filled`, `hand.thumbsup.fill`, `bookmark`, `bookmark.fill`, `flag.fill` |
| Persona / perfil | `person`, `person.fill`, `person.circle`, `person.crop.circle`, `person.crop.circle.fill`, `person.2.fill`, `person.3.fill`, `person.badge.plus` |
| Ajustes | `gear`, `gearshape.fill`, `slider.horizontal.3`, `switch.2`, `wrench.and.screwdriver` |
| Búsqueda / filtro | `magnifyingglass`, `line.3.horizontal.decrease.circle`, `arrow.up.arrow.down` |
| Fotos / cámara | `camera`, `camera.fill`, `photo`, `photo.fill`, `photo.on.rectangle`, `photo.stack`, `photo.badge.plus` |
| Gráficas / datos | `chart.bar.fill`, `chart.bar.xaxis`, `chart.pie.fill`, `chart.line.uptrend.xyaxis`, `percent`, `number` |
| Comunicación | `envelope`, `envelope.fill`, `phone.fill`, `message.fill`, `bubble.left.fill`, `paperplane.fill`, `square.and.arrow.up` (compartir) |
| Tiempo / fechas | `calendar`, `clock`, `clock.fill`, `timer`, `hourglass`, `alarm` |
| Lugares | `map`, `map.fill`, `mappin`, `mappin.and.ellipse`, `location.fill`, `building.2.fill`, `car.fill`, `airplane`, `tram.fill`, `figure.walk` |
| Comida / compras | `fork.knife`, `cup.and.saucer.fill`, `takeoutbag.and.cup.and.straw.fill`, `birthday.cake`, `carrot.fill`, `cart`, `cart.fill`, `bag.fill`, `creditcard.fill`, `dollarsign.circle.fill`, `tag.fill`, `gift.fill` |
| Escuela / trabajo | `book.fill`, `books.vertical.fill`, `graduationcap.fill`, `pencil.and.outline`, `doc.text`, `doc.richtext.fill`, `folder.fill`, `folder.badge.plus`, `briefcase.fill`, `lightbulb.fill` |
| Entretenimiento | `music.note`, `music.note.list`, `play.fill`, `pause.fill`, `stop.fill`, `film`, `tv.fill`, `gamecontroller.fill`, `headphones`, `ticket.fill` |
| Deporte / salud | `figure.run`, `figure.baseball`, `dumbbell.fill`, `sportscourt.fill`, `soccerball`, `basketball.fill`, `heart.text.square.fill`, `bolt.heart.fill`, `cross.case.fill`, `pills.fill` |
| Clima / naturaleza | `sun.max.fill`, `moon.fill`, `cloud.fill`, `cloud.rain.fill`, `snowflake`, `flame.fill`, `leaf.fill`, `tree.fill`, `drop.fill`, `bolt.fill`, `globe`, `pawprint.fill`, `hare.fill`, `tortoise.fill` |
| Seguridad / cuenta | `lock.fill`, `lock.open.fill`, `key.fill`, `eye`, `eye.slash`, `shield.fill`, `rectangle.portrait.and.arrow.right` (cerrar sesión) |
| Dispositivo | `iphone`, `wifi`, `battery.100`, `speaker.wave.3.fill`, `speaker.slash.fill`, `qrcode`, `barcode` |

**Errores comunes:** el ícono no aparece → el nombre está mal escrito (no marca error, solo sale vacío). Revisa
puntos y mayúsculas: es `person.crop.circle`, no `personCropCircle`.

**¿Visto en clase?** ✅ Clase 3 (`globe`, `.imageScale`, `folder.badge.plus`), Clase 7 (`house.circle`, `doc.richtext.fill`, `bolt.heart.fill`), Clase 17 (`photo.on.rectangle`, `camera.fill`).
**En el repo:** `02_PrimeraApp/ImagenesView.swift` bloque 5.

---

## 3.12 Image(uiImage:) (fotos de la galería o de la cámara)

🔎 uiimage, Image(uiImage:), mostrar foto elegida, foto de la camara, foto de galeria, UIImage opcional

**Qué es:** las fotos que eliges con `PhotosPicker` o tomas con `CamaraPicker` llegan como `UIImage` (una imagen de
UIKit), no como nombre de asset. Se muestran con `Image(uiImage:)`. Como casi siempre la variable es **opcional**
(`UIImage?`), primero se desempaca con `if let` (Clase 17):

```swift
import SwiftUI

struct MostrarUIImage: View {
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        if let selectedImageBien = selectedImage {
            Image(uiImage: selectedImageBien)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
        } else {
            Text("Seleccionar imagen")
                .foregroundStyle(.gray)
        }
    }
}
```

| Escribes | Qué espera |
|---|---|
| `Image("foto1")` | El **nombre** de una imagen en Assets (String) |
| `Image(systemName: "star")` | El nombre de un SF Symbol |
| `Image(uiImage: miFoto)` | Un `UIImage` (NO opcional) |

**Error común:** `Value of optional type 'UIImage?' must be unwrapped` → le pasaste el opcional directo a `Image(uiImage:)`. Usa `if let`.
**¿Visto en clase?** ✅ Clase 17. **En el repo:** `10_FotosYCamara/SeleccionarFotoView.swift` (paso F). Más en la **parte 8**.

---

## 3.13 Colores

🔎 color, colores, Color(red:green:blue:), rgb, dividir entre 255, opacity, opacidad, transparente, colores del sistema, Color.clear, primary, secondary, tint, accentColor, flatuicolors, codigo de color, hex

**Qué es:** `Color` es la clase que se usa para color de letra, de fondo, de bordes (Clase 4).

### 3.13.1 Formas de crear un color

```swift
import SwiftUI

struct FormasDeColor: View {
    let azulPropio = Color(red: 116/255, green: 185/255, blue: 255/255)                    // RGB (Clase 4)
    let azulTransparente = Color(red: 116/255, green: 185/255, blue: 255/255, opacity: 0.5) // con opacidad (alpha)

    var body: some View {
        VStack(spacing: 10) {
            Color.yellow.frame(height: 40)                  // color del sistema (Clase 4: Color.yellow, Color.white)
            azulPropio.frame(height: 40)
            azulTransparente.frame(height: 40)
            Color.purple.opacity(0.3).frame(height: 40)     // un color del sistema con transparencia
            Color.clear.frame(height: 40)                   // invisible (ocupa espacio)
        }
        .padding()
    }
}
```

> **Por qué `/255`:** las páginas de colores dan el RGB de 0 a 255, pero SwiftUI espera un número de 0 a 1. Al dividir
> entre 255 lo conviertes (Clase 4: "observa que el código de cada color se divide entre 255").
> Si escribes `Color(red: 116, green: 185, blue: 255)` sin dividir, todo sale **blanco**.

### 3.13.2 Colores del sistema

| Colores | Se adaptan solos a modo oscuro |
|---|---|
| `.red`, `.orange`, `.yellow`, `.green`, `.mint`, `.teal`, `.cyan`, `.blue`, `.indigo`, `.purple`, `.pink`, `.brown` | Sí (cambian un poco de tono) |
| `.gray`, `.black`, `.white` | `.black` y `.white` **no** cambian |
| `.primary` (negro en claro / blanco en oscuro), `.secondary` (gris) | Sí: ideales para texto |
| `.clear` (transparente) | — |
| `Color(.systemGray6)` ⚠️ (gris muy clarito de iOS, para tarjetas) | Sí |

### 3.13.3 Dónde se usa un color

| Para… | Modificador | Ejemplo |
|---|---|---|
| La letra o un ícono | `.foregroundStyle(color)` | `.foregroundStyle(.white)` |
| El fondo de un elemento | `.background(color)` | `.background(Color.purple)` |
| Toda la pantalla | `ZStack { color.ignoresSafeArea() … }` | ver 3.15 |
| Botones, toggles, sliders, pestañas | `.tint(color)` | `.tint(.purple)` (Clase 4, 7) |
| Un borde | `.overlay { RoundedRectangle(cornerRadius: 12).stroke(color, lineWidth: 2) }` | |
| Una sombra | `.shadow(color: color, radius: 5)` | |

### 3.13.4 Herramientas de la Clase 4 (necesitan internet: úsalas antes del examen)

| Herramienta | Para qué |
|---|---|
| https://flatuicolors.com/ | Copiar códigos de colores (eliges formato RGB y das clic) |
| https://coolors.co/contrast-checker/ | Revisar que la letra se lea sobre el fondo (contraste) |
| https://coolors.co/image-picker | Sacar una paleta de colores de una imagen |

**Errores comunes:**

| Síntoma | Por qué | Arreglo |
|---|---|---|
| El color sale blanco | No dividiste entre 255 | `Color(red: 116/255, …)` |
| `Cannot convert value of type 'Int' to expected argument type 'Double'` | Escribiste `116 / 255` con variables `Int` | Usa literales (`116/255`) o `Double(r)/255` |
| El texto no se lee en modo oscuro | Fondo fijo claro + letra `.primary` (que se vuelve blanca) | Fija el color de letra o usa `.preferredColorScheme(.light)` (3.17) |

**¿Visto en clase?** ✅ Clase 4 (Color, RGB/255, opacity, herramientas), Clase 3 (fondo).
**En el repo:** `02_PrimeraApp/ColoresYFondosView.swift` bloques 1–3, 6.

---

## 3.14 Paleta de colores en Utils (sin static)

🔎 paleta, palette, colores de la app, esquema de color, monocromatico, analogo, utils, centralizar colores, contraste, rubrica colores

**Qué es:** un archivo en la carpeta `Utils/` donde defines **una sola vez** los colores de tu app. Así todas las
pantallas usan los mismos colores y un cambio se hace en un solo lugar. La rúbrica pide un esquema
**monocromático** o **análogo** y buen contraste.

**Cómo se escribe (sin `static`, como `let` globales):**

```swift
// Utils/Paleta.swift
import SwiftUI

// Esquema MONOCROMÁTICO: un solo tono (morado) en distintas luminosidades.
let paletaFondo      = Color(red: 245/255, green: 243/255, blue: 255/255)   // casi blanco morado
let paletaSuperficie = Color(red: 221/255, green: 214/255, blue: 254/255)   // tarjetas
let paletaPrimario   = Color(red: 124/255, green:  58/255, blue: 237/255)   // botones, íconos
let paletaOscuro     = Color(red:  91/255, green:  33/255, blue: 182/255)   // títulos
let paletaTexto      = Color(red:  30/255, green:  20/255, blue:  50/255)   // texto normal
```

**Cómo se usa en cualquier vista** (sin importar nada extra, porque son globales del proyecto):

```swift
import SwiftUI

let colorFondoApp = Color(red: 245/255, green: 243/255, blue: 255/255)
let colorPrimarioApp = Color(red: 124/255, green: 58/255, blue: 237/255)
let colorTextoApp = Color(red: 30/255, green: 20/255, blue: 50/255)

struct PantallaConPaleta: View {
    var body: some View {
        ZStack {
            colorFondoApp
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("Mis Antojos")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(colorTextoApp)

                Button("Agregar") {
                }
                .buttonStyle(.borderedProminent)
                .tint(colorPrimarioApp)
            }
        }
    }
}

#Preview {
    PantallaConPaleta()
}
```

| Esquema | Qué es | Ejemplo |
|---|---|---|
| **Monocromático** | Un solo color (matiz) en tonos claros y oscuros | morado muy claro, morado medio, morado oscuro |
| **Análogo** | Colores vecinos en el círculo cromático | morado + azul + azul verdoso |
| ❌ Ni uno ni otro | Colores opuestos o al azar | rojo + verde + morado |

**Contraste (se califica):** texto oscuro sobre fondo claro o texto blanco sobre fondo oscuro. Revísalo en
coolors.co/contrast-checker antes del examen. No pongas texto sobre una foto sin un fondo o degradado detrás.

**Ver tu paleta en el Canvas:** agrega un preview que dibuje los colores:

```swift
import SwiftUI

let muestraFondo = Color(red: 245/255, green: 243/255, blue: 255/255)
let muestraPrimario = Color(red: 124/255, green: 58/255, blue: 237/255)
let muestraTexto = Color(red: 30/255, green: 20/255, blue: 50/255)

#Preview {
    HStack(spacing: 0) {
        muestraFondo
        muestraPrimario
        muestraTexto
    }
    .frame(height: 100)
}
```

> **Otra forma que vas a ver:** la skill del curso usa `struct Palette { static let fondo = … }` y se llama
> `Palette.fondo`. Funciona igual, pero usa `static`. Con `let` globales no necesitas `static`.
> **Nombres únicos:** como son globales, no puede haber dos `let paletaFondo` en todo el proyecto.

**¿Visto en clase?** Colores RGB ✅ Clase 4. Esquemas monocromático/análogo y paleta en Utils ✅ (rúbrica de las tareas y skill). `let` global: ⚠️ técnica de Swift, no de una lámina (es la forma más simple de no usar `static`).
**En el repo:** `00_AppCompleta/Utils/PaletaMascotas.swift` · `02_PrimeraApp/ColoresYFondosView.swift` bloques 4, 5 y 7.

---

## 3.15 Fondo de pantalla completa y safe area

🔎 fondo, background, color de fondo, fondo completo, pantalla completa, ignoresSafeArea, safe area, area segura, notch, isla dinamica, fondo no llega arriba, edgesIgnoringSafeArea

**Qué es la safe area (área segura):** la zona de la pantalla donde no estorban la isla dinámica/notch de arriba ni
la barrita de abajo. SwiftUI acomoda tu contenido **dentro** de esa zona. Por eso un fondo de color "no llega
hasta arriba" a menos que le digas `.ignoresSafeArea()`.

**Las 2 opciones de la Clase 3:**

```swift
import SwiftUI

// OPCIÓN 1: ZStack principal con el color hasta atrás (la más usada)
struct FondoOpcion1: View {
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()      // solo el COLOR se sale de la safe area

            VStack {
                Text("La interfaz va aquí")
                    .foregroundStyle(.white)
            }
        }
    }
}

// OPCIÓN 2: background al VStack principal
struct FondoOpcion2: View {
    var body: some View {
        VStack {
            Text("La interfaz va aquí")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)   // el VStack ocupa toda la pantalla
        .background(Color.purple)
        .ignoresSafeArea()
    }
}
```

> **Cuál usar:** la **opción 1**. En la opción 2, el `.ignoresSafeArea()` también afecta al contenido, que puede
> quedar debajo de la isla dinámica. En la opción 1 solo el color se sale y el contenido se queda en la zona segura.

| Variante | Qué hace |
|---|---|
| `.ignoresSafeArea()` | Se sale por todos los lados |
| `.ignoresSafeArea(edges: .top)` ⚠️ | Solo por arriba (`.bottom`, `.horizontal`…) |
| `.ignoresSafeArea(.keyboard)` ⚠️ | Que el teclado no empuje la vista hacia arriba |
| `.edgesIgnoringSafeArea(.all)` | Forma vieja (obsoleta); usa `.ignoresSafeArea()` |

**Con NavigationStack, List o ScrollView:**

```swift
import SwiftUI

struct FondoConNavegacion: View {
    let colorFondo = Color(red: 245/255, green: 243/255, blue: 255/255)

    var body: some View {
        NavigationStack {
            ZStack {
                colorFondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 16) {
                        Text("Contenido")
                    }
                    .padding()
                }
            }
            .navigationTitle("Inicio")
        }
    }
}
```

> Para un `List` el fondo se pone diferente: `.scrollContentBackground(.hidden)` + `.background(color)` (parte 6).

**Errores comunes:**

| Síntoma | Por qué | Arreglo |
|---|---|---|
| Queda una franja blanca arriba o abajo | Falta `.ignoresSafeArea()` en el color | Agrégalo al `Color` |
| El contenido queda debajo de la isla dinámica | Pusiste `.ignoresSafeArea()` al contenedor (opción 2) | Usa la opción 1 |
| El fondo no ocupa toda la pantalla (opción 2) | Falta `.frame(maxWidth: .infinity, maxHeight: .infinity)` | Agrégalo **antes** del `.background` |
| El `List` sigue gris | El List dibuja su propio fondo | `.scrollContentBackground(.hidden)` |

**¿Visto en clase?** ✅ Clase 3 (opción 1 y opción 2).
**En el repo:** `02_PrimeraApp/FondoPantallaCompletaView.swift` · `02_PrimeraApp/MiPrimeraAppView.swift` bloque 4.

---

## 3.16 Degradados ⚠️

🔎 degradado, gradiente, gradient, LinearGradient, RadialGradient, fondo degradado, sombra para leer texto sobre foto

**Qué es:** un fondo que pasa de un color a otro. No se vio en clase.

```swift
import SwiftUI

struct DegradadosEjemplo: View {
    var body: some View {
        VStack(spacing: 16) {
            // De arriba hacia abajo
            LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom)
                .frame(height: 100)
                .cornerRadius(12)

            // En diagonal
            LinearGradient(colors: [.orange, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 100)
                .cornerRadius(12)

            // Circular, desde el centro
            RadialGradient(colors: [.yellow, .orange], center: .center, startRadius: 5, endRadius: 120)
                .frame(height: 100)
                .cornerRadius(12)

            // Rápido: degradado suave de un solo color
            Text("Botón")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.gradient)
                .foregroundStyle(.white)
                .cornerRadius(12)
        }
        .padding()
    }
}
```

| Puntos de inicio/fin | `.top`, `.bottom`, `.leading`, `.trailing`, `.center`, `.topLeading`, `.topTrailing`, `.bottomLeading`, `.bottomTrailing` |
|---|---|

**Truco muy útil:** degradado de transparente a negro encima de una foto para que el texto blanco se lea (ver 3.25 "Texto sobre imagen").
**Cómo explicarlo:** "LinearGradient recibe una lista de colores y de dónde a dónde se pinta."
**En el repo:** `02_PrimeraApp/ColoresYFondosView.swift` bloque 8 · `05_Layouts/CapasZStackView.swift` bloque 3.

---

## 3.17 Modo oscuro y `.preferredColorScheme` ⚠️

🔎 modo oscuro, dark mode, modo claro, light mode, preferredColorScheme, texto blanco no se ve, colores cambian solos

**Qué es:** el iPhone puede estar en modo claro u oscuro. Los colores del sistema (`.primary`, `.blue`, el fondo de
un `List`) cambian solos. **Tus colores RGB no cambian.** Si tu fondo es claro fijo pero la letra es `.primary`,
en modo oscuro la letra se vuelve blanca sobre fondo claro y no se lee.

**Soluciones:**
1. Usa **tus** colores para letra y fondo (de tu paleta), no `.primary`.
2. O fuerza modo claro en la vista raíz (lo usaste en tu tarea Movil2):

```swift
import SwiftUI

struct RaizSiempreClara: View {
    var body: some View {
        TabView {
            Text("Inicio")
                .tabItem { Label("Inicio", systemImage: "house") }
        }
        .preferredColorScheme(.light)        // ⚠️ toda la app en modo claro
    }
}
```

**Probarlo:** en el Canvas, botón de "Variants" → Color Scheme. En el simulador: Settings → Developer → Dark Appearance,
o en Xcode menú Features (con el simulador) → Toggle Appearance (⇧⌘A).
**Cómo explicarlo:** "Mi diseño usa fondos claros fijos, así que forcé modo claro para que el contraste no cambie."
**En el repo:** `05_Layouts/DashboardView.swift` · `00_AppCompleta/Views/AppCompletaView.swift`.

---
## 3.18 Stacks: VStack, HStack, ZStack

🔎 stack, vstack, hstack, zstack, vertical, horizontal, encima, uno sobre otro, acomodar, contenedor, apilar, columnas, filas, anidar stacks

**Qué es:** los contenedores que acomodan vistas (Clase 3).

| Stack | Acomoda | Dibujo |
|---|---|---|
| `VStack` | Vertical (uno debajo de otro) | `[A]` arriba, `[B]` abajo |
| `HStack` | Horizontal (uno al lado de otro) | `[A][B]` |
| `ZStack` | En profundidad (uno **encima** de otro; el último queda hasta adelante) | `[B]` tapa a `[A]` |

```swift
import SwiftUI

struct StacksEjemplo: View {
    var body: some View {
        VStack(spacing: 20) {                       // vertical
            HStack(spacing: 12) {                   // horizontal
                Image(systemName: "star.fill")
                Text("Al lado de la estrella")
            }

            ZStack {                                // encimados
                Circle()
                    .fill(Color.purple)
                    .frame(width: 100, height: 100)
                Text("Encima")                      // el último va hasta adelante
                    .foregroundStyle(.white)
            }
        }
    }
}
```

"Se pueden meter Stacks dentro de Stacks para generar una mejor organización" (Clase 3). Una pantalla normal es
un `VStack` grande con `HStack` adentro para cada renglón.

**¿Visto en clase?** ✅ Clase 3. **En el repo:** `02_PrimeraApp/StacksBasicosView.swift` bloques 1 y 10.

---

## 3.19 alignment (alineación)

🔎 alignment, alinear, alinear a la izquierda, leading, trailing, center, top, bottom, alinear todo el vstack, topLeading, esquina, alineacion de hijos

**Qué es:** cómo se alinean los hijos **dentro** del stack (no mueve el stack completo).

| Stack | Opciones | Default |
|---|---|---|
| `VStack(alignment: …)` | `.leading` (izquierda), `.center`, `.trailing` (derecha) | `.center` |
| `HStack(alignment: …)` | `.top` (arriba), `.center` (en medio), `.bottom` (abajo), `.firstTextBaseline` ⚠️ | `.center` |
| `ZStack(alignment: …)` ⚠️ | `.center`, `.top`, `.bottom`, `.leading`, `.trailing`, `.topLeading`, `.topTrailing`, `.bottomLeading`, `.bottomTrailing` | `.center` |

```swift
import SwiftUI

struct AlineacionEjemplo: View {
    var body: some View {
        VStack(spacing: 24) {
            // Hijos a la izquierda (Clase 3)
            VStack(alignment: .leading) {
                Text("Corto")
                Text("Un texto más largo")
            }

            // Hijos arriba (Clase 3)
            HStack(alignment: .top) {
                Text("Arriba")
                Text("Este texto\ntiene dos líneas")
            }

            // Alinear TODO el VStack a la izquierda de la pantalla (Clase 3, lámina 12)
            VStack(alignment: .leading) {
                Text("Nombre")
                Text("Ana López")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}
```

> **Consejo de la profe (lámina 12):** "Primero intenta colocar todos los elementos dentro del VStack antes de
> recurrir a este modificador `.frame`." El `alignment:` del VStack alinea a los hijos **entre ellos**; para mover
> el VStack completo hacia la orilla de la pantalla se necesita el `.frame(maxWidth: .infinity, alignment: .leading)`.

**Error típico:** pusiste `VStack(alignment: .leading)` y "no se mueve a la izquierda" → el VStack mide lo que mide
su hijo más ancho y está **centrado** en la pantalla. Agrega el `.frame(maxWidth: .infinity, alignment: .leading)`.

**¿Visto en clase?** ✅ Clase 3 (VStack y HStack). `ZStack(alignment:)`: ⚠️.
**En el repo:** `02_PrimeraApp/StacksBasicosView.swift` bloques 2, 3, 4 y 9 · `05_Layouts/AlineacionView.swift` bloques 5, 7 y 8.

---

## 3.20 spacing

🔎 spacing, espacio entre elementos, separacion, separar, juntar, pegados, espacio vertical, gap

**Qué es:** cuántos **puntos de espacio vacío hay ENTRE cada hijo** del stack. En un VStack el espacio queda
entre renglones; en un HStack, entre elementos de lado a lado.

```swift
import SwiftUI

struct SpacingEjemplo: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("A la izquierda")
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.blue.opacity(0.12))
            Text("Al centro")
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.blue.opacity(0.12))
            Text("A la derecha")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.blue.opacity(0.12))
        }
    }
}
```

```
┌───────────────────────────────┐
│A la izquierda                 │
└───────────────────────────────┘
          ↕ 8 puntos  (spacing: 8)
┌───────────────────────────────┐
│           Al centro           │
└───────────────────────────────┘
          ↕ 8 puntos
┌───────────────────────────────┐
│                   A la derecha│
└───────────────────────────────┘
```

| Valor | Resultado |
|---|---|
| `VStack {` (sin spacing) | SwiftUI pone un espacio automático (~8) que tú no controlas |
| `spacing: 0` | Pegados, sin hueco (para dividir la pantalla en partes que se tocan) |
| `spacing: 8` | Poco espacio |
| `spacing: 16` / `20` | Espacio cómodo (lo típico en formularios) |
| `spacing: 30` | Mucho espacio |

- El spacing **solo** va entre hijos: no pone espacio arriba del primero ni abajo del último (eso es `.padding`).
- Los "puntos" son la medida de iOS, no píxeles.

**¿Visto en clase?** ✅ (skill: "spacing en los stacks y padding en los contenedores" es criterio de la rúbrica).
**En el repo:** `02_PrimeraApp/StacksBasicosView.swift` bloque 5.

---

## 3.21 Spacer

🔎 spacer, espacio, empujar, separar a los lados, pegar abajo, pegar a la derecha, espacio flexible, espacio fijo, minLength, mitad izquierda

**Qué es:** un espacio **elástico** que se come todo el espacio libre y **empuja** a los demás.

```swift
import SwiftUI

struct SpacerEjemplos: View {
    var body: some View {
        VStack(spacing: 20) {
            // 1. Empujar a los lados: etiqueta a la izquierda, valor a la derecha
            HStack {
                Text("Álbum")
                Spacer()
                Text("Take Care")
            }

            // 2. Espacio FIJO (no elástico)
            Text("Arriba")
            Spacer().frame(height: 30)
            Text("30 puntos más abajo")

            // 3. "Elemento complementario" de la Clase 5A: algo SOLO en la mitad izquierda
            HStack {
                Text("Mitad izquierda")
                    .frame(maxWidth: .infinity)
                Spacer()
                    .frame(maxWidth: .infinity)        // la mitad derecha queda vacía
            }

            // 4. Empujar al fondo: un solo Spacer antes del botón
            Spacer()
            Button("Continuar") {
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
```

| Forma | Qué hace |
|---|---|
| `Spacer()` | Elástico: ocupa todo lo que sobra |
| `Spacer().frame(height: 30)` | Espacio fijo de 30 (en VStack) |
| `Spacer().frame(width: 20)` | Espacio fijo de 20 (en HStack) |
| `Spacer(minLength: 20)` ⚠️ | Elástico, pero nunca menor a 20 |
| `Spacer().frame(maxWidth: .infinity)` | Ocupa una "mitad" igual que su vecino (Clase 5A) |

- **Varios** `Spacer()` en el mismo stack **se reparten** el espacio sobrante en partes iguales.
- Un `Spacer()` arriba y otro abajo → el contenido queda centrado verticalmente.
- `Spacer()` dentro de un `ScrollView` vertical casi no hace nada (el scroll no tiene "espacio sobrante").

**¿Visto en clase?** ✅ Clase 5A (`Spacer().frame(maxWidth: .infinity)`), skill (`Spacer()`, `Spacer().frame(height: 30)`).
**En el repo:** `02_PrimeraApp/StacksBasicosView.swift` bloque 6 · `05_Layouts/AlineacionView.swift` bloque 2 · `05_Layouts/MitadesView.swift` bloque 5.

---

## 3.22 Divider

🔎 divider, linea divisora, separador, linea, separar secciones, raya

**Qué es:** una línea delgada gris. En un VStack es horizontal; en un HStack, vertical. La Clase 5A la usa para
separar secciones (Paso 5).

```swift
import SwiftUI

struct DividerEjemplo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Datos")
            Divider()                                    // línea horizontal
            HStack {
                Text("Izquierda")
                Divider()                                // línea vertical
                    .frame(height: 20)
                Text("Derecha")
            }
            Divider()
                .background(Color.purple)                // color de la línea ⚠️
        }
        .padding()
    }
}
```

**¿Visto en clase?** ✅ Clase 5A (Paso 5), skill.
**En el repo:** `02_PrimeraApp/StacksBasicosView.swift` bloque 7 · `05_Layouts/RenglonesView.swift`.

---

## 3.23 padding (márgenes)

🔎 padding, margen, margenes, espacio alrededor, relleno, separar de la orilla, EdgeInsets, padding horizontal, padding top

**Qué es:** espacio **alrededor** de un elemento (por dentro de su fondo, si el fondo va después).

| Forma | Qué hace |
|---|---|
| `.padding()` | ~16 puntos por los 4 lados (automático) |
| `.padding(20)` | 20 por los 4 lados |
| `.padding(.horizontal)` | Solo izquierda y derecha (automático) |
| `.padding(.horizontal, 24)` | Izquierda y derecha, 24 |
| `.padding(.vertical, 8)` | Arriba y abajo, 8 |
| `.padding(.top, 10)` | Solo arriba (`.bottom`, `.leading`, `.trailing`) |
| `.padding([.top, .leading], 10)` ⚠️ | Varios lados a la vez |
| `.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))` ⚠️ | Cada lado distinto |

```swift
import SwiftUI

struct PaddingEjemplo: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Botón gordito")
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color.purple)
                .foregroundStyle(.white)
                .cornerRadius(12)

            Text("Pegado a la orilla izquierda, con margen")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
        }
        .padding()          // margen de toda la pantalla
    }
}
```

> **Regla de la Clase 10:** en el **renglón de una lista** (Row) "no agregues padding al stack": el `List` ya pone
> sus márgenes. En pantallas normales sí usa `.padding()` en el contenedor principal.

**¿Visto en clase?** ✅ Clase 3 (`.padding()`), Clase 5A (Paso 5: márgenes), Clase 17 (`.padding(12)`).
**En el repo:** `02_PrimeraApp/StacksBasicosView.swift` bloque 8.

---

## 3.24 frame (tamaño)

🔎 frame, tamaño, ancho, alto, width, height, maxWidth, infinity, ocupar todo el ancho, ancho completo, minHeight, fixedSize, layoutPriority, alinear dentro del frame

**Qué es:** le da tamaño a un elemento: fijo (`width: 200`) o flexible (`maxWidth: .infinity` = "todo lo que se pueda").

| Forma | Qué hace |
|---|---|
| `.frame(width: 200)` | Ancho fijo de 200 |
| `.frame(width: 200, height: 100)` | Ancho y alto fijos |
| `.frame(height: 220)` | Solo el alto (típico en gráficas) |
| `.frame(maxWidth: .infinity)` | Ocupa **todo el ancho** disponible |
| `.frame(maxWidth: .infinity, maxHeight: .infinity)` | Ocupa toda la pantalla/espacio |
| `.frame(maxWidth: .infinity, alignment: .leading)` | Todo el ancho y el contenido pegado a la izquierda |
| `.frame(minHeight: 44)` | Al menos 44 de alto (área táctil mínima de un botón) |
| `.frame(minWidth: 100, maxWidth: 300)` ⚠️ | Entre 100 y 300 |
| `.frame(maxWidth: 400)` ⚠️ | Crece pero sin pasar de 400 (útil en iPad) |

```swift
import SwiftUI

struct FrameEjemplo: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Ancho fijo 200")
                .frame(width: 200, height: 44)
                .background(Color.orange.opacity(0.3))

            Text("Todo el ancho")
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color.green.opacity(0.3))

            Text("Todo el ancho, texto a la derecha")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.blue.opacity(0.3))
        }
        .padding()
    }
}
```

**`.layoutPriority` ⚠️ y `.fixedSize` ⚠️ (cuando un texto se corta):**

| Modificador | Qué hace | Ejemplo |
|---|---|---|
| `.layoutPriority(1)` | En un HStack, este hijo recibe espacio **primero** (los demás se encogen) | El nombre largo que no quieres cortado |
| `.fixedSize()` | El elemento mide lo que necesita y no se encoge | Un botón que no quieres que se aplaste |
| `.fixedSize(horizontal: false, vertical: true)` | Deja que el texto crezca hacia abajo (varias líneas) en vez de cortarse | Descripciones en tarjetas |

**Errores comunes:**

| Síntoma | Por qué | Arreglo |
|---|---|---|
| El fondo de un botón no ocupa todo el ancho | El `.frame(maxWidth: .infinity)` quedó afuera del label | Ponlo **dentro** del label del Button (parte 4) |
| `.frame` no cambia el tamaño de una imagen | Falta `.resizable` | 3.10 |
| El texto se corta con "…" en un HStack | Otro elemento le quita espacio | `.layoutPriority(1)` al texto o `.lineLimit(nil)` |

**¿Visto en clase?** ✅ Clase 3 (`.frame(width: 300)`, `.frame(maxWidth: .infinity, alignment: .leading)`, `.frame(maxWidth: .infinity, maxHeight: .infinity)`), Clase 5A (`.frame(width: 150)`).
**En el repo:** `02_PrimeraApp/ModificadoresView.swift` bloque 7 · `05_Layouts/AlineacionView.swift` bloque 4.

---

## 3.25 Recetas de layout (dividir la pantalla y más)

🔎 dividir pantalla, partes iguales, mitad, mitades, 50 50, tercios, columnas iguales, renglones iguales, cuadricula, grid, 2x2, 3x3, proporciones, un tercio, dos tercios, 30 70, encabezado fijo, boton fijo abajo, esquinas, centrar, renglon etiqueta valor, tabla, tarjeta, card, foto sobre portada, texto sobre imagen, badge, insignia, galeria, LazyVGrid, GridItem

**La regla de oro para partes iguales:** los hijos que llevan `.frame(maxWidth: .infinity, maxHeight: .infinity)`
**se reparten el espacio en partes iguales**. Con `spacing: 0` quedan pegados.

> En el repo, los ejemplos de `05_Layouts` traen un `.frame(height: …)` marcado `✏️ DEMO` para que quepan varios
> en una pantalla. Bórralo cuando copies el bloque y ocupará toda la pantalla.

### 3.25.1 Dividir en 2 mitades: arriba / abajo

```
┌──────────────┐
│    ARRIBA    │
├──────────────┤
│    ABAJO     │
└──────────────┘
```

```swift
import SwiftUI

struct MitadesArribaAbajo: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Mitad de ARRIBA")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.purple.opacity(0.3))

            Text("Mitad de ABAJO")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.orange.opacity(0.3))
        }
        .ignoresSafeArea()          // quítalo si no quieres que llegue a las orillas del iPhone
    }
}
```

### 3.25.2 Dividir en 2 mitades: izquierda / derecha

```
┌───────┬───────┐
│ IZQ.  │ DER.  │
└───────┴───────┘
```

```swift
import SwiftUI

struct MitadesIzqDer: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("IZQUIERDA")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.opacity(0.3))

            Text("DERECHA")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green.opacity(0.3))
        }
    }
}
```

### 3.25.3 3 o 4 partes iguales (columnas o renglones)

```
┌────┬────┬────┐      ┌──────────┐
│ 1  │ 2  │ 3  │      │    1     │
└────┴────┴────┘      ├──────────┤
                      │    2     │
                      ├──────────┤
                      │    3     │
                      └──────────┘
```

```swift
import SwiftUI

struct PartesIguales: View {
    var body: some View {
        VStack(spacing: 20) {
            // 3 columnas iguales
            HStack(spacing: 0) {
                Text("Col 1").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.purple.opacity(0.3))
                Text("Col 2").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.orange.opacity(0.3))
                Text("Col 3").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue.opacity(0.3))
            }
            .frame(height: 100)

            // 3 renglones iguales
            VStack(spacing: 0) {
                Text("Renglón 1").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.purple.opacity(0.3))
                Text("Renglón 2").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.orange.opacity(0.3))
                Text("Renglón 3").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue.opacity(0.3))
            }

            // 3 botones del mismo ancho
            HStack(spacing: 10) {
                Button { } label: { Text("Uno").frame(maxWidth: .infinity) }
                Button { } label: { Text("Dos").frame(maxWidth: .infinity) }
                Button { } label: { Text("Tres").frame(maxWidth: .infinity) }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
```

> ¿4 o 5 partes? Agrega otro hijo con el mismo `.frame(maxWidth: .infinity, maxHeight: .infinity)`.

### 3.25.4 Tarjetas del mismo ancho con espacio entre ellas (ej. 3 resúmenes)

```swift
import SwiftUI

struct TresTarjetasIguales: View {
    var body: some View {
        HStack(spacing: 12) {
            VStack {
                Text("10").font(.title).bold()
                Text("Antojos").font(.caption)
            }
            .frame(maxWidth: .infinity)          // cada tarjeta pide todo el ancho → quedan iguales
            .padding(.vertical, 16)
            .background(Color.purple.opacity(0.15))
            .cornerRadius(12)

            VStack {
                Text("4").font(.title).bold()
                Text("Favoritos").font(.caption)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.purple.opacity(0.15))
            .cornerRadius(12)

            VStack {
                Text("4.2").font(.title).bold()
                Text("Promedio").font(.caption)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.purple.opacity(0.15))
            .cornerRadius(12)
        }
        .padding()
    }
}
```

> Si las 3 tarjetas se ven iguales, conviértelas en **un componente** con parámetros (3.29) y úsalo 3 veces.

### 3.25.5 Cuadrícula 2x2 y 3x3 con stacks

```
┌─────┬─────┐
│  1  │  2  │
├─────┼─────┤
│  3  │  4  │
└─────┴─────┘
```

```swift
import SwiftUI

struct Cuadricula2x2: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text("1").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.purple.opacity(0.3)).cornerRadius(12)
                Text("2").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.orange.opacity(0.3)).cornerRadius(12)
            }
            HStack(spacing: 10) {
                Text("3").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue.opacity(0.3)).cornerRadius(12)
                Text("4").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.green.opacity(0.3)).cornerRadius(12)
            }
        }
        .padding()
    }
}

// 3x3 con ForEach (⚠️): 3 renglones, cada uno con 3 columnas
struct Cuadricula3x3: View {
    var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<3, id: \.self) { fila in
                HStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { columna in
                        Text("\(fila * 3 + columna + 1)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.indigo.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
        }
        .frame(height: 300)
        .padding()
    }
}
```

### 3.25.6 Proporciones: 1/3 y 2/3 (o 30 % / 70 %)

**Con `GeometryReader` ⚠️** (te dice cuánto mide el espacio disponible: `geo.size.width` y `geo.size.height`):

```swift
import SwiftUI

struct UnTercioDosTercios: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Text("1/3")
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height / 3)
                    .background(Color.purple.opacity(0.3))

                Text("2/3")
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height * 2 / 3)
                    .background(Color.orange.opacity(0.3))
            }
        }
    }
}

struct TreintaSetenta: View {
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                Text("30%")
                    .frame(width: geo.size.width * 0.3)
                    .frame(maxHeight: .infinity)
                    .background(Color.blue.opacity(0.3))
                Text("70%")
                    .frame(width: geo.size.width * 0.7)
                    .frame(maxHeight: .infinity)
                    .background(Color.green.opacity(0.3))
            }
        }
        .frame(height: 150)
    }
}
```

**Sin GeometryReader (usando solo lo de clase):** una parte con alto fijo y la otra con `maxHeight: .infinity`
(se queda con todo lo que sobra).

```swift
import SwiftUI

struct AltoFijoYResto: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Arriba: siempre 200 puntos")
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(Color.purple.opacity(0.3))

            Text("Abajo: todo lo demás")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.orange.opacity(0.3))
        }
    }
}
```

**Cómo explicar GeometryReader:** "Me da el tamaño del espacio disponible y calculo cada parte multiplicando:
un tercio es `alto / 3`."

### 3.25.7 Encabezado fijo arriba + contenido con scroll + botón fijo abajo

```
┌──────────────────┐
│ ENCABEZADO fijo  │
├──────────────────┤
│  contenido       │ ← se desliza
│  (ScrollView)    │
├──────────────────┤
│ [   Guardar   ]  │ ← siempre visible
└──────────────────┘
```

```swift
import SwiftUI

struct EncabezadoCuerpoPie: View {
    var body: some View {
        VStack(spacing: 0) {
            // 1. Encabezado (fijo)
            Text("Nuevo antojo")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple.opacity(0.15))

            // 2. Cuerpo (con scroll)
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(1...15, id: \.self) { i in
                        Text("Campo \(i)")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }

            // 3. Pie (fijo abajo)
            Button {
            } label: {
                Text("Guardar")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}
```

### 3.25.8 Algo en cada esquina y al centro

```swift
import SwiftUI

struct CuatroEsquinas: View {
    var body: some View {
        ZStack {
            Text("Arriba izq.").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            Text("Arriba der.").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            Text("CENTRO")
            Text("Abajo izq.").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            Text("Abajo der.").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .padding()
    }
}
```

### 3.25.9 Centrar todo en la pantalla / botón pegado abajo

```swift
import SwiftUI

struct CentradoYBotonAbajo: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()                                  // empuja hacia abajo
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 80))
                .foregroundStyle(.green)
            Text("¡Listo!")
                .font(.title)
            Spacer()                                  // empuja hacia arriba → queda centrado

            Button {
            } label: {
                Text("Continuar")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)          // queda pegado abajo
        }
        .padding()
    }
}
```

### 3.25.10 Renglón "Etiqueta ……… Valor"

```swift
import SwiftUI

struct RenglonesEtiquetaValor: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Álbum").foregroundStyle(.gray)
                Spacer()
                Text("Take Care")
            }
            Divider()
            HStack {
                Text("Duración").foregroundStyle(.gray)
                Spacer()
                Text("5:07")
            }
            Divider()
            HStack {
                Image(systemName: "person.fill").foregroundStyle(.purple)
                Text("Perfil")
                Spacer()
                Image(systemName: "chevron.right").foregroundStyle(.gray)     // estilo Ajustes
            }
        }
        .padding()
    }
}
```

### 3.25.11 Tabla con columnas alineadas

El truco: el **mismo `.frame(width:)`** para cada columna en el encabezado y en cada renglón.

```swift
import SwiftUI

struct TablaAlineada: View {
    let nombres = ["Ana", "Luis", "Sofía"]
    let goles = [12, 7, 15]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Nombre").frame(maxWidth: .infinity, alignment: .leading)
                Text("Goles").frame(width: 70, alignment: .trailing)
            }
            .bold()
            .padding(10)
            .background(Color.purple)
            .foregroundStyle(.white)

            ForEach(nombres.indices, id: \.self) { i in               // ⚠️ ForEach
                HStack {
                    Text(nombres[i]).frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(goles[i])").frame(width: 70, alignment: .trailing)
                }
                .padding(10)
                .background(i % 2 == 0 ? Color.purple.opacity(0.08) : Color.clear)   // renglones "cebra"
            }
        }
        .cornerRadius(12)
        .padding()
    }
}
```

### 3.25.12 Tarjeta (card)

```swift
import SwiftUI

struct TarjetaSimple: View {
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: "fork.knife")
                .font(.title)
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(Color.orange)
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 4) {
                Text("Tacos Juanito").font(.headline)
                Text("Tacos · $120").font(.subheadline).foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
        .padding()
    }
}
```

### 3.25.13 Foto circular encima de una portada (Clase 5A, Pasos 1 y 2.3)

```
┌──────────────────────┐
│      PORTADA         │
│        ┌───┐         │
└────────│ ◉ │─────────┘   ← la foto se baja con .offset(y: 120)
         └───┘
   Nombre (con padding de arriba para no quedar tapado)
```

```swift
import SwiftUI

struct FotoSobrePortada: View {
    var body: some View {
        VStack {
            ZStack {
                Image("foto1")                                  // ✏️ portada
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)

                Image("mascota")                                // ✏️ foto
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                    .overlay {
                        Circle().stroke(.orange, lineWidth: 5)
                    }
                    .shadow(color: .orange, radius: 5)
                    .frame(width: 150)                          // 1. ancho de 150
                    .offset(y: 120)                             // 2. offset en y de 120
            }

            Text("Charmander")
                .font(.system(size: 21))
                .bold()
                .padding(.top, 60)       // .offset mueve el DIBUJO, no el espacio: deja lugar para el círculo
            Spacer()
        }
    }
}
```

> **Por qué el `.padding(.top)`:** `.offset` solo mueve dónde se **dibuja** la foto; su espacio sigue arriba. Lo de
> abajo no se entera y quedaría tapado.

### 3.25.14 Texto encima de una imagen (que se lea)

```swift
import SwiftUI

struct TextoSobreImagen: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {                     // ⚠️ ZStack(alignment:)
            Image("foto2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)                // ⚠️
                .frame(height: 200)
                .clipped()

            LinearGradient(colors: [.clear, .black.opacity(0.7)], startPoint: .top, endPoint: .bottom)   // ⚠️
                .frame(height: 200)

            VStack(alignment: .leading) {
                Text("Playa del Carmen").font(.title2).bold()
                Text("Quintana Roo").font(.subheadline)
            }
            .foregroundStyle(.white)
            .padding()
        }
        .cornerRadius(16)
        .padding()
    }
}
```

> La rúbrica dice "legibilidad de textos (sin imágenes de background en textos)": si pones texto sobre foto,
> **siempre** con un fondo o degradado oscuro detrás.

### 3.25.15 Badge (insignia) en una esquina

```swift
import SwiftUI

struct BadgeEnEsquina: View {
    var body: some View {
        HStack(spacing: 40) {
            // Forma 1: ZStack(alignment:) ⚠️
            ZStack(alignment: .topTrailing) {
                Image(systemName: "cart.fill")
                    .font(.system(size: 40))
                Text("3")
                    .font(.caption).bold()
                    .foregroundStyle(.white)
                    .padding(6)
                    .background(Color.red)
                    .clipShape(.circle)
                    .offset(x: 10, y: -10)
            }

            // Forma 2: overlay con alineación ⚠️
            Image(systemName: "bell.fill")
                .font(.system(size: 40))
                .overlay(alignment: .topTrailing) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14, height: 14)
                }
        }
    }
}
```

### 3.25.16 Galería con `LazyVGrid` ⚠️ (cuadrícula automática)

Cuando tienes **muchos** elementos (fotos, íconos) y quieres que se acomoden solos en columnas.

```swift
import SwiftUI

struct GaleriaLazyVGrid: View {
    let fotos = ["foto1", "foto2", "foto3", "foto4", "foto1", "foto2"]

    // 2 columnas que se reparten el ancho
    let columnas = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnas, spacing: 12) {
                ForEach(fotos.indices, id: \.self) { i in
                    Image(fotos[i])
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}
```

| Tipo de columna | Qué hace | Ejemplo |
|---|---|---|
| `GridItem(.flexible())` | Se reparten el ancho por igual | 2 → `[GridItem(.flexible()), GridItem(.flexible())]` |
| `GridItem(.fixed(100))` | Ancho fijo de 100 | Íconos del mismo tamaño |
| `GridItem(.adaptive(minimum: 80))` | Mete **tantas columnas como quepan** de al menos 80 | Galerías que se ajustan a iPhone/iPad |
| `Array(repeating: GridItem(.flexible()), count: 3)` | 3 columnas iguales sin escribirlas a mano | |

- `LazyHGrid(rows: …)` ⚠️ es lo mismo pero en horizontal (va dentro de `ScrollView(.horizontal)`).
- `Grid { GridRow { … } }` ⚠️ (iOS 16+) arma tablas con columnas alineadas automáticamente.
- "Lazy" = solo dibuja lo que se ve en pantalla (rinde mejor con muchos elementos).

**Cómo explicarlo:** "LazyVGrid recibe la lista de columnas y acomoda los elementos de izquierda a derecha, bajando
de renglón cuando se llena."

**¿Visto en clase?** Partes iguales con `.frame(maxWidth: .infinity)`, `Spacer().frame(maxWidth: .infinity)`, ZStack + `.offset`: ✅ Clase 3 y 5A.
`GeometryReader`, `LazyVGrid`, `ZStack(alignment:)`, `.overlay(alignment:)`, `.fill` + `.clipped`, degradados: ⚠️.
**En el repo:** `05_Layouts/MitadesView.swift` · `PartesIgualesView.swift` · `CuadriculaView.swift` · `ProporcionesView.swift` · `EncabezadoCuerpoPieView.swift` · `AlineacionView.swift` · `RenglonesView.swift` · `CapasZStackView.swift` · `DashboardView.swift`.

---

## 3.26 ScrollView

🔎 scrollview, scroll, deslizar, no cabe, contenido se corta, pantalla chica, scroll horizontal, carrusel horizontal, showsIndicators, ocultar barra de scroll

**Qué es:** un contenedor que se puede **deslizar** cuando el contenido no cabe en la pantalla. La rúbrica pide usarlo
"cuando el contenido pueda no caber en pantallas chicas".

```swift
import SwiftUI

struct ScrollEjemplos: View {
    var body: some View {
        ScrollView {                                            // vertical (el default)
            VStack(alignment: .leading, spacing: 16) {
                Text("Destacados").font(.title2).bold()

                ScrollView(.horizontal, showsIndicators: false) {      // ⚠️ horizontal sin barrita
                    HStack(spacing: 12) {
                        ForEach(1...6, id: \.self) { i in
                            Text("Tarjeta \(i)")
                                .frame(width: 140, height: 90)
                                .background(Color.purple.opacity(0.2))
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }

                ForEach(1...20, id: \.self) { i in
                    Text("Renglón \(i)")
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}
```

| Forma | Qué hace |
|---|---|
| `ScrollView { VStack { … } }` | Scroll vertical (lo normal) |
| `ScrollView(.horizontal) { HStack { … } }` ⚠️ | Scroll de lado (carrusel de tarjetas) |
| `ScrollView(.horizontal, showsIndicators: false)` ⚠️ | Sin la barrita gris |
| `.scrollIndicators(.hidden)` ⚠️ | Otra forma de ocultar la barrita |

**ScrollView + ForEach vs List:**

| | `List` (Clase 10) | `ScrollView` + `VStack` + `ForEach` ⚠️ |
|---|---|---|
| Diseño | El de iOS (renglones con separador) | El que tú quieras (tarjetas) |
| Borrar con swipe, secciones | Sí | No |
| Fondo | Hay que apagar el suyo (`.scrollContentBackground(.hidden)`) | Se ve tu fondo directo |

**Errores comunes:**

| Síntoma | Por qué | Arreglo |
|---|---|---|
| El contenido se pega a la izquierda dentro del ScrollView | El VStack mide lo que su contenido | `.frame(maxWidth: .infinity, alignment: .leading)` al VStack |
| `Spacer()` no empuja nada dentro del ScrollView | El scroll no tiene espacio "sobrante" | Usa `.padding` o un layout sin scroll |
| Un `List` dentro de un `ScrollView` no se ve (alto 0) | Los dos quieren hacer scroll | No metas `List` en `ScrollView`; usa uno u otro |

**¿Visto en clase?** `ScrollView` vertical: ✅ (rúbrica/skill; no viene en las láminas). Horizontal: ⚠️.
**En el repo:** `05_Layouts/ScrollHorizontalView.swift` bloques 1–3 · `08_ModelosYListas/Views/ListaTarjetasView.swift`.

---

## 3.27 Formas y esquinas redondeadas

🔎 formas, shapes, rectangle, rectangulo, roundedrectangle, circulo, circle, capsule, capsula, ellipse, fill, stroke, borde, esquinas redondeadas, cornerRadius, clipShape, redondear

**Qué es:** figuras geométricas que se dibujan solas. Sirven de fondos, bordes, círculos de color o barras.

```swift
import SwiftUI

struct FormasEjemplo: View {
    var body: some View {
        VStack(spacing: 16) {
            Rectangle()
                .fill(Color.purple)                          // relleno
                .frame(height: 40)

            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange.opacity(0.3))
                .frame(height: 60)

            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.purple, lineWidth: 2)          // solo el borde
                .frame(height: 60)

            HStack(spacing: 16) {
                Circle()
                    .fill(Color.green)
                    .frame(width: 60, height: 60)
                Capsule()                                    // pastilla
                    .fill(Color.blue)
                    .frame(width: 120, height: 40)
                Ellipse()
                    .fill(Color.pink)
                    .frame(width: 90, height: 50)
            }
        }
        .padding()
    }
}
```

| Forma | Para qué |
|---|---|
| `Rectangle()` | Barras, bloques de color |
| `RoundedRectangle(cornerRadius: 12)` | Tarjetas, bordes redondeados |
| `Circle()` | Fotos circulares (como borde), puntos de color, insignias |
| `Capsule()` | Botones tipo pastilla, etiquetas (chips) |
| `Ellipse()` | Óvalos |

| Modificador de forma | Qué hace |
|---|---|
| `.fill(color)` | La rellena |
| `.stroke(color, lineWidth: 2)` | Solo dibuja el contorno |
| `.frame(width:height:)` | Tamaño (sin frame, una forma ocupa todo el espacio que le den) |

**Esquinas redondeadas a cualquier vista: 3 formas**

| Forma | Ejemplo | ¿Clase? |
|---|---|---|
| `.cornerRadius(12)` | `.background(.purple).cornerRadius(12)` | ✅ Clase 17 (la forma de la profe) |
| `.clipShape(RoundedRectangle(cornerRadius: 12))` | igual resultado | ⚠️ (tu tarea Movil2 la usa) |
| `.clipShape(.rect(cornerRadius: 12))` | igual, más corto (iOS 17) | ⚠️ |

> Las tres funcionan en Xcode 26 sin warning. Usa `.cornerRadius` para ir con la lámina. Para círculos, `.clipShape(.circle)` (Clase 5A).

**¿Visto en clase?** `Circle().stroke(.orange, lineWidth: 5)` ✅ Clase 5A, `.cornerRadius(12)` ✅ Clase 17, `RoundedRectangle(...).stroke(...)` ✅ skill. `.fill`, `Capsule`, `Ellipse`: ⚠️.
**En el repo:** `02_PrimeraApp/ModificadoresView.swift` bloque 2 · `02_PrimeraApp/StacksBasicosView.swift`.

---
## 3.28 Tabla de otros modificadores + animaciones

🔎 modificadores, background, overlay, border, borde, sombra, shadow, opacity, transparencia, offset, mover, position, rotar, rotationEffect, escalar, scaleEffect, blur, desenfocar, hidden, ocultar, disabled, deshabilitar, zIndex, contentShape, onTapGesture, tocar, gesto, animacion, withAnimation, transition

### 3.28.1 Tabla general

| Modificador | Qué hace | Ejemplo | ¿Clase? |
|---|---|---|---|
| `.background(color)` | Fondo detrás | `.background(Color.purple)` | ✅ 3, 17 |
| `.background { vista }` | Una vista como fondo | `.background { RoundedRectangle(cornerRadius: 12).fill(.white) }` | ⚠️ |
| `.overlay { vista }` | Dibuja algo **encima** (bordes, insignias) | `.overlay { Circle().stroke(.orange, lineWidth: 5) }` | ✅ 5A |
| `.overlay(alignment: .topTrailing) { … }` | Encima, en una esquina | badge | ⚠️ |
| `.border(Color.gray, width: 1)` | Borde cuadrado | | ⚠️ |
| `.cornerRadius(12)` | Esquinas redondas | | ✅ 17 |
| `.clipShape(.circle)` | Recorta con una forma | | ✅ 5A |
| `.shadow(color: .orange, radius: 5)` | Sombra | | ✅ 5A |
| `.shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)` | Sombra suave desplazada hacia abajo | tarjetas | ⚠️ (`x`, `y`) |
| `.opacity(0.5)` | Transparencia (0 invisible, 1 normal) | `.opacity(visible ? 1 : 0)` | ⚠️ |
| `.offset(x: 10, y: 120)` | Mueve el **dibujo** sin mover su espacio | foto sobre portada | ✅ 5A (`y`) |
| `.position(x: 100, y: 200)` | Pone el **centro** en una coordenada exacta | | ⚠️ (evítalo: rompe el layout) |
| `.rotationEffect(.degrees(45))` | Gira | | ⚠️ |
| `.scaleEffect(1.5)` | Agranda/achica el dibujo | | ⚠️ |
| `.scaleEffect(x: 1, y: 3)` | Escala distinta por eje (engrosar un ProgressView) | | ✅ 15 |
| `.blur(radius: 3)` | Desenfoca | | ⚠️ |
| `.hidden()` | Oculta pero **conserva su espacio** | | ⚠️ (mejor usa `if`) |
| `.disabled(true)` | Desactiva botones/controles (y a sus hijos) | `.disabled(nombre.isEmpty)` | ⚠️ |
| `.zIndex(1)` | Quién va encima en un ZStack (mayor = adelante) | | ⚠️ |
| `.onTapGesture { … }` | Acción al tocar cualquier vista | esconder teclado (Clase 3/4) | ✅ 3, 4 |
| `.onLongPressGesture { … }` | Acción al dejar presionado | | ⚠️ |
| `.contentShape(Rectangle())` | Que toda el área (incluido lo vacío) responda al toque | renglones con `Spacer` + `onTapGesture` | ⚠️ |
| `.allowsHitTesting(false)` | Que una vista **no** reciba toques (los pasa a lo de atrás) | | ⚠️ |
| `.onAppear { … }` | Código cuando la vista aparece | cargar datos | ⚠️ (parte 4) |

```swift
import SwiftUI

struct ModificadoresVarios: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Sombra suave")
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)

            Text("Con borde")
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.purple, lineWidth: 2)
                )

            Image(systemName: "arrow.up")
                .font(.largeTitle)
                .rotationEffect(.degrees(45))

            Text("Medio transparente")
                .opacity(0.4)
        }
        .padding()
    }
}
```

### 3.28.2 Animaciones básicas ⚠️

No se vieron en clase, pero hacen que la app se sienta más pulida. Úsalas solo si puedes explicarlas.

```swift
import SwiftUI

struct AnimacionesBasicas: View {
    @State private var mostrar = false
    @State private var grande = false

    var body: some View {
        VStack(spacing: 24) {
            Button("Mostrar / ocultar") {
                withAnimation {                 // ⚠️ anima TODO lo que cambie por este cambio de estado
                    mostrar.toggle()
                }
            }

            if mostrar {
                Text("¡Hola!")
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(12)
                    .transition(.scale)         // ⚠️ cómo entra/sale: .opacity, .scale, .slide
            }

            Circle()
                .fill(Color.purple)
                .frame(width: grande ? 150 : 60, height: grande ? 150 : 60)
                .animation(.easeInOut, value: grande)     // ⚠️ anima cuando cambia "grande"
                .onTapGesture {
                    grande.toggle()
                }
        }
    }
}
```

| Forma | Cuándo |
|---|---|
| `withAnimation { estado.toggle() }` | En la acción de un botón: anima el cambio |
| `.animation(.easeInOut, value: variable)` | En la vista: anima cada vez que cambia esa variable |
| `.transition(.opacity / .scale / .slide)` | Cómo aparece/desaparece algo que está dentro de un `if` |
| Tipos: `.default`, `.easeInOut`, `.linear`, `.spring()` | Velocidad/estilo de la animación |

**Cómo explicarlo:** "withAnimation hace que el cambio de estado se vea gradual en lugar de instantáneo."
**En el repo:** `02_PrimeraApp/ModificadoresView.swift` (bloques 2–8: esquinas, bordes, sombras, opacidad, offset, escala y rotación).

---

## 3.29 Componentes reutilizables (Clase 5A)

🔎 componente, component, vista reutilizable, reutilizar, separar en archivos, components, subvista, parametros de una vista, crear swiftui view, file from template, pasar datos a componente, componente con binding, componente con accion, closure

**Qué es (palabras de la profe):** "Una pantalla se arma con varios componentes… y también se puede incluir en una
sección de la pantalla una vista completa **definida en un archivo separado**. Así las soluciones quedan **mejor
estructuradas, encapsuladas y reutilizables**." Los componentes van en la carpeta **`Components/`**.

**Cuándo hacer un componente:**
- Cuando algo se **repite** (renglón de una lista, tarjeta de resumen, botón con tu estilo).
- Cuando una pantalla se hizo **muy larga** y quieres separarla por secciones (como DatosView y MasDatosView).
- Cuando la rúbrica pide "componentes reutilizables con parámetros".

### 3.29.1 Crear el archivo (Clase 5A, lámina 8)

1. Clic derecho en la carpeta `Components` (o menú **File > New > File from Template...**).
2. En la sección **"User Interface"** elige **"SwiftUI View"** → **Next**.
3. Escribe el nombre (ej. `TarjetaResumen.swift`) → **Create**.
4. Borra el `Text("Hello, World!")` y escribe tu diseño.

### 3.29.2 Componente con parámetros

Los datos que recibe se declaran como **`var` sin `@State` y sin `private`** (igual que el paso de valores de la
Clase 6B). Una `var` con valor (`= .purple`) es **opcional** al llamarlo.

```swift
import SwiftUI

// Components/TarjetaResumen.swift
struct TarjetaResumen: View {
    var valor: String                    // obligatorio
    var etiqueta: String                 // obligatorio
    var icono: String                    // obligatorio (SF Symbol)
    var color: Color = .purple           // opcional: si no lo mandas, usa morado

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundStyle(color)
            Text(valor)
                .font(.title)
                .bold()
            Text(etiqueta)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(color.opacity(0.12))
        .cornerRadius(12)
    }
}

#Preview {
    TarjetaResumen(valor: "10", etiqueta: "Antojos", icono: "fork.knife")
        .padding()
}
```

**Usarlo desde una pantalla** (3 veces, con datos distintos):

```swift
struct InicioConTarjetas: View {
    let totalAntojos = 10
    let favoritos = 4
    let promedio = 4.2

    var body: some View {
        HStack(spacing: 12) {
            TarjetaResumen(valor: "\(totalAntojos)", etiqueta: "Antojos", icono: "fork.knife")
            TarjetaResumen(valor: "\(favoritos)", etiqueta: "Favoritos", icono: "heart.fill", color: .red)
            TarjetaResumen(valor: String(format: "%.1f", promedio), etiqueta: "Promedio", icono: "star.fill", color: .orange)
        }
        .padding()
    }
}
```

> Los parámetros se mandan **en el orden** en que están declarados en el struct. Los opcionales (`color`) se pueden
> omitir. `String(format: "%.1f", promedio)` ⚠️ convierte un Double a texto con 1 decimal (alternativa de clase:
> `promedio.formatted(.number.precision(.fractionLength(1)))`).

### 3.29.3 Qué tipo de dato se le puede pasar

| Quiero pasar… | Declaración en el componente | Al llamarlo |
|---|---|---|
| Un texto | `var titulo: String` | `titulo: "Hola"` |
| Un número | `var cantidad: Int` / `var precio: Double` | `cantidad: 3` |
| Un número convertido a texto | `var valor: String` | `valor: "\(total)"` |
| Un color | `var color: Color = .purple` | `color: .red` (o nada) |
| Un ícono | `var icono: String` | `icono: "star.fill"` |
| Un modelo completo | `var antojo: Antojo` | `antojo: antojoItem` (ej. `JugadorRow(jugador: jugadorItem)`, Clase 10) |
| Un dato que el componente debe **modificar** | `@Binding var texto: String` | `texto: $nombre` |
| Una acción (qué hacer al tocar) ⚠️ | `var accion: () -> Void` | `accion: { guardar() }` o con llaves al final |

### 3.29.4 Componente que MODIFICA un dato del padre (`@Binding`)

```swift
import SwiftUI

struct CampoConEtiqueta: View {
    var etiqueta: String
    var placeholder: String
    @Binding var texto: String               // permiso para leer y modificar el @State del padre

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(etiqueta)
                .font(.headline)
            TextField(placeholder, text: $texto)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct FormularioConComponente: View {
    @State private var nombre = ""           // el padre es DUEÑO del dato

    var body: some View {
        VStack(spacing: 16) {
            CampoConEtiqueta(etiqueta: "Nombre", placeholder: "Ej. Tacos Juanito", texto: $nombre)
            Text("Escribiste: \(nombre)")    // se actualiza mientras escribes en el componente
        }
        .padding()
    }
}

#Preview {
    CampoConEtiqueta(etiqueta: "Nombre", placeholder: "Escribe", texto: .constant(""))
}
```

> **@State** = esta vista es dueña del dato. **@Binding** = esta vista recibe permiso para leer y modificar el dato
> de otra vista (Clase 6B). Al llamarlo se pasa **con `$`**.

### 3.29.5 Componente que recibe una acción `() -> Void` ⚠️

"La acción de un botón es un método o una propiedad de cierre" (Clase 3). Si tu componente es un botón con diseño
propio, la acción se la manda quien lo usa:

```swift
import SwiftUI

struct BotonGrande: View {
    var titulo: String
    var icono: String
    var color: Color = .purple
    var accion: () -> Void                  // ⚠️ "una función que no recibe nada y no regresa nada"

    var body: some View {
        Button {
            accion()                        // ejecuta lo que le mandaron
        } label: {
            Label(titulo, systemImage: icono)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .tint(color)
    }
}

struct PantallaConBoton: View {
    @State private var contador = 0

    func sumar() {
        contador += 1
    }

    var body: some View {
        VStack(spacing: 12) {
            Text("Contador: \(contador)")
            BotonGrande(titulo: "Sumar", icono: "plus", accion: sumar)          // pasando una función
            BotonGrande(titulo: "Reiniciar", icono: "arrow.counterclockwise", color: .red) {
                contador = 0                                                     // llaves al final (trailing closure)
            }
        }
        .padding()
    }
}

#Preview {
    BotonGrande(titulo: "Guardar", icono: "checkmark") { }
}
```

**Cómo explicarlo:** "`() -> Void` es el tipo de una función sin parámetros ni resultado. El componente no sabe qué
hacer; la pantalla que lo usa le manda la acción, igual que a un `Button`."

### 3.29.6 Errores comunes con componentes

| Error | Por qué | Arreglo |
|---|---|---|
| `Missing argument for parameter 'x' in call` | No mandaste un parámetro obligatorio (también en el `#Preview`) | Agrégalo, o dale valor por defecto en el componente |
| `Argument 'color' must precede argument 'icono'` | Orden distinto al del struct | Respeta el orden de las `var` |
| `Cannot convert value of type 'String' to expected argument type 'Binding<String>'` | El componente pide `@Binding` y mandaste el valor | Llama con `$nombre` (y en el preview `.constant("")`) |
| `Cannot find 'X' in scope` | El componente está en otro proyecto o con otro nombre | Copia el archivo del componente / revisa el nombre |
| `Invalid redeclaration of 'X'` | Dos structs con el mismo nombre en el proyecto | Renombra uno (clic derecho → Refactor → Rename) |
| El componente no cambia aunque cambie el dato | Le pusiste `@State` a un parámetro que viene de afuera | Los parámetros van como `var` simple; `@State` solo para datos propios |

**¿Visto en clase?** ✅ Clase 5A (componentes en archivos separados, pasos para crearlos), Clase 6B (`var` y `@Binding` como parámetros), Clase 10 (`JugadorRow(jugador:)`). `() -> Void`: ⚠️.
**En el repo:** `04_Componentes/Components/` (TarjetaInfo, BotonGrande, ImagenCircular, EncabezadoPantalla, FilaDato, EtiquetaChip, TileEstadistica, CampoConEtiqueta, EstrellasRating) · `04_Componentes/ComponentesDemoView.swift` (todos juntos).

---

## 3.30 Ejemplo Pokémon completo (Clase 5A)

🔎 pokemon, charmander, ejemplo clase 5a, pokeimagenview, datosview, masdatosview, portada, evoluciones, foto circular con offset

La pantalla de la clase tiene 3 secciones: **portada + foto** (ZStack), **datos** (nombre, tipo, descripción) y
**evoluciones**. Cada sección es un componente. En tu proyecto, cada `struct` va en su propio archivo
(`PokeImagenView.swift`, `DatosView.swift`, `MasDatosView.swift` en `Components/`; `ContentView.swift` en `Views/`).
Usa tus propias imágenes en Assets (aquí: `foto1` portada, `mascota` foto, `foto2` y `foto3` evoluciones ✏️).

```swift
import SwiftUI

// PASO 2.1 y 2.2 · Components/PokeImagenView.swift — solo el diseño de la imagen
struct PokeImagenView: View {
    var body: some View {
        Image("mascota")                                   // ✏️ tu imagen (en clase: el Pokémon)
            .resizable(resizingMode: .stretch)             // Mode: Stretch
            .aspectRatio(contentMode: .fit)                // Aspect ratio: fit
            .clipShape(.circle)                            // circular
            .overlay {
                Circle().stroke(.orange, lineWidth: 5)     // borde
            }
            .shadow(color: .orange, radius: 5)             // sombra
    }
}
```

```swift
import SwiftUI

// PASO 3 · Components/DatosView.swift — nombre, tipo y descripción
struct DatosView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("Charmander")                         // ✏️
                    .font(.system(size: 21))               // tip de clase: tamaño exacto
                    .bold()
                    .foregroundStyle(.orange)
                Spacer()
                Text("Fuego")                              // ✏️ tipo
                    .bold()
                    .foregroundStyle(.white)
                    .padding(6)
                    .background(Color.orange)
            }
            Text("Dicen que cuando llueve le sale vapor de la punta de la cola.")   // ✏️
                .font(.system(size: 15))
        }
    }
}
```

```swift
import SwiftUI

// PASO 4 · Components/MasDatosView.swift — evoluciones, cada una en su mitad
struct MasDatosView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Evoluciones:")
                .bold()
                .foregroundStyle(.orange)

            HStack {
                VStack {
                    Image("foto2")                         // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110)
                    Text("Charmeleon")
                }
                .frame(maxWidth: .infinity)                // cada evolución pide todo el ancho → mitades iguales

                VStack {
                    Image("foto3")                         // ✏️
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110)
                    Text("Charizard")
                }
                .frame(maxWidth: .infinity)

                // PAUSA de clase: si solo hubiera UNA evolución y la quieres en la mitad izquierda,
                // cambia el segundo VStack por:  Spacer().frame(maxWidth: .infinity)
            }
        }
    }
}
```

```swift
import SwiftUI

// Views/ContentView.swift — la pantalla que junta todo
struct PokemonContentView: View {
    var body: some View {
        VStack {
            // PASO 1 y 2.3: portada a todo el ancho + foto encima, dentro de un ZStack
            ZStack {
                Image("foto1")                             // ✏️ portada
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)

                PokeImagenView()
                    .frame(width: 150)                     // 1. ancho de 150
                    .offset(y: 120)                        // 2. offset en y de 120
            }

            // PASO 3: datos, abajo del ZStack
            DatosView()
                .padding(.horizontal)
                .padding(.top, 50)                         // deja lugar al círculo que bajó con offset

            // PASO 5: línea divisora entre secciones
            Divider()

            // PASO 4: datos complementarios
            MasDatosView()
                .padding(.horizontal)

            Spacer()
        }
    }
}

#Preview {
    PokemonContentView()
}
```

**Explicación para la defensa:**
- Separé la pantalla en **componentes** porque cada sección tiene su propio diseño; así el ContentView queda corto y cada parte se puede reutilizar (palabras de la Clase 5A).
- La foto y la portada van en un **ZStack** porque una va encima de la otra.
- `.offset(y: 120)` baja el **dibujo** de la foto para que quede a la mitad de la orilla de la portada; como offset no mueve su espacio, a los datos les puse `.padding(.top)`.
- Cada evolución tiene `.frame(maxWidth: .infinity)` para que las dos se repartan el ancho en mitades iguales.

**¿Visto en clase?** ✅ Clase 5A completa (Pasos 1–5 y la PAUSA).
**En el repo:** `04_Componentes/PokemonEjemploView.swift` + `04_Componentes/Components/PokeImagenView.swift`, `PokeDatosView.swift`, `PokeMasDatosView.swift` (ahí `DatosView` se llama `PokeDatosView` y `MasDatosView` se llama `PokeMasDatosView` para no chocar con otros nombres del repo).

---

## 3.31 Errores comunes de diseño (síntoma → arreglo)

🔎 no se ve, se corta, no se alinea, fondo blanco, imagen gigante, texto cortado, layout roto, no ocupa todo el ancho, problemas de diseño, se encima, se ve mal

| Síntoma | Causa probable | Arreglo | Ver |
|---|---|---|---|
| La imagen sale gigante | Falta `.resizable` (o va después del `.frame`) | `.resizable(resizingMode: .stretch)` primero | 3.10 |
| La imagen se ve estirada | Falta `.aspectRatio` | `.aspectRatio(contentMode: .fit)` | 3.10 |
| La imagen no aparece | Nombre distinto al de Assets | Copia el nombre exacto | 3.10 |
| El fondo no llega hasta arriba/abajo | Falta `.ignoresSafeArea()` en el color | Opción 1 de fondo | 3.15 |
| El contenido queda bajo la isla dinámica | `.ignoresSafeArea()` en el contenedor | Pónselo solo al `Color` | 3.15 |
| `VStack(alignment: .leading)` no se pega a la izquierda | El VStack está centrado en la pantalla | `.frame(maxWidth: .infinity, alignment: .leading)` | 3.19 |
| Los elementos están pegados | Sin `spacing` / sin `padding` | `VStack(spacing: 16)` y `.padding()` | 3.20, 3.23 |
| El botón no ocupa todo el ancho | El `.frame(maxWidth: .infinity)` está fuera del label | Dentro del label | parte 4 |
| Las partes "iguales" no son iguales | A una le falta `.frame(maxWidth: .infinity, maxHeight: .infinity)` o tiene `padding` distinto | Mismo frame en todas | 3.25 |
| El fondo de un elemento no cubre el margen | `.background` antes de `.padding` | `.padding()` → `.background()` | 3.6 |
| El texto se corta con "…" | No cabe | Quita `.lineLimit`, usa `.layoutPriority(1)`, o un `ScrollView` | 3.8, 3.24 |
| El contenido no cabe en un iPhone chico | Sin scroll | Envuelve en `ScrollView` | 3.26 |
| Algo tapado por una foto con `offset` | offset no mueve el espacio | `.padding(.top, …)` a lo de abajo | 3.25.13 |
| El texto no se lee en modo oscuro | Letra `.primary` sobre fondo claro fijo | Colores fijos de tu paleta o `.preferredColorScheme(.light)` | 3.17 |
| El texto sobre una foto no se lee | Sin fondo detrás | Degradado oscuro o fondo semitransparente | 3.25.14 |
| `.navigationTitle` no aparece | La vista no está dentro de un `NavigationStack` (o el preview no lo tiene) | parte 5 | 3.5 |
| Un ícono SF Symbol no aparece | Nombre mal escrito | Revisa el nombre exacto (puntos, `.fill`) | 3.11 |
| Un color sale blanco | No dividiste el RGB entre 255 | `116/255` | 3.13 |
| Warning `'+' was deprecated in iOS 26.0` | `Text + Text` | Interpolación o HStack | 3.8.4 |

---

# 4. Estado, controles y formularios

En esta parte está todo lo que hace que tu app **reaccione**: cómo guardar datos que cambian (estado), todos los
controles (botones, campos de texto, switches, sliders, pickers…), el teclado, las alertas, las sheets, los eventos
(`onAppear`, `onChange`…) y la **receta completa de un formulario con validación**, que es lo que más se pide.

> **Regla de oro de esta parte**
> 1. Si un dato **cambia** y la pantalla se tiene que enterar → `@State private var`.
> 2. Si ese dato se lo pasas a un **control** (TextField, Toggle, Slider, Picker…) → lleva **`$`** adelante.
> 3. Si solo lo **lees** (en un `Text`, en un `if`) → **sin** `$`.

---

## 4.1 Por qué una variable normal no cambia la pantalla

🔎 estado, state, variable no cambia, no se actualiza, pantalla no cambia, self is immutable, mutating, inmutable, redibujar, refrescar vista

**Qué pasa:** una vista de SwiftUI es un `struct`. SwiftUI la "dibuja" leyendo su `body`. Dentro de la vista **no
puedes modificar** una variable normal: el struct es de solo lectura mientras se dibuja. Y aunque pudieras, SwiftUI
no sabría que tiene que volver a dibujar.

```swift
// ❌ esto NO compila:
struct SinState: View {
    var contador = 0

    var body: some View {
        Button("Sumar") {
            contador += 1      // error
        }
    }
}
```

Xcode dice:
`left side of mutating operator isn't mutable: 'self' is immutable`

**La solución** es `@State`. Piensa en `@State` como una **caja que SwiftUI guarda aparte**. Cada vez que cambias lo
que hay en la caja, SwiftUI vuelve a dibujar el `body` con el valor nuevo. Por eso la pantalla "se actualiza sola".

```swift
struct ContadorView: View {
    @State private var contador = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Llevas \(contador) toques")
            Button("Sumar 1") {
                contador += 1
            }
        }
    }
}
```

Cada vez que tocas el botón: `contador` cambia → SwiftUI redibuja → el `Text` muestra el número nuevo.

---

## 4.2 `@State`

🔎 @State, state, private var, variable de estado, estado de la vista, guardar dato, $, dolar, signo de pesos, binding, valor inicial

**Qué es:** una variable "modificable" ligada a la interfaz. Cuando cambia, la pantalla se vuelve a dibujar.

**Cuándo usarlo:** todo lo que el usuario cambia o que cambia con una acción: lo que escribe en un TextField, si un
Toggle está prendido, qué opción eligió en un Picker, si una alerta se muestra, un contador, una lista que crece.

**Cómo se escribe (forma de clase):**

```swift
@State private var username = ""
@State private var username: String = ""   // igual, pero diciendo el tipo
```

Lo que dijo la profesora (Clase 3, lámina 15):
- `@State` sirve para variables **modificables**.
- **Apple recomienda fuertemente marcarlas `private`.**
- Se usa con **tipos simples** (String, Int, Double, Bool).
- **No se recomienda compartirlas** con otras vistas → para eso existe `@Binding` (sección 4.3 y Parte 5).

**Reglas:**

| Regla | Por qué |
|---|---|
| Siempre `@State private var` | Recomendación de Apple y de la profesora. Nadie de afuera la toca. |
| Siempre con **valor inicial** (`= ""`, `= 0`, `= false`, `= nil`) | SwiftUI necesita saber con qué arrancar. |
| Va **dentro** del struct de la vista, arriba del `body` | Es una propiedad de la vista. |
| Se declara con `var`, nunca `let` | Tiene que poder cambiar. |
| Se cambia en **acciones** (botón, onChange, onAppear), nunca "suelta" dentro del `body` | Si la cambias mientras se dibuja, SwiftUI se confunde. |

**Tipos que puede guardar:**

```swift
struct TiposStateView: View {
    @State private var nombre: String = ""
    @State private var edad: Int = 0
    @State private var estatura: Double = 1.70
    @State private var activo: Bool = false
    @State private var fecha = Date()
    @State private var foto: UIImage? = nil
    @State private var frutas: Array<String> = ["Manzana", "Pera"]

    var body: some View {
        VStack {
            TextField("Nombre", text: $nombre)
            Text("Hola \(nombre)")
            Toggle("Activo", isOn: $activo)
            Text("\(edad) \(estatura) \(frutas.count)")
            Text(fecha, style: .date)
            if let fotoBien = foto {
                Image(uiImage: fotoBien)
            }
        }
    }
}
```

También puede guardar **arreglos de tus structs**: `@State private var antojos = cargarAntojos()`.
`Array<String>` y `[String]` son **exactamente lo mismo**, solo cambia la forma de escribirlo. La profe usa `Array<…>`.

**El `$` explicado (muy importante):**

| Escribes | Qué es | Para qué |
|---|---|---|
| `nombre` | El **valor** (ej. `"Ana"`) | Para leerlo: `Text("Hola \(nombre)")`, `if nombre.isEmpty` |
| `$nombre` | Un **binding**: permiso de leer **y escribir** | Para dárselo a un control que lo va a cambiar: `TextField(..., text: $nombre)` |

Regla fácil: **los controles que el usuario modifica llevan `$`** (TextField, SecureField, Toggle, Slider, Stepper,
Picker, DatePicker, ColorPicker, `.alert(isPresented:)`, `.sheet(isPresented:)`). Los `Text` **no**.

**Errores comunes:**

| Mensaje / síntoma | Por qué | Arreglo |
|---|---|---|
| `left side of mutating operator isn't mutable: 'self' is immutable` | La variable no tiene `@State` | Ponle `@State private var` |
| `cannot convert value 'nombre' of type 'String' to expected type 'Binding<String>', use wrapper instead` | Le pasaste el valor a un control | Agrega `$`: `text: $nombre` |
| `cannot use instance member 'a' within property initializer; property initializers run before 'self' is available` | Usaste una variable de la vista para dar el valor inicial de otra (`let b = a + 1`) | Convierte `b` en propiedad calculada: `var b: Int { return a + 1 }` (sección 4.4) |
| En la consola sale en morado `Modifying state during view update, this will cause undefined behavior.` | Cambiaste un `@State` mientras se dibuja el `body` | Muévelo a un botón, `.onAppear` o `.onChange` |
| La pantalla no cambia aunque el valor cambió | La variable no es `@State` (o la cambiaste en otra copia) | Revisa que sea `@State` y que estés cambiando esa misma |

**¿Visto en clase?** ✅ Clase 3 (lámina 15).
**En el repo:** `02_PrimeraApp/MiPrimeraAppView.swift` (la app de la Clase 3) · cualquier archivo de `03_ElementosUI/`.

---

## 4.3 `@Binding` (resumen; lo de pantallas completo está en la Parte 5)

🔎 @Binding, binding, pasar variable, compartir dato, modificar desde otra vista, componente que cambia, ida y vuelta, .constant, preview binding

**Qué es:** `@State` = **esta vista es dueña del dato**. `@Binding` = **esta vista recibe permiso para leer y
modificar el dato de otra vista** (Clase 6B). Cuando la vista hija lo cambia, la vista dueña se entera y se redibuja.

**Cuándo usarlo:** un componente que modifica algo del padre (un campo de texto reutilizable), una pantalla de
detalle que cambia un favorito, una sheet que regresa un valor.

**Cómo se escribe (3 pasos de la Clase 6B):**
1. En la vista hija: `@Binding var dato: Tipo` → **sin** `private` y **sin** valor inicial.
2. En la vista dueña: `@State private var dato = …`.
3. Al llamar a la hija: con **`$`** → `Hija(dato: $dato)`.

```swift
struct CampoNombre: View {
    @Binding var nombre: String

    var body: some View {
        TextField("Tu nombre", text: $nombre)
            .textFieldStyle(.roundedBorder)
    }
}

struct PantallaPadre: View {
    @State private var nombre = ""

    var body: some View {
        VStack {
            CampoNombre(nombre: $nombre)
            Text("Escribiste: \(nombre)")
        }
    }
}

#Preview {
    CampoNombre(nombre: .constant("Ana"))
}
```

**El `#Preview` con `@Binding`:** en el preview no hay un padre que le pase el binding, así que se le inyecta uno de
prueba con `.constant(...)` (un binding de solo lectura con valor fijo).

**Errores comunes:**

| Mensaje | Arreglo |
|---|---|
| `Missing argument for parameter 'nombre' in call` (en el `#Preview`) | `CampoNombre(nombre: .constant("Ana"))` |
| `cannot convert value 'nombre' of type 'String' to expected type 'Binding<String>'` al llamar a la hija | Te faltó el `$`: `CampoNombre(nombre: $nombre)` |
| Le pusiste `@Binding private var` o `@Binding var x = ""` | Un `@Binding` va **sin** `private` y **sin** valor inicial |

**¿Visto en clase?** ✅ Clase 6B.
**En el repo:** `04_Componentes/Components/CampoConEtiqueta.swift` · `06_MultiplesPantallas/BindingIdaYVueltaView.swift` + `EditarNicknameView.swift`.

---

## 4.4 Constantes (`let`) y propiedades calculadas dentro de la vista

🔎 let, constante, propiedad calculada, computed property, var calculada, total, se recalcula, derivado, gokuImage, mensaje segun valor, opciones fijas

**Qué es:**
- **`let`** dentro de la vista = un dato fijo que nunca cambia (ej. las opciones de un Picker, un IVA).
- **Propiedad calculada** = una `var` que **no guarda** nada: cada vez que la lees, **calcula** su valor con otras
  variables. Si esas variables son `@State`, la propiedad se recalcula sola cuando cambian.

**Cuándo usarlo:** totales, promedios, porcentajes, "¿el formulario es válido?", el nombre de una imagen según un
Slider, una lista filtrada, un mensaje que depende de un número.

```swift
struct CalculadaView: View {
    @State private var precio = 100.0
    @State private var cantidad = 3
    let iva = 0.16

    var total: Double {
        return precio * Double(cantidad) * (1 + iva)
    }

    var mensaje: String {
        if total > 500 {
            return "Compra grande"
        } else {
            return "Compra chica"
        }
    }

    var body: some View {
        VStack {
            Text("Total: \(total, specifier: "%.2f")")
            Text(mensaje)
            Button("Agregar uno") {
                cantidad += 1
            }
        }
    }
}
```

Al tocar "Agregar uno", `cantidad` cambia → `total` y `mensaje` se recalculan solos → los `Text` cambian.

**Diferencias rápidas:**

| | `@State private var` | `let` | Propiedad calculada `var x: T { … }` |
|---|---|---|---|
| ¿Cambia? | Sí, tú la cambias | Nunca | Sí, sola, cuando cambian las variables que usa |
| ¿Se le asigna con `=`? | Sí | Solo al declararla | **No**, se calcula |
| Ejemplo | `@State private var cantidad = 3` | `let iva = 0.16` | `var total: Double { return … }` |

**Errores comunes:** querer escribir `let total = precio * 2` usando un `@State` → error
`cannot use instance member … within property initializer`. Usa una propiedad calculada.

**¿Visto en clase?** ✅ La Clase 15 usa `var id: Int { return x }` y tu tarea Movil2 usa `var estrellas: String { … }`.
**En el repo:** `03_ElementosUI/ImagenSegunValorView.swift` (imagen según el valor de un Slider, como `gokuImage`).

---

## 4.5 El teclado y `@FocusState`

🔎 teclado, keyboard, esconder teclado, ocultar teclado, quitar teclado, hide keyboard, dismiss keyboard, FocusState, focused, foco, onTapGesture, listo, done, siguiente campo

**Qué es:** `@FocusState` dice qué campo de texto tiene el teclado abierto. Si lo pones en `false`, el teclado se
esconde.

**Los 3 pasos de clase (Clase 3 lámina 24 · Clase 4 lámina 18):**

```swift
// 1. Variable dentro del View
@FocusState private var campoEnFoco: Bool

// 2. Ligar el focus al TextField
.focused($campoEnFoco)

// 3. Esconder el teclado (por ejemplo, al presionar un botón)
campoEnFoco = false
```

**Que el teclado desaparezca al tocar cualquier parte (Clase 4, lámina 19):** en el **Stack principal** de la
pantalla agrega:

```swift
.onTapGesture {
    campoEnFoco = false
}
```

**Ejemplo completo:**

```swift
struct FocoView: View {
    @State private var nombre = ""
    @FocusState private var campoEnFoco: Bool

    var body: some View {
        VStack {
            TextField("Nombre", text: $nombre)
                .textFieldStyle(.roundedBorder)
                .focused($campoEnFoco)
            Button("Listo") {
                campoEnFoco = false
            }
        }
        .padding()
        .onTapGesture {
            campoEnFoco = false
        }
    }
}
```

Si tienes **varios** TextField, ponle `.focused($campoEnFoco)` a **todos** con la misma variable.

**Varios campos y pasar al siguiente con el botón del teclado** (⚠️ usa `enum`, `submitLabel` y `onSubmit`):

```swift
enum CampoDelFormulario {
    case nombre
    case correo
}

struct FocoEnumView: View {
    @State private var nombre = ""
    @State private var correo = ""
    @FocusState private var campoActivo: CampoDelFormulario?

    var body: some View {
        VStack {
            TextField("Nombre", text: $nombre)
                .focused($campoActivo, equals: .nombre)
                .submitLabel(.next)
                .onSubmit {
                    campoActivo = .correo
                }
            TextField("Correo", text: $correo)
                .focused($campoActivo, equals: .correo)
                .submitLabel(.done)
            Button("Esconder teclado") {
                campoActivo = nil
            }
        }
        .onAppear {
            campoActivo = .nombre
        }
    }
}
```

- `campoActivo = .correo` → abre el teclado en el campo de correo.
- `campoActivo = nil` → esconde el teclado.
- El `.onAppear` hace que la pantalla abra con el teclado en "Nombre".

**Botón "Listo" arriba del teclado** (⚠️; muy útil con `.numberPad`, que **no tiene** tecla de Enter):

```swift
struct TecladoToolbarView: View {
    @State private var cantidad = ""
    @FocusState private var campoEnFoco: Bool

    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("Cantidad", text: $cantidad)
                    .keyboardType(.numberPad)
                    .focused($campoEnFoco)
            }
            .scrollDismissesKeyboard(.interactively)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Listo") {
                        campoEnFoco = false
                    }
                }
            }
        }
    }
}
```

- `.toolbar` con `placement: .keyboard` pone una barrita sobre el teclado. Funciona dentro de un `NavigationStack`.
- `.scrollDismissesKeyboard(.interactively)` esconde el teclado al hacer scroll hacia abajo (también existe `.immediately`).

**Opciones:**

| Qué | Cómo |
|---|---|
| Esconder el teclado | `campoEnFoco = false` (o `= nil` con enum) |
| Abrir el teclado en un campo al entrar | `.onAppear { campoEnFoco = true }` |
| Esconder al tocar fuera | `.onTapGesture { campoEnFoco = false }` en el Stack principal |
| Esconder al hacer scroll | `.scrollDismissesKeyboard(.interactively)` ⚠️ |
| Botón Listo sobre el teclado | `.toolbar { ToolbarItemGroup(placement: .keyboard) { … } }` ⚠️ |
| Cambiar el texto de la tecla Enter | `.submitLabel(.done / .next / .search / .go / .send)` ⚠️ |
| Hacer algo al presionar Enter | `.onSubmit { … }` ⚠️ |

**Errores comunes:**

| Síntoma | Por qué | Arreglo |
|---|---|---|
| Toco fuera y el teclado no se esconde | El `.onTapGesture` está en un stack que no tiene fondo: las zonas vacías no reciben toques | Ponlo en el Stack principal que tiene el `Color` de fondo (ZStack con `Color….ignoresSafeArea()`) o agrega `.contentShape(Rectangle())` ⚠️ antes del `.onTapGesture` |
| Un campo esconde el teclado y otro no | Ese TextField no tiene `.focused($campoEnFoco)` | Agrégaselo a todos |
| En el simulador no sale el teclado | El simulador está usando el teclado de tu Mac | En el simulador: **⌘K** (I/O → Keyboard → Toggle Software Keyboard) |
| `.numberPad` no tiene botón para cerrar | Ese teclado no trae Enter | Tocar fuera (`onTapGesture`) o botón "Listo" en la toolbar |

**¿Visto en clase?** ✅ Clase 3 (láminas 24–25) y Clase 4 (láminas 18–19). El `enum`, `submitLabel`, `onSubmit`,
la toolbar del teclado y `scrollDismissesKeyboard` son ⚠️ no vistos (explicación: "son modificadores de SwiftUI para
mejorar la experiencia del teclado; el patrón base es el de clase").
**En el repo:** `03_ElementosUI/TextFieldsView.swift` → bloque 8 · `03_ElementosUI/FormularioValidacionView.swift`.

---

## 4.6 `@Environment(\.dismiss)` — cerrar o regresar por código

🔎 dismiss, regresar, volver, cerrar pantalla, cerrar sheet, back, atras, boton regresar, Environment, presentationMode

**Qué es:** una acción que te da SwiftUI para **cerrar la pantalla actual**: regresa a la anterior si llegaste con
NavigationLink, o cierra la sheet si es una sheet.

**Cómo se escribe (2 pasos, Clase 6A):**

```swift
struct DetalleView: View {
    @Environment(\.dismiss) private var dismiss    // 1. variable

    var body: some View {
        Button("Regresar") {
            dismiss()                                // 2. llamarla donde quieras regresar
        }
    }
}
```

- En la pantalla **raíz** (la primera) no hace nada, porque no hay a dónde regresar.
- `DismissAction` existe desde iOS 15. Antes se usaba `@Environment(\.presentationMode)`; si lo ves en internet, es la forma vieja.

**¿Visto en clase?** ✅ Clase 6A.
**En el repo:** `06_MultiplesPantallas/PantallaDestinoView.swift`. Más detalle en la Parte 5.

---

## 4.7 `@AppStorage` (resumen; completo en la Parte 9)

🔎 AppStorage, guardar dato, persistencia, que no se borre, UserDefaults, recordar, preferencias, ajustes

**Qué es:** igual que `@State`, pero el valor **se guarda en el iPhone** y sigue ahí aunque cierres la app.

```swift
struct AjustesView: View {
    @AppStorage("nombreUsuario") private var nombreGuardado = ""

    var body: some View {
        TextField("Tu nombre", text: $nombreGuardado)
    }
}
```

- `"nombreUsuario"` es la **llave** (el nombre con que se guarda). Dos vistas con la misma llave comparten el valor.
- El `= ""` solo se usa la primera vez, cuando todavía no hay nada guardado.
- Sirve para `String`, `Int`, `Double`, `Bool`. **Nunca** para contraseñas (eso va en Keychain).

**¿Visto en clase?** ✅ Clase de persistencia (UserDefaults / @AppStorage).
**En el repo:** `11_Extras/AppStorageView.swift`.

---

## 4.8 Lo que NO se usa en el curso (y por qué)

🔎 ObservableObject, StateObject, ObservedObject, EnvironmentObject, Observable, Bindable, Published, MVVM, viewmodel

Vas a ver estas cosas en internet. **No las uses en el examen** a menos que puedas defenderlas: la profesora dijo de
Observation "**No lo utilizaremos todavía**" (Clase 6B).

| Cosa | Qué es (en una frase) | Qué usamos en su lugar |
|---|---|---|
| `class … : ObservableObject` + `@Published` | Una clase que avisa a las vistas cuando cambia | `@State` en la vista dueña |
| `@StateObject` / `@ObservedObject` | Guardar / recibir esa clase en una vista | `@State` / `@Binding` |
| `@EnvironmentObject` | Compartir esa clase con todas las vistas sin pasarla | Pasar el dato con `$` a cada vista |
| `@Observable` / `@Bindable` | La versión nueva (iOS 17) de lo mismo | `@State` + `@Binding` |
| `static let` | Valores "de la clase" | `let` normales (dentro de la vista o globales) |

**Si la profe pregunta por qué no usaste ViewModel/ObservableObject:** "Con `@State` en la vista dueña y `@Binding`
en las demás tengo una sola fuente de verdad y SwiftUI redibuja solo; para el tamaño de esta app es suficiente y
es lo que vimos en clase."

---

## 4.9 `Button`

🔎 button, boton, botón, accion, action, tocar, presionar, tap, click, borderedProminent, tint, controlSize, ancho completo, full width, boton grande, boton con icono, disabled, deshabilitado, destructive, rojo

**Qué es (Clase 3, lámina 17):** un Button tiene **etiqueta + acción**. La **acción** es un método o una propiedad de
cierre (closure, el código entre llaves). La **etiqueta** es una vista: texto, ícono o ambos.

**Cómo se escribe — las 3 formas de clase (Clase 3, lámina 18):**

```swift
struct BotonesView: View {
    @State private var edad = 0
    @State private var mensaje = ""
    @State private var nombre = ""

    func CalcularValor() {
        edad = 20
    }

    func saludar() {
        mensaje = "Hola \(nombre)"
    }

    var body: some View {
        VStack(spacing: 16) {
            // Forma 1: texto + código directo entre llaves
            Button("Aceptar") {
                edad = 20
            }

            // Forma 2: llama a una función que ya existe (SIN paréntesis)
            Button("Aceptar", action: CalcularValor)

            // Forma 3: acción + etiqueta personalizada (Label con ícono)
            Button(action: CalcularValor) {
                Label("Add Folder", systemImage: "folder.badge.plus")
            }

            // Otra forma que vas a ver: acción primero, etiqueta después
            Button {
                saludar()
            } label: {
                Text("Saludar")
            }

            // Texto + ícono en una línea (así lo usa la Clase 17: "Abrir Cámara")
            Button("Guardar", systemImage: "square.and.arrow.down") {
                saludar()
            }
        }
    }
}
```

Lo que aclara la lámina: `CalcularValor` debe ser una **función que exista**; `edad` una **variable que exista**;
dentro de las llaves va código o una llamada a función.

**Estilos** (`.buttonStyle(...)`):

| Estilo | Cómo se ve | ¿Clase? |
|---|---|---|
| `.borderedProminent` | Fondo de color sólido, texto blanco. El más usado | ✅ Clase 3 |
| `.bordered` | Fondo de color clarito | ⚠️ |
| `.borderless` | Solo texto de color (sin fondo) | ⚠️ |
| `.plain` | Como texto normal, sin color de botón | ⚠️ |
| (nada) | Texto azul | ✅ |

**Color, tamaño y forma:**

| Modificador | Qué hace | Ejemplo |
|---|---|---|
| `.tint(.purple)` | Color del botón | `.buttonStyle(.borderedProminent).tint(.purple)` |
| `.controlSize(...)` | Tamaño: `.mini`, `.small`, `.regular`, `.large`, `.extraLarge` | `.controlSize(.large)` sube la altura y el área táctil |
| `.buttonBorderShape(...)` ⚠️ | Forma: `.capsule`, `.roundedRectangle(radius: 8)`, `.circle` | `.buttonBorderShape(.capsule)` |
| `.font(.headline)` | Tamaño de letra del botón | |
| `.disabled(condición)` ⚠️ | Lo apaga (gris, no se puede tocar) si la condición es `true` | `.disabled(nombre.isEmpty)` |

```swift
Button("Morado grande") { }
    .buttonStyle(.borderedProminent)
    .tint(.purple)
    .controlSize(.large)

Button("Cápsula") { }
    .buttonStyle(.bordered)
    .buttonBorderShape(.capsule)
```

**Botón de ancho completo:** el `.frame(maxWidth: .infinity)` va **DENTRO del label**, no después del `.buttonStyle`.

```swift
Button {
    saludar()
} label: {
    Text("Generar")
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
}
.buttonStyle(.borderedProminent)
.tint(.purple)
```

Por qué: el estilo del botón se dibuja alrededor del **label**. Si el label es ancho, el fondo es ancho y **toda la
barra se puede tocar**. Si pones el `.frame` afuera, el botón se ve chico (o solo el texto se puede tocar).

**Botón con fondo propio** (sin `buttonStyle`, tú le pones todo):

```swift
Button {
    saludar()
} label: {
    Text("Continuar")
        .font(.headline)
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.orange)
        .cornerRadius(12)
}
```

**Botón que es solo un ícono** (que mida al menos ~44 puntos para el dedo):

```swift
Button {
    edad += 1
} label: {
    Image(systemName: "plus.circle.fill")
        .font(.system(size: 44))
}
```

**Botón deshabilitado y botones con rol** (⚠️):

```swift
Button("Enviar") {
    saludar()
}
.buttonStyle(.borderedProminent)
.disabled(nombre.isEmpty || !aceptaTerminos)   // se apaga si falta el nombre o no aceptó

Button("Borrar todo", role: .destructive) {    // .destructive = rojo, para borrar
    nombre = ""
}
.buttonStyle(.borderedProminent)

Button(role: .cancel) {                          // .cancel = cancelar (útil en alertas)
    nombre = ""
} label: {
    Text("Cancelar")
}
```

**Tabla de tamaños** (`.controlSize`): `.mini` < `.small` < `.regular` (normal) < `.large` < `.extraLarge`.
Para la rúbrica ("tamaño de botones"), usa `.large` o un label con `.padding()`: así el botón mide al menos 44 puntos.

**Errores comunes:**

| Mensaje / síntoma | Por qué | Arreglo |
|---|---|---|
| `cannot convert value of type '()' to expected argument type '@MainActor () -> Void'` | Escribiste `Button("A", action: calcular())` con paréntesis: eso **ejecuta** la función en vez de pasarla | Sin paréntesis: `action: calcular` |
| `Cannot find 'CalcularValor' in scope` | La función no existe o tiene otro nombre | Créala dentro del struct (antes del `body` o después) |
| El botón no hace nada | La acción está vacía `{ }`, o cambia una variable sin `@State` | Revisa la acción y que la variable sea `@State` |
| Botón ancho que solo responde al tocar el texto | El `.frame(maxWidth:)` quedó fuera del label | Muévelo **dentro** del label |
| En un renglón de `List` con 2 botones, al tocar uno se activan los dos | Dentro de List, todo el renglón cuenta como un botón | A cada botón: `.buttonStyle(.borderless)` ⚠️ |

**¿Visto en clase?** ✅ Clase 3 (láminas 14, 17, 18): las 3 formas y `.borderedProminent`. ✅ Clase 6A: `.tint(.purple)`
para dar aspecto de botón. ✅ Clase 17: `Button("Abrir Cámara", systemImage: "camera.fill")`. `.controlSize` viene en
la skill del curso. ⚠️ `role:`, `.disabled`, `.bordered/.borderless/.plain`, `.buttonBorderShape`.
**En el repo:** `03_ElementosUI/BotonesView.swift` → bloques 1–10 (1–3 las formas de clase, 6 ancho completo, 7 fondo propio, 8 solo ícono, 9 deshabilitado, 10 destructivo).

---

## 4.10 `TextField`

🔎 textfield, campo de texto, input, caja de texto, escribir, capturar, placeholder, roundedBorder, keyboardType, teclado numerico, correo, email, mayusculas, autocorrector, varias lineas, multilinea

**Qué es (Clase 3, lámina 16):** un campo donde el usuario escribe. Tiene una **etiqueta** (el texto gris que se ve
cuando está vacío, el *placeholder*) y una **variable `@State` ligada**. Si la variable es `String`, se actualiza
continuamente mientras el usuario escribe.

**Cómo se escribe (forma de clase, Clase 3 láminas 14 y 16):**

```swift
@State private var username: String = ""

TextField("Nombre", text: $username)
    .textFieldStyle(.roundedBorder)
    .frame(width: 300)
```

- `"Nombre"` = el placeholder (lo que se ve cuando está vacío).
- `$username` = dónde se guarda lo que escribe (con `$`).

**Mostrar en vivo lo que escribe:** como `username` es `@State`, cualquier `Text` que lo use cambia mientras escribe:

```swift
Text("Hola \(username)")
```

**Estilos:**

| Estilo | Cómo se ve |
|---|---|
| `.textFieldStyle(.roundedBorder)` | Cajita con borde redondeado (✅ el de clase) |
| `.textFieldStyle(.plain)` | Sin borde, solo el texto (para ponerle tu propio fondo) |
| Estilo propio | `.padding(12)` + `.background(Color.gray.opacity(0.15))` + `.cornerRadius(10)` |

```swift
TextField("Escribe tu correo", text: $correo)
    .padding(12)
    .background(Color.gray.opacity(0.15))
    .cornerRadius(10)
    .keyboardType(.emailAddress)
    .textInputAutocapitalization(.never)
    .autocorrectionDisabled()
```

**Tipos de teclado** (`.keyboardType(...)`, ⚠️ no visto en clase):

| Tipo | Qué teclado sale | Úsalo para |
|---|---|---|
| `.default` | Normal | Nombres, texto |
| `.numberPad` | Solo números 0–9 (sin punto, **sin Enter**) | Edad, cantidad, piezas |
| `.decimalPad` | Números y punto decimal (sin Enter) | Precio, peso, estatura |
| `.emailAddress` | Con `@` y `.` a la mano | Correo |
| `.phonePad` | Teclado de teléfono | Teléfono |
| `.URL` | Con `/` y `.com` | Páginas web |
| `.numbersAndPunctuation` | Números y signos | Códigos |

> Ojo: `.keyboardType` solo cambia el **teclado**, no impide que peguen letras. Igual valida con `if let`.

**Más modificadores útiles:**

| Modificador | Qué hace | ¿Clase? |
|---|---|---|
| `.textInputAutocapitalization(.never)` | No pone mayúscula automática (para correos y usuarios). Otras: `.words` (cada palabra), `.sentences` (cada oración), `.characters` (todo) | ⚠️ |
| `.autocorrectionDisabled()` | Apaga el autocorrector | ⚠️ |
| `.submitLabel(.done)` | Cambia el texto de la tecla Enter: `.done`, `.next`, `.search`, `.go`, `.send` | ⚠️ |
| `.onSubmit { … }` | Hace algo cuando presiona Enter | ⚠️ |
| `.focused($campoEnFoco)` | Para esconder el teclado (sección 4.5) | ✅ Clase 3/4 |
| `.disabled(true)` | Campo bloqueado, no se puede escribir | ⚠️ |
| `.font(.title2)` | Tamaño de la letra | ✅ |
| `.multilineTextAlignment(.center)` | Texto centrado dentro del campo | ⚠️ |

**Varias líneas** (⚠️, iOS 16+): el campo crece hacia abajo mientras escribe.

```swift
TextField("Comentario", text: $comentario, axis: .vertical)
    .lineLimit(3...5)
    .textFieldStyle(.roundedBorder)
```

`.lineLimit(3...5)` = mide mínimo 3 renglones y crece hasta 5.

**Limitar el número de caracteres** (con `.onChange` de clase):

```swift
TextField("Apodo (máx. 20)", text: $username)
    .onChange(of: username) { oldValue, newValue in
        if newValue.count > limite {
            username = String(newValue.prefix(limite))
        }
    }
Text("\(username.count)/\(limite)")
```

`newValue.prefix(20)` = los primeros 20 caracteres. `limite` es un `let limite = 20` dentro de la vista.

**TextField que guarda directo un número** (⚠️; la forma de clase es guardar texto y convertirlo, sección 4.13):

```swift
@State private var edad = 0

TextField("Edad", value: $edad, format: .number)
    .keyboardType(.numberPad)
```

**Errores comunes:**

| Mensaje / síntoma | Por qué | Arreglo |
|---|---|---|
| `cannot convert value of type 'Binding<Int>' to expected argument type 'Binding<String>'` | Ligaste un `Int` a `text:`. `text:` solo acepta `String` | Guarda un `String` (`edadTexto`) y conviértelo con `Int(edadTexto)` (4.13) |
| `cannot convert value 'nombre' of type 'String' to expected type 'Binding<String>'` | Te faltó el `$` | `text: $nombre` |
| No sale el teclado en el simulador | Está usando el teclado de la Mac | **⌘K** en el simulador |
| Escribo y el `Text` no cambia | La variable no es `@State`, o el `Text` usa otra variable | Revisa nombres y `@State` |
| El correo empieza con mayúscula | Autocapitalización | `.textInputAutocapitalization(.never)` |

**¿Visto en clase?** ✅ Clase 3 (láminas 14 y 16): `TextField("Nombre", text: $username)`, `.roundedBorder`, `.frame(width: 300)`.
**En el repo:** `03_ElementosUI/TextFieldsView.swift` → bloques 1–7 (1 básico, 2 ancho fijo, 3 estilo propio, 5 teclado numérico, 6 en vivo, 7 límite).

---

## 4.11 `SecureField` (contraseñas) ⚠️

🔎 securefield, contraseña, password, contrasena, puntitos, ocultar texto, login

**Qué es:** igual que TextField, pero muestra puntitos en lugar de las letras.

```swift
@State private var contrasena = ""

SecureField("Contraseña", text: $contrasena)
    .textFieldStyle(.roundedBorder)
```

Se valida igual que un TextField (`contrasena.isEmpty`, `contrasena.count < 8`…).
**¿Visto en clase?** ⚠️ No (explicación: "es el TextField de SwiftUI para contraseñas, oculta lo que se escribe").
**En el repo:** `03_ElementosUI/TextFieldsView.swift` → bloque 4 · `06_MultiplesPantallas/LoginView.swift`.

---

## 4.12 `TextEditor` (texto largo) ⚠️

🔎 texteditor, texto largo, descripcion larga, notas, comentarios, area de texto, textarea, varias lineas

**Qué es:** una caja grande para escribir párrafos (descripciones, notas). A diferencia del TextField, **no tiene
placeholder**: pon un `Text` arriba como etiqueta.

```swift
@State private var notas = ""

Text("Notas")
    .font(.headline)
TextEditor(text: $notas)
    .frame(height: 150)
    .padding(8)
    .scrollContentBackground(.hidden)      // quita el fondo blanco propio
    .background(Color.gray.opacity(0.15))
    .cornerRadius(10)
```

Para algo corto de 2–5 renglones, `TextField(..., axis: .vertical)` (4.10) es más sencillo.
**¿Visto en clase?** ⚠️ No. **En el repo:** no está; usa este ejemplo.

---

## 4.13 Convertir lo que escribe el usuario a número

🔎 convertir texto a numero, string a int, string a double, Int(, Double(, if let, opcional, nil, no es numero, validar numero, coma decimal, punto decimal, parse

**Qué es:** un TextField **siempre** guarda texto (`String`). Para hacer cuentas tienes que convertirlo:
`Int(texto)` o `Double(texto)`. Esa conversión **regresa un opcional**, porque el texto podría no ser número
(`"hola"` → `nil`).

**Cómo se escribe (optional binding con `if let`, Clase 2 — la forma recomendada):**

```swift
@State private var edadTexto = ""
@State private var resultado = ""
@State private var showAlert = false
@State private var alertMessage = ""

func convertir() {
    if let edad = Int(edadTexto) {
        resultado = "El próximo año tendrás \(edad + 1)"
    } else {
        alertMessage = "La edad debe ser un número entero"
        showAlert.toggle()
    }
}
```

- Dentro del `if let`, `edad` **ya es `Int` normal** (no opcional) y puedes hacer cuentas.
- Si el texto no era número, entra al `else`: ahí muestras la alerta.

**Qué regresa cada conversión:**

| Texto | `Int(texto)` | `Double(texto)` |
|---|---|---|
| `"25"` | `25` | `25.0` |
| `"3.5"` | `nil` (tiene punto) | `3.5` |
| `"3,5"` | `nil` | `nil` (Swift usa **punto**, no coma) |
| `""` (vacío) | `nil` | `nil` |
| `" 25"` (con espacio) | `nil` | `nil` |
| `"hola"` | `nil` | `nil` |

**Decimales con coma** (⚠️; en algunos iPhones el `.decimalPad` pone coma):

```swift
func convertirPrecio() {
    let textoConPunto = precioTexto.replacingOccurrences(of: ",", with: ".")
    if let precio = Double(textoConPunto) {
        resultado = "Precio con IVA: \(precio * 1.16)"
    } else {
        alertMessage = "El precio debe ser un número"
        showAlert.toggle()
    }
}
```

**Quitar espacios del principio y del final** (⚠️):

```swift
let limpio = nombre.trimmingCharacters(in: .whitespacesAndNewlines)
```

**Por qué no usar `Int(edadTexto)!`:** el `!` dice "confía, sí hay valor". Si el usuario escribió letras, la app
**truena** (*crash*). La profe enseñó el `!` (Clase 2) pero recomendó `if let` porque nunca truena.

**¿Visto en clase?** ✅ Clase 2: opcionales, unwrapping con `!` y optional binding con `if let`. ⚠️ `replacingOccurrences`
y `trimmingCharacters`.
**En el repo:** `01_SwiftBasico/OpcionalesView.swift` → bloque 4 · `03_ElementosUI/TextFieldsView.swift` → bloque 5.

---

## 4.14 `Toggle` (switch)

🔎 toggle, switch, interruptor, prender apagar, on off, si no, booleano, bool, activar, favorito, checkbox

**Qué es (Clase 4, lámina 13):** nos permite **prender/apagar** un valor. Por ejemplo, activar elementos o
prender/apagar audio. Se liga a un `Bool`.

**Cómo se escribe (Clase 4, láminas 13–15):**

```swift
@State private var isOnVal: Bool = false

Toggle("Activar Música", isOn: $isOnVal)
    .onChange(of: isOnVal) { oldValue, newValue in
        print("Cambió de \(oldValue) a \(newValue)")
    }
```

El `.onChange` es para "hacer algo" cuando se prende o se apaga (Clase 4, lámina 15).

**Variantes:**

```swift
// Con ícono que cambia (Label)
Toggle(isOn: $esFavorita) {
    Label("Favorita", systemImage: esFavorita ? "heart.fill" : "heart")
}
.tint(.purple)

// Solo el switch, sin texto
Toggle("", isOn: $isOnVal)
    .labelsHidden()

// Como botón que se queda presionado (⚠️)
Toggle("Ver detalles", isOn: $mostrarDetalles)
    .toggleStyle(.button)

// Mostrar u ocultar algo según el Toggle
if mostrarDetalles {
    Text("Aquí van los detalles")
}
```

**Modificadores:**

| Modificador | Qué hace |
|---|---|
| `.tint(.purple)` | Color del switch cuando está prendido |
| `.labelsHidden()` | Esconde el texto (queda solo el switch) |
| `.toggleStyle(.switch)` / `.toggleStyle(.button)` ⚠️ | Switch normal / botón que se queda presionado |
| `.onChange(of: variable) { oldValue, newValue in }` | Hacer algo al cambiar |
| `.disabled(true)` ⚠️ | No se puede mover |

`esFavorita ? "heart.fill" : "heart"` es el **operador ternario**: "si `esFavorita` es true usa `heart.fill`; si no,
usa `heart`".

**¿Visto en clase?** ✅ Clase 4 (láminas 12–15). ⚠️ `toggleStyle`, Toggle con `Label`.
**En el repo:** `03_ElementosUI/SliderYToggleView.swift` → bloques 4–7.

---

## 4.15 `Slider`

🔎 slider, barra, deslizar, rango, valor continuo, brillo, volumen, calificacion, step, de 1 en 1, onEditingChanged, minimo maximo

**Qué es (Clase 4, lámina 10):** una barra de valores continuos para seleccionar un valor. Por ejemplo, brillo o
volumen. Se liga a un **`Double`**.

**Cómo se escribe (forma EXACTA de la Clase 4, láminas 10–11):**

```swift
@State private var sliderValue = 50.0

Slider(value: $sliderValue, in: 0 ... 100,
       onEditingChanged: { editing in
           // hace algo
       })
.tint(.purple)
```

- `in: 0 ... 100` = el mínimo y el máximo.
- `onEditingChanged` se llama con `editing = true` cuando el usuario **empieza** a arrastrar y con `false` cuando lo **suelta**.
- `50.0` lleva `.0` porque el Slider necesita un `Double`.

**Mostrar el valor:**

```swift
Text("Brillo: \(Int(sliderValue))")                   // sin decimales: 50
Text("Valor: \(sliderValue, specifier: "%.1f")")       // con 1 decimal: 50.0
```

**Que avance de 1 en 1** (⚠️ `step:`):

```swift
@State private var calificacion = 3.0

Slider(value: $calificacion, in: 1...5, step: 1)
Text("Calificación: \(Int(calificacion))")
```

**Con íconos a los lados** (⚠️):

```swift
Slider(value: $volumen, in: 0...1) {
    Text("Volumen")
} minimumValueLabel: {
    Image(systemName: "speaker.fill")
} maximumValueLabel: {
    Image(systemName: "speaker.wave.3.fill")
}
```

**Si necesitas un `Int`:** el Slider **no acepta `Int`**. Guarda un `Double` y convierte al usarlo: `Int(calificacion)`.

**Errores comunes:**

| Mensaje | Por qué | Arreglo |
|---|---|---|
| `initializer 'init(value:in:onEditingChanged:)' requires that 'Int' conform to 'BinaryFloatingPoint'` | Ligaste un `Int` | Usa `@State private var x = 5.0` (Double) |
| Muestra `50.000000` | Interpolaste el Double directo | `Int(x)` o `specifier: "%.1f"` |

**¿Visto en clase?** ✅ Clase 4 (láminas 9–11). ⚠️ `step:`, labels de mínimo/máximo.
**En el repo:** `03_ElementosUI/SliderYToggleView.swift` → bloques 1–3 · `03_ElementosUI/ImagenSegunValorView.swift`.

---

## 4.16 `Stepper` (botones + y −) ⚠️

🔎 stepper, mas menos, + -, incrementar, decrementar, contador, cantidad, sumar restar, piezas, personas

**Qué es:** dos botoncitos `−` `+` para subir o bajar un número entero. Ideal para cantidades.

```swift
@State private var cantidad = 1

Stepper("Cantidad: \(cantidad)", value: $cantidad, in: 1...10)
Stepper("De 5 en 5: \(cantidad)", value: $cantidad, in: 0...100, step: 5)
```

- `in: 1...10` = no deja bajar de 1 ni subir de 10.
- `step: 5` = brinca de 5 en 5.
- A diferencia del Slider, el Stepper **sí** acepta `Int`.

**Con tu propio código al presionar + o −:**

```swift
Stepper {
    Text("Personas: \(cantidad)")
} onIncrement: {
    cantidad += 1
} onDecrement: {
    if cantidad > 0 {
        cantidad -= 1
    }
}
```

**¿Visto en clase?** ⚠️ No (explicación: "control de SwiftUI para subir/bajar un entero; se liga con `$` igual que el Slider").
**En el repo:** `03_ElementosUI/OtrosControlesView.swift` → bloque 1.

---

## 4.17 `Picker`

🔎 picker, selector, select, dropdown, menu, opciones, elegir, segmented, segment control, wheel, ruleta, tag, seleccionar, combo, lista desplegable

**Qué es (Clase 4, lámina 3):** nos permite **seleccionar valores de una lista**. El más utilizado es el conocido
como "select".

**Cómo se escribe (forma EXACTA de la Clase 4, láminas 3–5):**

```swift
@State private var selectedColor: Int = 1

Picker(selection: $selectedColor, label: Text("Picker")) {
    Text("Rojo").tag(1)
    Text("Amarillo").tag(2)
    Text("Azul").tag(3)
}
.pickerStyle(.wheel)
.onChange(of: selectedColor) { oldValue, newValue in
    // hace algo
}
```

**Lo más importante del Picker:**
- El **`Text`** es lo que el usuario **ve**.
- El **`.tag`** es lo que se **guarda** en la variable.
- El tipo del `.tag` debe ser **exactamente** el tipo de la variable: si la variable es `Int`, los tags son `1, 2, 3`;
  si es `String`, los tags son `"Rojo"`, `"Azul"`…
- El valor inicial de la variable (`= 1`) decide qué opción sale elegida al principio.

**Estilos** (`.pickerStyle(...)`):

| Estilo | Cómo se ve | Cuándo | ¿Clase? |
|---|---|---|---|
| `.wheel` | Ruleta ("select") | Muchas opciones | ✅ Clase 4 |
| `.segmented` | Botones en fila ("segment control") | **3–4 opciones máximo** (recomendación de la profe) | ✅ Clase 4 |
| `.menu` | Botón que abre una lista desplegable | Opciones en poco espacio | ✅ skill del curso |
| `.inline` | Lista de opciones con palomita (dentro de `Form`) | Ajustes | ⚠️ |
| `.navigationLink` | Abre otra pantalla con las opciones (dentro de `Form` + `NavigationStack`) | Muchas opciones en ajustes | ⚠️ |

```swift
// Segment control con tag String
@State private var talla = "M"

Picker(selection: $talla, label: Text("Talla")) {
    Text("Chica").tag("S")
    Text("Mediana").tag("M")
    Text("Grande").tag("L")
}
.pickerStyle(.segmented)
```

**Opción "Selecciona…" para saber si no ha elegido nada:** agrega una opción con tag vacío y valida contra ese valor.
No uses opcionales aquí, complican los tags sin ganar nada.

```swift
@State private var carrera = ""
let carreras = ["ITC", "IMT", "IBT", "LAD"]

HStack {
    Text("Carrera:")
    Picker(selection: $carrera, label: Text("Carrera")) {
        Text("Selecciona…").tag("")
        ForEach(carreras, id: \.self) { opcion in
            Text(opcion).tag(opcion)
        }
    }
    .pickerStyle(.menu)
}

Button("Validar") {
    if carrera.isEmpty {
        mensaje = "Elige una carrera"
    } else {
        mensaje = "Elegiste \(carrera)"
    }
}
```

- Para `Int`, la opción vacía sería `Text("Selecciona…").tag(0)` y validas `if numero == 0`.
- `ForEach(carreras, id: \.self)` ⚠️ crea una opción por cada elemento del arreglo. La forma 100 % de clase es escribir
  cada `Text("ITC").tag("ITC")` a mano.

**Estilos que solo funcionan dentro de un `Form`** (⚠️):

```swift
NavigationStack {
    Form {
        Picker(selection: $opcion, label: Text("En línea")) {
            Text("Uno").tag(1)
            Text("Dos").tag(2)
        }
        .pickerStyle(.inline)

        Picker(selection: $opcion, label: Text("Otra pantalla")) {
            Text("Uno").tag(1)
            Text("Dos").tag(2)
        }
        .pickerStyle(.navigationLink)
    }
}
```

**Errores comunes:**

| Síntoma | Por qué | Arreglo |
|---|---|---|
| Toco una opción y no se queda elegida | El tipo del `.tag` no coincide con la variable (ej. variable `Double`, tags `1, 2`) | Que sean del mismo tipo (`Int` con `Int`, `String` con `String`) |
| En la consola: `Picker: the selection "…" is invalid and does not have an associated tag` | El valor de la variable no es ninguno de los tags (ej. empieza en `""` y no hay `.tag("")`) | Agrega la opción vacía o pon un valor inicial que exista |
| La etiqueta "Carrera" no se ve con `.menu` o `.segmented` | En esos estilos el label no se muestra (fuera de un Form) | Pon un `Text("Carrera:")` al lado, en un HStack |
| La ruleta ocupa mucho espacio | `.wheel` mide ~200 puntos | Usa `.menu` o ponle `.frame(height: 120)` |

**¿Visto en clase?** ✅ Clase 4: `Picker(selection:label:)`, `.tag`, `.wheel`, `.segmented`, `.onChange { oldValue, newValue in }`.
⚠️ `ForEach` dentro del Picker, `.inline`, `.navigationLink`.
**En el repo:** `03_ElementosUI/PickersView.swift` → bloques 1–5 (1 wheel + onChange, 2 segmented, 3 menú desde arreglo, 4 opción vacía + validación).

---

## 4.18 Picker que depende de otro (país → ciudad)

🔎 picker dependiente, picker anidado, depende de otro, cascada, pais ciudad, categoria subcategoria, resetear seleccion, onChange picker

**Qué es:** las opciones del segundo Picker cambian según lo elegido en el primero. Cuando cambia el primero, hay
que **resetear** el segundo para que no quede apuntando a una opción que ya no existe.

```swift
struct PickerDependienteView: View {
    @State private var pais = "México"
    @State private var ciudad = "Monterrey"

    var ciudades: Array<String> {
        if pais == "México" {
            return ["Monterrey", "CDMX", "Guadalajara"]
        } else {
            return ["Madrid", "Barcelona", "Sevilla"]
        }
    }

    var body: some View {
        VStack {
            Picker(selection: $pais, label: Text("País")) {
                Text("México").tag("México")
                Text("España").tag("España")
            }
            .pickerStyle(.segmented)
            .onChange(of: pais) { oldValue, newValue in
                if let primera = ciudades.first {
                    ciudad = primera
                }
            }

            Picker(selection: $ciudad, label: Text("Ciudad")) {
                ForEach(ciudades, id: \.self) { opcion in
                    Text(opcion).tag(opcion)
                }
            }
            .pickerStyle(.wheel)

            Text("Vives en \(ciudad), \(pais)")
        }
    }
}
```

- `ciudades` es una **propiedad calculada**: se recalcula sola cuando cambia `pais`.
- `ciudades.first` es opcional (la lista podría estar vacía), por eso el `if let`.

**¿Visto en clase?** ✅ `.onChange` (Clase 4). ⚠️ `ForEach`.
**En el repo:** `03_ElementosUI/PickersDependientesView.swift` → bloques 1–3.

---

## 4.19 `DatePicker` (elegir fecha y hora) ⚠️

🔎 datepicker, fecha, elegir fecha, calendario, hora, cumpleaños, nacimiento, cita, date, displayedComponents, rango de fechas

**Qué es:** un control para elegir una fecha y/o una hora. Se liga a una variable `Date`.

```swift
@State private var fecha = Date()       // empieza en hoy

DatePicker("Fecha", selection: $fecha, displayedComponents: .date)
    .datePickerStyle(.compact)
    .environment(\.locale, Locale(identifier: "es_MX"))
```

**Qué mostrar** (`displayedComponents:`):

| Valor | Muestra |
|---|---|
| `.date` | Solo la fecha |
| `.hourAndMinute` | Solo la hora |
| `[.date, .hourAndMinute]` | Fecha y hora |

**Estilos** (`.datePickerStyle(...)`):

| Estilo | Cómo se ve |
|---|---|
| `.compact` | Un botoncito con la fecha; al tocarlo abre el calendario (el normal) |
| `.graphical` | Calendario completo en la pantalla |
| `.wheel` | Ruletas (día, mes, año) |

**Limitar las fechas** (`in:`):

```swift
// Solo de hoy en adelante (citas, reservaciones)
DatePicker("Cita", selection: $fecha, in: Date()..., displayedComponents: .date)
    .datePickerStyle(.graphical)

// Solo hasta hoy (fecha de nacimiento)
DatePicker("Nacimiento", selection: $nacimiento, in: ...Date(), displayedComponents: .date)
```

**Mostrar la fecha elegida en español** (DateFormatter de la Clase 3B):

```swift
func textoFecha(fecha: Date) -> String {
    let formato = DateFormatter()
    formato.dateStyle = DateFormatter.Style.long
    formato.timeStyle = DateFormatter.Style.none
    formato.locale = Locale(identifier: "es_MX")
    return formato.string(from: fecha)
}

Text("Elegiste: \(textoFecha(fecha: fecha))")
```

- `.environment(\.locale, Locale(identifier: "es_MX"))` hace que el **control** salga en español (meses, días).
- El `formato.locale` hace que el **texto** salga en español. Son cosas distintas: pon las dos.

**¿Visto en clase?** ⚠️ DatePicker no. ✅ DateFormatter sí (Clase 3B).
**En el repo:** `03_ElementosUI/OtrosControlesView.swift` → bloques 2–3.

---

## 4.20 `ColorPicker` ⚠️

🔎 colorpicker, elegir color, selector de color, paleta, color favorito

```swift
@State private var colorElegido = Color.blue

ColorPicker("Color de fondo", selection: $colorElegido)
ColorPicker("Sin transparencia", selection: $colorElegido, supportsOpacity: false)

Rectangle()
    .fill(colorElegido)
    .frame(height: 50)
```

Ojo: un `Color` **no se puede guardar** en `@AppStorage`. Si quieres recordar el color, usa un Picker con nombres
("Verde", "Azul") guardados como `String` y conviértelos a `Color` con un `switch`.
**¿Visto en clase?** ⚠️ No. **En el repo:** `03_ElementosUI/OtrosControlesView.swift` → bloque 4.

---

## 4.21 `ProgressView` (barra de avance y "cargando")

🔎 progressview, barra de progreso, avance, porcentaje, progress bar, cargando, loading, spinner, rueda, meta

**Qué es (Clase 15):** representa un porcentaje de avance puntual, sin necesitar Charts.

**Forma EXACTA de la Clase 15:**

```swift
VStack(alignment: .leading) {
    Text("Avance:")
    ProgressView(value: 75, total: 100)
        .scaleEffect(x: 1, y: 3)
}
```

- `value` = cuánto llevas; `total` = cuánto es el 100 %.
- `.scaleEffect(x: 1, y: 3)` engrosa la barra (3 veces más alta) sin cambiar el ancho.

**Con variable, color y porcentaje en texto:**

```swift
ProgressView(value: avance, total: 100)
    .tint(.green)
Text("\(Int(avance))% completado")
```

**Rueda de "cargando"** (⚠️):

```swift
ProgressView()                 // ruedita que gira
ProgressView("Cargando…")      // ruedita con texto
```

**Errores comunes:** si `value` es mayor que `total` la barra se queda llena y Xcode avisa en consola. Al calcular un
porcentaje (`favoritos / total`), **revisa que el total no sea 0** antes de dividir.

**¿Visto en clase?** ✅ Clase 15 (barra). ⚠️ `ProgressView()` circular.
**En el repo:** `09_Graficas/ProgressViewEjemplosView.swift` → bloque 1 · `03_ElementosUI/OtrosControlesView.swift` → bloque 5.

---

## 4.22 `Label` (texto + ícono)

🔎 label, texto con icono, icono y texto, systemImage, labelStyle, iconOnly, titleOnly

**Qué es:** un texto con un ícono (SF Symbol) a la izquierda. Se usa sola, dentro de botones, en `.tabItem` (Clase 7)
y en Toggles.

```swift
Label("Favoritos", systemImage: "star.fill")

Label("Solo ícono", systemImage: "star")
    .labelStyle(.iconOnly)       // ⚠️ solo se ve la estrella

Label("Solo texto", systemImage: "star")
    .labelStyle(.titleOnly)      // ⚠️ solo se ve el texto
```

Los nombres de los íconos se buscan en la app **SF Symbols** (o developer.apple.com/sf-symbols).
**¿Visto en clase?** ✅ Clase 3 (`Label("Add Folder", systemImage: "folder.badge.plus")` dentro de un Button) y Clase 7 (`.tabItem`). ⚠️ `.labelStyle`.

---

## 4.23 `Link` (abrir una página web) ⚠️

🔎 link, liga, url, abrir pagina, sitio web, safari, enlace, hipervinculo

```swift
if let url = URL(string: "https://www.apple.com/mx/") {
    Link("Abrir Apple", destination: url)

    Link(destination: url) {
        Label("Sitio web", systemImage: "safari")
    }
}
```

`URL(string:)` regresa un **opcional** (el texto podría no ser una URL válida), por eso el `if let`. Abre Safari, así
que **en el examen sin internet no carga** la página.
**¿Visto en clase?** ⚠️ No. **En el repo:** `03_ElementosUI/OtrosControlesView.swift` → bloque 6.

---

## 4.24 `Menu` (menú de opciones) ⚠️

🔎 menu, menú, opciones, tres puntitos, ellipsis, ordenar, mas opciones, dropdown de botones

**Qué es:** un botón que, al tocarlo, despliega una lista de botones.

```swift
Menu("Opciones") {
    Button("Editar") { }
    Button("Compartir") { }
    Button("Borrar", role: .destructive) { }
}

Menu {
    Button("Ordenar por nombre") { }
    Button("Ordenar por precio") { }
} label: {
    Label("Ordenar", systemImage: "arrow.up.arrow.down")
}
```

Diferencia con el Picker `.menu`: el **Picker guarda** la opción elegida en una variable; el **Menu ejecuta** una acción.
**¿Visto en clase?** ⚠️ No. **En el repo:** no está; usa este ejemplo.

---

## 4.25 `Gauge` (medidor) ⚠️

🔎 gauge, medidor, indicador, circulo de progreso, bateria, nivel

```swift
@State private var bateria = 0.7      // de 0 a 1

Gauge(value: bateria) {
    Text("Batería")
}

Gauge(value: bateria) {
    Text("%")
} currentValueLabel: {
    Text("\(Int(bateria * 100))")
}
.gaugeStyle(.accessoryCircular)
```

Por default va de 0 a 1. Para la rúbrica es más seguro usar `ProgressView` (sí visto en clase).
**¿Visto en clase?** ⚠️ No. **En el repo:** no está.

---

## 4.26 Alertas (`.alert`)

🔎 alert, alerta, mensaje, popup, aviso, error, validacion, showAlert, toggle, isPresented, ventana emergente, confirmar, message

**Qué es:** una ventanita que aparece encima de la pantalla con un título, un mensaje opcional y botones. Se usa para
avisar errores de validación, confirmar acciones y mostrar resultados. **Solo admite texto y botones** (no imágenes).

**Los 3 pasos de clase (Clase 3, lámina 23):**

```swift
// 1. Variable booleana
@State private var showAlert = false

// 2. Modificador en la vista
.alert("Este es un mensaje de alerta", isPresented: $showAlert) {
    Button("OK") {}
    Button("Not OK") {}
}

// 3. Prender la alerta desde una acción
showAlert.toggle()
```

`showAlert.toggle()` cambia `false` → `true` y la alerta aparece. Cuando el usuario toca un botón, SwiftUI regresa
`showAlert` a `false` solito. (`showAlert = true` funciona igual, pero la clase usa `toggle()`.)

**Mensaje que cambia según el error:** guarda el texto en otra `@State` y úsala como título.

```swift
@State private var showAlert2 = false
@State private var alertMessage = ""

Button("Validar") {
    if nombre.isEmpty {
        alertMessage = "Escribe tu nombre"
    } else {
        alertMessage = "Todo bien, \(nombre)"
    }
    showAlert2.toggle()
}
.alert(alertMessage, isPresented: $showAlert2) {
    Button("OK") {}
}
```

**Título + mensaje de varias líneas** (bloque `message:`, ⚠️ va un poco más allá de la clase):

```swift
.alert("Tu Perfil", isPresented: $showProfile) {
    Button("Cerrar") {}
} message: {
    Text("""
    Nombre: \(nombre)
    Carrera: \(carrera)
    """)
}
```

Las tres comillas `"""` permiten un texto de **varias líneas**.

**Título y mensaje variables** (lo más útil para validar formularios):

```swift
struct AlertaTituloVariableView: View {
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    var body: some View {
        Button("Probar") {
            alertTitle = "Error"
            alertMessage = "Escribe tu nombre"
            showAlert.toggle()
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }
}
```

**Botones con rol** (⚠️) para confirmar algo peligroso:

```swift
.alert("¿Borrar todo?", isPresented: $showBorrar) {
    Button("Borrar", role: .destructive) {
        lista.removeAll()
    }
    Button("Cancelar", role: .cancel) {}
} message: {
    Text("Esta acción no se puede deshacer.")
}
```

- `.destructive` = sale en **rojo**. `.cancel` = el botón de cancelar (iOS lo acomoda en su lugar).
- El código de cada botón (entre sus llaves) se ejecuta al tocarlo.

**Alerta que pide un dato** (⚠️, iOS 16+):

```swift
.alert("Nuevo elemento", isPresented: $pedirNombre) {
    TextField("Nombre", text: $nuevoNombre)
    Button("Guardar") {
        if !nuevoNombre.isEmpty {
            lista.append(nuevoNombre)
            nuevoNombre = ""
        }
    }
    Button("Cancelar", role: .cancel) {}
}
```

**Varias alertas en la misma pantalla:** cada una con **su propia** variable `Bool`. Se pueden encadenar en el mismo
elemento o ponerlas en elementos distintos (cada botón la suya).

**Si no pones botones**, iOS agrega uno de "OK" solo.

**Por qué una alerta "no sale":**

| Causa | Arreglo |
|---|---|
| Nunca cambias la variable a `true` (falta `showAlert.toggle()`) | Agrega el toggle en la acción |
| El `.alert` está en una vista que **no existe** en ese momento (dentro de un `if` que es falso) | Pon el `.alert` en una vista que siempre se ve (el ZStack/VStack principal o el botón) |
| Hay una **sheet abierta** y el `.alert` está en la pantalla de atrás | Pon el `.alert` **dentro** de la vista de la sheet |
| Dos alertas se prenden al mismo tiempo | Solo se ve una. Usa una sola alerta con título/mensaje variables |
| Usas la misma variable para dos alertas | Cada alerta necesita su propio `Bool` |
| El texto no se actualiza | Asigna `alertMessage` **antes** del `toggle()` |

**¿Visto en clase?** ✅ Clase 3 (lámina 23: los 3 pasos) y Clase 6C (alerta al validar). ⚠️ bloque `message:`,
`role:`, `TextField` dentro de la alerta.
**En el repo:** `03_ElementosUI/AlertasView.swift` → bloques 1–7 (1 básica, 2 mensaje variable, 3 varias líneas, 4 cancelar/borrar, 5 dos alertas, 6 con TextField, 7 confirmationDialog).

---

## 4.27 `confirmationDialog` (menú que sale de abajo) ⚠️

🔎 confirmationDialog, action sheet, menu de abajo, opciones abajo, hoja de acciones, que quieres hacer

**Qué es:** como una alerta, pero sale desde abajo con varias opciones (el "action sheet" de iOS).

```swift
@State private var mostrarOpciones = false

Button("Opciones") {
    mostrarOpciones.toggle()
}
.confirmationDialog("¿Qué quieres hacer?", isPresented: $mostrarOpciones, titleVisibility: .visible) {
    Button("Editar") {}
    Button("Compartir") {}
    Button("Borrar", role: .destructive) {}
    Button("Cancelar", role: .cancel) {}
}
```

`titleVisibility: .visible` hace que se vea el título.
**¿Visto en clase?** ⚠️ No. **En el repo:** `03_ElementosUI/AlertasView.swift` → bloque 7.

---

## 4.28 `.sheet` (pantalla que sube desde abajo)

🔎 sheet, hoja, modal, ventana emergente, pantalla emergente, sube desde abajo, presentar, formulario agregar, popup pantalla, isPresented, onDismiss

**Qué es:** muestra otra vista **encima**, subiendo desde abajo. El usuario la cierra deslizando hacia abajo o con un
botón. Se usa para formularios de "Agregar", elegir una opción, o abrir la cámara (Clase 17).

**Cómo se escribe (igual que la cámara de la Clase 17):**

```swift
@State private var mostrarSheet = false

Button("Abrir") {
    mostrarSheet = true
}
.sheet(isPresented: $mostrarSheet) {
    Text("Hola desde la sheet")
}
```

Mismo patrón que la alerta: un `Bool` + un modificador con `isPresented: $…`. Cuando el usuario cierra la sheet,
SwiftUI pone el `Bool` en `false` solo.

**Sheet que regresa un valor y se cierra sola** (`@Binding` + `dismiss`):

```swift
struct ElegirFrutaView: View {
    @Binding var frutaElegida: String
    @Environment(\.dismiss) private var dismiss

    let frutas = ["Manzana", "Pera", "Mango"]

    var body: some View {
        VStack(spacing: 16) {
            Text("Elige una fruta")
                .font(.title2)
            ForEach(frutas, id: \.self) { fruta in
                Button(fruta) {
                    frutaElegida = fruta
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
            Button("Cancelar", role: .cancel) {
                dismiss()
            }
        }
        .padding()
    }
}

struct SheetConValorView: View {
    @State private var mostrarSheet = false
    @State private var fruta = "Ninguna"

    var body: some View {
        VStack {
            Text("Fruta: \(fruta)")
            Button("Elegir fruta") {
                mostrarSheet = true
            }
        }
        .sheet(isPresented: $mostrarSheet) {
            ElegirFrutaView(frutaElegida: $fruta)
        }
    }
}
```

Es el mismo patrón que `CamaraPicker(selectedImageFromCamera: $selectedImage)`: la sheet recibe un `@Binding` y ahí
"regresa" el resultado.

**Para un formulario de "Agregar":** la sheet recibe `@Binding var lista: Array<MiModelo>`, hace `lista.append(...)` y
luego `dismiss()`. Receta completa en la Parte 6.

**Tips:**
- Si quieres **título y botones en la barra** dentro de la sheet, envuelve su contenido en `NavigationStack { }`. En una
  sheet sí es correcto, porque es una presentación nueva y no una pantalla empujada.
- Para hacer algo **cuando se cierra** (⚠️): `.sheet(isPresented: $mostrarSheet, onDismiss: { … }) { … }`.

**¿Visto en clase?** ✅ Clase 17 (la cámara se abre con `.sheet(isPresented:)`).
**En el repo:** `06_MultiplesPantallas/SheetView.swift` → bloques 1–2 · `08_ModelosYListas/Views/ListaAgregarBorrarView.swift`.

---

## 4.29 Más presentaciones: tamaño de la sheet, `sheet(item:)`, `fullScreenCover` ⚠️

🔎 presentationDetents, media pantalla, medium, large, sheet item, fullScreenCover, pantalla completa, no cerrar sheet, interactiveDismissDisabled, drag indicator

**Sheet a media pantalla y otras opciones:**

```swift
.sheet(isPresented: $mostrarSheet) {
    ElegirFrutaView(frutaElegida: $fruta)
        .presentationDetents([.medium, .large])     // puede estar a media pantalla o completa
        .presentationDragIndicator(.visible)        // rayita de arriba para arrastrar
        .interactiveDismissDisabled()               // no se cierra deslizando (hay que usar un botón)
}
```

| Modificador (dentro de la sheet) | Qué hace |
|---|---|
| `.presentationDetents([.medium])` | Solo media pantalla |
| `.presentationDetents([.medium, .large])` | Media y completa (el usuario elige) |
| `.presentationDetents([.fraction(0.3)])` | 30 % de la pantalla |
| `.presentationDetents([.height(200)])` | 200 puntos de alto |
| `.presentationDragIndicator(.visible)` | Muestra la rayita para arrastrar |
| `.interactiveDismissDisabled()` | No deja cerrarla deslizando |

**Sheet con un elemento** (`sheet(item:)`): se abre cuando la variable opcional tiene algo, y te da ese elemento.

```swift
struct ProductoSheet: Identifiable {
    var id: Int
    var nombre: String
}

struct SheetItemView: View {
    @State private var productoElegido: ProductoSheet? = nil

    let productos = [
        ProductoSheet(id: 1, nombre: "Tacos"),
        ProductoSheet(id: 2, nombre: "Pizza")
    ]

    var body: some View {
        List(productos) { producto in
            Button(producto.nombre) {
                productoElegido = producto
            }
        }
        .sheet(item: $productoElegido) { producto in
            Text("Detalle de \(producto.nombre)")
        }
    }
}
```

El modelo debe ser `Identifiable`. Al cerrar, SwiftUI regresa la variable a `nil`.

**Pantalla completa** (`fullScreenCover`): igual que la sheet, pero cubre todo y **no se cierra deslizando**. Necesita
un botón para cerrarla.

```swift
.fullScreenCover(isPresented: $mostrar) {
    VStack {
        Text("Cubre toda la pantalla")
        Button("Cerrar") {
            mostrar = false
        }
    }
}
```

**¿Visto en clase?** ⚠️ Nada de esta sección.
**En el repo:** `06_MultiplesPantallas/SheetView.swift` → bloques 3–4.

---

## 4.30 Eventos y ciclo de vida: `onAppear`, `onDisappear`, `onChange`, `task`

🔎 onAppear, onDisappear, onChange, task, al abrir pantalla, al cerrar pantalla, cuando cambie, reaccionar, evento, ciclo de vida, oldValue newValue, deprecated onChange

**Qué es:** modificadores que ejecutan código **cuando pasa algo**.

| Modificador | Cuándo corre | Ejemplo de uso | ¿Clase? |
|---|---|---|---|
| `.onAppear { }` | Cada vez que la vista **aparece** (también al regresar de otra pantalla) | Cargar datos guardados, contar visitas, poner el foco | ✅ (tus tareas DefaultsApp y ejemploMusica) |
| `.onDisappear { }` | Cuando la vista se **va** | Parar música, guardar | ⚠️ |
| `.onChange(of: x) { oldValue, newValue in }` | Cuando `x` **cambia** | Reaccionar a un Picker/Toggle, limitar caracteres | ✅ Clase 4 |
| `.onChange(of: x) { }` | Igual, pero sin recibir los valores | Cuando no necesitas saber el valor | ⚠️ |
| `.onChange(of: x, initial: true) { oldValue, newValue in }` | Al cambiar **y también al aparecer** | Calcular algo desde el inicio | ⚠️ |
| `.task { }` | Al aparecer, para código asíncrono (`await`) | Cargar algo que tarda | ⚠️ |

```swift
struct EventosView: View {
    @State private var visitas = 0
    @State private var texto = ""
    @State private var mensaje = ""

    var body: some View {
        VStack {
            Text(mensaje)
            TextField("Escribe", text: $texto)
                .onChange(of: texto) { oldValue, newValue in
                    mensaje = "Antes: \(oldValue) · Ahora: \(newValue)"
                }
        }
        .onAppear {
            visitas += 1
        }
        .onDisappear {
            print("Saliste de la pantalla")
        }
    }
}
```

**La firma vieja de un solo parámetro está deprecada:**

```swift
// ⚠️ forma vieja: compila pero sale un warning amarillo
.onChange(of: t) { nuevo in
    print(nuevo)
}
```

Warning: `'onChange(of:perform:)' was deprecated in iOS 17.0: Use 'onChange' with a two or zero parameter action closure instead.`
→ Usa `{ oldValue, newValue in }` (la de clase) o `{ }` sin parámetros.

**¿Visto en clase?** ✅ `.onChange { oldValue, newValue in }` (Clase 4, láminas 5 y 15). `.onAppear` aparece en tus tareas.

---

## 4.31 Gestos: tocar, doble toque, mantener presionado

🔎 onTapGesture, tap, toque, doble tap, doble toque, double tap, long press, mantener presionado, onLongPressGesture, gesto, gesture

```swift
Image(systemName: "heart")
    .onTapGesture(count: 2) {
        mensaje = "Doble toque"
    }
    .onLongPressGesture {
        mensaje = "Lo mantuviste presionado"
    }
```

| Gesto | Código | ¿Clase? |
|---|---|---|
| Un toque | `.onTapGesture { }` | ✅ Clase 4 (para esconder el teclado) |
| Doble toque | `.onTapGesture(count: 2) { }` | ⚠️ |
| Mantener presionado | `.onLongPressGesture { }` | ⚠️ |

Para que **todo un rectángulo** responda al toque (no solo donde hay texto o color): `.contentShape(Rectangle())` ⚠️
antes del gesto. Para acciones normales, mejor usa un `Button` (es más accesible).

---

## 4.32 FORMULARIO CON VALIDACIÓN (receta completa)

🔎 formulario, form, registro, validar, validacion, validation, campos vacios, isEmpty, mensaje especifico, else if, alerta de error, registrar, guardar, limpiar formulario, rango, correo valido

**Qué es:** la pantalla típica de examen. Varios campos + un botón que **revisa en orden** cada campo y, si algo está
mal, muestra una alerta con un mensaje **específico** ("Falta tu nombre", no "Error"). La rúbrica pide
"validación con alertas" y "retroalimentación al usuario".

**La idea:** una función `validarFormulario()` con una **cadena de `else if`**. En cuanto encuentra un error, prepara
su mensaje y ya no revisa los demás. Si nada falló, llega al `else` final (éxito). Al final, una sola alerta.

```swift
struct RegistroFormularioView: View {

    @State private var nombre: String = ""
    @State private var edadTexto: String = ""
    @State private var correo: String = ""
    @State private var carrera: String = ""
    @State private var aceptaTerminos: Bool = false

    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var registroListo = false

    @FocusState private var campoEnFoco: Bool

    let carreras = ["ITC", "IMT", "IBT", "LAD"]

    func validarFormulario() {
        campoEnFoco = false

        let nombreLimpio = nombre.trimmingCharacters(in: .whitespacesAndNewlines)

        var edad = 0
        if let edadConvertida = Int(edadTexto) {
            edad = edadConvertida
        }

        if nombreLimpio.isEmpty {
            alertTitle = "Falta tu nombre"
            alertMessage = "Escribe tu nombre completo."
        } else if nombreLimpio.count < 3 {
            alertTitle = "Nombre muy corto"
            alertMessage = "El nombre debe tener al menos 3 letras."
        } else if edadTexto.isEmpty {
            alertTitle = "Falta tu edad"
            alertMessage = "Escribe tu edad."
        } else if Int(edadTexto) == nil {
            alertTitle = "Edad no válida"
            alertMessage = "La edad debe ser un número entero, sin letras ni puntos."
        } else if edad < 15 || edad > 99 {
            alertTitle = "Edad fuera de rango"
            alertMessage = "La edad debe estar entre 15 y 99 años."
        } else if correo.isEmpty {
            alertTitle = "Falta tu correo"
            alertMessage = "Escribe tu correo electrónico."
        } else if !correo.contains("@") || !correo.contains(".") {
            alertTitle = "Correo no válido"
            alertMessage = "El correo debe tener @ y un punto. Ejemplo: ana@tec.mx"
        } else if carrera.isEmpty {
            alertTitle = "Falta tu carrera"
            alertMessage = "Elige tu carrera de la lista."
        } else if !aceptaTerminos {
            alertTitle = "Términos y condiciones"
            alertMessage = "Debes aceptar los términos para continuar."
        } else {
            alertTitle = "¡Registro exitoso!"
            alertMessage = """
            Nombre: \(nombreLimpio)
            Edad: \(edadTexto)
            Correo: \(correo)
            Carrera: \(carrera)
            """
            registroListo = true
        }

        showAlert.toggle()
    }

    func limpiarFormulario() {
        nombre = ""
        edadTexto = ""
        correo = ""
        carrera = ""
        aceptaTerminos = false
        registroListo = false
    }

    var body: some View {
        ZStack {
            Color.purple.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Registro")
                        .font(.largeTitle)
                        .bold()

                    Text("Nombre")
                        .font(.headline)
                    TextField("Ej. Ana López", text: $nombre)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Edad")
                        .font(.headline)
                    TextField("Ej. 20", text: $edadTexto)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .focused($campoEnFoco)

                    Text("Correo")
                        .font(.headline)
                    TextField("Ej. ana@tec.mx", text: $correo)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($campoEnFoco)

                    HStack {
                        Text("Carrera")
                            .font(.headline)
                        Spacer()
                        Picker(selection: $carrera, label: Text("Carrera")) {
                            Text("Selecciona…").tag("")
                            ForEach(carreras, id: \.self) { opcion in
                                Text(opcion).tag(opcion)
                            }
                        }
                        .pickerStyle(.menu)
                    }

                    Toggle("Acepto términos y condiciones", isOn: $aceptaTerminos)
                        .tint(.purple)

                    Button {
                        validarFormulario()
                    } label: {
                        Text("Registrar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)

                    Button("Limpiar", role: .destructive) {
                        limpiarFormulario()
                    }
                    .frame(maxWidth: .infinity)

                    if registroListo {
                        Text("✅ Registrado: \(nombre)")
                            .font(.headline)
                    }
                }
                .padding()
            }
        }
        .onTapGesture {
            campoEnFoco = false
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    RegistroFormularioView()
}
```

**Cómo leerlo:**
1. Cada campo es un `@State`. La edad se captura como **texto** (`edadTexto`) y se convierte al validar.
2. `validarFormulario()` esconde el teclado y luego revisa **en orden**: nombre → edad → correo → carrera → términos.
3. Cada `else if` es **un error con su propio mensaje**. El primero que falla gana.
4. Al final de la función, **un solo** `showAlert.toggle()` muestra la alerta con el título y mensaje que quedaron.
5. El `.alert` y el `.onTapGesture` van en el **Stack principal** (el ZStack).

**Validaciones típicas (cópialas a tu `else if`):**

| Quiero validar | Condición de error |
|---|---|
| Campo vacío | `nombre.isEmpty` |
| Vacío o solo espacios | `nombre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty` ⚠️ |
| Mínimo de caracteres | `nombre.count < 3` |
| Máximo de caracteres | `comentario.count > 200` |
| No es número entero | `Int(edadTexto) == nil` |
| No es número decimal | `Double(precioTexto) == nil` |
| Número fuera de rango (ya convertido) | `edad < 15 \|\| edad > 99` |
| Número negativo o cero | `precio <= 0` |
| Correo sin `@` | `!correo.contains("@")` ⚠️ |
| No eligió en el Picker (tag `""`) | `carrera.isEmpty` |
| No eligió en el Picker (tag `0`) | `categoria == 0` |
| No aceptó términos | `!aceptaTerminos` |
| Contraseñas distintas | `contrasena != confirmacion` |
| Ya existe en la lista | `lista.contains(nombre)` ⚠️ |

(`||` = "o", `&&` = "y", `!` = "no", `!=` = "distinto de".)

**Errores comunes:**
- Poner un `showAlert.toggle()` en **cada** `else if` además del final → la alerta se prende y se apaga. Pon **uno solo**, al final.
- Validar `Int(edadTexto)` **antes** de revisar si está vacío → el mensaje dice "no es número" cuando en realidad estaba vacío. Revisa vacío primero.
- Mensajes genéricos ("Error", "Datos inválidos") → la rúbrica pide mensajes **específicos**.

**¿Visto en clase?** ✅ Clase 3 (TextField, alertas), Clase 4 (Picker, Toggle, teclado), Clase 6C (validar en el
botón y alertar), Clase 2 (`if let`). ⚠️ `.keyboardType`, `.textInputAutocapitalization`, `trimmingCharacters`,
`contains("@")`, `role:`, `message:`.
**En el repo:** `03_ElementosUI/FormularioValidacionView.swift` → bloques 1–9 · `00_AppCompleta/Views/AgregarMascotaView.swift` (agrega a una lista).

---

## 4.33 Botón apagado hasta que el formulario sea válido ⚠️

🔎 deshabilitar boton, disabled, boton gris, formulario valido, habilitar boton, isValid

En lugar de (o además de) la alerta: una **propiedad calculada** dice si todo está bien, y el botón se apaga si no.

```swift
struct FormularioValidoView: View {
    @State private var nombre = ""
    @State private var edadTexto = ""

    var formularioValido: Bool {
        if nombre.isEmpty {
            return false
        }
        if Int(edadTexto) == nil {
            return false
        }
        return true
    }

    var body: some View {
        VStack {
            TextField("Nombre", text: $nombre)
            TextField("Edad", text: $edadTexto)
            Button("Guardar") { }
                .buttonStyle(.borderedProminent)
                .disabled(!formularioValido)
        }
    }
}
```

UX: si usas esto, explica al usuario **por qué** está apagado (un texto chico abajo), o la alerta es mejor opción.

---

## 4.34 `Form` y `Section` (pantalla tipo Ajustes) ⚠️

🔎 form, section, ajustes, settings, configuracion, header, footer, formulario estilo ajustes

**Qué es:** un contenedor que acomoda los controles como la app de Ajustes del iPhone (grupos con fondo gris,
renglones separados). Los controles se ven distinto dentro de un `Form` (por ejemplo, el Picker muestra su etiqueta).

```swift
struct FormSectionView: View {
    @State private var nombre = ""
    @State private var notificaciones = true
    @State private var tema = 1

    var body: some View {
        NavigationStack {
            Form {
                Section("Datos personales") {
                    TextField("Nombre", text: $nombre)
                }
                Section {
                    Toggle("Notificaciones", isOn: $notificaciones)
                    Picker(selection: $tema, label: Text("Tema")) {
                        Text("Claro").tag(1)
                        Text("Oscuro").tag(2)
                    }
                } header: {
                    Text("Preferencias")
                } footer: {
                    Text("Puedes cambiarlo cuando quieras.")
                }
                Section {
                    Button("Guardar") { }
                }
            }
            .navigationTitle("Ajustes")
        }
    }
}
```

- `Section("Título") { … }` = un grupo con título.
- `header:` / `footer:` = texto arriba / abajo del grupo.
- `Form` ya trae su propio scroll, así que no lo metas en un `ScrollView`.
- Para cambiar su fondo gris: `.scrollContentBackground(.hidden)` + `.background(tuColor)`.

**¿Visto en clase?** ⚠️ No (la clase arma los formularios con VStack + ScrollView, y eso es lo más seguro). Úsalo si la
pantalla es tipo "Ajustes" y puedes explicarlo.
**En el repo:** no hay `Form`; `Section` dentro de `List` está en `08_ModelosYListas/Views/ListaSeccionesView.swift`.

---

## 4.35 Chuleta de la Parte 4 (todo en una tabla)

🔎 resumen, chuleta, cheat sheet, acordeon, sintaxis rapida, controles resumen

| Quiero | Código mínimo |
|---|---|
| Variable que cambia la pantalla | `@State private var x = 0` |
| Dársela a un control | `$x` |
| Recibirla de otra vista para modificarla | `@Binding var x: Int` (sin private, sin valor) |
| Preview de una vista con `@Binding` | `MiVista(x: .constant(5))` |
| Botón | `Button("Texto") { acción }` |
| Botón azul relleno grande | `.buttonStyle(.borderedProminent).tint(.blue).controlSize(.large)` |
| Botón de ancho completo | `.frame(maxWidth: .infinity)` **dentro** del label |
| Campo de texto | `TextField("Placeholder", text: $texto).textFieldStyle(.roundedBorder)` |
| Contraseña | `SecureField("Contraseña", text: $pass)` |
| Teclado numérico | `.keyboardType(.numberPad)` / `.decimalPad` |
| Texto → número | `if let n = Int(texto) { … } else { alerta }` |
| Esconder teclado | `@FocusState private var f: Bool` + `.focused($f)` + `f = false` |
| Esconder al tocar fuera | `.onTapGesture { f = false }` en el Stack principal |
| Switch | `Toggle("Texto", isOn: $bool)` |
| Slider | `Slider(value: $double, in: 0 ... 100)` |
| Stepper | `Stepper("Cant: \(n)", value: $n, in: 1...10)` |
| Picker | `Picker(selection: $x, label: Text("…")) { Text("A").tag(1) }.pickerStyle(.segmented)` |
| Hacer algo al cambiar | `.onChange(of: x) { oldValue, newValue in }` |
| Fecha | `DatePicker("Fecha", selection: $fecha, displayedComponents: .date)` |
| Barra de avance | `ProgressView(value: 75, total: 100).scaleEffect(x: 1, y: 3)` |
| Alerta | `@State private var showAlert = false` + `.alert("Título", isPresented: $showAlert) { Button("OK") {} }` + `showAlert.toggle()` |
| Alerta con mensaje | `.alert(t, isPresented: $s) { Button("OK") {} } message: { Text(m) }` |
| Sheet | `.sheet(isPresented: $mostrar) { OtraVista() }` |
| Cerrar sheet / regresar | `@Environment(\.dismiss) private var dismiss` + `dismiss()` |
| Al aparecer la pantalla | `.onAppear { … }` |
| Guardar aunque cierre la app | `@AppStorage("llave") private var x = ""` |

---

# 5. Navegación, múltiples pantallas y TabView

Esta parte explica cómo pasar de una pantalla a otra, cómo mandar datos entre pantallas y cómo hacer una app con pestañas abajo (TabView).
Viene de las clases **6A** (Múltiples pantallas), **6B** (Paso de valores), **6C** (Botón con validación) y **7** (TabView).

### Mapa rápido: ¿qué uso?

| Quiero… | Usa | Sección |
|---|---|---|
| Ir a otra pantalla al tocar algo | `NavigationStack` + `NavigationLink` | 5.1 y 5.3 |
| Ir a otra pantalla SOLO si los datos están bien | `Button` + `.navigationDestination(isPresented:)` (Clase 6C) | 5.8 |
| Que la pantalla tenga título arriba | `.navigationTitle("…")` dentro de un `NavigationStack` | 5.4 |
| Un botón "Regresar" hecho por mí | `@Environment(\.dismiss)` + `dismiss()` | 5.5 |
| Mandar un dato a la siguiente pantalla (solo mostrarlo) | `var dato: Tipo` en la pantalla 2 | 5.6 |
| Que la pantalla 2 cambie el dato y se vea al regresar | `@State` en la 1 + `@Binding` en la 2 + `$` | 5.7 |
| Una ventana que sube desde abajo | `.sheet(isPresented:)` | 5.9 |
| Pestañas abajo | `TabView` + `.tabItem { Label(…) }` | 5.10 |
| Fotos que se deslizan de lado (carrusel) | `TabView` + `.tabViewStyle(.page)` | 5.10.9 |
| Login que lleva a una app con pestañas | `if` en la vista raíz | 5.11.4 |
| Algo no navega o sale raro | Tabla de problemas | 5.12 |

---

## 5.1 NavigationStack: las pantallas son una pila

🔎 navigationstack, navigation stack, navegacion, navegar, pila, stack de pantallas, varias pantallas, multiples pantallas, navigationview, push, pop, back, regresar, flecha atras

**Qué es:** el contenedor que permite pasar de una pantalla a otra. Funciona como una **pila de platos**:
- La primera pantalla es la **raíz** (el plato de hasta abajo).
- Cuando tocas un enlace (`NavigationLink`), la nueva pantalla se pone **encima** (push).
- Con el botón **"< Back"** de arriba, o deslizando el dedo desde la orilla izquierda, se quita la de arriba (pop) y vuelves a la anterior.
- Siempre se ve la pantalla de hasta arriba. La raíz **no se puede quitar**.

Así lo dice la lámina de la Clase 6A: "NavigationStack presenta una pila de vistas sobre una vista raíz. Las nuevas vistas se agregan encima al tocar un NavigationLink y se eliminan con el Back o con un gesto de deslizamiento".

**Cuándo usarlo:** siempre que tu app tenga más de una pantalla y quieras la flecha de regresar arriba: lista → detalle, menú → opción, formulario → resultado.

**Cómo se escribe (forma de clase, Paso #1 de la 6A):** envuelves la vista principal completa, "o inclusive solamente una sección".

```swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, world!")
            }
        }
    }
}
```

### 5.1.1 ¿Dónde va el NavigationStack? (la regla más importante)

| Tu pantalla es… | ¿Lleva `NavigationStack`? |
|---|---|
| La primera pantalla de la app (la que pones en `TuAppApp.swift`) | ✅ Sí, si desde ahí navegas |
| Cada pestaña de un `TabView` | ✅ Sí, **cada una el suyo, adentro de la pestaña** |
| Una pantalla a la que llegas con `NavigationLink` o `.navigationDestination` | ❌ **No**. Ya está dentro del de la pantalla anterior |
| Una `sheet` o `fullScreenCover` donde quieres título o navegar adentro | ✅ Sí, su propio `NavigationStack` (la sheet es "otra pila") |

**Por qué no se anida:** si la pantalla 2 también trae `NavigationStack`, metes una pila dentro de otra pila. Resultado: **dos barras de navegación** (dos títulos o dos flechas), o el Back hace cosas raras. Las pantallas destino solo traen su contenido.

```swift
// ❌ esto NO se hace: DetalleView llega con NavigationLink y además trae su propio NavigationStack
struct DetalleView: View {
    var body: some View {
        NavigationStack {          // ← sobra: ya está dentro del de la pantalla anterior
            Text("Detalle")
        }
    }
}
```

```swift
// ✅ Así: la pantalla destino solo trae su contenido
struct DetalleView: View {
    var body: some View {
        VStack {
            Text("Esta es la segunda pantalla")
        }
        .navigationTitle("Detalle")    // sí funciona: usa la barra del NavigationStack de antes
    }
}
```

**Otra forma que vas a ver:** `NavigationView { … }`. Es la versión **vieja** (antes de iOS 16). Apple la marcó como obsoleta. Usa `NavigationStack`, que es la de clase.

**Errores comunes:**
- **El `NavigationLink` sale gris y no hace nada** → no hay `NavigationStack` arriba. Envuelve la pantalla raíz.
- **El título no sale** → no hay `NavigationStack` (ver 5.4).
- **Salen dos barras o dos flechas** → hay un `NavigationStack` dentro de otro. Quita el de la pantalla destino.

**¿Visto en clase?** ✅ Clase 6A (Múltiples pantallas).
**En el repo:** `06_MultiplesPantallas/NavegacionBasicaView.swift` (encabezado con la teoría de la lámina).

---

## 5.2 Crear la segunda pantalla (un archivo nuevo)

🔎 nueva pantalla, nueva vista, crear vista, new file, swiftui view, archivo nuevo, segunda pantalla, detalleview, crear archivo

**Pasos de clase (6A, Paso #2):**
1. Clic derecho en la carpeta `Views/` → **New File from Template…** (o menú **File → New → File…**).
2. Sección **User Interface** → **SwiftUI View** → **Next**.
3. Nombre: por ejemplo `DetalleView` → **Create**.

Xcode crea el archivo con un `struct DetalleView: View` y su `#Preview`. Ahí escribes el contenido de la pantalla 2. Ejemplo de la lámina:

```swift
import SwiftUI

struct DetalleView: View {
    var body: some View {
        VStack {
            Text("Esta es la segunda pantalla")
            Image(systemName: "gamecontroller.fill")
                .font(.system(size: 60))
        }
    }
}

#Preview {
    DetalleView()
}
```

**Regla:** el nombre del archivo y el nombre del `struct` deben ser iguales (`DetalleView.swift` → `struct DetalleView`). Así lo encuentras rápido con ⌘⇧O.

**¿Visto en clase?** ✅ Clase 6A.
**En el repo:** `06_MultiplesPantallas/PantallaDestinoView.swift` (encabezado "CÓMO SE CREA").

---

## 5.3 NavigationLink: el enlace a otra pantalla

🔎 navigationlink, navigation link, link, enlace, liga, ir a otra pantalla, ir al detalle, boton que navega, navegar al tocar, destination, label

**Qué es:** el elemento que, al tocarlo, pone otra pantalla encima. Se ve como texto azul (liga) o como botón si le das estilo. **Tiene que estar dentro de un `NavigationStack`.**

### 5.3.1 Las 2 formas de la Clase 6A

```swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // FORMA 1: texto del enlace + llaves con el destino
                NavigationLink("Ir al detalle") {
                    DetalleView()
                }

                // FORMA 2: destination: + llaves con lo que se ve
                NavigationLink(destination: DetalleView()) {
                    Text("Ir al detalle")
                }
            }
        }
    }
}
```

Las dos hacen lo mismo. La forma 1 es más corta cuando el enlace es solo texto.

### 5.3.2 Forma con `label:` (la de las listas)

Cuando lo que se toca no es un texto simple (un renglón con foto, una tarjeta), se usa esta forma. Es la que aparece en la clase de **Modelos y Listas (Clase 10)**:

```swift
struct MenuView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetalleView()                       // a dónde va
            } label: {
                HStack {                            // lo que se ve y se toca
                    Image(systemName: "star.fill")
                    Text("Ver mi favorito")
                    Spacer()
                }
            }
        }
    }
}
```

### 5.3.3 Que se vea como botón (Paso #3 de la 6A)

```swift
struct BotonNavegaView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Forma exacta de la lámina
                NavigationLink("Ir al detalle") {
                    DetalleView()
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)

                // Botón que ocupa todo el ancho: el .frame va DENTRO del label
                NavigationLink {
                    DetalleView()
                } label: {
                    Text("Continuar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .padding()
        }
    }
}
```

### 5.3.4 NavigationLink dentro de una List

Cada renglón navega al detalle del elemento que tocaste. Forma de la Clase 10:

```swift
struct Jugador: Identifiable {
    var id: Int
    var nombre: String
}

struct ListaJugadoresView: View {
    let jugadores = [
        Jugador(id: 1, nombre: "Michael Jordan"),
        Jugador(id: 2, nombre: "LeBron James")
    ]

    var body: some View {
        NavigationStack {
            List(jugadores) { jugadorItem in
                NavigationLink {
                    DetalleJugadorView(jugador: jugadorItem)    // le pasas el que tocaste
                } label: {
                    Text(jugadorItem.nombre)
                }
            }
            .navigationTitle("Jugadores")
        }
    }
}

struct DetalleJugadorView: View {
    var jugador: Jugador

    var body: some View {
        Text(jugador.nombre)
            .font(.largeTitle)
            .navigationTitle("Detalle")
    }
}
```

La flechita gris `>` a la derecha del renglón la pone `List` sola cuando hay un `NavigationLink`.

### 5.3.5 Opciones del NavigationLink

| Forma / modificador | Qué hace | Ejemplo |
|---|---|---|
| `NavigationLink("Texto") { Destino() }` | Enlace de texto (forma 1, 6A) | `NavigationLink("Ver más") { MasView() }` |
| `NavigationLink(destination: Destino()) { … }` | Enlace con contenido propio (forma 2, 6A) | `NavigationLink(destination: MasView()) { Text("Ver más") }` |
| `NavigationLink { Destino() } label: { … }` | Renglones, tarjetas, botones grandes (Clase 10) | ver 5.3.2 |
| `.buttonStyle(.borderedProminent)` | Se ve como botón relleno | Paso #3 de la 6A |
| `.buttonStyle(.bordered)` | Botón con fondo suave | |
| `.tint(.purple)` | Color del botón | |
| `.controlSize(.large)` | Botón más alto (mejor área táctil) | |
| `.buttonStyle(.plain)` ⚠️ | Quita el color azul del contenido del label (útil en tarjetas) | `.buttonStyle(.plain)` |
| `.disabled(condicion)` ⚠️ | Desactiva el enlace mientras la condición sea `true` | `.disabled(nombre.isEmpty)` |

### 5.3.6 NavigationLink(value:) + .navigationDestination(for:) ⚠️

Es otra forma de navegar: el enlace manda un **valor**, y en un solo lugar dices qué pantalla mostrar para ese tipo de valor. **No se vio en clase.** Te puede salir en ejemplos de internet; aquí está para que la reconozcas.

```swift
struct FrutasView: View {
    let frutas = ["Manzana", "Mango", "Fresa"]

    var body: some View {
        NavigationStack {
            List(frutas, id: \.self) { fruta in
                NavigationLink(value: fruta) {          // ⚠️ manda el valor (un String)
                    Text(fruta)
                }
            }
            .navigationDestination(for: String.self) { fruta in   // ⚠️ qué hacer con un String
                Text("Elegiste \(fruta)")
                    .font(.largeTitle)
            }
            .navigationTitle("Frutas")
        }
    }
}
```

Si la profe pregunta: "el `NavigationLink` manda un valor y `.navigationDestination(for:)` decide qué pantalla mostrar para ese tipo de dato; sirve cuando muchos enlaces van al mismo tipo de pantalla". La forma de clase (5.3.1) es más simple; úsala.

**Errores comunes:**
- **El enlace está gris / no responde** → falta el `NavigationStack`.
- **Todo el texto del renglón sale azul** → el `NavigationLink` pinta su contenido con el color de acento. Pon tú el color (`.foregroundStyle(.black)`) o usa `.buttonStyle(.plain)` ⚠️.
- **Pusiste un `NavigationLink` dentro de un `Button`** → no navega. Un enlace ya es "tocable"; no lo metas en un botón. Si necesitas validar antes, usa la forma 6C (5.8).

**¿Visto en clase?** ✅ Formas 1 y 2: Clase 6A. Forma `label:`: Clase 10. ⚠️ `value:` + `navigationDestination(for:)` no.
**En el repo:** `06_MultiplesPantallas/NavegacionBasicaView.swift` → bloques 1 (forma 1), 2 (forma 2), 3 (label), 4 (aspecto de botón), 5 (ancho completo).

---

## 5.4 Título y barra de navegación

🔎 navigationtitle, navigation title, titulo, title, titulo de pantalla, titulo arriba, barra de navegacion, navigation bar, toolbar, ocultar barra, esconder barra, toolbar hidden, inline, titulo chico, large title, back button, flecha, boton en la barra, toolbaritem

### 5.4.1 .navigationTitle

**Qué es:** el título grande que sale arriba de la pantalla. También es el texto que aparece junto a la flecha `<` en la pantalla siguiente.

**Dónde va (importantísimo):** sobre el **contenido** que está **dentro** del `NavigationStack`, no sobre el `NavigationStack`.

```swift
struct InicioView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.purple.opacity(0.1)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        Text("Contenido")
                    }
                }
            }
            .navigationTitle("Mis Antojos")    // ✅ sobre el contenido, DENTRO del NavigationStack
        }
    }
}
```

**¿Por qué a veces NO sale el título?** (te pasó hoy)
- **No hay `NavigationStack`.** `.navigationTitle` le avisa al `NavigationStack` qué título poner. Si no hay ninguno arriba, nadie lo dibuja, y Xcode **no marca error**: simplemente no sale.
- **Es una pantalla destino y la estás viendo en el `#Preview`.** En la app sí sale, porque llega desde una pantalla con `NavigationStack`. Pero en el preview no hay pantalla anterior. Arreglo: envuelve el preview.

```swift
#Preview {
    NavigationStack {          // solo para el preview: así se ve el título en el Canvas
        DetalleView()
    }
}
```

- **Lo pusiste afuera del `NavigationStack`** (`NavigationStack { … }.navigationTitle("…")`). Muévelo adentro, al contenido.

### 5.4.2 Título chico y centrado ⚠️

```swift
.navigationTitle("Detalle")
.navigationBarTitleDisplayMode(.inline)   // ⚠️ .inline = chico y centrado · .large = grande (default)
```

Útil en pantallas de detalle, donde el título grande ocupa mucho espacio.

### 5.4.3 Esconder la barra (forma de la Clase 6A)

La lámina dice: "en el Stack principal de la pantalla deseada, el modificador `.toolbar(.hidden)`".

```swift
struct PortadaView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Pantalla sin barra arriba")
            }
            .toolbar(.hidden)     // ✅ Clase 6A: en el Stack principal
        }
    }
}
```

Ojo: si escondes la barra en una pantalla destino, también desaparece la flecha `<`. Pon un botón con `dismiss()` (5.5) para que el usuario pueda regresar.

### 5.4.4 Botones en la barra con .toolbar ⚠️

```swift
struct BarraView: View {
    @State private var contador = 0

    var body: some View {
        NavigationStack {
            Text("Toques: \(contador)")
                .font(.largeTitle)
                .navigationTitle("Barra")
                .toolbar {                                       // ⚠️ no visto en clase
                    ToolbarItem(placement: .topBarTrailing) {    // arriba a la derecha
                        Button {
                            contador += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {     // arriba a la izquierda
                        Button("Borrar") {
                            contador = 0
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {         // barra de abajo
                        Text("Barra de abajo")
                    }
                }
        }
    }
}
```

| `placement:` | Dónde sale |
|---|---|
| `.topBarTrailing` | Arriba a la derecha (típico: botón "+" o "Guardar") |
| `.topBarLeading` | Arriba a la izquierda (ojo: en una pantalla destino ahí va la flecha `<`) |
| `.bottomBar` | Una barra abajo de la pantalla |
| `.principal` | En el centro de la barra, en lugar del título |
| `.keyboard` | Arriba del teclado (ej. un botón "Listo") |

**Otra forma que vas a ver:** `.navigationBarItems(trailing: …)`. Es la versión vieja y obsoleta; no la uses.

### 5.4.5 Quitar la flecha de regresar ⚠️

```swift
.navigationBarBackButtonHidden(true)   // ⚠️ quita el "< Back" de esta pantalla
```

Úsalo en la pantalla de **Bienvenida** después de un login (para que no regrese al login con la flecha). Si lo quitas, pon un botón tuyo con `dismiss()` ("Cerrar sesión").

### 5.4.6 Color de fondo de la barra ⚠️

```swift
struct BarraDeColorView: View {
    var body: some View {
        NavigationStack {
            Text("Contenido")
                .navigationTitle("Con color")
                .toolbarBackground(Color.purple, for: .navigationBar)    // ⚠️ color de la barra
                .toolbarBackground(.visible, for: .navigationBar)        // ⚠️ que siempre se vea
                .toolbarColorScheme(.dark, for: .navigationBar)          // ⚠️ título en blanco
        }
    }
}
```

Casi nunca hace falta. Si tu pantalla ya tiene fondo de color completo (`Color.ignoresSafeArea()`), la barra se ve sobre ese fondo.

### 5.4.7 Resumen de modificadores de la barra

| Modificador | Qué hace | ¿Clase? |
|---|---|---|
| `.navigationTitle("Texto")` | Título de la pantalla | ✅ (se usa desde la Clase 10) |
| `.toolbar(.hidden)` | Esconde la barra completa | ✅ 6A |
| `.navigationBarTitleDisplayMode(.inline)` | Título chico centrado | ⚠️ |
| `.toolbar { ToolbarItem(placement:) { … } }` | Botones en la barra | ⚠️ |
| `.navigationBarBackButtonHidden(true)` | Quita la flecha `<` | ⚠️ |
| `.toolbarBackground(color, for: .navigationBar)` | Color de la barra | ⚠️ |

**En el repo:** `06_MultiplesPantallas/ToolbarView.swift` → bloques 1 (título inline), 2 (botones en la barra), 3 (`.toolbar(.hidden)`). `06_MultiplesPantallas/BienvenidaView.swift` (flecha escondida).

---

## 5.5 Regresar por código: dismiss()

🔎 dismiss, regresar, volver, back, boton regresar, cerrar pantalla, cerrar sheet, environment, presentationmode, salir, pop, ir atras, cerrar sesion

**Qué es:** una acción que cierra la pantalla actual y te regresa a la anterior. Sirve igual para una pantalla de navegación que para una `sheet`.

**Cuándo usarlo:** un botón "Regresar", "Volver a la lista", "Guardar" (guarda y regresa), "Cancelar", "Cerrar sesión". La lámina dice: "además del ícono `<`, con código se tiene mayor control de **cuándo y cómo** regresar".

**Cómo se escribe (Clase 6A, 2 pasos):**
1. En la pantalla **de detalle** (la que se va a cerrar), una variable de clase:
2. Llamar `dismiss()` donde quieras regresar (en un botón).

```swift
struct DetalleView: View {
    @Environment(\.dismiss) private var dismiss      // 1. la variable

    var body: some View {
        VStack(spacing: 20) {
            Text("Esta es la segunda pantalla")

            Button("Regresar") {
                dismiss()                            // 2. regresa a la pantalla anterior
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
        .navigationTitle("Detalle")
    }
}
```

**Nota de la lámina:** `DismissAction` (lo que usa `dismiss`) existe desde **iOS 15**. Antes se usaba `PresentationMode` (`@Environment(\.presentationMode)`), que ya es vieja. Si la ves en internet, es lo mismo pero antiguo.

**Errores comunes:**
- **Pusiste el `@Environment(\.dismiss)` en la pantalla BASE** → no hace lo que esperas. Va en la pantalla que se va a **cerrar**.
- **Llamas `dismiss()` en la pantalla raíz** → no pasa nada: la raíz no se puede quitar.
- **`dismiss()` en una `sheet`** → la cierra (es lo correcto para un botón "Cancelar" o "Guardar").

### 5.5.1 Regresar varias pantallas de golpe ⚠️

Con `dismiss()` solo regresas una. Para volver al inicio desde la pantalla 3, el `NavigationStack` necesita un **camino** (`path`). **No se vio en clase.**

```swift
struct RutaView: View {
    @State private var ruta: [Int] = []          // ⚠️ las pantallas que están encima

    var body: some View {
        NavigationStack(path: $ruta) {            // ⚠️ el stack sigue a "ruta"
            VStack(spacing: 20) {
                Text("Inicio")
                    .font(.largeTitle)
                Button("Empezar") {
                    ruta.append(1)                // agregar = navegar
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(for: Int.self) { numero in
                PasoView(numero: numero, ruta: $ruta)
            }
            .navigationTitle("Inicio")
        }
    }
}

struct PasoView: View {
    var numero: Int
    @Binding var ruta: [Int]

    var body: some View {
        VStack(spacing: 20) {
            Text("Pantalla \(numero)")
                .font(.largeTitle)
            Button("Siguiente") {
                ruta.append(numero + 1)
            }
            Button("Volver al inicio") {
                ruta.removeAll()                  // vaciar = regresar hasta la raíz
            }
        }
        .navigationTitle("Paso \(numero)")
    }
}
```

`ruta.removeLast()` regresa una sola pantalla.

**¿Visto en clase?** ✅ `dismiss`: Clase 6A. ⚠️ `path`: no.
**En el repo:** `06_MultiplesPantallas/PantallaDestinoView.swift` (botón con `dismiss()` y la nota de iOS 15).

---

## 5.6 Paso de valores de ida (Pantalla 1 → Pantalla 2)

🔎 paso de valores, pasar datos, pasar valores, mandar datos, enviar datos, parametro, pasar variable, otra pantalla, detalle recibe, var sin private, init, missing argument, recibir datos

**Qué es:** mandar un dato de una pantalla a la siguiente para que ésta lo **muestre**. Solo va de ida: si la pantalla 2 lo cambiara, la 1 no se entera.

**Cuándo usarlo:** la lista le pasa al detalle el elemento que tocaste; el formulario le pasa el resultado a la pantalla de resultados; el login le pasa el nombre a la bienvenida.

**Cómo se escribe (Clase 6B, 2 pasos):**
1. En la pantalla de **Detalle**, una variable de clase que **NO sea `private`** (tampoco lleva `@State`).
2. En la pantalla **Base**, asignar esa variable al llamar la vista, dentro de los paréntesis.

```swift
// Pantalla BASE
struct ContentView: View {
    @State private var nombre: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Tu nombre", text: $nombre)
                    .textFieldStyle(.roundedBorder)

                NavigationLink("Ir al detalle") {
                    DetalleView(nombreDetalle: nombre)     // 2. se lo mandas aquí
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .padding()
        }
    }
}

// Pantalla DETALLE
struct DetalleView: View {
    var nombreDetalle: String                  // 1. sin private y sin @State

    var body: some View {
        VStack(spacing: 12) {
            Text("Hola, \(nombreDetalle)")
                .font(.largeTitle)
            Text("Esta es la segunda pantalla")
            Image(systemName: "gamecontroller.fill")
                .font(.system(size: 60))
        }
    }
}

#Preview {
    DetalleView(nombreDetalle: "Cristina")     // el preview necesita un valor de prueba
}
```

Fíjate: al llamar la vista, `nombre` va **sin `$`**. Le mandas el **valor**, una copia.

### 5.6.1 Varios valores y un struct completo

Puedes mandar los que quieras. Se escriben **en el mismo orden** en que los declaraste.

```swift
struct Producto: Identifiable {
    var id: Int
    var nombre: String
    var precio: Double
}

struct DetalleProductoView: View {
    var producto: Producto                 // un struct completo
    var cantidad: Int                      // otro valor
    var mostrarTotal: Bool = true          // con valor inicial → al llamarla es opcional ponerlo

    var total: Double {
        return producto.precio * Double(cantidad)
    }

    var body: some View {
        VStack(spacing: 12) {
            Text(producto.nombre)
                .font(.largeTitle)
                .bold()
            Text("Cantidad: \(cantidad)")
            if mostrarTotal {
                Text("Total: \(total, format: .currency(code: "MXN"))")
            }
        }
        .navigationTitle("Producto")
    }
}

#Preview {
    NavigationStack {
        DetalleProductoView(producto: Producto(id: 1, nombre: "Tacos", precio: 25), cantidad: 4)
    }
}
```

Al llamarla: `DetalleProductoView(producto: miProducto, cantidad: 3)`. Si quieres esconder el total: `DetalleProductoView(producto: miProducto, cantidad: 3, mostrarTotal: false)`.

**Errores comunes:**
- **`Missing argument for parameter 'nombreDetalle' in call`** → la pantalla 2 pide un dato y no se lo diste. Ponlo al llamarla. En el `#Preview`, pon un valor de prueba.
- **`'DetalleView' initializer is inaccessible due to 'private' protection level`** → le pusiste `private` a `nombreDetalle`. La variable que recibe datos **no** es `private` (paso 1 de la lámina).
- **`Argument 'producto' must precede argument 'cantidad'`** → los pusiste en otro orden. Respeta el orden en que los declaraste.
- **`Cannot assign to property: 'self' is immutable`** → intentas cambiar `nombreDetalle` dentro de la pantalla 2. Con paso de ida solo se puede **leer**. Si necesitas cambiarlo, usa `@Binding` (5.7).
- **Le pusiste `@State var nombreDetalle`** → compila, pero `@State` solo toma el valor la primera vez y después ya no se actualiza. La lámina dice: sin `@State`.

**¿Visto en clase?** ✅ Clase 6B.
**En el repo:** `06_MultiplesPantallas/PasoDeValoresView.swift` → bloques 1 (capturar) y 2 (mandar) + `06_MultiplesPantallas/RecibeValoresView.swift`.

---

## 5.7 Paso de valores de ida y vuelta (@Binding)

🔎 binding, @binding, ida y vuelta, regresar valor, modificar en otra pantalla, que se refleje, cambio se vea, dos pantallas mismo dato, $ signo de pesos, dolar, state vs binding, fuente de verdad, constant, .constant, preview binding

**Qué es:** que la pantalla 2 pueda **cambiar** el dato de la pantalla 1, y que al regresar el cambio ya se vea.

**Cuándo usarlo:** el detalle donde marcas "favorito" y la lista se actualiza; una pantalla de "editar nombre"; una `sheet` que te regresa lo que elegiste; un componente `TextField` reutilizable.

**Cómo se escribe (Clase 6B, 3 pasos):**
1. En el **Detalle**, una variable que **sea `@Binding`**, **NO sea privada** y **no tenga valor inicial**.
2. En la **Base**, una variable `@State private`.
3. Asignarla al llamar la vista **con la variable `@State`**, y **no olvidar el `$`**.

```swift
// Pantalla BASE: es dueña del dato
struct ContentView: View {
    @State private var nickname: String = ""            // 2. @State private

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Tu nickname: \(nickname)")
                TextField("Nickname", text: $nickname)
                    .textFieldStyle(.roundedBorder)

                NavigationLink("Ir al detalle") {
                    DetalleView(nickname: $nickname)     // 3. con $
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .padding()
        }
    }
}

// Pantalla DETALLE: recibe permiso para leer y cambiar
struct DetalleView: View {
    @Binding var nickname: String                       // 1. @Binding, sin private, sin valor

    var body: some View {
        VStack(spacing: 16) {
            Text("Cámbialo aquí:")
            TextField("Nickname", text: $nickname)       // $ otra vez: le pasas el mismo permiso al TextField
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    DetalleView(nickname: .constant(""))                // binding de prueba para el preview
}
```

Escribe "Cristina" en la base, entra al detalle y cámbialo a "Verónica": al regresar, la base ya dice "Verónica".

### 5.7.1 La teoría (palabras de la profesora, lámina 6B)

> **@State** = esta vista es **dueña** del dato.
> **@Binding** = esta vista recibe **permiso** para leer y modificar el dato de otra vista.

- La vista con `@State` es la **única fuente de verdad**: el dato vive ahí.
- Con `$nickname` no mandas una copia: mandas una **referencia al dato** (un *Binding*).
- La vista con `@Binding` **no guarda** el dato. Solo tiene acceso para leerlo y cambiarlo. Cuando lo cambia, el cambio "viaja de regreso".
- Además de pasar la referencia, el binding **avisa**: cuando el valor cambia, SwiftUI vuelve a dibujar todas las vistas que lo usan. Por eso el cambio aparece solo.
- La lámina dice que esto es "ideal para valores individuales o pocos datos sencillos". Para modelos más grandes existe `@Observable` / `@Bindable`, pero la profe dijo: **"No lo utilizaremos todavía"**. En el examen usa `@State` + `@Binding`.

### 5.7.2 ¿Cuál uso? (dale a cada vista solo el permiso que necesita)

| La vista… | Declara | Al llamarla escribes |
|---|---|---|
| Es dueña del dato | `@State private var x = valor` | — |
| Solo lo muestra | `var x: Tipo` | `Vista(x: x)` (sin `$`) |
| Lo muestra **y lo cambia** | `@Binding var x: Tipo` | `Vista(x: $x)` (con `$`) |

### 5.7.3 El signo `$` en una línea

- `nickname` = el **valor** ("Cristina").
- `$nickname` = el **permiso** para cambiarlo (el Binding).
- Los controles que cambian datos (`TextField`, `Toggle`, `Slider`, `Picker`) siempre piden el `$`.

### 5.7.4 Preview de una vista con @Binding: .constant

En el `#Preview` no existe una pantalla base real que le pase el binding. Hay que "inyectarle" uno de prueba. La forma más limpia (lámina 6B) es `.constant(…)`: un binding de **solo lectura** con un valor fijo.

```swift
#Preview {
    DetalleView(nickname: .constant("Cristina"))
}
```

En el preview no vas a poder cambiar el valor (es constante). Para probar que sí cambia, corre la app.

### 5.7.5 Binding a una propiedad de un struct

Si la pantalla recibe un struct completo con `@Binding`, puedes ligar cada campo con `$elemento.campo`:

```swift
struct Antojo: Identifiable {
    var id: Int
    var nombre: String
    var esFavorito: Bool
}

struct DetalleAntojoView: View {
    @Binding var antojo: Antojo

    var body: some View {
        VStack(spacing: 16) {
            Text(antojo.nombre)                         // leer: sin $
                .font(.largeTitle)
            Toggle("Favorito", isOn: $antojo.esFavorito)  // cambiar: con $
                .tint(.purple)
        }
        .padding()
        .navigationTitle("Detalle")
    }
}

#Preview {
    NavigationStack {
        DetalleAntojoView(antojo: .constant(Antojo(id: 1, nombre: "Tacos Juanito", esFavorito: true)))
    }
}
```

### 5.7.6 Pasar UN elemento de una lista con binding

Para que el detalle cambie un elemento y la lista se actualice, la lista se recorre **con bindings**:

```swift
struct ListaAntojosView: View {
    @State private var antojos = [
        Antojo(id: 1, nombre: "Tacos Juanito", esFavorito: true),
        Antojo(id: 2, nombre: "Burger Barrio", esFavorito: false)
    ]

    var body: some View {
        NavigationStack {
            List($antojos) { $antojo in                    // $antojos y $antojo
                NavigationLink {
                    DetalleAntojoView(antojo: $antojo)     // con $: el detalle lo puede cambiar
                } label: {
                    HStack {
                        Text(antojo.nombre)                // sin $: solo mostrar
                        Spacer()
                        Image(systemName: antojo.esFavorito ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Antojos")
        }
    }
}
```

- `List($antojos) { $antojo in … }`: el `$` de afuera pide bindings; el `$antojo` de adentro hace que `$antojo` sea el binding y `antojo` el valor.
- Con un índice también se puede: `DetalleAntojoView(antojo: $antojos[0])`. Cuidado: si la lista tiene menos elementos, **truena** ("Index out of range").

### 5.7.7 ¿Qué pasa si NO pones el `$`?

```swift
DetalleView(nickname: nickname)
// ❌ esto NO compila si DetalleView tiene @Binding:
// Cannot convert value 'nickname' of type 'String' to expected type 'Binding<String>', use wrapper instead
```

- Si la pantalla 2 tiene `@Binding`, Xcode **no te deja**: el mensaje dice que esperaba un `Binding<String>`. Ponle `$`.
- Si la pantalla 2 tiene `var` normal, le mandas una **copia**: puedes leerla, pero si la cambias no regresa nada.

### 5.7.8 ¿Por qué una variable global no actualiza la pantalla?

En la Clase 10 la lista es una `var` global (`var listaJugadores = cargarJugadores()`), y para **mostrar** está bien. Pero si el detalle cambia esa variable global, **la pantalla no se redibuja**: una variable normal no le avisa a SwiftUI que cambió. `@State` y `@Binding` sí avisan. Por eso, si algo se va a **modificar**, va en un `@State` de la vista dueña y se reparte con `$`.

**Errores comunes:**
- **`Cannot convert value 'nickname' of type 'String' to expected type 'Binding<String>', use wrapper instead`** → falta el `$` al llamar la vista ("use wrapper" = usa el `$`).
- **`Cannot find '$nickname' in scope`** → `nickname` no es `@State` ni `@Binding` (es una `var` o `let` normal). Solo las variables con `@State`/`@Binding` tienen `$`.
- **`Missing argument for parameter 'nickname'` en el `#Preview`** → ponle `.constant(…)`.
- **El cambio no se ve al regresar** → le pasaste una copia (sin `$`), o la pantalla 2 tiene su propio `@State` en lugar de `@Binding`.
- **`Cannot convert value of type 'String' to specified type 'Binding<String>'`** → escribiste `@Binding var nickname: String = ""`. Un `@Binding` **no lleva valor inicial** (paso 1 de la lámina).

**¿Visto en clase?** ✅ Clase 6B. El recorrido `List($lista) { $item in }` va un paso más allá de la Clase 10 (allá la lista era de solo lectura); es el mismo `@Binding` de la 6B aplicado a una lista.
**En el repo:** `06_MultiplesPantallas/BindingIdaYVueltaView.swift` + `06_MultiplesPantallas/EditarNicknameView.swift` (preview con `.constant`). Lista editable: `08_ModelosYListas/Views/ListaEditableView.swift` + `08_ModelosYListas/Views/EditarJugadorView.swift`.

---

## 5.8 Navegar con un botón que valida (Clase 6C)

🔎 navigationdestination, navigation destination, isPresented, isvalid, validar antes de navegar, boton que navega, button navegar, validacion, alerta y navegar, no navegar si esta vacio, login, ir a detalle con validacion

**Qué es:** la forma de ir a otra pantalla **solo si los datos están bien**. Con `NavigationLink` no se puede validar: en cuanto lo tocas, navega. Con un `Button` primero revisas y luego decides.

**Cómo se escribe (Clase 6C, 3 pasos):**
1. Una variable para decidir si la validación pasa o no: `@State private var isValid = false`.
2. Un **`Button`** en lugar de un `NavigationLink` (**pero sí debe estar dentro de un `NavigationStack`**). Dentro del botón haces las validaciones y cambias `isValid`.
3. Un modificador **al botón** que navega cuando `isValid` sea `true`: `.navigationDestination(isPresented: $isValid) { DetalleView() }`.

**Código exacto de la lámina** (dentro del `NavigationStack`):

```swift
struct ContentView: View {
    @State private var username: String = ""
    @State private var isValid = false
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("username", text: $username)
                    .textFieldStyle(.roundedBorder)

                Button("Ir a detalle"){
                    if username.isEmpty {
                        isValid = false
                        showAlert.toggle()
                    }else{
                        isValid = true
                    }
                }
                .alert("Introduce un username", isPresented: $showAlert) {
                    Button("OK") {}
                }
                .navigationDestination(isPresented: $isValid){
                    DetalleView()
                }
            }
            .padding()
        }
    }
}
```

**Cómo funciona paso a paso:**
1. Tocas el botón.
2. Si el campo está vacío: `isValid = false` y se prende la alerta (`showAlert.toggle()`). No navega.
3. Si está lleno: `isValid = true`. Como `.navigationDestination` está "escuchando" a `isValid`, en cuanto vale `true`, navega a `DetalleView`.
4. Cuando regresas con `<`, SwiftUI pone `isValid` otra vez en `false` solito. Por eso puedes volver a navegar.

### 5.8.1 Con varios campos y un mensaje específico por error

La rúbrica pide mensajes **específicos**. Guarda el texto en otra `@State` y úsala en el `.alert`:

```swift
struct RegistroView: View {
    @State private var nombre: String = ""
    @State private var edadTexto: String = ""
    @State private var edad = 0
    @State private var isValid = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Nombre", text: $nombre)
                    .textFieldStyle(.roundedBorder)
                TextField("Edad", text: $edadTexto)
                    .textFieldStyle(.roundedBorder)

                Button("Continuar") {
                    validar()
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .alert(alertMessage, isPresented: $showAlert) {
                    Button("OK") {}
                }
                .navigationDestination(isPresented: $isValid) {
                    ResumenView(nombre: nombre, edad: edad)    // paso de valores de ida
                }
            }
            .padding()
            .navigationTitle("Registro")
        }
    }

    func validar() {
        if nombre.isEmpty {
            isValid = false
            alertMessage = "Escribe tu nombre."
            showAlert.toggle()
        } else if edadTexto.isEmpty {
            isValid = false
            alertMessage = "Escribe tu edad."
            showAlert.toggle()
        } else if let numero = Int(edadTexto) {
            if numero < 1 || numero > 120 {
                isValid = false
                alertMessage = "La edad debe estar entre 1 y 120."
                showAlert.toggle()
            } else {
                edad = numero                // guardas el número ANTES de navegar
                isValid = true
            }
        } else {
            isValid = false
            alertMessage = "La edad debe ser un número, sin letras."
            showAlert.toggle()
        }
    }
}

struct ResumenView: View {
    var nombre: String
    var edad: Int

    var body: some View {
        VStack(spacing: 12) {
            Text("Hola, \(nombre)")
                .font(.largeTitle)
            Text("Tienes \(edad) años")
        }
        .navigationTitle("Resumen")
    }
}
```

### 5.8.2 Login completo (patrón 6C)

Usuario y contraseña fijos ("admin" / "1234"), alerta específica por error, navega a una Bienvenida que recibe el nombre y tiene "Cerrar sesión".

```swift
struct LoginView: View {
    @State private var usuario: String = ""
    @State private var contrasena: String = ""
    @State private var isValid = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.purple)
                Text("Iniciar sesión")
                    .font(.largeTitle)
                    .bold()

                TextField("Usuario", text: $usuario)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)   // ⚠️ que no ponga mayúscula al inicio
                SecureField("Contraseña", text: $contrasena) // ⚠️ escribe con puntitos
                    .textFieldStyle(.roundedBorder)

                Button {
                    validar()
                } label: {
                    Text("Entrar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .controlSize(.large)
                .alert(alertMessage, isPresented: $showAlert) {
                    Button("OK") {}
                }
                .navigationDestination(isPresented: $isValid) {
                    BienvenidaView(nombre: usuario)
                }
            }
            .padding()
        }
    }

    func validar() {
        if usuario.isEmpty {
            isValid = false
            alertMessage = "Escribe tu usuario."
            showAlert.toggle()
        } else if contrasena.isEmpty {
            isValid = false
            alertMessage = "Escribe tu contraseña."
            showAlert.toggle()
        } else if usuario != "admin" || contrasena != "1234" {
            isValid = false
            alertMessage = "Usuario o contraseña incorrectos."
            showAlert.toggle()
        } else {
            isValid = true
        }
    }
}

struct BienvenidaView: View {
    var nombre: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("¡Hola, \(nombre)!")
                .font(.largeTitle)
                .bold()
            Button("Cerrar sesión") {
                dismiss()                              // regresa al login
            }
            .buttonStyle(.bordered)
            .tint(.red)
        }
        .navigationBarBackButtonHidden(true)           // ⚠️ sin flecha: solo sale con "Cerrar sesión"
    }
}
```

**Errores comunes de la 6C:**
- **El botón no navega nunca** → el botón no está dentro de un `NavigationStack`, o nunca pones `isValid = true`.
- **Pusiste `.navigationDestination` fuera del `NavigationStack`** (por ejemplo, después de la llave que lo cierra) → no navega. La lámina lo pone **en el botón**.
- **La pantalla de resultado muestra datos viejos** → guarda los datos ya convertidos (como `edad = numero`) **antes** de poner `isValid = true`.
- **Advertencia "Do not put a navigation destination modifier inside a lazy container"** → tu botón está dentro de una `List` o `LazyVStack`. En ese caso pon el `.navigationDestination` sobre la `List`, no sobre el botón.
- **La alerta sale pero también navega** → en el caso de error te faltó `isValid = false`.

**¿Visto en clase?** ✅ Clase 6C. ⚠️ `SecureField`, `.textInputAutocapitalization` y `.navigationBarBackButtonHidden` no.
**En el repo:** `06_MultiplesPantallas/NavegacionConValidacionView.swift` → bloque 1 (código exacto de la lámina) y bloque 2 (varios campos). Login: `06_MultiplesPantallas/LoginView.swift` → bloque 4 (botón que valida) + `06_MultiplesPantallas/BienvenidaView.swift`.

---

## 5.9 Otras formas de mostrar una pantalla: sheet, fullScreenCover e if

🔎 sheet, hoja, modal, popup, pop up, ventana emergente, fullscreencover, full screen cover, pantalla completa, presentationdetents, media pantalla, if para cambiar pantalla, onboarding, bienvenida, cambiar de vista sin navegar

### 5.9.1 .sheet (ventana que sube desde abajo)

**Qué es:** una pantalla que sube desde abajo, encima de la actual. Se cierra deslizando hacia abajo o con `dismiss()`. No deja flecha `<`.

**Cuándo usarlo:** formularios rápidos ("Agregar"), elegir una opción, abrir la cámara (así la abre la Clase 17).

```swift
struct SheetEjemploView: View {
    @State private var mostrarSheet = false
    @State private var fruta = "Ninguna"

    var body: some View {
        VStack(spacing: 20) {
            Text("Elegiste: \(fruta)")
                .font(.title2)
            Button("Elegir fruta") {
                mostrarSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $mostrarSheet) {
            ElegirFrutaView(fruta: $fruta)       // la sheet regresa el valor con @Binding
        }
    }
}

struct ElegirFrutaView: View {
    @Binding var fruta: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text("¿Cuál prefieres?")
                .font(.title2)
                .bold()
            Button("Manzana") {
                fruta = "Manzana"
                dismiss()                          // cierra la sheet
            }
            Button("Mango") {
                fruta = "Mango"
                dismiss()
            }
            Button("Cancelar") {
                dismiss()
            }
        }
        .padding()
    }
}
```

Es el mismo patrón que la cámara de la Clase 17: `CamaraPicker(selectedImageFromCamera: $selectedImage)` dentro de un `.sheet`.

Sheet a media pantalla ⚠️:

```swift
ElegirFrutaView(fruta: $fruta)
    .presentationDetents([.medium, .large])   // ⚠️ empieza a la mitad; se puede jalar a completa
```

### 5.9.2 .fullScreenCover ⚠️

Igual que `.sheet`, pero cubre **toda** la pantalla y **no** se cierra deslizando. Necesita un botón con `dismiss()`.

```swift
struct PortadaCompletaView: View {
    @State private var mostrar = false

    var body: some View {
        Button("Ver bienvenida") {
            mostrar.toggle()
        }
        .fullScreenCover(isPresented: $mostrar) {       // ⚠️ no visto en clase
            PantallaCompletaView()
        }
    }
}

struct PantallaCompletaView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            Button("Cerrar") {
                dismiss()                               // sin esto no hay forma de salir
            }
            .buttonStyle(.borderedProminent)
            .tint(.white)
            .foregroundStyle(.purple)
        }
    }
}
```

### 5.9.3 Cambiar la pantalla completa con `if` y una @State

**Qué es:** en lugar de "navegar", la vista raíz muestra una cosa u otra según una variable. No hay flecha ni pila.

**Cuándo usarlo:** bienvenida/onboarding que se ve una vez y luego la app; login que lleva a una app con pestañas (ver 5.11.4).

```swift
struct RaizView: View {
    @State private var yaEntro = false

    var body: some View {
        if yaEntro {
            Text("Aquí va tu app (por ejemplo el TabView)")
        } else {
            VStack(spacing: 20) {
                Text("Bienvenido")
                    .font(.largeTitle)
                    .bold()
                Button("Comenzar") {
                    yaEntro = true
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}
```

### 5.9.4 ¿Cuál uso?

| Necesito… | Usa | ¿Flecha `<`? | ¿Clase? |
|---|---|---|---|
| Ir a una pantalla al tocar algo | `NavigationLink` | Sí | ✅ 6A |
| Ir solo si los datos son válidos | `Button` + `.navigationDestination(isPresented:)` | Sí | ✅ 6C |
| Algo temporal encima (agregar, elegir, cámara) | `.sheet(isPresented:)` | No (se desliza) | ✅ 17 |
| Algo encima que ocupe todo | `.fullScreenCover(isPresented:)` | No (botón propio) | ⚠️ |
| Cambiar toda la app (login → app, bienvenida → app) | `if` con una `@State` | No | ✅ (`if` y `@State` sí se vieron) |
| Secciones principales de la app | `TabView` | No (pestañas) | ✅ 7 |

**¿Visto en clase?** ✅ `.sheet`: Clase 17 (cámara). ⚠️ `.fullScreenCover` y `.presentationDetents`: no.
**En el repo:** `06_MultiplesPantallas/SheetView.swift` → bloques 1 (sheet básica), 2 (sheet que regresa un valor), 3 (media pantalla), 4 (pantalla completa).

---

## 5.10 TabView: pestañas abajo (Clase 7)

🔎 tabview, tab view, tabs, pestañas, pestana, tab bar, tabbar, barra de abajo, menu de abajo, tabitem, tab item, iconos abajo, secciones de la app, tint pestaña, color pestaña

**Qué es:** la barra de pestañas de abajo (como en Instagram o WhatsApp). Cada pestaña muestra una vista distinta.

**Cuándo usarlo:** cuando tu app tiene varias secciones principales del mismo nivel: Inicio, Lista, Estadísticas, Perfil.

### 5.10.1 Pasos de la Clase 7

1. Crear el proyecto SwiftUI.
2. Crear la carpeta **Views** (clic derecho en la carpeta principal → **New Folder**).
3. Dentro, crear **una vista por pestaña** (New File → SwiftUI View): en clase fueron `PrincipalView`, `DetallesView` y `EvolucionesView`.
4. En `ContentView`, poner un `VStack` y, adentro, el `TabView`.

### 5.10.2 Código de la clase

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                PrincipalView()
                    .tabItem {
                        Label("Inicio", systemImage: "house.circle")
                    }
                DetallesView()
                    .tabItem {
                        Label("Detalle", systemImage: "doc.richtext.fill")
                    }
                EvolucionesView()
                    .tabItem {
                        Label("Evoluciones", systemImage: "bolt.heart.fill")
                    }
            }
            .tint(.orange)          // color del ícono de la pestaña seleccionada
        }
    }
}
```

- En la lámina la primera pestaña dice **"Home"**. Aquí dice "Inicio" porque **no se deben mezclar idiomas** en la app (se califica).
- `.tabItem { … }` va pegado a **cada vista**; lo que pongas adentro es lo que se ve en la barra.
- `Label("Texto", systemImage: "ícono")` pone el ícono y el texto. Los íconos son SF Symbols: https://developer.apple.com/sf-symbols/
- `.tint(.orange)` va sobre el `TabView` y pinta la pestaña seleccionada (lámina "Cambiar el color de ícono"). Usa un color de tu paleta.

**Otra forma de escribir el `.tabItem`** (sin `Label`): `.tabItem { Image(systemName: "house"); Text("Inicio") }`. Hace lo mismo.

### 5.10.3 ¿Cuántas pestañas?

- Entre **2 y 5**. En iPhone, si pones más de 5, iOS junta las sobrantes en una pestaña **"Más"** y se ve desordenado.
- Cada pestaña: ícono + texto corto (una palabra).

**Íconos SF Symbols que sirven para pestañas:**

| Sección | Ícono |
|---|---|
| Inicio | `house`, `house.fill`, `house.circle` |
| Lista | `list.bullet`, `list.bullet.rectangle`, `checklist` |
| Buscar | `magnifyingglass` |
| Agregar | `plus.circle`, `plus.circle.fill` |
| Estadísticas | `chart.bar.fill`, `chart.pie.fill`, `chart.line.uptrend.xyaxis` |
| Favoritos | `heart.fill`, `star.fill` |
| Perfil | `person.crop.circle`, `person.fill` |
| Ajustes | `gearshape`, `gearshape.fill` |
| Fotos / cámara | `photo`, `camera.fill` |
| Mapa / lugares | `map`, `mappin.and.ellipse` |
| Comida | `fork.knife`, `cup.and.saucer.fill` |
| Calendario | `calendar` |

### 5.10.4 NavigationStack DENTRO de cada pestaña

Si una pestaña necesita título o navegar (lista → detalle), **esa pestaña** lleva su propio `NavigationStack`, **adentro**. Nunca uno solo afuera del `TabView`.

**Por qué:**
- Cada pestaña es un "camino" independiente: si navegas en "Lista" y te cambias a "Perfil", al volver a "Lista" sigues donde estabas.
- Con un solo `NavigationStack` afuera, al navegar se iría **todo el TabView** a la pila y la barra de pestañas desaparecería. Y si además cada pestaña trae el suyo, salen **dos barras**.

La forma más ordenada: el `NavigationStack` va **dentro del archivo de cada pestaña**:

```swift
// Views/InicioView.swift
struct InicioView: View {
    var body: some View {
        NavigationStack {                          // el de esta pestaña
            List {
                NavigationLink("Ver detalle") {
                    Text("Detalle de Inicio")
                }
            }
            .navigationTitle("Inicio")
        }
    }
}

// Views/AjustesView.swift
struct AjustesView: View {
    var body: some View {
        NavigationStack {                          // el de esta otra pestaña
            Text("Ajustes")
                .navigationTitle("Ajustes")
        }
    }
}

// ContentView.swift: el TabView NO lleva NavigationStack afuera
struct ContentView: View {
    var body: some View {
        TabView {
            InicioView()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
            AjustesView()
                .tabItem {
                    Label("Ajustes", systemImage: "gearshape")
                }
        }
        .tint(.purple)
    }
}
```

### 5.10.5 Compartir datos entre pestañas

**El problema:** si cada pestaña crea su propia lista con `@State`, son **listas distintas**. Lo que agregas en una no aparece en la otra.

**La solución (forma de la skill del curso):** el `@State` vive en la vista que **contiene** el `TabView` (la dueña), y se reparte hacia abajo:
- **con `$`** a la pestaña que **modifica** (recibe `@Binding`),
- **sin `$`** a la pestaña que **solo lee** (recibe `var`).

```swift
struct Tarea: Identifiable {
    var id: Int
    var titulo: String
    var hecha: Bool
}

// La dueña de los datos: la vista del TabView
struct ContentView: View {
    @State private var tareas = [
        Tarea(id: 1, titulo: "Estudiar SwiftUI", hecha: false),
        Tarea(id: 2, titulo: "Hacer la gráfica", hecha: true)
    ]

    var body: some View {
        TabView {
            ListaTareasView(tareas: $tareas)          // con $: puede modificar
                .tabItem {
                    Label("Tareas", systemImage: "checklist")
                }
            ResumenTareasView(tareas: tareas)         // sin $: solo lee
                .tabItem {
                    Label("Resumen", systemImage: "chart.pie.fill")
                }
        }
        .tint(.purple)
    }
}

// Pestaña que MODIFICA: agrega y marca tareas
struct ListaTareasView: View {
    @Binding var tareas: Array<Tarea>
    @State private var nuevaTarea = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Nueva tarea", text: $nuevaTarea)
                        .textFieldStyle(.roundedBorder)
                    Button("Agregar") {
                        if !nuevaTarea.isEmpty {
                            tareas.append(Tarea(id: tareas.count + 1, titulo: nuevaTarea, hecha: false))
                            nuevaTarea = ""
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()

                List($tareas) { $tarea in
                    Toggle(tarea.titulo, isOn: $tarea.hecha)
                }
            }
            .navigationTitle("Tareas")
        }
    }
}

// Pestaña que SOLO LEE: calcula el resumen
struct ResumenTareasView: View {
    var tareas: Array<Tarea>

    var hechas: Int {
        var total = 0
        for tarea in tareas {
            if tarea.hecha {
                total += 1
            }
        }
        return total
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Hechas: \(hechas) de \(tareas.count)")
                    .font(.title2)
                ProgressView(value: Double(hechas), total: Double(tareas.count))
                    .scaleEffect(x: 1, y: 3)
                    .tint(.purple)
            }
            .padding()
            .navigationTitle("Resumen")
        }
    }
}
```

Agrega una tarea en "Tareas" y cámbiate a "Resumen": el total ya cambió, porque las dos pestañas usan **la misma** lista.

Ojo: el `id` nuevo con `tareas.count + 1` sirve mientras no borres elementos. Si borras, usa "el id más grande + 1" (ver la parte de listas).

### 5.10.6 Cambiar de pestaña con un botón: TabView(selection:) + .tag ⚠️

**No se vio en clase.** Sirve para un botón como "Ver mi lista" en Inicio que te lleva a la pestaña Lista.

```swift
struct TabSeleccionView: View {
    @State private var pestana = 1                        // ⚠️ qué pestaña está abierta

    var body: some View {
        TabView(selection: $pestana) {                    // ⚠️ selection liga la pestaña con la variable
            VStack(spacing: 16) {
                Text("Inicio")
                    .font(.largeTitle)
                Button("Ir a mi perfil") {
                    pestana = 3                           // cambiar el número = cambiar de pestaña
                }
                .buttonStyle(.borderedProminent)
            }
            .tabItem {
                Label("Inicio", systemImage: "house")
            }
            .tag(1)                                       // ⚠️ el número de esta pestaña

            Text("Buscar")
                .tabItem {
                    Label("Buscar", systemImage: "magnifyingglass")
                }
                .tag(2)

            Text("Perfil")
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
                .tag(3)
                .badge(2)                                 // ⚠️ numerito rojo en la pestaña
        }
        .tint(.purple)
    }
}
```

- `.tag(n)` es como en el `Picker`: lo que se **guarda** en la variable cuando esa pestaña está abierta.
- `.badge(2)` pone un circulito rojo con un 2 (también acepta texto: `.badge("Nuevo")`).
- Si una pestaña hija es la que tiene el botón, pásale `$pestana` y que reciba `@Binding var pestana: Int`.

### 5.10.7 La API nueva `Tab(…)` (iOS 18) ⚠️ solo para reconocerla

En ejemplos de internet nuevos vas a ver esto:

```swift
struct TabNuevaView: View {
    var body: some View {
        TabView {
            Tab("Inicio", systemImage: "house") {        // ⚠️ iOS 18+, no visto en clase
                Text("Inicio")
            }
            Tab("Perfil", systemImage: "person") {
                Text("Perfil")
            }
        }
    }
}
```

Hace lo mismo que `.tabItem { Label(…) }`. En el examen usa la forma de clase (5.10.2): funciona en todas las versiones y es la que te pueden pedir explicar.

### 5.10.8 Opciones del TabView

| Modificador | Qué hace | ¿Clase? |
|---|---|---|
| `.tabItem { Label("Texto", systemImage: "ícono") }` | Ícono y texto de la pestaña | ✅ 7 |
| `.tint(color)` (sobre el TabView) | Color de la pestaña seleccionada | ✅ 7 |
| `TabView(selection: $variable)` + `.tag(valor)` | Saber o cambiar la pestaña por código | ⚠️ |
| `.badge(3)` / `.badge("Nuevo")` | Numerito o texto rojo en la pestaña | ⚠️ |
| `.tabViewStyle(.page)` | Convierte el TabView en carrusel | ✅ 7 |
| `.indexViewStyle(.page(backgroundDisplayMode: .always))` | Fondo para los puntitos del carrusel | ✅ 7 |
| `.tabViewStyle(.page(indexDisplayMode: .never))` | Carrusel sin puntitos | ⚠️ |

### 5.10.9 Carrusel de fotos con TabView (Clase 7)

🔎 carrusel, carousel, slider de fotos, galeria deslizable, paginas, page, puntitos, tabviewstyle, indexviewstyle, onboarding, deslizar fotos

**Código exacto de la lámina 9:**

```swift
struct CarruselView: View {
    var body: some View {
        TabView {
            //Poner imágenes con alto de 300
            Image(systemName: "figure.baseball")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Image(systemName: "figure.bowling")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Image(systemName: "figure.american.football")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 430)
    }
}
```

- `.tabViewStyle(.page)`: en lugar de pestañas abajo, las vistas se deslizan de lado (cada una es una "página").
- `.indexViewStyle(.page(backgroundDisplayMode: .always))`: les pone fondo a los puntitos para que se vean aunque el fondo sea blanco.
- `.frame(height: 430)`: alto del carrusel completo (las imágenes miden 300, el resto es espacio para los puntitos).
- Con tus fotos de Assets: cambia `Image(systemName: "…")` por `Image("foto1")` con los mismos modificadores.

**Carrusel con texto encima de cada foto:**

```swift
struct CarruselFotosView: View {
    var body: some View {
        TabView {
            ZStack(alignment: .bottom) {
                Image("foto1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                Text("Montaña")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(8)
                    .padding(.bottom, 30)
            }
            ZStack(alignment: .bottom) {
                Image("foto2")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                Text("Playa")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(8)
                    .padding(.bottom, 30)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 300)
    }
}
```

`ZStack(alignment: .bottom)` ⚠️ pone el texto abajo, encima de la foto.

### 5.10.10 Onboarding: páginas de bienvenida con botón

```swift
struct OnboardingView: View {
    @State private var pagina = 0
    @State private var terminado = false

    var body: some View {
        if terminado {
            Text("Aquí empieza tu app")
                .font(.largeTitle)
        } else {
            VStack(spacing: 20) {
                TabView(selection: $pagina) {                   // ⚠️ selection para saber en qué página va
                    PaginaBienvenidaView(icono: "fork.knife", titulo: "Guarda tus antojos")
                        .tag(0)
                    PaginaBienvenidaView(icono: "heart.fill", titulo: "Marca tus favoritos")
                        .tag(1)
                    PaginaBienvenidaView(icono: "chart.bar.fill", titulo: "Mira tus estadísticas")
                        .tag(2)
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))

                Button(pagina < 2 ? "Siguiente" : "Comenzar") {
                    if pagina < 2 {
                        pagina += 1
                    } else {
                        terminado = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding(.bottom, 30)
            }
        }
    }
}

struct PaginaBienvenidaView: View {
    var icono: String
    var titulo: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: icono)
                .font(.system(size: 80))
                .foregroundStyle(.purple)
            Text(titulo)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
```

**Errores comunes del TabView:**
- **La barra de pestañas desapareció al navegar** → pusiste el `NavigationStack` afuera del `TabView`. Muévelo adentro de cada pestaña.
- **Salen dos títulos / dos barras** → hay `NavigationStack` afuera **y** adentro.
- **Lo que agrego en una pestaña no aparece en otra** → cada pestaña tiene su propio `@State`. Sube el `@State` a la vista del `TabView` (5.10.5).
- **La pestaña no tiene ícono** → el nombre del SF Symbol está mal escrito (no marca error, solo no sale). Cópialo de la app SF Symbols.
- **Los puntitos del carrusel no se ven** → falta `.indexViewStyle(.page(backgroundDisplayMode: .always))` y tu fondo es blanco.
- **El carrusel ocupa toda la pantalla** → ponle `.frame(height: …)` al `TabView`.

**¿Visto en clase?** ✅ Clase 7 (TabView, `.tabItem`, `Label`, `.tint`, carrusel con `.page`). ⚠️ `selection`, `.tag` en pestañas, `.badge`, `Tab(…)`.
**En el repo:** `07_TabView/TabViewBasicoView.swift` (código de clase) + `07_TabView/PrincipalView.swift`, `07_TabView/DetallesView.swift`, `07_TabView/EvolucionesView.swift`. NavigationStack por pestaña: `07_TabView/TabConNavegacionView.swift`. Datos compartidos: `07_TabView/TabDatosCompartidosView.swift` + `07_TabView/TareasListaTabView.swift` + `07_TabView/TareasResumenTabView.swift`. Cambiar de pestaña: `07_TabView/TabSeleccionView.swift`. Carrusel: `07_TabView/CarruselView.swift` → bloques 1 (clase) y 2 (fotos con texto). Onboarding: `07_TabView/OnboardingView.swift`. App completa con 4 pestañas: `00_AppCompleta/Views/AppCompletaView.swift`.

---

## 5.11 Flujos típicos de examen (código completo)

🔎 flujo, ejemplo completo, menu principal, botones grandes, lista detalle editar, formulario resultado, login tabview, estructura de app, como armar la app, pantalla de inicio con opciones

### 5.11.1 Menú principal con botones grandes que navegan

Una pantalla de inicio con 4 botones grandes; cada uno lleva a una pantalla distinta. El botón es un **componente** (se escribe una vez, se usa 4 veces).

```swift
// Components/BotonMenu.swift
struct BotonMenu: View {
    var titulo: String
    var icono: String
    var color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icono)
                .font(.system(size: 36))
            Text(titulo)
                .font(.headline)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)          // los dos de cada fila miden lo mismo
        .frame(height: 120)
        .background(color)
        .cornerRadius(16)
    }
}

// Views/MenuPrincipalView.swift
struct MenuPrincipalView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("¿Qué quieres hacer hoy?")
                    .font(.title2)
                    .foregroundStyle(.secondary)

                HStack(spacing: 16) {
                    NavigationLink {
                        Text("Pantalla de perfil")
                    } label: {
                        BotonMenu(titulo: "Perfil", icono: "person.fill", color: .purple)
                    }
                    NavigationLink {
                        Text("Pantalla de lista")
                    } label: {
                        BotonMenu(titulo: "Lista", icono: "list.bullet", color: .blue)
                    }
                }

                HStack(spacing: 16) {
                    NavigationLink {
                        Text("Pantalla de gráficas")
                    } label: {
                        BotonMenu(titulo: "Gráficas", icono: "chart.bar.fill", color: .orange)
                    }
                    NavigationLink {
                        Text("Pantalla de ajustes")
                    } label: {
                        BotonMenu(titulo: "Ajustes", icono: "gearshape.fill", color: .teal)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Mi App")
        }
    }
}
```

Cambia cada `Text("Pantalla de …")` por tu vista real (`PerfilView()`, `ListaView()`…).
**En el repo:** `06_MultiplesPantallas/MenuPrincipalView.swift` → bloque 2 (cuadrícula 2x2).

### 5.11.2 Lista → Detalle → Editar (el binding pasa de mano en mano)

La lista es dueña (`@State`), el detalle recibe `@Binding` y se lo vuelve a pasar a "Editar" con `$`. Lo que cambies en Editar se ve en el Detalle **y** en la Lista.

```swift
struct Libro: Identifiable {
    var id: Int
    var titulo: String
    var autor: String
    var leido: Bool
}

struct ListaLibrosView: View {
    @State private var libros = [
        Libro(id: 1, titulo: "Cien años de soledad", autor: "Gabriel García Márquez", leido: true),
        Libro(id: 2, titulo: "Pedro Páramo", autor: "Juan Rulfo", leido: false)
    ]

    var body: some View {
        NavigationStack {
            List($libros) { $libro in
                NavigationLink {
                    DetalleLibroView(libro: $libro)
                } label: {
                    HStack {
                        Text(libro.titulo)
                        Spacer()
                        if libro.leido {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        }
                    }
                }
            }
            .navigationTitle("Libros")
        }
    }
}

struct DetalleLibroView: View {
    @Binding var libro: Libro

    var body: some View {
        VStack(spacing: 16) {
            Text(libro.titulo)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            Text(libro.autor)
                .foregroundStyle(.secondary)
            Toggle("Ya lo leí", isOn: $libro.leido)
                .tint(.green)
            NavigationLink("Editar") {
                EditarLibroView(libro: $libro)         // se lo vuelves a pasar con $
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
        .navigationTitle("Detalle")
    }
}

struct EditarLibroView: View {
    @Binding var libro: Libro
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Título")
            TextField("Título", text: $libro.titulo)
                .textFieldStyle(.roundedBorder)
            Text("Autor")
            TextField("Autor", text: $libro.autor)
                .textFieldStyle(.roundedBorder)
            Button("Listo") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
        .navigationTitle("Editar")
    }
}

#Preview {
    NavigationStack {
        DetalleLibroView(libro: .constant(Libro(id: 1, titulo: "Pedro Páramo", autor: "Juan Rulfo", leido: false)))
    }
}
```

**En el repo:** `08_ModelosYListas/Views/ListaEditableView.swift` + `08_ModelosYListas/Views/EditarJugadorView.swift`; versión completa con foto en `00_AppCompleta/Views/ListaMascotasView.swift` + `00_AppCompleta/Views/DetalleMascotaView.swift`.

### 5.11.3 Formulario → Resultado (validación 6C + paso de valores)

El usuario escribe datos, el botón valida y, si todo está bien, navega a una pantalla que **recibe** los valores y calcula.

```swift
struct PropinaView: View {
    @State private var cuentaTexto: String = ""
    @State private var porcentaje = 15
    @State private var cuenta = 0.0
    @State private var isValid = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Total de la cuenta", text: $cuentaTexto)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)                  // ⚠️ teclado con números y punto

                Picker(selection: $porcentaje, label: Text("Propina")) {
                    Text("10%").tag(10)
                    Text("15%").tag(15)
                    Text("20%").tag(20)
                }
                .pickerStyle(.segmented)

                Button("Calcular") {
                    if cuentaTexto.isEmpty {
                        isValid = false
                        alertMessage = "Escribe el total de la cuenta."
                        showAlert.toggle()
                    } else if let numero = Double(cuentaTexto) {
                        if numero <= 0 {
                            isValid = false
                            alertMessage = "El total debe ser mayor a 0."
                            showAlert.toggle()
                        } else {
                            cuenta = numero                     // 1. guardas el número
                            isValid = true                      // 2. y luego navegas
                        }
                    } else {
                        isValid = false
                        alertMessage = "El total debe ser un número."
                        showAlert.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .alert(alertMessage, isPresented: $showAlert) {
                    Button("OK") {}
                }
                .navigationDestination(isPresented: $isValid) {
                    ResultadoPropinaView(cuenta: cuenta, porcentaje: porcentaje)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Propina")
        }
    }
}

struct ResultadoPropinaView: View {
    var cuenta: Double
    var porcentaje: Int

    var propina: Double {
        return cuenta * Double(porcentaje) / 100
    }

    var body: some View {
        VStack(spacing: 12) {
            Text("Cuenta: \(cuenta, format: .currency(code: "MXN"))")
            Text("Propina (\(porcentaje)%): \(propina, format: .currency(code: "MXN"))")
            Text("Total: \(cuenta + propina, format: .currency(code: "MXN"))")
                .font(.title)
                .bold()
        }
        .navigationTitle("Resultado")
    }
}
```

### 5.11.4 Login → app con pestañas (SIN anidar NavigationStack)

**El problema:** si el login navega al `TabView` con `.navigationDestination`, el `TabView` queda **dentro** del `NavigationStack` del login. Y si cada pestaña trae su `NavigationStack`, salen **dos barras** y la flecha regresa al login.

**La solución:** la vista raíz decide con un `if` qué mostrar. El login y la app nunca están uno dentro del otro.

```swift
// ContentView.swift (la raíz): decide qué se ve
struct ContentView: View {
    @State private var sesionIniciada = false
    @State private var nombreUsuario = ""

    var body: some View {
        if sesionIniciada {
            AppPrincipalView(nombre: nombreUsuario, sesionIniciada: $sesionIniciada)
        } else {
            LoginSimpleView(nombreUsuario: $nombreUsuario, sesionIniciada: $sesionIniciada)
        }
    }
}

struct LoginSimpleView: View {
    @Binding var nombreUsuario: String
    @Binding var sesionIniciada: Bool
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 16) {
            Text("Bienvenido")
                .font(.largeTitle)
                .bold()
            TextField("Tu nombre", text: $nombreUsuario)
                .textFieldStyle(.roundedBorder)
            Button("Entrar") {
                if nombreUsuario.isEmpty {
                    showAlert.toggle()
                } else {
                    sesionIniciada = true            // la raíz cambia sola a la app
                }
            }
            .buttonStyle(.borderedProminent)
            .alert("Escribe tu nombre", isPresented: $showAlert) {
                Button("OK") {}
            }
        }
        .padding()
    }
}

struct AppPrincipalView: View {
    var nombre: String
    @Binding var sesionIniciada: Bool

    var body: some View {
        TabView {
            NavigationStack {                         // cada pestaña su propio NavigationStack
                Text("Hola, \(nombre)")
                    .navigationTitle("Inicio")
            }
            .tabItem {
                Label("Inicio", systemImage: "house")
            }

            NavigationStack {
                Button("Cerrar sesión") {
                    sesionIniciada = false            // regresa al login
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .navigationTitle("Perfil")
            }
            .tabItem {
                Label("Perfil", systemImage: "person.crop.circle")
            }
        }
        .tint(.purple)
    }
}
```

Otra opción: abrir la app con `.fullScreenCover(isPresented: $sesionIniciada) { AppPrincipalView(…) }` ⚠️ desde el login. También evita anidar, porque la `fullScreenCover` es otra "pila".

### 5.11.5 Bienvenida que se ve una vez → app

Usa el `if` de 5.9.3 o el onboarding de 5.10.10. Para que no vuelva a salir al reabrir la app, guarda `yaEntro` con `@AppStorage("yaEntro") private var yaEntro = false` en lugar de `@State` (ver la parte de persistencia).

---

## 5.12 Problemas típicos: síntoma → causa → arreglo

🔎 no navega, no sale el titulo, dos barras, doble barra, back no aparece, no regresa, cambios no se ven, no se actualiza, tabview pierde datos, preview truena, preview error, missing argument, binding error, navigation error, pantalla en blanco

| Síntoma | Causa más probable | Arreglo |
|---|---|---|
| El título no sale | No hay `NavigationStack` arriba | Envuelve la pantalla raíz (o la pestaña) en `NavigationStack`. En el preview de una pantalla destino: `#Preview { NavigationStack { MiVista() } }` |
| El título no sale (sí hay stack) | `.navigationTitle` está afuera del `NavigationStack` | Ponlo sobre el contenido, adentro |
| Salen dos barras / dos títulos / dos flechas | `NavigationStack` dentro de otro | Quítalo de la pantalla destino. En TabView: solo dentro de cada pestaña |
| El `NavigationLink` está gris y no navega | No está dentro de un `NavigationStack` | Agrega el `NavigationStack` |
| El botón (6C) no navega | Falta `NavigationStack`, nunca pones `isValid = true`, o el `.navigationDestination` está fuera del stack | Revisa los 3 pasos de 5.8 |
| No aparece la flecha `< Back` | Llegaste con `.sheet`/`fullScreenCover`, usaste `.toolbar(.hidden)` o `.navigationBarBackButtonHidden(true)` | Pon un botón con `dismiss()` |
| Navega dos veces / pantalla repetida | Un `NavigationLink` dentro de un `Button`, o dos `.navigationDestination` con la misma variable | Usa solo uno de los dos |
| Los cambios del detalle no se ven al regresar | Mandaste el valor sin `$`, el detalle tiene `@State` en vez de `@Binding`, o usas una variable global | `@State` en la base + `@Binding` en el detalle + `$` (5.7) |
| Lo que agrego en una pestaña no sale en otra | Cada pestaña tiene su propio `@State` | Sube el `@State` a la vista del `TabView` (5.10.5) |
| La barra de pestañas desaparece al navegar | `NavigationStack` afuera del `TabView` | Muévelo dentro de cada pestaña |
| Al cambiar de pestaña se borra lo escrito | El dato es `@State` de una vista que se vuelve a crear | Guarda el dato en la vista del `TabView` y pásalo con `$` |
| `Missing argument for parameter 'x' in call` | La vista pide un dato y no se lo diste (muy común en el `#Preview`) | Pásalo. En el preview: valor de prueba o `.constant(…)` si es `@Binding` |
| `Cannot convert value 'x' of type 'String' to expected type 'Binding<String>', use wrapper instead` | Falta el `$` | `Vista(x: $x)` |
| `Cannot find '$x' in scope` | `x` no es `@State` ni `@Binding` | Declárala con `@State private var` |
| `'MiVista' initializer is inaccessible due to 'private' protection level` | Una variable que recibe datos es `private` | Quita el `private` en la pantalla que recibe |
| `Cannot assign to property: 'self' is immutable` | Intentas cambiar una `var` normal dentro de una vista | Si es de la vista: `@State private var`. Si viene de otra: `@Binding` |
| `Argument 'a' must precede argument 'b'` | Los datos van en otro orden | Escríbelos en el orden en que se declararon |
| El preview no muestra el título | El preview no tiene `NavigationStack` | Envuélvelo en `NavigationStack` |
| El preview truena o sale en blanco con `@Binding` | Le pasaste un binding que no existe | Usa `.constant(valor)` |
| `dismiss()` no hace nada | Está en la pantalla raíz, o el `@Environment(\.dismiss)` está en otra vista | Ponlo en la pantalla que se va a cerrar |

---

## 5.13 Resumen de una línea (acordeón)

🔎 resumen navegacion, cheat sheet, acordeon, chuleta, resumen tabview, resumen binding

| Cosa | Se escribe | Clase |
|---|---|---|
| Pila de pantallas | `NavigationStack { … }` (en la raíz o en cada pestaña) | 6A |
| Enlace (texto) | `NavigationLink("Texto") { Destino() }` | 6A |
| Enlace (destination) | `NavigationLink(destination: Destino()) { Text("…") }` | 6A |
| Enlace (renglón) | `NavigationLink { Destino() } label: { Renglon() }` | 10 |
| Enlace con aspecto de botón | `.buttonStyle(.borderedProminent)` + `.tint(.purple)` | 6A |
| Título | `.navigationTitle("…")` sobre el contenido | 10 |
| Esconder barra | `.toolbar(.hidden)` en el Stack principal | 6A |
| Regresar por código | `@Environment(\.dismiss) private var dismiss` + `dismiss()` | 6A |
| Mandar un dato (ida) | Destino: `var x: Tipo` · Base: `Destino(x: valor)` | 6B |
| Ida y vuelta | Base: `@State private var x` · Destino: `@Binding var x: Tipo` · `Destino(x: $x)` | 6B |
| Preview con binding | `Destino(x: .constant(valor))` | 6B |
| Navegar si es válido | `@State private var isValid = false` + `Button` + `.navigationDestination(isPresented: $isValid) { Destino() }` en el botón | 6C |
| Hoja que sube | `.sheet(isPresented: $mostrar) { Vista() }` | 17 |
| Pestañas | `TabView { Vista().tabItem { Label("…", systemImage: "…") } }` + `.tint(…)` | 7 |
| Datos en varias pestañas | `@State` en la vista del TabView; `$` a quien modifica | skill |
| Carrusel | `TabView { … }.tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .always)).frame(height: 430)` | 7 |

---

# 6. Modelos, listas y datos

Esta parte explica cómo guardar la información de tu app (el **modelo**), cómo llenarla con datos de prueba (**ModelData**) y cómo mostrarla en una **lista** con su **detalle**. También trae recetas para agregar, editar, borrar, buscar, contar y sacar promedios.

Los ejemplos usan dos temas:
- **Jugador**: el ejemplo exacto de la profesora (Clase 10).
- **Antojo**: el simulacro que estás practicando (antojos de Monterrey).

---

## 6.1 ¿Qué es un modelo? (el struct como "molde")

🔎 modelo, model, struct, estructura, molde, ficha, plantilla, que es un struct, para que sirve el struct, datos, clase de datos

**Qué es:** un modelo es un `struct` que dice **qué datos tiene cada cosa** de tu app. Es como el molde de una ficha: "cada antojo tiene nombre, precio, calificación…".

**Lo más importante que hay que entender:**
- El struct **no hace nada por sí solo**. No muestra nada, no guarda nada. Solo define la forma de la ficha.
- Los datos de verdad (los 10 antojos llenos) van en otro archivo: **ModelData.swift** (ver 6.6).
- Las pantallas (Views) **usan** esos datos para dibujar la lista y el detalle.

```
Model/Antojo.swift      → el MOLDE (qué campos tiene un antojo)
Model/ModelData.swift   → los DATOS (10 antojos ya llenos)
Views/…                 → las PANTALLAS que los muestran
Components/…            → piezas reutilizables (el renglón de la lista)
```

**Comparación con tu tarea de canciones (Movil2):** ahí tenías `struct Cancion` (el molde) y `cargarCanciones()` (los datos). Es exactamente lo mismo con otro tema.

**¿Visto en clase?** ✅ Clase 10 (Modelos y listas).

---

## 6.2 Cómo crear el modelo paso a paso (forma de la Clase 10)

🔎 crear modelo, carpeta Model, Jugador.swift, import Foundation, nuevo archivo swift, struct Jugador, struct Antojo

**Pasos de la lámina:**
1. Crea una carpeta **Model** (clic derecho en el proyecto → New Folder).
2. Dentro, crea un archivo **Swift File** (no SwiftUI View) llamado como tu modelo: `Jugador.swift`.
3. Escribe el struct con sus campos.

**Cómo se escribe (código exacto de la lámina, página 5):**

```swift
import Foundation

struct Jugador {
    var id: Int
    var nombre: String
    var apellido: String
    var numero: Int
    var estatura: Double
}
```

- `import Foundation` (no `SwiftUI`): el modelo solo guarda datos, no dibuja nada. Foundation trae `String`, `Date`, `Double`, etc.
- Cada campo es `var nombre: Tipo`.
- Después, para usarlo en una lista dinámica, se le agrega `: Identifiable` (ver 6.3).

**Ejemplo completo: el modelo de Antojo (tu simulacro)**

```swift
import Foundation

struct Antojo: Identifiable {
    var id: Int
    var nombre: String
    var descripcion: String
    var categoria: String       // "Tacos", "Hamburguesas" o "Postres"
    var imagen: String          // nombre de la imagen en Assets
    var calificacion: Int       // de 1 a 5
    var precio: Double          // cuánto cuesta más o menos
    var fecha: Date             // cuándo lo registraste
    var favorito: Bool
}
```

**Tipos que vas a usar en un modelo:**

| Tipo | Para qué | Ejemplo de valor |
|---|---|---|
| `Int` | números enteros (id, calificación, número, edad) | `5` |
| `Double` | números con decimales (precio, estatura, peso) | `120.5` |
| `String` | texto (nombre, descripción, categoría, nombre de imagen) | `"Tacos"` |
| `Bool` | sí / no (favorito, vacunado, completado) | `true` |
| `Date` | fechas | `Date()` |
| `UIImage?` | foto que el usuario eligió (⚠️ ver 6.5) | `nil` |

**El init automático (memberwise):** un struct crea solo su "constructor" con **todos los campos, en el mismo orden** en que los escribiste:

```swift
let antojo = Antojo(id: 1, nombre: "Tacos Juanito", descripcion: "Tacos de trompo.",
                    categoria: "Tacos", imagen: "foto1", calificacion: 5,
                    precio: 120, fecha: Date(), favorito: true)
```

No tienes que escribir `init`. Si lo escribes a mano (como en la skill), funciona igual, pero es opcional.

**Errores comunes:**

| Error de Xcode | Por qué | Arreglo |
|---|---|---|
| `Missing argument for parameter 'favorito' in call` | Al crear el antojo te faltó un campo | Pon TODOS los campos del struct |
| `Argument 'nombre' must precede argument 'favorito'` | Los pusiste en otro orden | Ponlos en el mismo orden que en el struct |
| `Value of type 'Antojo' has no member 'esFavorito'` | El nombre no coincide (en el struct se llama `favorito`) | Usa exactamente el mismo nombre en todos lados |
| `Cannot convert value of type 'Int' to expected argument type 'String'` | Pusiste un número donde va texto (o al revés) | Revisa el tipo del campo: texto va entre comillas |
| `Cannot find 'Antojo' in scope` | El archivo del modelo no está en el proyecto o tiene otro nombre | Revisa que `Antojo.swift` exista y esté en el target |

**¿Visto en clase?** ✅ Clase 10, págs. 4–5.
**En el repo:** `08_ModelosYListas/Model/Jugador.swift` (con campos extra: posición, imagen, favorito).

---

## 6.3 Identifiable y el `id`

🔎 identifiable, id, identificador, uuid, UUID(), id unico, ids repetidos, id duplicado, the ID occurs multiple times, requires that conform to Identifiable

**Qué es:** `Identifiable` es un protocolo que dice "cada elemento tiene un `id` único". `List` y `ForEach` lo necesitan para saber cuál renglón es cuál.

**Cómo se escribe (lámina, pág. 13):** se agrega `: Identifiable` después del nombre del struct, y el struct debe tener una propiedad llamada **exactamente** `id`.

```swift
struct Jugador: Identifiable {
    var id: Int
    var nombre: String
    var apellido: String
    var numero: Int
    var estatura: Double
}
```

**Tres formas de dar el `id`:**

| Forma | Código | Cuándo |
|---|---|---|
| Número que tú pones | `var id: Int` | La de clase. Tú escribes 1, 2, 3… en ModelData |
| Automático | `let id = UUID()` | Cuando no te importa el número (gráficas de la Clase 15). No lo pasas al crear el elemento |
| Calculado desde otro campo | `var id: Int { return x }` | Cuando ya tienes un campo único (lámina de gráficas de líneas) |

```swift
struct Consola: Identifiable {
    let id = UUID()              // se genera solo, distinto cada vez
    let nombre: String
    let numeroJugadores: Double
}

let listaConsolas = [
    Consola(nombre: "Switch", numeroJugadores: 20),     // sin id: no se pasa
    Consola(nombre: "Xbox", numeroJugadores: 30)
]

struct Punto: Identifiable {
    var id: Int { return x }     // propiedad calculada: el id ES el valor de x
    let x: Int
    let y: Double
}
```

**¿Por qué los ids NO deben repetirse?** La lista usa el `id` para distinguir cada renglón. Si dos antojos tienen `id: 1`:
- Xcode avisa en la consola: `ForEach<…>: the ID 1 occurs multiple times within the collection, this will give undefined results!`
- La lista puede mostrar renglones cruzados o repetidos.
- Al tocar uno se puede abrir el detalle de **otro**, y al editar (con `@Binding`) se cambia el antojo equivocado.

Regla: en ModelData pon 1, 2, 3, 4… sin repetir. Para agregar nuevos, usa la receta de 6.16 (mayor + 1).

**El id NO se muestra en la pantalla.** La tarea lo pide explícito: "El ID no debe ser mostrado en ninguna parte de la UI". Es para que la app se organice, no para el usuario.

**Errores comunes:**

| Error / síntoma | Por qué | Arreglo |
|---|---|---|
| `Initializer 'init(_:rowContent:)' requires that 'Antojo' conform to 'Identifiable'` | Usaste `List(antojos)` pero el struct no dice `: Identifiable` | Agrega `: Identifiable` y un campo `id` |
| `Type 'Antojo' does not conform to protocol 'Identifiable'` | Dice Identifiable pero no tiene campo `id` (o se llama `ID`, `Id`, `identificador`) | El campo se llama exactamente `id`, en minúsculas |
| Renglones repetidos o el detalle abre otro elemento | Ids repetidos | Cada elemento con su propio id |

**¿Visto en clase?** ✅ Clase 10 (pág. 13: Identifiable). `UUID()` y el id calculado: ✅ Clase 15 (gráficas).
**En el repo:** `08_ModelosYListas/Model/Jugador.swift`, `09_Graficas/PastelYDonaView.swift` (UUID), `09_Graficas/LineasView.swift` (id calculado).

---

## 6.4 Propiedades calculadas en el modelo

🔎 propiedad calculada, computed property, var estrellas, fechaTexto, precioTexto, nombreCompleto, campo calculado, return en var

**Qué es:** una `var` del struct que **no guardas tú**: se calcula con los otros campos cada vez que la pides. Se escribe con llaves y `return`.

**Cuándo usarla:** para no repetir el mismo cálculo en varias pantallas. Ejemplos: las estrellas a partir de la calificación, la fecha como texto en español, el precio en pesos, el nombre completo.

**Ejemplo completo (modelo Antojo con 4 propiedades calculadas):**

```swift
import Foundation

struct Antojo: Identifiable {
    var id: Int
    var nombre: String
    var descripcion: String
    var categoria: String
    var imagen: String
    var calificacion: Int
    var precio: Double
    var fecha: Date
    var favorito: Bool

    // "⭐️⭐️⭐️" según la calificación (igual que en tu Cancion de Movil2)
    var estrellas: String {
        return String(repeating: "⭐️", count: calificacion)
    }

    // "$120.00"
    var precioTexto: String {
        return precio.formatted(.currency(code: "MXN"))
    }

    // "15 de octubre de 2026" (los 3 pasos de la Clase 3B)
    var fechaTexto: String {
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.long
        formato.timeStyle = DateFormatter.Style.none
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: fecha)
    }

    // Un ícono distinto por categoría
    var iconoCategoria: String {
        switch categoria {
        case "Tacos":
            return "flame.fill"
        case "Hamburguesas":
            return "takeoutbag.and.cup.and.straw.fill"
        case "Postres":
            return "birthday.cake.fill"
        default:
            return "fork.knife"
        }
    }
}
```

**Cómo se usa en cualquier pantalla:** igual que un campo normal, sin paréntesis:

```swift
Text(antojo.estrellas)
Text(antojo.precioTexto)
Text(antojo.fechaTexto)
Image(systemName: antojo.iconoCategoria)
```

Otro ejemplo del repo: `var nombreCompleto: String { return "\(nombre) \(apellido)" }`.

**Errores comunes:**
- Escribir `antojo.estrellas()` con paréntesis → error, porque no es función: `Cannot call value of non-function type 'String'`.
- Olvidar el `return` en una propiedad de varias líneas → `Missing return in getter expected to return 'String'`.
- Querer asignarle valor (`antojo.estrellas = "⭐️"`) → no se puede, se calcula sola. Cambia `calificacion` y las estrellas cambian solas.

**¿Visto en clase?** ✅ Propiedad calculada `var id: Int { return x }` en Clase 15 y en la skill de modelos. La de estrellas la usaste en tu tarea Movil2.
**En el repo:** `08_ModelosYListas/Model/Jugador.swift` (`nombreCompleto`), `00_AppCompleta/Model/Mascota.swift` (`iconoEspecie` con switch, `textoEdad`).

---

## 6.5 Imágenes dentro del modelo

🔎 imagen en el modelo, image en struct, nombre del asset, String imagen, foto en el modelo, UIImage en struct, guardar foto

**Regla de la skill:** si el modelo tiene una imagen, el campo es un **`String` con el nombre del asset**, no un `Image`. El modelo guarda datos; la vista decide cómo dibujarlos.

```swift
var imagen: String     // "foto1", "tacos_juanito"… igual que en Assets.xcassets
```

En la vista:

```swift
Image(antojo.imagen)
    .resizable(resizingMode: .stretch)
    .aspectRatio(contentMode: .fit)
    .frame(width: 55)
```

**Errores comunes:**
- `imagen: ""` (vacío) → no se ve nada y la consola dice `No image named '' found in asset catalog`. Pon el nombre real.
- El nombre no coincide con Assets (mayúsculas, espacios, `.png`) → no se ve. En Assets el nombre es el del "image set", sin extensión.

**Fotos que elige el usuario (galería o cámara):** esas no están en Assets; son un `UIImage`. Se pueden guardar en el modelo como opcional:

```swift
import Foundation
import UIKit

struct AntojoConFoto: Identifiable {
    var id: Int
    var nombre: String
    var imagen: String       // foto de Assets (para los datos fijos)
    var foto: UIImage?       // ⚠️ foto elegida por el usuario; nil si no eligió
}
```

Y en la vista: `if let fotoBien = antojo.foto { Image(uiImage: fotoBien)… } else { Image(antojo.imagen)… }`.

**¿Visto en clase?** `String` con nombre de asset: ✅ skill de modelos. `UIImage?` dentro del modelo: ⚠️ no visto en clase. Si la profe pregunta: "PhotosPicker y la cámara me dan un `UIImage`; lo guardo como opcional porque no todos los elementos tienen foto".
**En el repo:** `10_FotosYCamara/RegistroConFoto.swift`, `00_AppCompleta/Model/Mascota.swift` (`foto: UIImage?`), `00_AppCompleta/Components/FotoMascotaView.swift` (if let / else).

---

## 6.6 ModelData: los datos fijos de la app

🔎 ModelData, modeldata.swift, datos de prueba, datos fijos, cargarJugadores, cargarAntojos, lista fija, append, arreglo de structs, var global, listaJugadores, Array<Jugador>

**Qué es:** un archivo `ModelData.swift` en la carpeta Model donde vive "todo lo relevante a la carga de los datos" (lámina, pág. 6). Ahí escribes tus 10 o 20 elementos.

**Forma de la clase (lámina, pág. 6): dos cosas**
1. Una **función** que regresa un arreglo `Array<Jugador>`.
2. Una **variable (`var`)** que se inicializa con esa función.

```swift
import Foundation

func cargarJugadores() -> Array<Jugador> {
    let lista = [
        Jugador(id: 1, nombre: "Lebron", apellido: "James", numero: 23, estatura: 2.06),
        Jugador(id: 2, nombre: "Stephen", apellido: "Curry", numero: 30, estatura: 1.88),
        Jugador(id: 3, nombre: "Luka", apellido: "Doncic", numero: 77, estatura: 2.01),
        Jugador(id: 4, nombre: "Nikola", apellido: "Jokic", numero: 15, estatura: 2.11)
    ]
    return lista
}

var listaJugadores = cargarJugadores()
```

`Array<Jugador>` y `[Jugador]` **son lo mismo**. La profe usa `Array<Jugador>`; la skill usa `[Jugador]`. Puedes usar cualquiera.

**Forma con `append` (la de tu tarea Movil2):** empiezas con un arreglo vacío y vas agregando uno por uno. Se lee muy claro cuando cada elemento tiene muchos campos.

```swift
import Foundation

func cargarAntojos() -> Array<Antojo> {

    // Si vas a convertir textos a fecha, el formateador va AQUÍ ADENTRO
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"

    var lista = Array<Antojo>()          // arreglo vacío

    lista.append(Antojo(
        id: 1,
        nombre: "Tacos Juanito",
        descripcion: "Tacos de trompo con mucha piña.",
        categoria: "Tacos",
        imagen: "foto1",
        calificacion: 5,
        precio: 120,
        fecha: Date(),
        favorito: true
    ))

    lista.append(Antojo(
        id: 2,
        nombre: "Burger Barrio",
        descripcion: "Hamburguesa doble con tocino.",
        categoria: "Hamburguesas",
        imagen: "foto2",
        calificacion: 4,
        precio: 180,
        fecha: fechaHaceDias(dias: 20),
        favorito: false
    ))

    lista.append(Antojo(
        id: 3,
        nombre: "Nieves La Fe",
        descripcion: "Nieve de garrafa de limón.",
        categoria: "Postres",
        imagen: "foto3",
        calificacion: 3,
        precio: 45,
        fecha: dateFormatter.date(from: "15/04/2024") ?? Date(),
        favorito: false
    ))

    return lista
}
```

**Forma con arreglo escrito directo (literal):**

```swift
func cargarAntojos() -> [Antojo] {
    return [
        Antojo(id: 1, nombre: "Tacos Juanito", descripcion: "Tacos de trompo.", categoria: "Tacos",
               imagen: "foto1", calificacion: 5, precio: 120, fecha: Date(), favorito: true),
        Antojo(id: 2, nombre: "Burger Barrio", descripcion: "Hamburguesa doble.", categoria: "Hamburguesas",
               imagen: "foto2", calificacion: 4, precio: 180, fecha: Date(), favorito: false)
    ]
}
```

Las tres formas dan el mismo resultado. Fíjate en las comas: entre elementos sí, después del último no.

### 6.6.1 Fechas en ModelData

`Date()` = **la fecha y hora de este momento**. Si todos tus antojos usan `Date()`, todos quedan con la misma fecha (la de cuando se abre la app). Eso no está mal. Si quieres fechas distintas:

**Opción A — "hace X días" (✅ Clase 3B: sumar con DateComponents):**

```swift
func fechaHaceDias(dias: Int) -> Date {
    var dateComponent = DateComponents()
    dateComponent.day = -dias                     // negativo = hacia atrás

    if let fecha = Calendar.current.date(byAdding: dateComponent, to: Date()) {
        return fecha
    }
    return Date()                                 // por si algo falla
}

// En la lista: fecha: fechaHaceDias(dias: 20)
```

`Calendar.current.date(byAdding:to:)` regresa un **opcional** (la lámina lo dice), por eso el `if let`.

**Opción B — fecha exacta desde texto (⚠️ `date(from:)` no viene en las láminas):**

```swift
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy"
// fecha: dateFormatter.date(from: "15/04/2024") ?? Date()
```

- `date(from:)` convierte texto → fecha usando el `dateFormat`. Regresa opcional porque el texto puede venir mal.
- `?? Date()` = "si salió nil, usa la fecha de hoy" (⚠️ `??` no viene en las láminas).
- **Trampa:** si se te olvida `dateFormatter.dateFormat = "dd/MM/yyyy"`, `date(from:)` regresa `nil` y TODAS tus fechas salen como "hoy" sin ningún aviso.

### 6.6.2 El error de hoy: código fuera de la función

```swift
import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat("dd/MM/yyyy")     // ❌ esto NO compila (dos errores)
```

1. `dateFormat` es una **propiedad**, no una función. Se asigna con `=`, no con paréntesis. Error: `Cannot call value of non-function type 'String?'`.
2. Aunque pongas `=`, sigue fallando: en un archivo normal, **fuera de un struct o función solo puedes declarar** (`let`, `var`, `func`, `struct`). No puedes **ejecutar** instrucciones como "cambiar una propiedad". Error: `Expressions are not allowed at the top level`.

**Arreglo:** mueve las dos líneas **adentro** de `cargarAntojos()`, al principio (como en el ejemplo de arriba).

### 6.6.3 ¿`var` global o `@State`?

| Situación | Qué usar | Por qué |
|---|---|---|
| La lista solo se **muestra** (nadie la cambia) | `var listaJugadores = cargarJugadores()` en ModelData y `List(listaJugadores)` | Así lo hace la lámina. Simple |
| La lista se **modifica** (favorito, agregar, borrar) | `@State private var antojos = cargarAntojos()` en la vista dueña | `@State` **avisa** a SwiftUI cuando cambia y redibuja. Una variable global NO avisa: cambiarías el dato y la pantalla no se actualizaría |
| Varias pestañas usan la **misma** lista | `@State` en la vista del `TabView` y la pasas con `$` (modifica) o sin `$` (solo lee) | Una sola fuente de verdad (Clase 6B y 7) |

```swift
struct ListaAntojosView: View {
    @State private var antojos = cargarAntojos()     // esta vista es DUEÑA de la lista
    // ...
}
```

Llamas `cargarAntojos()` **una sola vez** (en el `@State`). Si la llamas en cada pantalla, cada una tendría su propia copia y los cambios no se compartirían.

**Errores comunes:**

| Error / síntoma | Por qué | Arreglo |
|---|---|---|
| `Expressions are not allowed at the top level` | Código suelto fuera de una función | Mételo dentro de la función |
| `Cannot find 'cargarAntojos' in scope` | La función tiene otro nombre o el archivo no está en el target | Revisa el nombre exacto |
| `Missing return in global function expected to return 'Array<Antojo>'` | Olvidaste `return lista` al final | Agrega el `return` |
| Cambio un favorito y la lista no se actualiza | Usas la `var` global en lugar de `@State` | Usa `@State private var` en la vista dueña |
| Todas las fechas salen iguales | Usas `Date()` en todas, o falta el `dateFormat` | Usa `fechaHaceDias` o pon el `dateFormat` |
| La app truena: `Index out of range` | Usas `lista[5]` y la lista tiene menos de 6 elementos | Los índices empiezan en 0; revisa cuántos hay |

**¿Visto en clase?** ✅ Clase 10, pág. 6 (función + var). `append`: ✅ tu tarea Movil2. `@State` para la lista: ✅ skill (navegación y modelos).
**En el repo:** `08_ModelosYListas/Model/ModelDataJugadores.swift` (bloques 1 y 2), `00_AppCompleta/Model/ModelDataMascotas.swift`.

---

## 6.7 List: lista estática y lista dinámica

🔎 list, lista, tabla, table view, renglones, filas, List(lista), lista dinamica, lista estatica, mostrar arreglo, jugadorItem

**Qué es:** `List` dibuja renglones uno debajo de otro, con scroll y separadores. Es la "tabla" de iOS.

**Paso 1 de la lámina — lista estática (pág. 11):** escribes cada renglón a mano. Sirve para entender, pero no es práctica.

```swift
struct ListaJugadoresView: View {
    var body: some View {
        VStack {
            List {
                JugadorRow(jugador: listaJugadores[0])
                JugadorRow(jugador: listaJugadores[1])
                JugadorRow(jugador: listaJugadores[2])
                JugadorRow(jugador: listaJugadores[3])
            }
        }
    }
}
```

**Paso 2 de la lámina — lista dinámica (pág. 13), la "más eficiente":** `List` recorre el arreglo solo y dibuja un renglón por elemento. Requiere que el modelo sea `Identifiable`.

```swift
struct ListaJugadoresView: View {
    var body: some View {
        List(listaJugadores) { jugadorItem in
            JugadorRow(jugador: jugadorItem)
        }
        .listStyle(.inset)
    }
}
```

**Cómo se lee:** "para cada `jugadorItem` dentro de `listaJugadores`, dibuja un `JugadorRow`". `jugadorItem` es un nombre que tú inventas (puede ser `antojo`, `item`, `cancion`).

**Con datos que se modifican (antojos con `@State`):**

```swift
@State private var antojos = cargarAntojos()

// en el body:
List(antojos) { antojo in
    AntojoRow(antojo: antojo)
}
.listStyle(.inset)
```

**Importante:** `List(lista) { item in }` entrega cada elemento como **copia de solo lectura**. Si quieres modificarlo desde la lista o el detalle, usa la versión con bindings (6.13).

**Errores comunes:**

| Error | Por qué | Arreglo |
|---|---|---|
| `Initializer 'init(_:rowContent:)' requires that 'Antojo' conform to 'Identifiable'` | El modelo no es Identifiable | `struct Antojo: Identifiable` |
| `Initializer 'init(_:rowContent:)' requires that 'String' conform to 'Identifiable'` | Le diste un arreglo de textos `["a","b"]` | Usa `List(arreglo, id: \.self) { texto in }` o `ForEach(arreglo, id: \.self)` |
| `Cannot assign to property: 'antojo' is a 'let' constant` | Quieres cambiar el elemento dentro de `List(lista)` | Usa `List($lista) { $antojo in }` (6.13) |

**¿Visto en clase?** ✅ Clase 10, págs. 11 y 13.
**En el repo:** `08_ModelosYListas/Views/ListaSimpleView.swift` (bloque 1 dinámica; `ListaEstaticaJugadoresView` estática).

---

## 6.8 Estilos de lista (`.listStyle`)

🔎 listStyle, estilo de lista, inset, plain, grouped, insetGrouped, sidebar, cambiar aspecto lista

**Cómo se escribe:** después de la `List`:

```swift
.listStyle(.inset)
```

La lámina dice: "Nosotros usaremos `.listStyle(.inset)`".

| Estilo | Cómo se ve |
|---|---|
| `.inset` | Renglones con margen a los lados, sin fondo gris. **El de clase** |
| `.plain` | Renglones de orilla a orilla, sin márgenes. Lo más simple |
| `.grouped` | Fondo gris y los renglones en bloques blancos de lado a lado (como Ajustes viejo) |
| `.insetGrouped` | Bloques blancos con esquinas redondeadas y margen (como la app Ajustes actual). Es el default en iPhone |
| `.sidebar` | Pensado para iPad; las secciones se pueden contraer |

**¿Visto en clase?** ✅ Clase 10, pág. 12.
**En el repo:** `08_ModelosYListas/Views/ListaSimpleView.swift` → bloque 2.

---

## 6.9 Lista que navega al detalle (código exacto de la lámina)

🔎 lista con detalle, navigationlink en lista, tocar renglon, ir al detalle, list navigation, NavigationLink label, DetalleView

**Pasos de la lámina (pág. 17):**
1. Envuelve la lista en un `NavigationStack`.
2. Cambia el renglón por un `NavigationLink`: el destino es el `DetalleView` y el `label:` es el `JugadorRow`.

```swift
struct ListaJugadoresView: View {
    var body: some View {
        NavigationStack {
            List(listaJugadores) { jugadorItem in
                NavigationLink {
                    DetalleView(jugador: jugadorItem)
                } label: {
                    JugadorRow(jugador: jugadorItem)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Jugadores")
        }
    }
}
```

- El `NavigationLink` agrega solo la flechita `>` a la derecha del renglón.
- `.navigationTitle` va **sobre la List** (el contenido), **dentro** del `NavigationStack`. Si no hay `NavigationStack`, el título no sale.
- Si esta lista vive dentro de una pestaña del `TabView`, el `NavigationStack` va **dentro** de esta vista (no afuera del TabView).

**Errores comunes:**
- El título no aparece → falta el `NavigationStack`.
- Dos barras de navegación encimadas → pusiste un `NavigationStack` también en la pantalla de detalle. El detalle **no** lleva su propio NavigationStack.
- En el preview del detalle no sale el título → el preview no tiene pantalla anterior. Envuelve el preview: `#Preview { NavigationStack { DetalleView(jugador: listaJugadores[0]) } }`.

**¿Visto en clase?** ✅ Clase 10, pág. 17.
**En el repo:** `08_ModelosYListas/Views/ListaConDetalleView.swift`.

---

## 6.10 ForEach (y cuándo usarlo en lugar de List)

🔎 foreach, ForEach, repetir vista, ciclo en la vista, id: \.self, indices, 0..<n, recorrer arreglo en swiftui

**Qué es:** `ForEach` repite una vista por cada elemento, pero **sin** dibujar una lista. Se usa:
- **Dentro de una `List`** cuando necesitas `.onDelete`, `.onMove` o secciones (esos modificadores son de ForEach, no de List).
- **Dentro de un `VStack`/`HStack`/`ScrollView`** para hacer tarjetas o diseños libres.
- Dentro de un `Picker` para crear las opciones desde un arreglo.

**Las variantes:**

```swift
@State private var antojos = cargarAntojos()
let categorias = ["Tacos", "Hamburguesas", "Postres"]

// en el body:
List {
    // 1. Arreglo de structs Identifiable
    ForEach(antojos) { antojo in
        Text(antojo.nombre)
    }

    // 2. Arreglo de textos o números (no son Identifiable): id: \.self
    ForEach(categorias, id: \.self) { categoria in
        Text(categoria)
    }

    // 3. Un rango de números: repetir N veces
    ForEach(0..<5, id: \.self) { numero in
        Text("Renglón \(numero)")
    }

    // 4. Por posición (cuando necesitas el número de lugar)
    ForEach(antojos.indices, id: \.self) { indice in
        Text("\(indice + 1). \(antojos[indice].nombre)")
    }

    // 5. Con bindings (para modificar cada uno)
    ForEach($antojos) { $antojo in
        Toggle(antojo.nombre, isOn: $antojo.favorito)
    }
}
```

| Variante | Úsala para |
|---|---|
| `ForEach(lista) { item in }` | Structs con `Identifiable` (lo normal) |
| `ForEach(lista, id: \.self) { texto in }` | Arreglos de `String` o `Int` sin repetidos |
| `ForEach(0..<n, id: \.self) { i in }` | Repetir algo N veces (estrellas, cuadritos) |
| `ForEach(lista.indices, id: \.self) { i in }` | Necesitas la posición (1., 2., 3.) o colores alternados |
| `ForEach($lista) { $item in }` | Modificar cada elemento (Toggle, TextField) |

`\.self` significa "usa el valor mismo como id". Por eso con textos repetidos (`["Tacos", "Tacos"]`) da problemas.

**Errores comunes:**
- `Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'String' conform to 'Identifiable'` → a un arreglo de textos le falta `id: \.self`.
- Un `ForEach(0..<lista.count)` sin `id:` cuando la lista cambia → advertencias raras. Usa `id: \.self` o `lista.indices`.

**¿Visto en clase?** ⚠️ `ForEach` no viene en las láminas (la clase usa `List(lista)`). Tu tarea actSwift sí lo usó con `id: \.self`. Si la profe pregunta: "ForEach repite una vista por cada elemento como List, pero sin dibujar la lista; lo necesito para onDelete y para diseños con tarjetas".
**En el repo:** `01_SwiftBasico/ArreglosYCiclosView.swift` (bloque 6), `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` (bloque 2).

---

## 6.11 Componente de renglón (Row)

🔎 row, renglon, celda, cell, JugadorRow, AntojoRow, componente de lista, fila de la lista, Components

**Qué es:** una vista chiquita, en su propio archivo dentro de **Components**, que dibuja **un** renglón. La lista la repite por cada elemento.

**Pasos de la lámina (pág. 10):**
1. Crea la carpeta **Components** y dentro una SwiftUI View llamada `JugadorRow`.
2. Ponle una variable **no privada** `jugador` de tipo `Jugador` (sin `@State`, sin `private`: el componente solo muestra).
3. En el `body`, un **HStack** con la información.
4. **"No agregues padding al stack."** La `List` ya pone su propio espacio; si le agregas padding, los renglones se ven gordos y desalineados.

```swift
import SwiftUI

struct JugadorRow: View {
    var jugador: Jugador

    var body: some View {
        HStack {
            Text("\(jugador.numero)")
                .font(.system(size: 36))
                .foregroundStyle(.red)
                .bold()
            Text("\(jugador.nombre) \(jugador.apellido)")
            Spacer()
            Text("Mide: \(jugador.estatura, specifier: "%.2f") mts")
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    JugadorRow(jugador: listaJugadores[0])
}
```

**Row para tu simulacro: imagen chica + nombre + estrellas + favorito**

```swift
import SwiftUI

struct AntojoRow: View {
    var antojo: Antojo

    var body: some View {
        HStack {
            Image(antojo.imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 55)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(antojo.nombre)
                    .font(.headline)
                Text(antojo.estrellas)
                    .font(.caption)
            }

            Spacer()

            Image(systemName: antojo.favorito ? "heart.fill" : "heart")
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    AntojoRow(antojo: cargarAntojos()[0])
}
```

- `Spacer()` empuja el corazón a la derecha.
- `antojo.favorito ? "heart.fill" : "heart"` = ternario: corazón lleno si es favorito, vacío si no.
- **Preview:** el Row recibe un dato, así que en el preview le pasas uno de prueba: `listaJugadores[0]` o `cargarAntojos()[0]`.

**Errores comunes:**
- `Missing argument for parameter 'antojo' in call` en el `#Preview` → no le pasaste el dato de prueba.
- Pusiste `@State public var jugador` (como en una versión vieja de tu tarea) → funciona, pero lo correcto en clase es `var jugador: Jugador`. Un `@State` es para datos que la vista **posee y cambia**; el renglón solo **recibe** y muestra.

**¿Visto en clase?** ✅ Clase 10, pág. 10.
**En el repo:** `08_ModelosYListas/Components/JugadorRow.swift` (y `JugadorConImagenRow` con foto), `00_AppCompleta/Components/MascotaRow.swift`.

---

## 6.12 Pantalla de detalle (solo ver)

🔎 detalle, detail view, DetalleView, pantalla de detalle, ver informacion, mostrar todos los datos

**Pasos de la lámina (pág. 15):**
1. En **Views**, una vista `DetalleView`.
2. Variable **no privada** `jugador` (solo recibe, igual que el Row).
3. En el body, todo el detalle. "Esta sí es una pantalla independiente: **puedes agregar todos los padding necesarios**."

**Diseño de la lámina (pág. 16):**

```swift
import SwiftUI

struct DetalleView: View {
    var jugador: Jugador

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Número:")
                Text("\(jugador.numero)")
                    .font(.system(size: 40))
                    .foregroundStyle(.red)
                    .bold()
            }
            Text("Nombre: \(jugador.nombre) \(jugador.apellido)")
                .font(.title)
            Divider()
            Text("Estatura:")
            Text("\(jugador.estatura, specifier: "%.2f") mts")
                .bold()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DetalleView(jugador: listaJugadores[0])
}
```

**Recuerda:** muestra todos los datos **menos el id**.

**¿Visto en clase?** ✅ Clase 10, págs. 15–16.
**En el repo:** `08_ModelosYListas/Views/DetalleJugadorView.swift` → bloque 2 (diseño de la lámina) y bloques extra con imagen y renglones.

---

## 6.13 Editar desde el detalle y que la lista se actualice (@Binding)

🔎 editar, modificar, cambiar favorito, binding en lista, List($lista), $item, que se vea al regresar, actualizar lista, toggle favorito detalle

**El problema:** `List(lista) { item in }` te da una **copia**. Si el detalle cambia esa copia, la lista original no se entera. La tarea pide: "al modificar el favorito, al regresar a la pantalla principal se vea el cambio".

**La solución (3 pasos, igual que el paso de valores de ida y vuelta de la Clase 6B):**
1. En la lista: `@State private var antojos` (la vista es dueña).
2. Recorre con bindings: `List($antojos) { $antojo in … }`.
3. En el detalle: `@Binding var antojo: Antojo` y llámalo con `$antojo`.

**Lista:**

```swift
struct ListaAntojosView: View {
    @State private var antojos = cargarAntojos()

    var body: some View {
        NavigationStack {
            List($antojos) { $antojo in
                NavigationLink {
                    DetalleAntojoView(antojo: $antojo)      // con $: puede modificar
                } label: {
                    AntojoRow(antojo: antojo)               // sin $: solo muestra
                }
            }
            .listStyle(.inset)
            .navigationTitle("Antojos")
        }
    }
}
```

- `$antojos` → pide bindings de toda la lista.
- `{ $antojo in }` → dentro, `$antojo` es el binding (para modificar) y `antojo` es el valor (para mostrar).

**Si la lista viene del TabView** (la comparten varias pestañas), cámbiale el `@State` por `@Binding var antojos: Array<Antojo>`. El `@State` vive en la vista del TabView y se pasa con `$`. Preview: `ListaAntojosView(antojos: .constant(cargarAntojos()))`.

**Detalle que modifica (favorito con Toggle y calificación con Picker):**

```swift
import SwiftUI

struct DetalleAntojoView: View {
    @Binding var antojo: Antojo
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(antojo.imagen)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .cornerRadius(16)

                Text(antojo.nombre)
                    .font(.largeTitle)
                    .bold()

                Text(antojo.descripcion)
                    .multilineTextAlignment(.center)

                HStack {
                    Text("Categoría")
                    Spacer()
                    Text(antojo.categoria)
                }
                HStack {
                    Text("Precio")
                    Spacer()
                    Text(antojo.precioTexto)
                }
                HStack {
                    Text("Registrado")
                    Spacer()
                    Text(antojo.fechaTexto)
                }

                Divider()

                Toggle("Favorito", isOn: $antojo.favorito)

                Text("Calificación: \(antojo.estrellas)")
                Picker(selection: $antojo.calificacion, label: Text("Calificación")) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                .pickerStyle(.segmented)

                Button("Volver a la lista") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("Detalle")
    }
}

#Preview {
    NavigationStack {
        DetalleAntojoView(antojo: .constant(cargarAntojos()[0]))
    }
}
```

- `$antojo.favorito` → binding a UN campo del antojo. El Toggle lo cambia directo en la lista original.
- Los `.tag(1)…(5)` son `Int` porque `calificacion` es `Int`. El tag debe ser del **mismo tipo** que la variable.
- `.constant(...)` en el preview: no hay pantalla padre que preste el binding, así que se le da uno fijo de prueba (Clase 6B).
- `dismiss()` regresa a la lista (Clase 6A). La flecha "<" también funciona.

**Errores comunes:**

| Error | Por qué | Arreglo |
|---|---|---|
| `Cannot assign to property: 'antojo' is a 'let' constant` | Usas `List(antojos)` y quieres cambiar el elemento | `List($antojos) { $antojo in }` |
| `Cannot convert value of type 'Antojo' to expected argument type 'Binding<Antojo>'` | Llamaste `DetalleAntojoView(antojo: antojo)` sin `$` | `DetalleAntojoView(antojo: $antojo)` |
| `Cannot convert value 'antojos' of type '[Antojo]' to expected type 'Binding<[Antojo]>', use wrapper instead` | Usaste `$antojo` adentro pero la lista sin `$` | La lista también con `$`: `List($antojos)` |
| `Missing argument for parameter 'antojo' in call` en el preview | Falta el dato de prueba | `.constant(cargarAntojos()[0])` |
| Cambio el favorito y al regresar no se ve | La lista usa la `var` global o una copia | `@State` en la vista dueña + bindings |

**¿Visto en clase?** ✅ `@Binding` y `.constant`: Clase 6B. `List($lista) { $item in }`: ✅ skill de modelos (va más allá del ejemplo de clase, que es de solo lectura; justificación: una variable global no avisa a SwiftUI cuando cambia).
**En el repo:** `08_ModelosYListas/Views/ListaEditableView.swift` + `EditarJugadorView.swift`, `00_AppCompleta/Views/DetalleMascotaView.swift`.

---

## 6.14 Personalizar la lista: secciones, fondo, separadores, lista vacía

🔎 section, secciones, header, footer, agrupar por categoria, fondo de lista, listRowBackground, scrollContentBackground, listRowSeparator, quitar separador, lista vacia, sin elementos

### 6.14.1 Secciones (⚠️)

**Agrupar por categoría:**

```swift
struct ListaSeccionesAntojosView: View {
    var antojos: Array<Antojo>
    let categorias = ["Tacos", "Hamburguesas", "Postres"]

    var body: some View {
        List {
            ForEach(categorias, id: \.self) { categoria in
                Section(categoria) {
                    ForEach(antojos) { antojo in
                        if antojo.categoria == categoria {
                            AntojoRow(antojo: antojo)
                        }
                    }
                }
            }
        }
    }
}
```

**Con encabezado y pie de sección:**

```swift
List {
    Section {
        Text("Tacos Juanito")
        Text("Tacos Popo")
    } header: {
        Text("Tacos")
    } footer: {
        Text("Los mejores de Monterrey")
    }
}
```

**¿Visto en clase?** ⚠️ `Section` no viene en las láminas. Explicación: "agrupa renglones dentro de la List con un título".

### 6.14.2 Fondo y color de renglones

`List` dibuja su propio fondo gris/blanco encima de lo que pongas atrás. Para ver el tuyo hay que apagarlo primero:

```swift
struct ListaFondoAntojosView: View {
    @State private var antojos = cargarAntojos()
    let colorFondo = Color(red: 255/255, green: 243/255, blue: 230/255)
    let colorRenglon = Color(red: 255/255, green: 225/255, blue: 195/255)

    var body: some View {
        List(antojos) { antojo in
            AntojoRow(antojo: antojo)
                .listRowBackground(colorRenglon)     // color de CADA renglón (va dentro)
                .listRowSeparator(.hidden)           // ⚠️ quita la línea entre renglones
        }
        .scrollContentBackground(.hidden)            // apaga el fondo propio de la List
        .background(colorFondo)                      // ahora sí se ve el tuyo
    }
}
```

| Modificador | Dónde va | Qué hace |
|---|---|---|
| `.listRowBackground(color)` | En el renglón (dentro del closure) | Color de fondo de cada renglón |
| `.listRowSeparator(.hidden)` ⚠️ | En el renglón | Quita la línea separadora |
| `.scrollContentBackground(.hidden)` | Sobre la List | Apaga el fondo de la lista |
| `.background(color)` | Sobre la List | Tu fondo |

**¿Visto en clase?** ✅ skill de modelos (`listRowBackground`, `scrollContentBackground`). ⚠️ `listRowSeparator` no.
**En el repo:** `08_ModelosYListas/Views/ListaFondoPersonalizadoView.swift`.

### 6.14.3 Lista vacía con mensaje

```swift
struct ListaVaciaAntojosView: View {
    @State private var antojos = Array<Antojo>()     // empieza vacía

    var body: some View {
        VStack {
            if antojos.isEmpty {
                Spacer()
                Image(systemName: "fork.knife")
                    .font(.system(size: 60))
                    .foregroundStyle(.secondary)
                Text("Todavía no tienes antojos. Agrega uno.")
                    .foregroundStyle(.secondary)
                Spacer()
            } else {
                List(antojos) { antojo in
                    AntojoRow(antojo: antojo)
                }
            }
        }
    }
}
```

`.isEmpty` es `true` cuando el arreglo no tiene nada. Úsalo también en "Resultados" del buscador cuando ningún antojo cumple el filtro.

**En el repo:** `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` → bloque 1, `00_AppCompleta/Views/ListaMascotasView.swift` → bloque 1.

---

## 6.15 Lista sin `List`: tarjetas con ScrollView + ForEach

🔎 tarjetas, cards, lista de tarjetas, scrollview foreach, diseño libre, lista bonita, sin separadores

**Cuándo:** quieres un diseño libre (tarjetas grandes con foto) en lugar del aspecto de tabla.

```swift
struct ListaTarjetasAntojosView: View {
    var antojos: Array<Antojo>

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(antojos) { antojo in
                    VStack(alignment: .leading, spacing: 6) {
                        Image(antojo.imagen)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                        Text(antojo.nombre)
                            .font(.title2)
                            .bold()
                        Text(antojo.estrellas)
                    }
                    .padding()
                    .background(Color.orange.opacity(0.15))
                    .cornerRadius(16)
                }
            }
            .padding()
        }
    }
}
```

Diferencias con `List`: no tiene separadores ni swipe para borrar, tú controlas todo el diseño. Para navegar, envuelve cada tarjeta en un `NavigationLink { … } label: { tarjeta }` y agrega `.buttonStyle(.plain)` ⚠️ para que el texto no se pinte azul.

**¿Visto en clase?** ⚠️ `ScrollView` + `ForEach` para listas no viene en las láminas (ScrollView sí está en la rúbrica de la skill).
**En el repo:** `08_ModelosYListas/Views/ListaTarjetasView.swift`.

---

## 6.16 Receta: agregar un elemento con formulario (CRUD — Crear)

🔎 agregar, add, crear elemento, nuevo, formulario, form, sheet, append, guardar, validar, id nuevo, siguiente id, alta, registrar

**Cómo funciona (4 piezas):**
1. La lista es `@State` en la vista dueña.
2. Un botón "Agregar" prende un Bool que abre una `.sheet` con el formulario.
3. El formulario recibe la lista con **`@Binding`** (para poder hacer `append`).
4. Al guardar: valida → crea el nuevo → `append` → `dismiss()`.

**El formulario completo:**

```swift
import SwiftUI

struct AgregarAntojoView: View {
    @Binding var antojos: Array<Antojo>
    @Environment(\.dismiss) private var dismiss

    @State private var nombre = ""
    @State private var descripcion = ""
    @State private var categoria = ""
    @State private var precioTexto = ""
    @State private var calificacion = 3
    @State private var favorito = false

    @State private var showAlert = false
    @State private var alertMessage = ""

    // id nuevo = el mayor que exista + 1 (nunca se repite, aunque hayas borrado)
    func siguienteId() -> Int {
        var mayor = 0
        for antojo in antojos {
            if antojo.id > mayor {
                mayor = antojo.id
            }
        }
        return mayor + 1
    }

    func guardar() {
        if nombre.isEmpty {
            alertMessage = "Escribe el nombre del antojo."
            showAlert.toggle()
        } else if descripcion.isEmpty {
            alertMessage = "Escribe una descripción."
            showAlert.toggle()
        } else if categoria.isEmpty {
            alertMessage = "Elige una categoría."
            showAlert.toggle()
        } else if precioTexto.isEmpty {
            alertMessage = "Escribe el precio."
            showAlert.toggle()
        } else if let precio = Double(precioTexto) {
            if precio <= 0 {
                alertMessage = "El precio debe ser mayor a 0."
                showAlert.toggle()
            } else {
                let nuevo = Antojo(
                    id: siguienteId(),
                    nombre: nombre,
                    descripcion: descripcion,
                    categoria: categoria,
                    imagen: "foto1",
                    calificacion: calificacion,
                    precio: precio,
                    fecha: Date(),
                    favorito: favorito
                )
                antojos.append(nuevo)
                dismiss()
            }
        } else {
            alertMessage = "El precio debe ser un número, por ejemplo 150."
            showAlert.toggle()
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                Text("Nuevo antojo")
                    .font(.largeTitle)
                    .bold()

                Text("Nombre")
                TextField("Ej. Tacos Juanito", text: $nombre)
                    .textFieldStyle(.roundedBorder)

                Text("Descripción")
                TextField("Ej. Tacos de trompo con piña", text: $descripcion)
                    .textFieldStyle(.roundedBorder)

                Text("Categoría")
                Picker(selection: $categoria, label: Text("Categoría")) {
                    Text("Selecciona…").tag("")
                    Text("Tacos").tag("Tacos")
                    Text("Hamburguesas").tag("Hamburguesas")
                    Text("Postres").tag("Postres")
                }
                .pickerStyle(.menu)

                Text("Precio")
                TextField("Ej. 150", text: $precioTexto)
                    .textFieldStyle(.roundedBorder)

                Text("Calificación")
                Picker(selection: $calificacion, label: Text("Calificación")) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                .pickerStyle(.segmented)

                Toggle("Favorito", isOn: $favorito)

                HStack {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .buttonStyle(.bordered)

                    Spacer()

                    Button("Guardar") {
                        guardar()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }
}

#Preview {
    AgregarAntojoView(antojos: .constant(cargarAntojos()))
}
```

**La pantalla de la lista que lo abre:**

```swift
struct ListaConAgregarView: View {
    @State private var antojos = cargarAntojos()
    @State private var mostrarFormulario = false

    var body: some View {
        NavigationStack {
            VStack {
                List(antojos) { antojo in
                    AntojoRow(antojo: antojo)
                }
                .listStyle(.inset)

                Button {
                    mostrarFormulario.toggle()
                } label: {
                    Label("Agregar antojo", systemImage: "plus")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .navigationTitle("Antojos")
            .sheet(isPresented: $mostrarFormulario) {
                AgregarAntojoView(antojos: $antojos)      // con $: puede hacer append
            }
        }
    }
}
```

**Puntos clave para explicar:**
- **Por qué el precio se captura como texto:** un `TextField` siempre da `String`. Se convierte con `Double(precioTexto)`, que regresa **opcional** (nil si escribieron "abc"). Por eso `else if let precio = Double(precioTexto)`.
- **Por qué una cadena de `else if`:** revisa los campos en orden; en cuanto encuentra un error, muestra su mensaje específico y ya no sigue.
- **Por qué `siguienteId()` y no `antojos.count + 1`:** si borras uno, `count + 1` puede repetir un id que ya existe. El mayor + 1 nunca se repite.
- **La fecha del nuevo es `Date()`:** el momento en que se guarda.
- **La imagen del nuevo:** aquí va fija (`"foto1"`). Si quieres que la elija, agrega un Picker con los nombres de tus assets o un PhotosPicker (Parte 8).

**¿Visto en clase?** `.sheet`: ✅ Clase 17 (cámara). Validación con alerta, `if let` con `Int()/Double()`: ✅ Clases 2, 3, 6C. `append`: ✅ tarea Movil2. `@Binding`: ✅ Clase 6B.
**En el repo:** `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` + `AgregarJugadorView.swift`, `00_AppCompleta/Views/AgregarMascotaView.swift`.

---

## 6.17 Receta: borrar elementos (CRUD — Borrar)

🔎 borrar, eliminar, delete, ondelete, swipe, deslizar para borrar, remove, removeAll, borrar todos, swipeActions, onMove, mover, reordenar, EditButton

### 6.17.1 Deslizar para borrar con `.onDelete` (⚠️)

`List(lista)` **no** tiene `.onDelete`. Hay que usar `List { ForEach(lista) { } .onDelete(...) }`.

```swift
struct ListaBorrarAntojosView: View {
    @State private var antojos = cargarAntojos()
    @State private var mostrarConfirmacion = false

    // onDelete entrega las POSICIONES que el usuario deslizó (IndexSet)
    func borrar(at posiciones: IndexSet) {
        antojos.remove(atOffsets: posiciones)
    }

    func mover(desde: IndexSet, hacia: Int) {
        antojos.move(fromOffsets: desde, toOffset: hacia)
    }

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(antojos) { antojo in
                        AntojoRow(antojo: antojo)
                    }
                    .onDelete(perform: borrar)       // deslizar a la izquierda → Borrar
                    .onMove(perform: mover)          // ⚠️ arrastrar para reordenar (en modo edición)
                }
                .toolbar {
                    EditButton()                     // ⚠️ botón "Editar" que activa borrar/mover
                }

                Button("Borrar todos") {
                    mostrarConfirmacion.toggle()
                }
                .alert("¿Borrar todos los antojos?", isPresented: $mostrarConfirmacion) {
                    Button("Borrar", role: .destructive) {
                        antojos.removeAll()
                    }
                    Button("Cancelar", role: .cancel) {}
                }
            }
            .navigationTitle("Antojos")
        }
    }
}
```

### 6.17.2 Botones al deslizar con `.swipeActions` (⚠️)

```swift
struct ListaSwipeAntojosView: View {
    @State private var antojos = cargarAntojos()

    func borrarAntojo(id: Int) {
        for indice in 0..<antojos.count {
            if antojos[indice].id == id {
                antojos.remove(at: indice)
                return                               // sal en cuanto lo borres
            }
        }
    }

    var body: some View {
        List {
            ForEach($antojos) { $antojo in
                AntojoRow(antojo: antojo)
                    .swipeActions {
                        Button(role: .destructive) {
                            borrarAntojo(id: antojo.id)
                        } label: {
                            Label("Borrar", systemImage: "trash")
                        }
                        Button {
                            antojo.favorito.toggle()
                        } label: {
                            Label("Favorito", systemImage: "heart")
                        }
                        .tint(.pink)
                    }
            }
        }
    }
}
```

### 6.17.3 Métodos de arreglo para borrar

| Método | Qué hace | Ejemplo |
|---|---|---|
| `remove(at: i)` | Quita el elemento en la posición `i` | `antojos.remove(at: 0)` |
| `remove(atOffsets: posiciones)` ⚠️ | Quita varias posiciones (lo que da `onDelete`) | `antojos.remove(atOffsets: posiciones)` |
| `removeAll()` | Vacía el arreglo | `antojos.removeAll()` |
| `removeLast()` | Quita el último (truena si está vacío) | `if !antojos.isEmpty { antojos.removeLast() }` |
| `removeFirst()` | Quita el primero (truena si está vacío) | igual, revisa `isEmpty` antes |
| `move(fromOffsets:toOffset:)` ⚠️ | Mueve renglones (lo que da `onMove`) | ver arriba |

**¿Visto en clase?** ⚠️ `onDelete`, `onMove`, `EditButton`, `swipeActions`, `role:` no vienen en las láminas. Explicación: "`onDelete` me da las posiciones que el usuario deslizó y `remove(atOffsets:)` las quita del arreglo `@State`; como es `@State`, la lista se redibuja sola".
**En el repo:** `08_ModelosYListas/Views/ListaAgregarBorrarView.swift` (bloques 2 y 5), `00_AppCompleta/Views/ListaMascotasView.swift`.

---

## 6.18 Receta: buscar y filtrar

🔎 buscar, search, filtrar, filter, filtro por categoria, buscador, searchable, barra de busqueda, contains, lowercased, presupuesto, rango de precio, resultados

**La idea:** NO borras nada de la lista original. Haces una **propiedad calculada** que arma una lista nueva solo con los que cumplen. Como es calculada, se rehace sola cada vez que cambia el texto o el filtro.

**Patrón base (for + if + append):**

```swift
var antojosFiltrados: Array<Antojo> {
    var resultado = Array<Antojo>()
    for antojo in antojos {
        if antojo.categoria == categoriaElegida {
            resultado.append(antojo)
        }
    }
    return resultado
}
```

**Ejemplo completo: texto + categoría con Picker + barra de búsqueda:**

```swift
struct BuscadorAntojosView: View {
    @State private var antojos = cargarAntojos()
    @State private var textoBusqueda = ""
    @State private var categoriaElegida = "Todas"

    var antojosFiltrados: Array<Antojo> {
        var resultado = Array<Antojo>()
        for antojo in antojos {
            // ¿Coincide con lo que escribió? (sin importar mayúsculas)
            let coincideTexto = textoBusqueda.isEmpty ||
                antojo.nombre.lowercased().contains(textoBusqueda.lowercased())
            // ¿Es de la categoría elegida?
            let coincideCategoria = categoriaElegida == "Todas" || antojo.categoria == categoriaElegida
            if coincideTexto && coincideCategoria {
                resultado.append(antojo)
            }
        }
        return resultado
    }

    var body: some View {
        NavigationStack {
            VStack {
                Picker(selection: $categoriaElegida, label: Text("Categoría")) {
                    Text("Todas").tag("Todas")
                    Text("Tacos").tag("Tacos")
                    Text("Hamburguesas").tag("Hamburguesas")
                    Text("Postres").tag("Postres")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                if antojosFiltrados.isEmpty {
                    Spacer()
                    Text("No hay antojos con ese filtro.")
                        .foregroundStyle(.secondary)
                    Spacer()
                } else {
                    List(antojosFiltrados) { antojo in
                        AntojoRow(antojo: antojo)
                    }
                    .listStyle(.inset)
                }
            }
            .navigationTitle("Buscar")
            .searchable(text: $textoBusqueda, prompt: "Buscar antojo")   // ⚠️ barra de búsqueda
        }
    }
}
```

**Filtrar por presupuesto (texto → número):**

```swift
var antojosEnPresupuesto: Array<Antojo> {
    var resultado = Array<Antojo>()
    if let presupuesto = Double(presupuestoTexto) {
        for antojo in antojos {
            if antojo.precio <= presupuesto {
                resultado.append(antojo)
            }
        }
    }
    return resultado
}
```

**Métodos de texto que sirven para buscar:**

| Método | Qué hace | Ejemplo |
|---|---|---|
| `.lowercased()` | Todo a minúsculas (para comparar sin importar mayúsculas) | `"Tacos".lowercased()` → `"tacos"` |
| `.uppercased()` | Todo a mayúsculas | `"tacos".uppercased()` → `"TACOS"` |
| `.contains(texto)` ⚠️ | ¿Incluye ese texto? | `"Tacos Juanito".contains("Juan")` → `true` |
| `.hasPrefix(texto)` ⚠️ | ¿Empieza con…? | `"Tacos".hasPrefix("Ta")` → `true` |
| `.isEmpty` | ¿Está vacío? | `textoBusqueda.isEmpty` |
| `==` | ¿Es exactamente igual? | `antojo.categoria == "Tacos"` |

**Otra forma que vas a ver (⚠️ no vista):** `antojos.filter { antojo in antojo.favorito }`. Hace lo mismo que el for + if + append en una línea. Si no la puedes explicar, usa el `for`.

**Ojo — editar desde una lista filtrada:** `antojosFiltrados` es una **copia**; si mandas `$` de ella al detalle, no compila. Para filtrar y poder editar, filtra dentro del `ForEach` con bindings:

```swift
List {
    ForEach($antojos) { $antojo in
        if antojo.categoria == categoriaElegida {
            NavigationLink {
                DetalleAntojoView(antojo: $antojo)
            } label: {
                AntojoRow(antojo: antojo)
            }
        }
    }
}
```

**¿Visto en clase?** Propiedad calculada, `for`, `if`, `append`: ✅ Clases 2 y 10. ⚠️ `.searchable`, `.contains`, `.filter` no vienen en las láminas.
**En el repo:** `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` (`jugadoresFiltrados`, bloques 1–4).

---

## 6.19 Receta: ordenar (⚠️)

🔎 ordenar, sort, sorted, orden alfabetico, mas caro primero, mejor calificado primero, ascendente, descendente

```swift
var porPrecio: Array<Antojo> {             // del más barato al más caro
    return antojos.sorted { a, b in
        a.precio < b.precio
    }
}

var porNombre: Array<Antojo> {             // A → Z
    return antojos.sorted { a, b in
        a.nombre < b.nombre
    }
}

var mejoresPrimero: Array<Antojo> {        // 5 estrellas primero
    return antojos.sorted { a, b in
        a.calificacion > b.calificacion
    }
}
```

**Cómo se lee:** "ordena de forma que `a` vaya antes que `b` cuando `a.precio < b.precio`". Con `<` es ascendente (menor primero); con `>` es descendente (mayor primero).

| Método | Qué hace |
|---|---|
| `lista.sorted { a, b in … }` | Regresa una **copia** ordenada; la original no cambia |
| `lista.sort { a, b in … }` | Ordena **la misma** lista (tiene que ser `var` o `@State`) |
| `lista.reversed()` | Al revés |

Úsalo en la vista así: `List(porPrecio) { antojo in AntojoRow(antojo: antojo) }`.

**¿Visto en clase?** ⚠️ No. Explicación: "sorted recibe una regla que compara dos elementos y regresa la lista ordenada; no modifica la original".
**En el repo:** `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift` → bloque 2.

---

## 6.20 Receta: contar, sumar, promedio, porcentaje, máximo y mínimo

🔎 contar, count, cuantos hay, total, favoritos, sumar, suma, promedio, average, media, porcentaje, percent, maximo, minimo, el mas caro, el mas barato, mejor calificado, estadisticas

Todas son **propiedades calculadas** dentro de la vista (o funciones). Se actualizan solas cuando cambia la lista.

```swift
var totalFavoritos: Int {
    var total = 0
    for antojo in antojos {
        if antojo.favorito {
            total += 1
        }
    }
    return total
}

func contarCategoria(_ categoria: String) -> Int {
    var total = 0
    for antojo in antojos {
        if antojo.categoria == categoria {
            total += 1
        }
    }
    return total
}

var promedioCalificacion: Double {
    if antojos.isEmpty {
        return 0                       // evita dividir entre 0
    }
    var suma = 0
    for antojo in antojos {
        suma += antojo.calificacion
    }
    return Double(suma) / Double(antojos.count)
}

var porcentajeFavoritos: Double {
    if antojos.isEmpty {
        return 0
    }
    return Double(totalFavoritos) / Double(antojos.count) * 100
}

var gastoTotal: Double {
    var suma = 0.0
    for antojo in antojos {
        suma += antojo.precio
    }
    return suma
}

var antojoMasCaro: Antojo? {           // opcional: si la lista está vacía no hay "más caro"
    var masCaro: Antojo? = nil
    for antojo in antojos {
        if let actual = masCaro {
            if antojo.precio > actual.precio {
                masCaro = antojo
            }
        } else {
            masCaro = antojo           // el primero que encuentra
        }
    }
    return masCaro
}
```

**Mostrarlos en pantalla:**

```swift
Text("Total: \(antojos.count)")
Text("Favoritos: \(totalFavoritos)")
Text("Tacos: \(contarCategoria("Tacos"))")
Text("Promedio: \(promedioCalificacion, specifier: "%.1f") ⭐️")      // 1 decimal
Text("Favoritos: \(porcentajeFavoritos, specifier: "%.0f")%")         // sin decimales
Text("Gasto total: \(gastoTotal.formatted(.currency(code: "MXN")))")
ProgressView(value: porcentajeFavoritos, total: 100)
    .scaleEffect(x: 1, y: 3)
if let caro = antojoMasCaro {
    Text("El más caro: \(caro.nombre) (\(caro.precioTexto))")
}
```

**Las trampas:**
- **División entera:** `suma / antojos.count` con dos `Int` da un `Int` (7 / 2 = 3, se pierde el .5). Convierte a `Double` **antes** de dividir: `Double(suma) / Double(antojos.count)`.
- **Dividir entre 0:** si la lista está vacía, `count` es 0 → el resultado es `nan` y se ve "nan" en pantalla. Revisa `isEmpty` primero.
- **Máximo/mínimo regresan opcional:** una lista vacía no tiene máximo. Usa `if let` para mostrarlo.

**Otra forma que vas a ver (⚠️ no vista):**

```swift
var mejorCalificado: Antojo? {
    return antojos.max { a, b in
        a.calificacion < b.calificacion
    }
}

var masBarato: Antojo? {
    return antojos.min { a, b in
        a.precio < b.precio
    }
}
```

**Métodos de arreglo para contar y revisar:**

| Método | Qué hace | Ejemplo |
|---|---|---|
| `.count` | Cuántos elementos hay | `antojos.count` |
| `.isEmpty` | ¿Está vacío? | `if antojos.isEmpty { }` |
| `.first` / `.last` | Primer / último (opcional) | `if let primero = antojos.first { }` |
| `.max { }` / `.min { }` ⚠️ | El mayor / menor según una regla (opcional) | ver arriba |
| `.contains { }` ⚠️ | ¿Alguno cumple? | `antojos.contains { a in a.favorito }` |

**¿Visto en clase?** `for`, `if`, `+=`, `Double()`, `specifier`, `ProgressView`: ✅ Clases 2, 3B y 15. ⚠️ `max`, `min`, `contains` con closure.
**En el repo:** `08_ModelosYListas/Views/ListaEditableView.swift` (`totalFavoritos`), `07_TabView/TareasResumenTabView.swift` (porcentaje), `00_AppCompleta/Views/InicioMascotasView.swift` (promedio), `09_Graficas/GraficaDesdeListaView.swift` (contar por categoría).

---

## 6.21 Receta: elemento al azar (recomendación sorpresa)

🔎 azar, aleatorio, random, randomElement, recomendacion sorpresa, sorpresa, elegir uno al azar, Int.random

**Forma 1 — `randomElement()` (✅ skill, Clase 2):** regresa un elemento al azar, como **opcional** (si la lista está vacía regresa nil).

```swift
struct SorpresaAntojoView: View {
    var antojos: Array<Antojo>
    @State private var sorpresa: Antojo? = nil     // nil = todavía no hay recomendación

    var body: some View {
        VStack(spacing: 16) {
            Button("Recomendación sorpresa") {
                sorpresa = antojos.randomElement()
            }
            .buttonStyle(.borderedProminent)

            if let elegido = sorpresa {
                Text(elegido.nombre)
                    .font(.title)
                Text(elegido.descripcion)
                Text(elegido.estrellas)
                Text(elegido.precioTexto)
            } else {
                Text("Toca el botón para recibir una recomendación.")
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}
```

**Forma 2 — índice al azar (la de tu tarea Movil2):**

```swift
@State private var indice = -1                       // -1 = todavía no hay

Button("Otra recomendación") {
    if !antojos.isEmpty {
        indice = Int.random(in: 0..<antojos.count)   // 0..<count: nunca se pasa del último
    }
}

if indice >= 0 && indice < antojos.count {
    Text(antojos[indice].nombre)
}
```

- `0..<antojos.count` (con `<`) va de 0 hasta count − 1. Con `0...antojos.count` (tres puntos) a veces daría un índice que no existe y la app truena.
- Si la lista está vacía, `Int.random(in: 0..<0)` truena. Por eso el `if !antojos.isEmpty`.

**¿Visto en clase?** ✅ skill (Clase 2: `Int.random`, `randomElement` con `if let`) y tu tarea Movil2.
**En el repo:** `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 5.

---

## 6.22 Receta: encontrar un elemento por su id (o su posición)

🔎 buscar por id, encontrar elemento, firstIndex, indice de un elemento, posicion, modificar uno especifico, find

**Con `for` sobre las posiciones (✅ solo cosas de clase):**

```swift
func marcarFavorito(id: Int) {
    for indice in 0..<antojos.count {
        if antojos[indice].id == id {
            antojos[indice].favorito = true          // se modifica en la lista original
        }
    }
}

func buscarAntojo(id: Int) -> Antojo? {
    for antojo in antojos {
        if antojo.id == id {
            return antojo
        }
    }
    return nil                                       // no existe
}
```

**Con `firstIndex(where:)` (⚠️ no visto):**

```swift
func marcarFavoritoConFirstIndex(id: Int) {
    if let indice = antojos.firstIndex(where: { antojo in antojo.id == id }) {
        antojos[indice].favorito = true
    }
}
```

**Por qué con índice y no con `for antojo in antojos`:** dentro de `for antojo in antojos`, `antojo` es una **copia** (`let`). Cambiarla no cambia la lista. Para modificar, hay que entrar por la posición: `antojos[indice].favorito = true`.

**¿Visto en clase?** ✅ `for`, rangos `0..<n`, acceso por índice (Clase 2). ⚠️ `firstIndex(where:)`.

---

## 6.23 Protocolos en modelos (Clase 8, resumen)

🔎 protocolo, protocol, conformar, interfaz, get set, clases que implementan, Personaje, EquipoDeportivo, polimorfismo

**Qué es:** un protocolo es una **lista de requisitos** (propiedades y métodos) que una clase o struct se compromete a tener. Es el equivalente a las "interfaces" de otros lenguajes. Se dice que la clase **se conforma** al protocolo.

- `{ get }` → basta con poder leerla (puede ser `let`).
- `{ get set }` → también se debe poder modificar (tiene que ser `var`).

```swift
protocol EquipoDeportivo {
    var nombreDeporte: String { get }
    var numeroJugadores: Int { get }
    var nombreEquipo: String { get set }
    var partidosGanados: Int { get set }

    func mostrarReglas() -> String
    func calcularPuntos() -> Int
}

class EquipoBasketball: EquipoDeportivo {
    let nombreDeporte = "Basketball"
    let numeroJugadores = 5
    var nombreEquipo: String
    var partidosGanados: Int

    init(nombre: String) {
        self.nombreEquipo = nombre
        self.partidosGanados = 0
    }

    func mostrarReglas() -> String {
        return "Se juega con \(numeroJugadores) jugadores. No hay empates."
    }

    func calcularPuntos() -> Int {
        return partidosGanados * 2               // básquet: 2 por ganado
    }
}

class EquipoFutbol: EquipoDeportivo {
    let nombreDeporte = "Fútbol"
    let numeroJugadores = 11
    var nombreEquipo: String
    var partidosGanados: Int
    var partidosEmpatados: Int

    init(nombre: String) {
        self.nombreEquipo = nombre
        self.partidosGanados = 0
        self.partidosEmpatados = 0
    }

    func mostrarReglas() -> String {
        return "Se juega con \(numeroJugadores) jugadores. Sí hay empates."
    }

    func calcularPuntos() -> Int {
        return partidosGanados * 3 + partidosEmpatados    // fútbol: 3 por ganado + empates
    }
}

// Los dos se pueden guardar en el mismo arreglo porque cumplen el protocolo
func pruebaEquipos() -> String {
    let equipos: Array<EquipoDeportivo> = [EquipoBasketball(nombre: "Tec"), EquipoFutbol(nombre: "Rayados")]
    var texto = ""
    for equipo in equipos {
        texto += "\(equipo.nombreEquipo): \(equipo.calcularPuntos()) puntos\n"
    }
    return texto
}
```

**Lo que hay que saber explicar:** dos clases cumplen el mismo protocolo pero implementan la lógica diferente (`calcularPuntos` suma distinto). Quien usa el protocolo no necesita saber cuál es cuál.

**Errores comunes:**
- `Type 'EquipoFutbol' does not conform to protocol 'EquipoDeportivo'` → te faltó una propiedad o método del protocolo, o el nombre/tipo no coincide. Xcode ofrece "Fix" para agregar lo que falta.
- Una propiedad `{ get set }` declarada con `let` → error: debe ser `var`.

**¿Visto en clase?** ✅ Clase 8 (Protocolos), en la skill de modelos. Tu tarea PersonajeProtocol.
**En el repo:** `08_ModelosYListas/Model/Personaje.swift` (protocolo + Guerrero, Mago, Arquero) y `08_ModelosYListas/Views/ProtocolosView.swift`.

---

## 6.24 Codable y JSON

🔎 codable, json, jsonencoder, jsondecoder, encode, decode, convertir a json, leer json, plist, xml, PropertyListEncoder, CustomStringConvertible, description, print bonito, do try catch

### 6.24.1 CustomStringConvertible: cómo se ve con `print`

Agregas `CustomStringConvertible` y una propiedad calculada `description`. Ahora `print(empleado)` muestra lo que tú decidas.

### 6.24.2 Codable: convertir a JSON / XML y de regreso

`Codable` permite convertir el struct a JSON (o XML) y leer JSON para crear structs. Todos los campos deben ser de tipos "codificables" (`Int`, `String`, `Double`, `Bool`, arreglos de ellos, otros structs Codable). `UIImage` **no** es Codable.

```swift
import Foundation

struct Empleado: CustomStringConvertible, Codable, Identifiable {
    var id: Int
    var nombre: String
    var apellidos: String
    var depto: String

    var description: String {
        return "ID=\(id) NOMBRE = \(nombre) \(apellidos)"
    }
}

func pruebaCodificar() {
    let emp1 = Empleado(id: 123, nombre: "Perla", apellidos: "Leal Flores", depto: "Ventas")
    let emp2 = Empleado(id: 456, nombre: "Jorge", apellidos: "Garza Junco", depto: "Merca")
    let listaEmpleados = [emp1, emp2]

    print(emp1)        // ID=123 NOMBRE = Perla Leal Flores

    // Lista → JSON
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted        // ⚠️ solo para que se lea bonito
    do {
        let jsonData = try jsonEncoder.encode(listaEmpleados)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    } catch {
        print("Error inesperado \(error)")
    }

    // Lista → XML (PropertyList)
    let plistEncoder = PropertyListEncoder()
    plistEncoder.outputFormat = .xml
    do {
        let plistData = try plistEncoder.encode(listaEmpleados)
        if let plistString = String(data: plistData, encoding: .utf8) {
            print(plistString)
        }
    } catch {
        print("Error inesperado \(error)")
    }
}
```

La skill escribe `print(jsonString!)`; aquí va con `if let` para que no truene.

### 6.24.3 JSON (texto) → lista de structs

```swift
func leerEmpleadosDeJSON(texto: String) -> Array<Empleado> {
    if let data = texto.data(using: .utf8) {
        do {
            let jsonDecoder = JSONDecoder()
            let lista = try jsonDecoder.decode([Empleado].self, from: data)
            return lista
        } catch {
            print("Error al leer el JSON: \(error)")
        }
    }
    return []
}

let textoJSON = """
[
  { "id": 1, "nombre": "Ana", "apellidos": "Ruiz", "depto": "Sistemas" },
  { "id": 2, "nombre": "Luis", "apellidos": "Peña", "depto": "Ventas" }
]
"""
```

- `[Empleado].self` le dice al decoder "espera un **arreglo** de Empleado". Si el JSON es un solo objeto `{ }`, sería `Empleado.self`.
- **Las llaves del JSON deben llamarse IGUAL que los campos del struct** (`"nombre"` ↔ `var nombre`). Si no coinciden o falta una, el decode falla y entra al `catch`.
- `"""` (tres comillas) = texto de varias líneas.

### 6.24.4 `do / try / catch` en palabras simples

| Palabra | Significa |
|---|---|
| `do { }` | "intenta esto" |
| `try` | se pone antes de cada función que puede fallar (`encode`, `decode`, `Data(contentsOf:)`) |
| `catch { }` | "si algo falló, haz esto"; adentro existe la variable `error` con el motivo |

Error si olvidas el `try`: `Call can throw but is not marked with 'try'`. Si pones `try` fuera de un `do`: `Errors thrown from here are not handled`.

**¿Visto en clase?** ✅ `Codable`, `CustomStringConvertible`, `JSONEncoder`, `PropertyListEncoder`: Clase 8 (skill de modelos). `JSONDecoder`: ✅ clase de servicios REST (skill). ⚠️ `.prettyPrinted`.
**En el repo:** `08_ModelosYListas/Model/Empleado.swift` (bloques 1–5) y `08_ModelosYListas/Views/CodableView.swift`.

---

## 6.25 Cargar un archivo .json incluido en la app (⚠️)

🔎 json local, archivo json, bundle, Bundle.main.url, leer archivo, Data(contentsOf:), datos desde json, peliculas.json

**Cuándo:** si en el examen te dan los datos en un archivo `.json`.

**Pasos:**
1. Arrastra el `.json` a tu proyecto en Xcode → marca **Copy items if needed** y tu **target**.
2. Haz un struct `Codable` con los **mismos nombres** que las llaves del JSON.
3. Léelo con esta función:

```swift
import Foundation

struct Pelicula: Codable, Identifiable {
    var id: Int
    var titulo: String
    var anio: Int
}

func cargarPeliculasJSON() -> Array<Pelicula> {
    // Bundle.main = la carpeta de la app ya instalada. Busca "peliculas.json".
    if let url = Bundle.main.url(forResource: "peliculas", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)                 // lee el archivo completo
            let jsonDecoder = JSONDecoder()
            let lista = try jsonDecoder.decode([Pelicula].self, from: data)
            return lista
        } catch {
            print("Error al leer el JSON: \(error)")             // nombres que no coinciden
        }
    } else {
        print("No se encontró peliculas.json. ¿Está agregado al target?")
    }
    return []
}
```

Y en la vista: `@State private var peliculas = cargarPeliculasJSON()` y `List(peliculas) { … }`.

**Si la lista sale vacía:** mira la consola de Xcode. "No se encontró" = el archivo no está en el target (selecciónalo → panel derecho → Target Membership). "Error al leer" = una llave del JSON no coincide con el struct, o un tipo no coincide (en el JSON `"anio": "2017"` con comillas es texto, no `Int`).

**¿Visto en clase?** ⚠️ `Bundle.main.url` y `Data(contentsOf:)` no vienen en las láminas. El `JSONDecoder` sí (clase de servicios).
**En el repo:** `08_ModelosYListas/Model/Pelicula.swift` + `Model/peliculas.json` + `Views/JSONLocalView.swift`.

---

## 6.26 AsyncImage: imágenes desde internet (Anexo A de la Clase 10)

🔎 asyncimage, imagen de internet, url de imagen, imagen remota, descargar imagen, placeholder, imagen desde link

**Forma básica (lámina, pág. 18):**

```swift
AsyncImage(url: URL(string: "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/077.png"), scale: 3)
```

`scale: 3` la hace 3 veces más chica.

**Con placeholder y tamaño (lámina, pág. 19):**

```swift
AsyncImage(url: URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/077.png")) { image in
    image
        .resizable(resizingMode: .stretch)
        .aspectRatio(contentMode: .fit)
} placeholder: {
    Color.gray
        .frame(height: 100)
}
.frame(height: 100)
```

- El primer bloque dice qué hacer con la imagen cuando ya llegó.
- `placeholder:` es lo que se ve mientras carga (o si falla).

**Por qué NO conviene en el examen:** necesita internet (mañana no hay), gasta datos en cada carga y la URL se puede romper. Los **assets locales** funcionan sin conexión y cargan de inmediato. En el modelo, si la imagen es de internet, el campo es un `String` con la URL (ej. `ligaImagen` en tu tarea EjemploListas).

**¿Visto en clase?** ✅ Clase 10, Anexo A (págs. 18–19).
**En el repo:** `08_ModelosYListas/Views/ImagenRemotaView.swift` (bloques 1 y 2; el 3 con fases ⚠️).

---

## 6.27 Resumen de errores de modelos y listas

🔎 errores lista, error modelo, no compila lista, crash lista, index out of range, requires that conform to identifiable, let constant, binding error

| Mensaje o síntoma | Causa más común | Arreglo | Ver |
|---|---|---|---|
| `Initializer 'init(_:rowContent:)' requires that 'X' conform to 'Identifiable'` | El modelo no dice `: Identifiable` | Agrega `: Identifiable` y `var id` | 6.3 |
| `Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'String' conform to 'Identifiable'` | `ForEach` de textos sin `id:` | `ForEach(arreglo, id: \.self)` | 6.10 |
| `Missing argument for parameter 'x' in call` | Te faltó un campo al crear el struct, o el dato en el `#Preview` | Pon todos los campos / dato de prueba / `.constant(...)` | 6.2, 6.11 |
| `Argument 'a' must precede argument 'b'` | Orden distinto al del struct | Mismo orden que en el struct | 6.2 |
| `Value of type 'X' has no member 'y'` | Nombre del campo distinto (`esFavorito` vs `favorito`) | Mismo nombre en todos lados | 6.2 |
| `Cannot convert value of type 'Int' to expected argument type 'String'` | Tipo equivocado | Texto entre comillas; número sin comillas | 6.2 |
| `No exact matches in call to initializer` en un `Text` | `Text(5)` o `Text(precio)` con un número | `Text("\(numero)")` | — |
| `Cannot assign to property: 'x' is a 'let' constant` | Modificas un elemento de `List(lista)` o de `for item in lista` | `List($lista) { $item in }` o por índice `lista[i].campo = …` | 6.13, 6.22 |
| `Cannot convert value of type 'X' to expected argument type 'Binding<X>'` | Falta el `$` al pasar al detalle | `DetalleView(antojo: $antojo)` | 6.13 |
| `Expressions are not allowed at the top level` | Código suelto fuera de función (ej. configurar el DateFormatter) | Muévelo dentro de la función | 6.6.2 |
| `Cannot call value of non-function type 'String?'` | `dateFormatter.dateFormat("…")` | `dateFormatter.dateFormat = "…"` | 6.6.2 |
| Crash `Index out of range` | `lista[i]` con un `i` que no existe (o lista vacía) | Revisa `isEmpty` / usa `0..<count` | 6.21 |
| Consola: `the ID 1 occurs multiple times` | Ids repetidos | Cada elemento con id distinto | 6.3 |
| Consola: `No image named '' found in asset catalog` | `imagen: ""` o nombre mal escrito | Nombre exacto del asset | 6.5 |
| El cambio no se ve al regresar a la lista | Lista en `var` global o copia | `@State` en la vista dueña + `@Binding` | 6.6.3, 6.13 |
| El título de la lista no sale | Falta `NavigationStack` | Envuelve la lista en `NavigationStack` | 6.9 |
| El promedio sale "nan" | Lista vacía: dividir entre 0 | `if lista.isEmpty { return 0 }` | 6.20 |

---

# 7. Gráficas (Swift Charts)

Todo lo de gráficas sale de la **Clase 15 (Gráficas Simples en Swift)**. La profe usa la librería **Charts** de Apple.
Las láminas también mencionan que se podrían dibujar "con figuras geométricas desde cero", pero eso no se practicó: usa Charts.

## 7.1 Lo básico: `import Charts`, `Chart` y las "marcas"
🔎 grafica, gráfica, chart, charts, import charts, swift charts, graficas, graph, plot, barras, lineas, pastel, BarMark, LineMark, PointMark, SectorMark, value, .value

**Qué es:** una gráfica es una vista más, como un `Text` o un `Image`. Se escribe `Chart { ... }` y adentro pones **marcas**.
Cada marca es una figura: una barra (`BarMark`), un punto de una línea (`LineMark`), un punto suelto (`PointMark`) o una rebanada de pastel (`SectorMark`).

**Cómo se escribe (forma de clase, lámina 4):**

```swift
import SwiftUI
import Charts          // 1. SIEMPRE, arriba del archivo, además de SwiftUI

// 2. Dentro del body:
// Chart {
//     BarMark(
//         x: .value("Label X", "Val X"),
//         y: .value("Label Y", valorY)
//     )
// }
```

**¿Qué es `.value("Etiqueta", valor)`?** Es la forma de darle un dato a la gráfica. Tiene 2 partes:

| Parte | Para qué sirve | Ejemplo |
|---|---|---|
| `"Etiqueta"` (texto) | El **nombre** del dato. Es lo que sale en la leyenda y en los ejes. | `"Comida"`, `"Votos"`, `"Meses"` |
| `valor` | El dato de verdad: texto (categoría), número o fecha. | `"Pizza"`, `10`, `item.votos` |

- En **x** normalmente va la categoría o el tiempo (`"Pizza"`, mes `1`).
- En **y** va el número (cuántos votos, cuánto dinero).

**Ejemplo completo (lámina 5, barras escritas a mano):**

```swift
import SwiftUI
import Charts

struct BarrasEstaticasView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Comida", "Pizza"),
                y: .value("Votos", 10)
            )
            BarMark(
                x: .value("Comida", "Hamburguesa"),
                y: .value("Votos", 15)
            )
            BarMark(
                x: .value("Comida", "Tacos"),
                y: .value("Votos", 7)
            )
        }
        .frame(height: 250)     // dale un alto, si no, puede salir aplastada
        .padding()
    }
}
```

**Las dos formas de llenar un `Chart`:**

| Forma | Cuándo | Cómo se ve |
|---|---|---|
| **Estática** `Chart { BarMark(...) BarMark(...) }` | Pocos datos fijos, escritos a mano | Cada marca escrita una por una (láminas 5, 11, 18) |
| **Dinámica** `Chart(arreglo) { item in BarMark(...) }` | Datos que vienen de un arreglo o de tu lista | Una marca por cada elemento del arreglo (láminas 7, 13, 20) |

La dinámica es la que vas a usar en el examen, porque los datos vienen de tu lista.

**¿Visto en clase?** ✅ Clase 15 (láminas 4–7).
**En el repo:** `09_Graficas/BarrasView.swift` → bloques 1 y 2.

## 7.2 ¿Qué gráfica uso? (la tabla de la profe)
🔎 que grafica usar, cual grafica, tipo de grafica, barras o lineas, pastel o barras, comparar categorias, tendencia, proporcion, relacion entre variables, which chart

La profe dio una regla para cada tipo. Te pueden preguntar "¿por qué elegiste esta gráfica?" y esta es la respuesta:

| Gráfica | Marca | Úsala para… (frase de la clase) | Ejemplo en tu app |
|---|---|---|---|
| **Barras** | `BarMark` | **Comparar categorías** | Cuántos antojos hay de Tacos, Hamburguesas, Postres |
| **Líneas** | `LineMark` | **Evoluciones, tendencias, tiempo** | Cuánto gastaste cada mes, temperatura por día |
| **Puntos** (dispersión) | `PointMark` | **Relación entre 2 variables** | Precio vs calificación, horas de estudio vs calificación |
| **Pastel / dona** | `SectorMark` | **Proporciones de un total** | Favoritos vs no favoritos (qué parte del 100%) |

> ⚠️ **Regla importante de la lámina 10:** la gráfica de líneas **NO** se usa para comparar categorías. Solo para ver cómo cambia
> **una misma variable en el tiempo**. Si tus datos son "Tacos / Hamburguesas / Postres", usa barras o pastel, nunca líneas.
> La línea "une" los puntos y eso hace creer que hay una continuidad entre Tacos y Hamburguesas, que no existe.

**Cómo elegir rápido:**
- ¿Tus datos son nombres de cosas (categorías)? → **Barras**. Si quieres ver "qué parte del total" es cada una → **Pastel/dona**.
- ¿Tus datos son meses, días o fechas, en orden? → **Líneas**.
- ¿Tienes 2 números por cada cosa y quieres ver si uno sube cuando el otro sube? → **Puntos**.

**¿Visto en clase?** ✅ Clase 15 (láminas 3, 9, 10, 14, 16).
**En el repo:** `09_Graficas/DashboardGraficasView.swift` → encabezado ("Qué gráfica usar").

## 7.3 El modelo de datos para una gráfica (struct `Identifiable`)
🔎 modelo grafica, struct grafica, Identifiable, id, datos de la grafica, arreglo de datos, dataBarChart, UUID, var id

**Qué es:** para la forma dinámica `Chart(arreglo) { item in ... }` necesitas un arreglo de structs. Igual que en `List`, el struct
debe ser **`Identifiable`** (tener un `id` único). Así Charts sabe distinguir cada elemento.

**Las 3 formas de dar el `id` que salen en la clase:**

```swift
// Forma 1 (lámina 6): id como número que tú pones
struct Comida: Identifiable {
    let id: Int
    let tipo: String
    let votos: Double
}

let dataBarChart: [Comida] = [
    Comida(id: 1, tipo: "Pizza", votos: 10),
    Comida(id: 2, tipo: "Hamburguesa", votos: 15),
    Comida(id: 3, tipo: "Tacos", votos: 7)
]

// Forma 2 (lámina 12): id CALCULADO a partir de otro campo que ya es único
struct Punto: Identifiable {
    var id: Int { return x }      // el mes ya es único, se usa como id
    let x: Int
    let y: Double
}

let dataLinesXY = [
    Punto(x: 1, y: 20),
    Punto(x: 2, y: 100),
    Punto(x: 3, y: 60)
]

// Forma 3 (lámina 19): id automático con UUID() (no tienes que inventarlo)
struct Consolas: Identifiable {
    let id = UUID()
    let nombre: String
    let numeroJugadores: Double
}

let listaConsolas = [
    Consolas(nombre: "Switch", numeroJugadores: 20),
    Consolas(nombre: "Xbox", numeroJugadores: 30),
    Consolas(nombre: "Compu", numeroJugadores: 10)
]
```

| Forma del id | Cuándo usarla | Ojo |
|---|---|---|
| `let id: Int` | Tú controlas los ids (1, 2, 3…) | No repitas ids |
| `var id: Int { return x }` / `var id: String { return categoria }` | Ya tienes un campo que nunca se repite | Si ese campo se repite, la gráfica se confunde |
| `let id = UUID()` | No tienes un identificador natural | Al crear el struct NO pasas el id: `Consolas(nombre: "Xbox", numeroJugadores: 30)` |

**Dónde va todo esto:** el struct y el `let` con los datos pueden ir arriba de la vista (fuera del `struct ...View`) como en las láminas,
o en tu carpeta `Model/`. Los `let` globales con datos fijos están bien para gráficas que no cambian.

**Errores comunes:**
- `initializer 'init(_:content:)' requires that 'X' conform to 'Identifiable'` → a tu struct le falta `: Identifiable` o la propiedad `id`.
- `Missing argument for parameter 'id'` al crear un `Consolas` → si el id es `let id = UUID()` no lo pases; si es `let id: Int`, sí.

**¿Visto en clase?** ✅ Clase 15 (láminas 6, 12, 19).
**En el repo:** `09_Graficas/BarrasView.swift` (`ComidaVotos`), `09_Graficas/LineasView.swift` (`PuntoMes`), `09_Graficas/PastelYDonaView.swift` (`ConsolaJugadores`).

## 7.4 Gráfica de barras (`BarMark`)
🔎 barras, bar chart, barchart, BarMark, columnas, comparar categorias, barras horizontales, barras apiladas, barras agrupadas, valor encima de la barra, stacked, grouped

**Qué es:** barras verticales (o acostadas) para **comparar categorías**.

**Cuándo usarlo:** votos por comida, antojos por categoría, gasto por categoría, calificación por materia.

**Barras con un arreglo (forma de clase, lámina 7):**

```swift
struct BarrasDinamicasView: View {
    var body: some View {
        Chart(dataBarChart) { item in
            BarMark(
                x: .value("Comida", item.tipo),
                y: .value("Votos", item.votos)
            )
        }
        .frame(height: 250)
    }
}
```

`item` es cada elemento del arreglo, uno por uno (como el `jugadorItem` de las listas). El nombre lo eliges tú.

### 7.4.1 Barras horizontales ⚠️
Solo **intercambia** lo que va en `x` y en `y`: el número en `x` y la categoría en `y`.

```swift
Chart(dataBarChart) { item in
    BarMark(
        x: .value("Votos", item.votos),     // número en x
        y: .value("Comida", item.tipo)      // categoría en y
    )
}
```

Sirven cuando los nombres son largos y se enciman abajo.

### 7.4.2 Valor escrito encima de cada barra ⚠️

```swift
Chart(dataBarChart) { item in
    BarMark(
        x: .value("Comida", item.tipo),
        y: .value("Votos", item.votos)
    )
    .annotation(position: .top) {           // ⚠️ no visto: pone una vista arriba de la barra
        Text("\(Int(item.votos))")
            .font(.caption)
            .bold()
    }
}
```

### 7.4.3 Barras apiladas y agrupadas ⚠️
Cuando cada categoría tiene **sub-grupos** (ej. ventas por mes de 2 tiendas):

```swift
struct VentaTienda: Identifiable {
    let id: Int
    let mes: String
    let tienda: String
    let ventas: Double
}

let datosVentasTienda = [
    VentaTienda(id: 1, mes: "Ene", tienda: "Centro", ventas: 120),
    VentaTienda(id: 2, mes: "Ene", tienda: "Norte", ventas: 80),
    VentaTienda(id: 3, mes: "Feb", tienda: "Centro", ventas: 150),
    VentaTienda(id: 4, mes: "Feb", tienda: "Norte", ventas: 95)
]

// APILADAS (una encima de otra): basta con darle color por tienda
Chart(datosVentasTienda) { item in
    BarMark(
        x: .value("Mes", item.mes),
        y: .value("Ventas", item.ventas)
    )
    .foregroundStyle(by: .value("Tienda", item.tienda))
}

// AGRUPADAS (una al lado de otra): además .position(by:)
Chart(datosVentasTienda) { item in
    BarMark(
        x: .value("Mes", item.mes),
        y: .value("Ventas", item.ventas)
    )
    .foregroundStyle(by: .value("Tienda", item.tienda))
    .position(by: .value("Tienda", item.tienda))      // ⚠️ no visto
}
```

**Opciones de `BarMark`:**

| Modificador | Qué hace | ¿Clase? |
|---|---|---|
| `.foregroundStyle(.purple)` | Todas las barras de un color | ✅ opción A |
| `.foregroundStyle(by: .value("Comida", item.tipo))` | Un color automático por categoría + leyenda | ✅ opción B |
| `.annotation(position: .top) { Text(...) }` | Texto o vista encima de la barra | ⚠️ |
| `.position(by: .value("Grupo", item.grupo))` | Barras agrupadas lado a lado | ⚠️ |
| `.cornerRadius(6)` | Esquinas redondeadas en la barra | ⚠️ |
| `.opacity(0.7)` | Transparencia | ⚠️ |

**¿Visto en clase?** ✅ Clase 15 (láminas 4–8): estática, dinámica y colores. ⚠️ Horizontales, apiladas, agrupadas y anotaciones no.
**En el repo:** `09_Graficas/BarrasView.swift` → bloques 1–7 (6 = horizontales, 7 = valor encima).

## 7.5 Colores de la gráfica (opciones A, B y C de la clase)
🔎 color grafica, colores barras, foregroundStyle, foregroundStyle by, chartForegroundStyleScale, color por categoria, mis colores, paleta grafica, legend color, cambiar color

La lámina 8 enseña 3 opciones. Memorízalas así:

| Opción | Qué logra | Dónde va | Código |
|---|---|---|---|
| **A** | **Todas** las barras del mismo color | En la marca (`BarMark`) | `.foregroundStyle(.purple)` |
| **B** | Un color **diferente automático** por categoría (y sale leyenda) | En la marca | `.foregroundStyle(by: .value("Comida", item.tipo))` |
| **C** | Colores **diferentes que tú eliges** | **Además de B**, en el `Chart` | `.chartForegroundStyleScale([ "Pizza": .red, ... ])` |

```swift
// A. Todas iguales
Chart(dataBarChart) { item in
    BarMark(
        x: .value("Comida", item.tipo),
        y: .value("Votos", item.votos)
    )
    .foregroundStyle(.purple)
}

// B. Automáticos por categoría
Chart(dataBarChart) { item in
    BarMark(
        x: .value("Comida", item.tipo),
        y: .value("Votos", item.votos)
    )
    .foregroundStyle(by: .value("Comida", item.tipo))
}

// C. Personalizados = B + chartForegroundStyleScale sobre el Chart
Chart(dataBarChart) { item in
    BarMark(
        x: .value("Comida", item.tipo),
        y: .value("Votos", item.votos)
    )
    .foregroundStyle(by: .value("Comida", item.tipo))
}
.chartForegroundStyleScale([
    "Pizza": .red,
    "Hamburguesa": .brown,
    "Tacos": .orange
])
```

**Errores comunes:**
- **Los colores de la opción C no se aplican:** las llaves (`"Pizza"`) deben ser **exactamente** iguales al texto del dato, con mayúsculas y acentos.
  Y tiene que estar también la opción B (`.foregroundStyle(by:)`); sin B, la C no hace nada.
- **Pusiste `.chartForegroundStyleScale` dentro del closure:** va **afuera**, pegado al `Chart`, no a la marca.
- **Quieres usar los colores de tu paleta:** funciona igual: `"Tacos": paletaPrimario`.

**¿Visto en clase?** ✅ Clase 15 (lámina 8).
**En el repo:** `09_Graficas/BarrasView.swift` → bloques 3 (A), 4 (B), 5 (C).

## 7.6 Gráfica de líneas (`LineMark`)
🔎 lineas, línea, line chart, linechart, LineMark, tendencia, evolucion, tiempo, meses, dias, varias lineas, series, curva, linea punteada, interpolationMethod, lineStyle

**Qué es:** puntos unidos con una línea. Muestra cómo **cambia una variable en el tiempo**.

> ⚠️ Nunca para comparar categorías (lámina 10). Solo con meses, días, semanas, años, etc., en orden.

**Estática (lámina 11):**

```swift
Chart {
    LineMark(
        x: .value("Meses", 1),
        y: .value("Votos", 20)
    )
    LineMark(
        x: .value("Meses", 2),
        y: .value("Votos", 100)
    )
    LineMark(
        x: .value("Meses", 3),
        y: .value("Votos", 60)
    )
}
.frame(height: 250)
```

**Con arreglo (lámina 13), usando el struct `Punto` de 7.3:**

```swift
Chart(dataLinesXY) { item in
    LineMark(
        x: .value("Meses", item.x),
        y: .value("Votos", item.y)
    )
}
.frame(height: 250)
```

### 7.6.1 Varias líneas (una por serie)
Agrega `.foregroundStyle(by:)` con el campo que separa las series. Charts dibuja **una línea por cada valor distinto**:

```swift
struct TemperaturaCiudad: Identifiable {
    let id: Int
    let dia: Int
    let ciudad: String
    let grados: Double
}

let datosTemperaturas = [
    TemperaturaCiudad(id: 1, dia: 1, ciudad: "Monterrey", grados: 30),
    TemperaturaCiudad(id: 2, dia: 2, ciudad: "Monterrey", grados: 33),
    TemperaturaCiudad(id: 3, dia: 3, ciudad: "Monterrey", grados: 31),
    TemperaturaCiudad(id: 4, dia: 1, ciudad: "CDMX", grados: 22),
    TemperaturaCiudad(id: 5, dia: 2, ciudad: "CDMX", grados: 24),
    TemperaturaCiudad(id: 6, dia: 3, ciudad: "CDMX", grados: 21)
]

Chart(datosTemperaturas) { item in
    LineMark(
        x: .value("Día", item.dia),
        y: .value("Grados", item.grados)
    )
    .foregroundStyle(by: .value("Ciudad", item.ciudad))   // una línea por ciudad
}
```

### 7.6.2 Línea con puntitos, curva o punteada ⚠️

```swift
// Línea + un punto en cada dato: pon las DOS marcas en el mismo closure
Chart(dataLinesXY) { item in
    LineMark(
        x: .value("Meses", item.x),
        y: .value("Votos", item.y)
    )
    PointMark(
        x: .value("Meses", item.x),
        y: .value("Votos", item.y)
    )
}

// Curva, gruesa, punteada y de color
Chart(dataLinesXY) { item in
    LineMark(
        x: .value("Meses", item.x),
        y: .value("Votos", item.y)
    )
    .interpolationMethod(.catmullRom)                       // ⚠️ curva suave
    .lineStyle(StrokeStyle(lineWidth: 3, dash: [6]))        // ⚠️ grosor 3, punteada
    .foregroundStyle(.orange)
}
```

**Opciones de `LineMark`:**

| Modificador | Qué hace | ¿Clase? |
|---|---|---|
| `.foregroundStyle(.orange)` | Color de la línea | ✅ (opción A aplica igual) |
| `.foregroundStyle(by: .value("Serie", item.serie))` | Una línea por serie, con leyenda | ✅ (opción B) |
| `.interpolationMethod(.catmullRom)` | Línea curva | ⚠️ |
| `.interpolationMethod(.stepStart)` | Línea en escalones | ⚠️ |
| `.lineStyle(StrokeStyle(lineWidth: 3))` | Grosor | ⚠️ |
| `.lineStyle(StrokeStyle(lineWidth: 2, dash: [6]))` | Punteada | ⚠️ |
| `.symbol(.circle)` | Pone un símbolo en cada punto | ⚠️ |

**¿Visto en clase?** ✅ Clase 15 (láminas 9–13). ⚠️ Varias series con puntos, curva y estilos no.
**En el repo:** `09_Graficas/LineasView.swift` → bloques 1 (estática), 2 (arreglo), 3 (con puntos), 4 (varias), 6 (curva).

## 7.7 Gráfica de puntos / dispersión (`PointMark`)
🔎 puntos, dispersion, dispersión, scatter, scatter plot, PointMark, relacion entre variables, correlacion, $0, symbol, symbolSize

**Qué es:** igual que `LineMark` pero **sin unir los puntos** (lámina 15). Muestra si hay **relación entre 2 variables**.

**Forma 1 (con `item in`):**

```swift
Chart(dataLinesXY) { item in
    PointMark(
        x: .value("Meses", item.x),
        y: .value("Votos", item.y)
    )
}
```

**Forma 2: "Otra forma de definirlo" con `$0` (lámina 15):**

```swift
Chart(dataLinesXY) {
    PointMark(
        x: .value("Meses", $0.x),
        y: .value("Votos", $0.y)
    )
}
```

**¿Qué es `$0`?** Es un nombre automático para "el elemento actual". En lugar de escribir `item in` y luego `item.x`,
escribes directo `$0.x`. Hace exactamente lo mismo. (No confundir con el `$` de `@State`/`@Binding`: son cosas distintas.)

**Color y forma por grupo ⚠️:**

```swift
struct AlumnoGrafica: Identifiable {
    let id: Int
    let horasEstudio: Double
    let calificacion: Double
    let grupo: String
}

let datosAlumnos = [
    AlumnoGrafica(id: 1, horasEstudio: 1, calificacion: 60, grupo: "A"),
    AlumnoGrafica(id: 2, horasEstudio: 3, calificacion: 75, grupo: "A"),
    AlumnoGrafica(id: 3, horasEstudio: 5, calificacion: 90, grupo: "B"),
    AlumnoGrafica(id: 4, horasEstudio: 2, calificacion: 70, grupo: "B")
]

Chart(datosAlumnos) { item in
    PointMark(
        x: .value("Horas de estudio", item.horasEstudio),
        y: .value("Calificación", item.calificacion)
    )
    .foregroundStyle(by: .value("Grupo", item.grupo))   // ✅ opción B
    .symbol(by: .value("Grupo", item.grupo))            // ⚠️ círculo, cuadro, triángulo…
    .symbolSize(120)                                    // ⚠️ tamaño del punto
}
```

**¿Visto en clase?** ✅ Clase 15 (láminas 14–15). ⚠️ `.symbol` y `.symbolSize` no.
**En el repo:** `09_Graficas/PuntosView.swift` → bloques 1, 2 (`$0`), 3 (color), 4 (forma y tamaño).

## 7.8 Gráfica de pastel y dona (`SectorMark`)
🔎 pastel, pay, pie, pie chart, dona, donut, doughnut, SectorMark, angle, innerRadius, ratio, proporciones, porcentaje, rebanadas, total al centro, angularInset

**Qué es:** un círculo dividido en rebanadas. Cada rebanada es **qué parte del total** es cada categoría.
Solo funciona en **iOS 17 o más nuevo** (lámina 17).

**Cómo se escribe:** en lugar de `x` y `y`, `SectorMark` usa **`angle:`** (qué tan grande es la rebanada).
Y casi siempre lleva `.foregroundStyle(by:)`, si no, todas las rebanadas salen del mismo color.

**Estático (lámina 18):**

```swift
Chart {
    SectorMark(angle: .value("Valor", 2))
        .foregroundStyle(by: .value("Categoría", "👩🏻"))
    SectorMark(angle: .value("Valor", 24))
        .foregroundStyle(by: .value("Categoría", "🧔🏻"))
}
.chartLegend(position: .bottom, alignment: .center)
.frame(height: 250)
```

**Con arreglo (lámina 20), con el struct `Consolas` de 7.3:**

```swift
Chart(listaConsolas) { consolaItem in
    SectorMark(angle: .value("Valor", consolaItem.numeroJugadores))
        .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
}
.chartLegend(position: .bottom, alignment: .center)
```

### 7.8.1 Dona (lámina 21)
"Para convertir el pastel en DONA solo agregamos una segunda propiedad a `SectorMark`": **`innerRadius: .ratio(0.5)`**
(el radio interior, el hueco del centro; 0.5 = la mitad).

```swift
Chart(listaConsolas) { consolaItem in
    SectorMark(
        angle: .value("Valor", consolaItem.numeroJugadores),
        innerRadius: .ratio(0.5)
    )
    .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
}
.chartLegend(position: .bottom, alignment: .center)
```

### 7.8.2 Rebanadas separadas y redondeadas ⚠️

```swift
Chart(listaConsolas) { consolaItem in
    SectorMark(
        angle: .value("Valor", consolaItem.numeroJugadores),
        innerRadius: .ratio(0.5),
        angularInset: 2                // ⚠️ espacio entre rebanadas
    )
    .cornerRadius(5)                   // ⚠️ esquinas redondas
    .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
}
```

### 7.8.3 Total en el centro de la dona ⚠️
No hay un modificador para eso: se pone la gráfica y el texto **uno encima del otro con un `ZStack`**:

```swift
struct DonaConTotalView: View {
    var total: Double {
        var suma = 0.0
        for consola in listaConsolas {
            suma = suma + consola.numeroJugadores
        }
        return suma
    }

    var body: some View {
        ZStack {
            Chart(listaConsolas) { consolaItem in
                SectorMark(
                    angle: .value("Valor", consolaItem.numeroJugadores),
                    innerRadius: .ratio(0.6)
                )
                .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
            }
            .chartLegend(.hidden)          // ⚠️ sin leyenda, si no, el centro se mueve

            VStack {
                Text("\(Int(total))")
                    .font(.largeTitle)
                    .bold()
                Text("jugadores")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .frame(height: 250)
    }
}
```

### 7.8.4 Porcentaje escrito en cada rebanada ⚠️
Porcentaje = **valor / total × 100**.

```swift
Chart(listaConsolas) { consolaItem in
    SectorMark(angle: .value("Valor", consolaItem.numeroJugadores))
        .foregroundStyle(by: .value("Categoría", consolaItem.nombre))
        .annotation(position: .overlay) {     // ⚠️ texto encima de la rebanada
            Text("\(consolaItem.numeroJugadores / total * 100, specifier: "%.0f")%")
                .font(.caption)
                .bold()
                .foregroundStyle(.white)
        }
}
.chartForegroundStyleScale([
    "Switch": .red,
    "Xbox": .green,
    "Compu": .blue
])
```
(Aquí `total` es la propiedad calculada del ejemplo anterior.)

**Opciones de `SectorMark`:**

| Parámetro / modificador | Qué hace | ¿Clase? |
|---|---|---|
| `angle: .value("Valor", n)` | Tamaño de la rebanada (obligatorio) | ✅ |
| `innerRadius: .ratio(0.5)` | Hueco al centro → dona | ✅ lámina 21 |
| `outerRadius: .ratio(0.9)` | Hace el pastel más chico | ⚠️ |
| `angularInset: 2` | Separación entre rebanadas | ⚠️ |
| `.cornerRadius(5)` | Esquinas redondeadas | ⚠️ |
| `.foregroundStyle(by: .value("Categoría", x))` | Color por categoría | ✅ |
| `.annotation(position: .overlay) { Text(...) }` | Texto sobre la rebanada | ⚠️ |

**Errores comunes:**
- `'SectorMark' is only available in iOS 17.0 or newer` → tu proyecto tiene un "Minimum Deployments" menor a 17. En el target → General →
  Minimum Deployments pon 17.0 o más. (Un proyecto nuevo en Xcode 26 ya viene bien.)
- Todo el pastel de un solo color → te faltó `.foregroundStyle(by:)`.
- Pusiste `innerRadius` como modificador (`.innerRadius(...)`) → va **dentro** de `SectorMark( ... )`, como segundo parámetro.

**¿Visto en clase?** ✅ Clase 15 (láminas 16–21). ⚠️ separación, centro y porcentaje no.
**En el repo:** `09_Graficas/PastelYDonaView.swift` → bloques 1 (estático), 2 (arreglo), 3 (dona), 4 (separadas), 5 (total al centro), 6 (porcentaje).

## 7.9 Línea de promedio o meta (`RuleMark`) ⚠️
🔎 RuleMark, linea de promedio, promedio, meta, limite, umbral, linea horizontal, linea de referencia, average line

**Qué es:** una línea recta horizontal (o vertical) que cruza toda la gráfica. Sirve para marcar un promedio, una meta o un límite.
No viene en las láminas, pero **la usaste en tu tarea de gráficas** ("Nivel de peligro: 40").

**Regla clave:** si mezclas `RuleMark` con datos de un arreglo, usa la forma **`Chart { ForEach(...) { } RuleMark(...) }`**,
porque `RuleMark` va una sola vez, no una por cada dato.

```swift
struct LineaConPromedioView: View {
    var promedio: Double {
        var suma = 0.0
        for item in dataLinesXY {
            suma = suma + item.y
        }
        if dataLinesXY.isEmpty {
            return 0
        }
        return suma / Double(dataLinesXY.count)
    }

    var body: some View {
        Chart {
            ForEach(dataLinesXY) { item in          // ⚠️ ForEach dentro de Chart
                LineMark(
                    x: .value("Meses", item.x),
                    y: .value("Votos", item.y)
                )
            }
            RuleMark(y: .value("Promedio", promedio))
                .foregroundStyle(.red)
                .lineStyle(StrokeStyle(lineWidth: 2, dash: [6]))
                .annotation(position: .top, alignment: .leading) {
                    Text("Promedio: \(promedio, specifier: "%.1f")")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
        }
        .frame(height: 250)
    }
}
```

- `RuleMark(y: ...)` = línea **horizontal** a esa altura.
- `RuleMark(x: ...)` = línea **vertical** en ese punto.

**Cómo explicarlo si te preguntan:** "Es otra marca de Charts, como BarMark, pero dibuja una línea de referencia que cruza toda la gráfica. La usé para que se vea si cada dato está arriba o abajo del promedio."
**En el repo:** `09_Graficas/LineasView.swift` → bloque 5; `09_Graficas/EjesYEstiloView.swift` → bloque 5.

## 7.10 Gráfica de área (`AreaMark`) ⚠️
🔎 AreaMark, area, área, grafica de area, relleno bajo la linea, area chart

**Qué es:** como una línea, pero con el espacio de abajo **relleno**. Misma regla que las líneas: solo para datos en el tiempo.

```swift
Chart(dataLinesXY) { item in
    AreaMark(
        x: .value("Meses", item.x),
        y: .value("Votos", item.y)
    )
    .foregroundStyle(.purple.opacity(0.3))   // relleno clarito
    LineMark(
        x: .value("Meses", item.x),
        y: .value("Votos", item.y)
    )
    .foregroundStyle(.purple)                // línea encima, más fuerte
}
.frame(height: 250)
```

**¿Visto en clase?** ⚠️ No. Si te preguntan: "Es una LineMark con el área de abajo rellena; muestra la misma tendencia en el tiempo".

## 7.11 La leyenda
🔎 leyenda, legend, chartLegend, quitar leyenda, ocultar leyenda, leyenda abajo, position bottom, alignment center

**Qué es:** el cuadrito con los colores y sus nombres. Sale **solo** cuando usas `.foregroundStyle(by:)`.

| Código | Qué hace | ¿Clase? |
|---|---|---|
| `.chartLegend(position: .bottom, alignment: .center)` | Leyenda abajo y centrada | ✅ láminas 18 y 20 |
| `.chartLegend(position: .top, alignment: .leading)` | Arriba a la izquierda | ⚠️ (mismo modificador, otros valores) |
| `.chartLegend(position: .trailing)` | A la derecha | ⚠️ |
| `.chartLegend(.hidden)` | Sin leyenda | ⚠️ |

Va **sobre el `Chart`**, nunca dentro del closure.

## 7.12 Ejes y escala
🔎 ejes, eje x, eje y, axis, chartXAxis, chartYAxis, ocultar ejes, escala, chartYScale, domain, de 0 a 100, titulo del eje, chartXAxisLabel, chartYAxisLabel

Nada de esto viene en las láminas (⚠️), pero es útil:

```swift
// Escala fija en Y (por ejemplo, calificaciones de 0 a 100) y títulos en los ejes
Chart(dataBarChart) { item in
    BarMark(
        x: .value("Comida", item.tipo),
        y: .value("Votos", item.votos)
    )
}
.chartYScale(domain: 0...20)      // ⚠️ el eje Y siempre va de 0 a 20
.chartXAxisLabel("Comida")        // ⚠️ título abajo
.chartYAxisLabel("Votos")         // ⚠️ título al lado

// Gráfica "mini" sin ejes
Chart(dataLinesXY) { item in
    LineMark(
        x: .value("Meses", item.x),
        y: .value("Votos", item.y)
    )
}
.chartXAxis(.hidden)              // ⚠️
.chartYAxis(.hidden)              // ⚠️
.frame(height: 60)
```

| Código | Qué hace |
|---|---|
| `.chartYScale(domain: 0...100)` | El eje Y siempre va de 0 a 100 (para que no "brinque" cuando cambian los datos) |
| `.chartXScale(domain: 1...12)` | Igual para el eje X |
| `.chartXAxisLabel("Texto")` / `.chartYAxisLabel("Texto")` | Título del eje |
| `.chartXAxis(.hidden)` / `.chartYAxis(.hidden)` | Esconde el eje |

**En el repo:** `09_Graficas/EjesYEstiloView.swift` → bloques 1 (escala), 2 (títulos), 3 (sin ejes).

## 7.13 Tamaño, padding y fondo (gráfica dentro de una tarjeta)
🔎 tamaño grafica, alto de la grafica, frame height, grafica aplastada, grafica chiquita, tarjeta grafica, fondo grafica, card chart

- **Siempre dale alto:** `.frame(height: 250)`. Dentro de un `ScrollView` o un `VStack` con mucho contenido, sin alto la gráfica puede salir aplastada.
- Los modificadores de siempre funcionan: `.padding()`, `.background(...)`, `.cornerRadius(...)`, `.shadow(...)`.

```swift
VStack(alignment: .leading, spacing: 12) {
    Text("Votos por comida")
        .font(.headline)

    Chart(dataBarChart) { item in
        BarMark(
            x: .value("Comida", item.tipo),
            y: .value("Votos", item.votos)
        )
        .foregroundStyle(.purple)
    }
    .frame(height: 200)
}
.padding()                    // espacio adentro de la tarjeta
.background(Color.white)      // fondo de la tarjeta
.cornerRadius(16)
.shadow(radius: 4)
.padding()                    // espacio afuera de la tarjeta
```

**En el repo:** `09_Graficas/EjesYEstiloView.swift` → bloque 4.

## 7.14 Gráficas que se actualizan solas (`@State`)
🔎 grafica dinamica, actualizar grafica, grafica que cambia, @State grafica, agregar dato a la grafica, refrescar grafica

**Idea clave:** si los datos de la gráfica son una variable `@State` (o vienen de un `@Binding`, o de una propiedad calculada a partir de ellos),
**la gráfica se vuelve a dibujar sola** cuando cambian. No tienes que "refrescarla".

```swift
struct VotarView: View {
    @State private var votosPizza = 10.0

    var body: some View {
        VStack {
            Chart {
                BarMark(
                    x: .value("Comida", "Pizza"),
                    y: .value("Votos", votosPizza)    // ← usa la @State
                )
                BarMark(
                    x: .value("Comida", "Tacos"),
                    y: .value("Votos", 7)
                )
            }
            .frame(height: 200)

            Slider(value: $votosPizza, in: 0 ... 30)
            Button("Votar por pizza") {
                votosPizza = votosPizza + 1          // la barra crece sola
            }
        }
        .padding()
    }
}
```

**Agregar datos a la gráfica con un formulario y validación:**

```swift
struct GastoGrafica: Identifiable {
    let id: Int
    let concepto: String
    let cantidad: Double
}

struct AgregarGastoView: View {
    @State private var gastos: Array<GastoGrafica> = []
    @State private var concepto = ""
    @State private var cantidadTexto = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            TextField("Concepto", text: $concepto)
                .textFieldStyle(.roundedBorder)
            TextField("Cantidad", text: $cantidadTexto)
                .textFieldStyle(.roundedBorder)

            Button("Agregar") {
                if concepto.isEmpty {
                    alertMessage = "Escribe el concepto"
                    showAlert.toggle()
                } else if let cantidad = Double(cantidadTexto) {
                    gastos.append(GastoGrafica(id: gastos.count + 1, concepto: concepto, cantidad: cantidad))
                    concepto = ""
                    cantidadTexto = ""
                } else {
                    alertMessage = "La cantidad debe ser un número"
                    showAlert.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK") {}
            }

            Chart(gastos) { item in
                BarMark(
                    x: .value("Concepto", item.concepto),
                    y: .value("Cantidad", item.cantidad)
                )
            }
            .frame(height: 220)
        }
        .padding()
    }
}
```

**En el repo:** `09_Graficas/GraficaInteractivaView.swift` → bloques 3 (agregar con validación) y 4 (quitar el último).

## 7.15 RECETA: graficar los datos de tu lista (contar y sumar por categoría)
🔎 graficar lista, grafica de la lista, contar por categoria, cuantos hay por categoria, sumar por categoria, total por categoria, favoritos vs no favoritos, conteo, estadisticas, grafica desde modelo

Esto es lo más probable en el examen: "haz una gráfica con cuántos elementos hay por categoría". **La gráfica no puede usar tu lista directo**,
porque tu lista tiene un renglón por antojo, y la gráfica necesita un renglón **por categoría**. Entonces:

1. Haces un **struct chiquito para la gráfica** (categoría + número).
2. Haces una **propiedad calculada** que recorre tu lista con `for`, cuenta o suma, y arma un arreglo de ese struct.
3. Le pasas ese arreglo al `Chart`.

Como es una propiedad calculada a partir de la lista, **se actualiza sola** cuando agregas un antojo o cambias un favorito.

```swift
// El modelo de tu app (ejemplo con antojos)
struct Antojo: Identifiable {
    var id: Int
    var nombre: String
    var descripcion: String
    var categoria: String
    var imagen: String
    var calificacion: Int
    var precio: Double
    var fecha: Date
    var favorito: Bool
}

// Paso 1: structs chiquitos para las gráficas.
// El id calculado con la categoría funciona porque cada categoría sale una sola vez.
struct ConteoCategoria: Identifiable {
    var id: String { return categoria }
    let categoria: String
    let cantidad: Int
}

struct SumaCategoria: Identifiable {
    var id: String { return categoria }
    let categoria: String
    let total: Double
}

struct EstadisticasAntojosView: View {

    var antojos: Array<Antojo>          // sin $: esta pantalla solo LEE la lista

    let categorias = ["Tacos", "Hamburguesas", "Postres"]   // tus categorías fijas

    // Paso 2a: CONTAR cuántos antojos hay por categoría
    var conteoPorCategoria: Array<ConteoCategoria> {
        var resultado = Array<ConteoCategoria>()
        for categoria in categorias {
            var cantidad = 0
            for antojo in antojos {
                if antojo.categoria == categoria {
                    cantidad = cantidad + 1
                }
            }
            resultado.append(ConteoCategoria(categoria: categoria, cantidad: cantidad))
        }
        return resultado
    }

    // Paso 2b: SUMAR los precios por categoría
    var gastoPorCategoria: Array<SumaCategoria> {
        var resultado = Array<SumaCategoria>()
        for categoria in categorias {
            var total = 0.0
            for antojo in antojos {
                if antojo.categoria == categoria {
                    total = total + antojo.precio
                }
            }
            resultado.append(SumaCategoria(categoria: categoria, total: total))
        }
        return resultado
    }

    // Paso 2c: favoritos vs no favoritos (para un pastel)
    var favoritosVsNo: Array<ConteoCategoria> {
        var favoritos = 0
        for antojo in antojos {
            if antojo.favorito {
                favoritos = favoritos + 1
            }
        }
        return [
            ConteoCategoria(categoria: "Favoritos", cantidad: favoritos),
            ConteoCategoria(categoria: "No favoritos", cantidad: antojos.count - favoritos)
        ]
    }

    var totalFavoritos: Int {
        var cuantos = 0
        for antojo in antojos {
            if antojo.favorito {
                cuantos = cuantos + 1
            }
        }
        return cuantos
    }

    var porcentajeFavoritos: Double {
        if antojos.isEmpty {
            return 0            // evita dividir entre 0
        }
        return Double(totalFavoritos) / Double(antojos.count) * 100
    }

    // Paso 3: las gráficas
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Antojos por categoría")
                    .font(.headline)
                Chart(conteoPorCategoria) { item in
                    BarMark(
                        x: .value("Categoría", item.categoria),
                        y: .value("Cantidad", item.cantidad)
                    )
                    .foregroundStyle(by: .value("Categoría", item.categoria))
                }
                .frame(height: 220)

                Text("Gasto por categoría")
                    .font(.headline)
                Chart(gastoPorCategoria) { item in
                    BarMark(
                        x: .value("Categoría", item.categoria),
                        y: .value("Total", item.total)
                    )
                }
                .frame(height: 220)

                Text("Favoritos")
                    .font(.headline)
                Chart(favoritosVsNo) { item in
                    SectorMark(
                        angle: .value("Cantidad", item.cantidad),
                        innerRadius: .ratio(0.5)
                    )
                    .foregroundStyle(by: .value("Tipo", item.categoria))
                }
                .chartLegend(position: .bottom, alignment: .center)
                .frame(height: 220)

                Text("Avance:")
                ProgressView(value: porcentajeFavoritos, total: 100)
                    .scaleEffect(x: 1, y: 3)
                Text("\(porcentajeFavoritos, specifier: "%.0f")% son favoritos")
            }
            .padding()
        }
    }
}

#Preview {
    EstadisticasAntojosView(antojos: cargarAntojos())     // cargarAntojos() es tu función de ModelData.swift
}
```

**Cómo se conecta con el TabView:** la lista vive en la vista del TabView como `@State`, y a esta pestaña se le pasa **sin `$`**
porque solo la lee:

```swift
EstadisticasAntojosView(antojos: antojos)
    .tabItem {
        Label("Estadísticas", systemImage: "chart.bar")
    }
```

**Por qué barras y pastel aquí (para la defensa):** las categorías se comparan → barras (Clase 15). Favoritos vs no favoritos son
partes de un total → pastel/dona. Nunca líneas, porque las categorías no son tiempo.

**Errores comunes:**
- `closure containing control flow statement cannot be used with result builder 'ChartContentBuilder'` → pusiste un `for` **dentro** del `Chart { }`.
  Dentro de `Chart` y del `body` no van `for` normales: haz el conteo en una **propiedad calculada** (como arriba) o usa `ForEach`.
- La gráfica no cambia cuando agregas un antojo → le pasaste una copia fija (ej. `cargarAntojos()` directo) en lugar de la lista del `@State`.
- Una categoría no sale → no está en tu arreglo `categorias` o está escrita distinto ("Taco" vs "Tacos").

**En el repo:** `09_Graficas/GraficaDesdeListaView.swift` → bloques 1–4; `00_AppCompleta/Views/EstadisticasMascotasView.swift` (`conteoPorEspecie()`).

## 7.16 RECETA: cambiar el tipo de gráfica con un Picker
🔎 cambiar tipo de grafica, picker grafica, elegir grafica, segmented grafica, barras o pastel, switch grafica

Un `Picker` `.segmented` guarda un número y con `if / else if` muestras una u otra gráfica con **los mismos datos**:

```swift
struct TipoGraficaView: View {
    @State private var tipoGrafica = 1

    var body: some View {
        VStack {
            Picker(selection: $tipoGrafica, label: Text("Tipo de gráfica")) {
                Text("Barras").tag(1)
                Text("Pastel").tag(2)
                Text("Dona").tag(3)
            }
            .pickerStyle(.segmented)

            if tipoGrafica == 1 {
                Chart(listaConsolas) { item in
                    BarMark(
                        x: .value("Consola", item.nombre),
                        y: .value("Jugadores", item.numeroJugadores)
                    )
                    .foregroundStyle(by: .value("Consola", item.nombre))
                }
                .frame(height: 250)
            } else if tipoGrafica == 2 {
                Chart(listaConsolas) { item in
                    SectorMark(angle: .value("Jugadores", item.numeroJugadores))
                        .foregroundStyle(by: .value("Consola", item.nombre))
                }
                .frame(height: 250)
            } else {
                Chart(listaConsolas) { item in
                    SectorMark(
                        angle: .value("Jugadores", item.numeroJugadores),
                        innerRadius: .ratio(0.5)
                    )
                    .foregroundStyle(by: .value("Consola", item.nombre))
                }
                .frame(height: 250)
            }
        }
        .padding()
    }
}
```

No pongas "Línea" como opción si los datos son categorías (regla de la lámina 10).
**En el repo:** `09_Graficas/GraficaInteractivaView.swift` → bloques 1 y 2.

## 7.17 RECETA: dashboard con 4 gráficas (cuadrícula 2x2)
🔎 dashboard, tablero, 4 graficas, cuadricula de graficas, 2x2, varias graficas en una pantalla, grid charts

Es el mismo truco de dividir la pantalla en partes iguales: un `VStack` con 2 `HStack`, y cada tarjeta con `.frame(maxWidth: .infinity)`.

```swift
struct DashboardDocView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    VStack(alignment: .leading) {
                        Text("Votos")
                            .font(.headline)
                        Chart(dataBarChart) { item in
                            BarMark(
                                x: .value("Comida", item.tipo),
                                y: .value("Votos", item.votos)
                            )
                        }
                    }
                    .frame(maxWidth: .infinity)     // mitad del ancho
                    .frame(height: 180)
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)

                    VStack(alignment: .leading) {
                        Text("Tendencia")
                            .font(.headline)
                        Chart(dataLinesXY) { item in
                            LineMark(
                                x: .value("Meses", item.x),
                                y: .value("Votos", item.y)
                            )
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)
                }

                HStack(spacing: 12) {
                    VStack(alignment: .leading) {
                        Text("Consolas")
                            .font(.headline)
                        Chart(listaConsolas) { item in
                            SectorMark(
                                angle: .value("Valor", item.numeroJugadores),
                                innerRadius: .ratio(0.5)
                            )
                            .foregroundStyle(by: .value("Consola", item.nombre))
                        }
                        .chartLegend(.hidden)       // en tarjetas chicas la leyenda estorba
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)

                    VStack(alignment: .leading) {
                        Text("Relación")
                            .font(.headline)
                        Chart(dataLinesXY) { item in
                            PointMark(
                                x: .value("Meses", item.x),
                                y: .value("Votos", item.y)
                            )
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}
```

**En el repo:** `09_Graficas/DashboardGraficasView.swift` → bloques 1–3.

## 7.18 Barra de avance (`ProgressView`) y porcentaje en texto
🔎 ProgressView, barra de progreso, progress bar, barra de avance, porcentaje, avance, cargando, loading, spinner, scaleEffect

**Qué es:** una barra que se llena según un valor. La profe la dio como "algo extra" en la lámina 23. **No necesita `import Charts`.**

**Forma de clase (lámina 23):**

```swift
VStack(alignment: .leading) {
    Text("Avance:")
    ProgressView(value: 75, total: 100)
        .scaleEffect(x: 1, y: 3)        // y: 3 la hace 3 veces más gruesa; x: 1 deja el mismo ancho
}
```

**Con un valor que cambia y el porcentaje en texto:**

```swift
struct AvanceView: View {
    @State private var avance = 40.0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Avance: \(Int(avance))%")
            ProgressView(value: avance, total: 100)
                .tint(.green)                  // color de la barra
                .scaleEffect(x: 1, y: 3)
                .padding(.vertical)
            Slider(value: $avance, in: 0 ... 100)
        }
        .padding()
    }
}
```

| Código | Qué hace | ¿Clase? |
|---|---|---|
| `ProgressView(value: 75, total: 100)` | Barra al 75% | ✅ lámina 23 |
| `.scaleEffect(x: 1, y: 3)` | Más gruesa | ✅ lámina 23 |
| `.tint(.green)` | Color de la barra | ✅ (`.tint` se vio en Clase 4 con Slider) |
| `ProgressView(value: 0.75)` | Sin `total`, el total es 1 (0.75 = 75%) | ⚠️ |
| `ProgressView()` / `ProgressView("Cargando…")` | Ruedita que gira (cargando) | ⚠️ |

**Calcular el porcentaje:** `parte / total * 100`, convirtiendo a `Double` si son `Int`, y **revisando que el total no sea 0**:

```swift
// dentro de la vista:
// var porcentaje: Double {
//     if antojos.isEmpty { return 0 }
//     return Double(totalFavoritos) / Double(antojos.count) * 100
// }
// Text("\(porcentaje, specifier: "%.0f")%")   → "40%"
```

**Errores comunes:**
- La barra siempre llena o vacía → el `value` es mayor que `total`, o dividiste dos `Int` (`3 / 4` da `0` en enteros). Convierte con `Double(...)`.
- La barra sale delgadita → te faltó `.scaleEffect(x: 1, y: 3)`.

**En el repo:** `09_Graficas/ProgressViewEjemplosView.swift` → bloques 1 (idéntica a la lámina), 2 (color), 3 (porcentaje que cambia), 4 (varias metas), 5 (circular).

## 7.19 Errores comunes con gráficas (resumen)
🔎 error grafica, grafica no sale, grafica vacia, cannot find chart, chart error, no aparece la grafica, colores no coinciden, etiquetas encimadas

| Síntoma o mensaje de Xcode | Por qué pasa | Cómo se arregla |
|---|---|---|
| `cannot find 'Chart' in scope` (o `BarMark`, `SectorMark`) | Falta la librería | Agrega `import Charts` arriba del archivo |
| `initializer 'init(_:content:)' requires that 'X' conform to 'Identifiable'` | El struct de los datos no es `Identifiable` | `struct X: Identifiable` + `let id: Int` (o `let id = UUID()`) |
| `closure containing control flow statement cannot be used with result builder 'ChartContentBuilder'` | Un `for` dentro de `Chart { }` | Calcula antes en una propiedad calculada, o usa `ForEach` |
| `'SectorMark' is only available in iOS 17.0 or newer` | El proyecto apunta a iOS viejo | Target → General → Minimum Deployments = 17.0 o más |
| La gráfica sale vacía | El arreglo está vacío, o los valores son 0 | Revisa tus datos (pon un `Text("\(arreglo.count)")` para ver cuántos hay) |
| La gráfica sale aplastada o chiquita | No tiene alto | `.frame(height: 250)` |
| Los colores de `chartForegroundStyleScale` no se aplican | Las llaves no coinciden con los datos, o falta `.foregroundStyle(by:)` | Mismo texto exacto + usa B y C juntas |
| Todo el pastel de un color | Falta `.foregroundStyle(by:)` | Agrégalo a `SectorMark` |
| Las etiquetas de abajo se enciman | Nombres largos o muchas barras | Barras horizontales (7.4.1), nombres más cortos o menos categorías |
| La gráfica no se actualiza | Le pasaste datos fijos, no la `@State`/lista | Usa la variable de estado o una propiedad calculada a partir de ella |
| Hiciste una línea con categorías | Error de concepto (lámina 10) | Cámbiala a barras o pastel |

## 7.20 Hoja rápida de Charts (todo en una tabla)
🔎 resumen charts, cheat sheet graficas, acordeon graficas, chuleta charts

| Quiero… | Código |
|---|---|
| Importar | `import Charts` |
| Gráfica con datos fijos | `Chart { BarMark(...) BarMark(...) }` |
| Gráfica con arreglo | `Chart(arreglo) { item in BarMark(...) }` |
| Barra | `BarMark(x: .value("Cat", item.nombre), y: .value("Num", item.valor))` |
| Línea (solo tiempo) | `LineMark(x: .value("Mes", item.mes), y: .value("Valor", item.valor))` |
| Puntos | `PointMark(x: ..., y: ...)` o con `$0.campo` |
| Pastel | `SectorMark(angle: .value("Valor", item.valor))` + `.foregroundStyle(by:)` |
| Dona | `SectorMark(angle: ..., innerRadius: .ratio(0.5))` |
| Todas de un color (A) | `.foregroundStyle(.purple)` en la marca |
| Color por categoría (B) | `.foregroundStyle(by: .value("Cat", item.nombre))` en la marca |
| Mis colores (C) | B + `.chartForegroundStyleScale(["Tacos": .red, ...])` en el `Chart` |
| Leyenda abajo | `.chartLegend(position: .bottom, alignment: .center)` |
| Sin leyenda ⚠️ | `.chartLegend(.hidden)` |
| Alto | `.frame(height: 250)` |
| Línea de promedio ⚠️ | `RuleMark(y: .value("Promedio", promedio))` |
| Valor encima ⚠️ | `.annotation(position: .top) { Text(...) }` |
| Escala fija ⚠️ | `.chartYScale(domain: 0...100)` |
| Barra de avance | `ProgressView(value: 75, total: 100).scaleEffect(x: 1, y: 3)` |

---

# 8. Fotos y cámara

Todo sale de la **Clase 17 (Usando las Fotos y la Cámara del iPhone)**. Hay dos caminos y cada uno se hace distinto (lámina 2):

| Quiero… | Qué se usa | De dónde viene |
|---|---|---|
| Elegir una foto que **ya existe** en la galería | **`PhotosPicker`** | Componente nativo de SwiftUI (iOS 16+) |
| **Tomar** una foto con la cámara | **`CamaraPicker`** (archivo de la profe) | Envuelve `UIImagePickerController` de UIKit |
| Una cámara personalizada con más control | AVFoundation | Solo se mencionó, no se vio. No la uses |

## 8.1 `Image` vs `UIImage` (lo primero que hay que entender)
🔎 UIImage, Image, uiImage, Image(uiImage:), diferencia Image UIImage, foto en memoria, mostrar foto, imagen de la galeria

- **`Image("foto1")`** es la vista de SwiftUI que muestra una imagen **de tus Assets** (por nombre).
- **`UIImage`** es una foto **guardada en memoria** (un dato, no una vista). Es lo que te regresa la galería o la cámara.
- Para **mostrar** un `UIImage` en pantalla lo metes en un `Image` así: **`Image(uiImage: miFoto)`**.

| Código | Qué es |
|---|---|
| `Image("foto1")` | Imagen de Assets por su nombre |
| `Image(systemName: "camera")` | Ícono de SF Symbols |
| `Image(uiImage: foto)` | Muestra un `UIImage` (foto de galería/cámara). `foto` NO puede ser opcional |
| `@State private var foto: UIImage? = nil` | Variable para guardar la foto; `?` porque al inicio no hay foto |

**Error típico:** `value of optional type 'UIImage?' must be unwrapped to a value of type 'UIImage'` → escribiste `Image(uiImage: foto)`
con `foto` opcional. Primero desempaca con `if let` (ver 8.2, paso F).

## 8.2 PhotosPicker paso a paso (A–F, forma EXACTA de la clase)
🔎 PhotosPicker, PhotoPicker, galeria, galería, libreria de fotos, elegir foto, seleccionar foto, photo library, carrete, PhotosPickerItem, loadTransferable, import PhotosUI

**Qué es:** un botón que abre la galería del iPhone. El usuario puede **elegir una foto o cancelar**. Tú recibes lo que eligió y lo conviertes en `UIImage` para mostrarlo.

**Los 6 pasos de la clase (láminas 5–9):**

| Paso | Qué haces | Código |
|---|---|---|
| **A** | Importar la librería | `import PhotosUI` |
| **B** | Variable para lo que el usuario **eligió** (todavía no es una imagen) | `@State private var selectedItem: PhotosPickerItem? = nil` |
| **C** | El componente `PhotosPicker`, ligado con `$` | `PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) { ... }` |
| **D** | Variable para la imagen **ya convertida** | `@State private var selectedImage: UIImage? = nil` |
| **E** | Cuando cambie la selección, cargarla y convertirla | `.onChange(of: selectedItem) { oldItem, newItem in Task { ... } }` |
| **F** | Mostrarla, revisando primero que no sea nula | `if let selectedImageBien = selectedImage { Image(uiImage: selectedImageBien) ... }` |

**Ejemplo completo (copiable):**

```swift
import SwiftUI
import PhotosUI                                             // A

struct SeleccionarFotoDocView: View {
    @State private var selectedItem: PhotosPickerItem? = nil    // B: lo que eligió
    @State private var selectedImage: UIImage? = nil            // D: la imagen convertida

    var body: some View {
        VStack(spacing: 20) {
            // F. Mostrar (solo si ya hay imagen)
            if let selectedImageBien = selectedImage {
                Image(uiImage: selectedImageBien)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
            } else {
                Text("Seleccionar imagen")
                    .foregroundStyle(.gray)
            }

            // C. El componente
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,               // filtra: solo fotos de la librería
                photoLibrary: .shared()) {
                Label("Seleccionar Foto", systemImage: "photo.on.rectangle")
                    .padding(12)
                    .background(.purple)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
            }
            // E. Escuchar el cambio y convertir
            .onChange(of: selectedItem) { oldItem, newItem in
                Task {      // ejecuta código asíncrono para cargar la imagen
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        // si pudo CARGAR y CONVERTIR, la asigna a la variable @State
                        selectedImage = uiImage
                    }
                }
            }
        }
        .padding()
    }
}
```

**Explicación del paso E, palabra por palabra (te lo pueden preguntar):**

| Pieza | Qué significa |
|---|---|
| `.onChange(of: selectedItem) { oldItem, newItem in` | Cada vez que el usuario elige otra foto, se ejecuta esto. `newItem` es lo nuevo que eligió |
| `Task { }` | Cargar la foto tarda un poco; `Task` deja hacerlo "en segundo plano" sin congelar la pantalla |
| `await` | "Espera a que termine de cargar" |
| `try?` | Si la carga falla, en lugar de tronar da `nil` |
| `newItem?.loadTransferable(type: Data.self)` | Saca los datos (bytes) de la foto. El `?` es porque `newItem` es opcional |
| `UIImage(data: data)` | Convierte esos bytes en una foto (`UIImage`); también puede dar `nil` |
| `if let …, let …` | Solo si las dos cosas salieron bien, guarda la foto |
| `selectedImage = uiImage` | Al cambiar la `@State`, la pantalla se redibuja y aparece la foto |

**Opciones de `PhotosPicker`:**

| Parámetro | Qué hace | ¿Clase? |
|---|---|---|
| `selection: $selectedItem` | Dónde guarda lo que eligió (con `$`) | ✅ |
| `matching: .images` | Solo fotos (sin videos) | ✅ |
| `matching: .videos` / `.livePhotos` | Solo videos / live photos | ⚠️ |
| `photoLibrary: .shared()` | Usa la galería del iPhone | ✅ |
| `maxSelectionCount: 5` | Varias fotos (ver 8.4) | ⚠️ |

**Errores comunes:**
- `cannot find 'PhotosPicker' in scope` (o `PhotosPickerItem`) → falta `import PhotosUI`.
- `cannot pass function of type '... async -> Void' to parameter expecting synchronous function type` → usaste `await` sin meterlo en `Task { }`.
- `call can throw but is not marked with 'try'` → te faltó el `try?`.
- La foto no aparece → olvidaste el `.onChange` (paso E), o estás mostrando `selectedItem` en lugar de `selectedImage`.
- En el **simulador** la galería trae unas fotos de ejemplo de Apple. Si quieres las tuyas, arrástralas al simulador.

**¿Visto en clase?** ✅ Clase 17 (láminas 4–9). Ojo: las láminas dicen "PhotoPicker" en los títulos, pero el código se llama `PhotosPicker`.
**En el repo:** `10_FotosYCamara/SeleccionarFotoView.swift` (bloques C, E, F con los mismos nombres de la lámina).

## 8.3 Darle estilo al botón del PhotosPicker
🔎 boton galeria, estilo photospicker, boton bonito foto, photospicker borderedProminent, main actor-isolated, nonisolated context, warning photospicker

Lo que pones **dentro de las llaves** del `PhotosPicker` es el **aspecto del botón**. La lámina usa `Label` + `.padding(12)` + `.background(.purple)` + `.foregroundStyle(.white)` + `.cornerRadius(12)`.

**Otra forma (estilo de botón de sistema, mismo ancho que otros botones):**

```swift
struct BotonGaleriaView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    let colorPrimario = Color(red: 0/255, green: 128/255, blue: 128/255)

    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
            Label("Galería", systemImage: "photo.on.rectangle")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)    // estilos AFUERA de las llaves
        .tint(colorPrimario)
        .controlSize(.large)
    }
}
```

**Warning de Swift 6 que te puede salir:** si usas un color de tu **paleta global** (un `let paletaPrimario = ...` declarado en `Utils/`, fuera de un struct)
**dentro** de las llaves del `PhotosPicker`, Xcode avisa:
`main actor-isolated let 'paletaPrimario' can not be referenced from a nonisolated context`.
Es solo un **warning** (la app corre), pero se ve mal. Soluciones:
1. Pon los estilos **afuera** de las llaves: `.buttonStyle(.borderedProminent)` + `.tint(paletaPrimario)` (como arriba). ✅ recomendado.
2. O copia el color a un `let` **dentro del struct** de la vista (`let colorPrimario = ...`) y usa ese. Con `let` dentro del struct no sale el warning.
3. O usa un color del sistema (`.purple`) dentro de las llaves, como la lámina.

## 8.4 Varias fotos a la vez ⚠️
🔎 varias fotos, multiples fotos, maxSelectionCount, seleccion multiple, galeria de fotos, array de fotos, [PhotosPickerItem], [UIImage]

Cambia la variable a **arreglo** (`[PhotosPickerItem]`) y agrega `maxSelectionCount:`. Convierte cada una con un `for`:

```swift
struct VariasFotosDocView: View {
    @State private var itemsSeleccionados: [PhotosPickerItem] = []
    @State private var imagenes: [UIImage] = []

    var body: some View {
        VStack {
            PhotosPicker(
                selection: $itemsSeleccionados,
                maxSelectionCount: 5,                 // ⚠️ máximo 5 fotos
                matching: .images,
                photoLibrary: .shared()) {
                Label("Elegir hasta 5 fotos", systemImage: "photo.stack")
            }
            .onChange(of: itemsSeleccionados) { oldValue, newValue in
                Task {
                    var nuevas: [UIImage] = []
                    for item in newValue {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            nuevas.append(uiImage)
                        }
                    }
                    imagenes = nuevas
                }
            }

            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<imagenes.count, id: \.self) { indice in     // ⚠️ ForEach por índice
                        Image(uiImage: imagenes[indice])
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
    }
}
```

**Cómo explicarlo si te preguntan:** "Es el mismo PhotosPicker de clase, pero la selección es un arreglo y `maxSelectionCount` limita cuántas.
Convierto cada una con el mismo `loadTransferable` del paso E dentro de un `for`."
**En el repo:** `10_FotosYCamara/VariasFotosView.swift` → bloques 1–4.

## 8.5 Mostrar la foto bonita (circular, con borde, que llene el cuadro)
🔎 foto circular, foto redonda, circle, clipShape, borde foto, foto de perfil, avatar, aspectRatio fill, foto cuadrada, recortar foto

```swift
struct FotoCircularDocView: View {
    var foto: UIImage

    var body: some View {
        Image(uiImage: foto)
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fill)     // llena el cuadro (puede recortar los lados)
            .frame(width: 150, height: 150)
            .clipShape(.circle)                  // recorta en círculo
            .overlay {
                Circle().stroke(.purple, lineWidth: 4)   // borde
            }
            .shadow(radius: 5)
    }
}
```

- **`.fit`** (forma de clase) muestra la foto **completa** sin deformarla; si no es cuadrada, quedan espacios.
- **`.fill`** ⚠️ **llena** el cuadro y recorta lo que sobra. Para fotos de la galería (casi nunca son cuadradas) dentro de un círculo, `.fill` se ve mejor.
- El orden importa: primero `.resizable`, luego `.aspectRatio`, luego `.frame`, y al final `.clipShape`.

**¿Visto en clase?** ✅ `.clipShape(.circle)`, `.overlay { Circle().stroke(...) }` y `.shadow` (Clase 5A). ⚠️ `.fill`.

## 8.6 CamaraPicker: qué es y cómo se agrega
🔎 CamaraPicker, camara, cámara, camera, UIImagePickerController, UIViewControllerRepresentable, Coordinator, tomar foto, camera picker, archivo de canvas

**Qué es:** SwiftUI **no tiene** un componente de cámara. La profe nos dio un archivo, **`CamaraPicker.swift`** (en Canvas), que envuelve
la cámara de UIKit (`UIImagePickerController`) para poder usarla en SwiftUI como si fuera una vista más.

**Cómo agregarlo (lámina 12):**
1. Bájalo de Canvas (o cópialo de `10_FotosYCamara/CamaraPicker.swift` del repo).
2. Arrástralo al navegador de tu proyecto en Xcode.
3. En la ventana que sale, marca **"Copy items if needed"** (para que se haga una **copia**) y que esté palomeado tu **target**.
4. **No lo modifiques.** Se usa tal cual.

**Qué tiene adentro (explicado simple, por si te preguntan):**

```swift
// ❌ esto NO lo escribes tú: es el archivo de la profe, solo para entenderlo
struct CamaraPicker: UIViewControllerRepresentable {
    private let sourceType: UIImagePickerController.SourceType = .camera   // usa la cámara (no la galería)
    @Binding var selectedImageFromCamera: UIImage?    // aquí REGRESA la foto a tu vista

    func makeUIViewController(context: Context) -> UIImagePickerController { ... }   // crea la pantalla de cámara de UIKit
    func updateUIViewController(...) {}                                               // no se usa (vacío)
    func makeCoordinator() -> Coordinator { ... }                                     // crea el "ayudante"

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        // cuando el usuario toma la foto:
        //   1. la guarda en parent.selectedImageFromCamera (tu @Binding)
        //   2. cierra la cámara con picker.dismiss(animated: true)
    }
}
```

| Pieza | En palabras simples |
|---|---|
| `UIViewControllerRepresentable` | Un protocolo de SwiftUI que permite **usar una pantalla de UIKit** como vista de SwiftUI (lámina 11) |
| `UIImagePickerController` | La pantalla de cámara "vieja" de UIKit, que sí existe |
| `@Binding var selectedImageFromCamera` | El canal de **ida y vuelta** (Clase 6B): tú le pasas tu variable con `$` y ella te devuelve la foto |
| `Coordinator` | Un "ayudante" que escucha cuando el usuario toma la foto, la entrega y cierra la cámara |
| `.originalImage` | La foto tal como se tomó |

**¿Visto en clase?** ✅ Clase 17 (láminas 10–12, 18–19). La profe dice que el componente queda **encapsulado**: tú solo lo usas.
**En el repo:** `10_FotosYCamara/CamaraPicker.swift` (idéntico al de Canvas, con encabezado de documentación).

## 8.7 Permiso de cámara (si no lo pones, la app TRUENA)
🔎 permiso camara, permiso cámara, Privacy - Camera Usage Description, NSCameraUsageDescription, info plist, crash camara, la app se cierra al abrir la camara, usage description

Desde **iOS 10**, para usar la cámara la app debe **explicar para qué la quiere**. Ese texto es el que ve el usuario en la ventanita
"¿Permitir acceso a la cámara?". Si falta, la app **se cierra** en cuanto abres la cámara.

**Pasos (láminas 15–17):**
1. En el navegador de la izquierda, haz clic en el **proyecto** (el ícono azul de hasta arriba).
2. Selecciona tu **target** y ve a la pestaña **Info**.
3. En **"Custom iOS Target Properties"**, clic derecho sobre la **última fila** → **Add Row**.
4. Elige **"Privacy - Camera Usage Description"**.
5. En **Value** escribe el mensaje, por ejemplo: `La app usa la cámara para tomar tu foto de perfil.`

**El error si se te olvida (en la consola, y la app se cierra):**
`This app has crashed because it attempted to access privacy-sensitive data without a usage description. The app's Info.plist must contain an NSCameraUsageDescription key...`
→ `NSCameraUsageDescription` es el nombre "técnico" de "Privacy - Camera Usage Description".

**Para la galería (`PhotosPicker`) NO necesitas permiso:** el usuario elige la foto en una ventana del sistema.

## 8.8 Abrir la cámara con `.sheet` (forma de clase)
🔎 abrir camara, boton camara, sheet camara, showCamara, Abrir Cámara, camera.fill, presentar camara

**Pasos de la lámina 18–19:**
1. Tener `CamaraPicker.swift` en el proyecto.
2. Una variable para la foto (el `@Binding` del CamaraPicker): `@State private var selectedImage: UIImage?`
3. Una variable `Bool` para abrir la cámara: `@State private var showCamara = false`
4. Un botón que la prende y un `.sheet` que muestra el `CamaraPicker`.

```swift
struct TomarFotoDocView: View {
    @State private var selectedImage: UIImage?
    @State private var showCamara = false

    var body: some View {
        VStack(spacing: 20) {
            if let foto = selectedImage {          // la lámina usa selectedImage!; mejor if let
                Image(uiImage: foto)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
            } else {
                Text("Todavía no tomas una foto")
                    .foregroundStyle(.gray)
            }

            Button("Abrir Cámara", systemImage: "camera.fill") {
                showCamara = true                  // así lo hace la lámina (no .toggle())
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showCamara) {
                CamaraPicker(selectedImageFromCamera: $selectedImage)   // con $: ida y vuelta
            }
        }
    }
}
```

- `.sheet(isPresented: $showCamara)` muestra una ventana que sube desde abajo cuando `showCamara` es `true`.
- `selectedImageFromCamera: $selectedImage` → la cámara **escribe** la foto en tu variable. Cuando la escribe, tu pantalla se redibuja y la muestra.
- La lámina muestra la foto con `Image(uiImage: selectedImage!)`. Funciona si ya hay foto, pero **truena** si es `nil`. Usa `if let` (Clase 2).

**¿Visto en clase?** ✅ Clase 17 (láminas 18–19).
**En el repo:** `10_FotosYCamara/TomarFotoView.swift` → bloques 1 y 2.

## 8.9 El simulador NO tiene cámara
🔎 simulador camara, simulator camera, no hay camara, source type not available, crash simulador camara, isSourceTypeAvailable, probar en iphone fisico

- En el simulador, al abrir `CamaraPicker` la app **truena** (no hay cámara física). La profe dice: **la prueba final se hace en un iPhone físico** (tutorial en Canvas).
- Para que no truene en el simulador, revisa antes si hay cámara ⚠️:

```swift
struct CamaraSeguraView: View {
    @State private var selectedImage: UIImage?
    @State private var showCamara = false
    @State private var showAlert = false

    var body: some View {
        Button("Abrir Cámara", systemImage: "camera.fill") {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {   // ⚠️ ¿hay cámara?
                showCamara = true
            } else {
                showAlert.toggle()
            }
        }
        .buttonStyle(.borderedProminent)
        .sheet(isPresented: $showCamara) {
            CamaraPicker(selectedImageFromCamera: $selectedImage)
        }
        .alert("Este dispositivo no tiene cámara. Prueba en un iPhone físico.", isPresented: $showAlert) {
            Button("OK") {}
        }
    }
}
```

**Cómo explicarlo si te preguntan:** "`isSourceTypeAvailable(.camera)` pregunta al sistema si este dispositivo tiene cámara. Si no (simulador), muestro una alerta en lugar de abrir algo que no existe. Es manejo de errores para el usuario."
**En el examen:** prueba la parte de fotos con la **galería** en el simulador; el código de la cámara queda listo igual.

## 8.10 RECETA: foto de perfil con galería y cámara
🔎 foto de perfil, perfil foto, avatar, galeria y camara, dos botones foto, cambiar foto, quitar foto, foto circular perfil

Las dos fuentes llenan **la misma** variable `fotoPerfil`. Si no hay foto, se muestra un ícono:

```swift
import SwiftUI
import PhotosUI

struct FotoPerfilDocView: View {
    @State private var fotoPerfil: UIImage? = nil
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var showCamara = false
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 20) {
            // Foto o ícono
            if let foto = fotoPerfil {
                Image(uiImage: foto)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(.circle)
                    .overlay {
                        Circle().stroke(.purple, lineWidth: 4)
                    }
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 150))
                    .foregroundStyle(.gray)
            }

            // Botones del mismo ancho
            HStack(spacing: 12) {
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    Label("Galería", systemImage: "photo.on.rectangle")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .onChange(of: selectedItem) { oldItem, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            fotoPerfil = uiImage
                        }
                    }
                }

                Button {
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        showCamara = true
                    } else {
                        showAlert.toggle()
                    }
                } label: {
                    Label("Cámara", systemImage: "camera.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .controlSize(.large)

            // Quitar foto (solo si hay)
            if fotoPerfil != nil {
                Button("Quitar foto", role: .destructive) {     // ⚠️ role
                    fotoPerfil = nil          // nil = sin foto → vuelve el ícono
                    selectedItem = nil
                }
            }
        }
        .padding()
        .sheet(isPresented: $showCamara) {
            CamaraPicker(selectedImageFromCamera: $fotoPerfil)   // la cámara llena la MISMA variable
        }
        .alert("Este dispositivo no tiene cámara", isPresented: $showAlert) {
            Button("OK") {}
        }
    }
}
```

**Por qué funciona:** las dos formas escriben en `fotoPerfil`. La galería lo hace en el paso E; la cámara, por el `@Binding`.
Como `fotoPerfil` es `@State`, al cambiar se redibuja y aparece la foto.

**Ojo:** esta foto se pierde al cerrar la app (es `@State`). Guardar fotos para siempre no se vio en clase.
**En el repo:** `10_FotosYCamara/FotoPerfilView.swift` → bloques 1–3; `00_AppCompleta/Views/PerfilDuenoView.swift`.

## 8.11 RECETA: guardar la foto dentro de un modelo (formulario con foto) ⚠️
🔎 foto en el modelo, UIImage en struct, guardar foto en la lista, registro con foto, formulario con foto, agregar con foto, foto opcional

Si quieres que cada elemento de tu lista tenga **su propia foto elegida por el usuario**, agrega al struct un campo **`UIImage?`**
(opcional, porque puede no tener foto):

```swift
import SwiftUI
import PhotosUI

struct LugarConFoto: Identifiable {
    var id: Int
    var nombre: String
    var imagen: String        // nombre del asset (para los datos fijos de ModelData)
    var foto: UIImage?        // ⚠️ foto elegida por el usuario; nil si no eligió
}

struct AgregarLugarView: View {
    @Binding var lugares: Array<LugarConFoto>        // con $: esta pantalla MODIFICA la lista
    @Environment(\.dismiss) private var dismiss

    @State private var nombre = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var fotoElegida: UIImage? = nil
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 16) {
            TextField("Nombre", text: $nombre)
                .textFieldStyle(.roundedBorder)

            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                Label("Elegir foto (opcional)", systemImage: "photo")
            }
            .onChange(of: selectedItem) { oldItem, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        fotoElegida = uiImage
                    }
                }
            }

            Button("Guardar") {
                if nombre.isEmpty {
                    showAlert.toggle()
                } else {
                    let nuevo = LugarConFoto(id: lugares.count + 1, nombre: nombre, imagen: "", foto: fotoElegida)
                    lugares.append(nuevo)
                    dismiss()
                }
            }
            .buttonStyle(.borderedProminent)
            .alert("Escribe el nombre", isPresented: $showAlert) {
                Button("OK") {}
            }
        }
        .padding()
    }
}

#Preview {
    AgregarLugarView(lugares: .constant([]))
}
```

- `UIImage` vive en UIKit. Si el archivo del modelo solo tiene `import Foundation` y te sale `cannot find type 'UIImage' in scope`, cámbialo a `import SwiftUI` (o `import UIKit`).
- En `ModelData.swift`, los datos fijos van con `foto: nil` y su `imagen: "foto1"`.

**Cómo explicarlo si te preguntan:** "La clase guardaba la foto en una `@State UIImage?` de la vista. Yo la puse dentro del struct para que cada
registro tenga su propia foto. Es opcional porque no todos tienen foto. Se pierde al cerrar la app porque la lista es `@State`."
**En el repo:** `10_FotosYCamara/RegistroConFoto.swift` + `NuevoRegistroConFotoView.swift`; `00_AppCompleta/Views/AgregarMascotaView.swift` → bloque 1.

## 8.12 RECETA: mostrar la foto del modelo, o la del asset, o un ícono
🔎 mostrar foto o asset, foto o icono, imagen por defecto, placeholder foto, if let foto, else if imagen

Tres casos en orden: ¿eligió foto? → ¿tiene imagen de Assets? → si no, un ícono:

```swift
struct FotoLugarView: View {
    var lugar: LugarConFoto

    var body: some View {
        if let foto = lugar.foto {                       // 1. foto del usuario
            Image(uiImage: foto)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(8)
        } else if !lugar.imagen.isEmpty {                // 2. imagen de Assets
            Image(lugar.imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(8)
        } else {                                          // 3. ícono por defecto
            Image(systemName: "photo")
                .font(.system(size: 40))
                .foregroundStyle(.gray)
                .frame(width: 60, height: 60)
        }
    }
}
```

Úsalo como componente en el renglón de la lista y en el detalle: `FotoLugarView(lugar: lugarItem)`.
**En el repo:** `00_AppCompleta/Components/FotoMascotaView.swift`.

## 8.13 Quitar o cambiar la foto
🔎 quitar foto, borrar foto, eliminar foto, foto nil, reset foto, cambiar foto

- **Quitar:** asigna `nil` → `fotoPerfil = nil`. Como la vista usa `if let`, vuelve a mostrar el ícono.
- Si usaste galería, pon también `selectedItem = nil`. Si no, al elegir **la misma foto** otra vez, `.onChange` no se dispara (porque "no cambió").
- **Cambiar:** solo vuelve a elegir; la nueva foto reemplaza a la anterior.

## 8.14 Errores comunes con fotos y cámara (resumen)
🔎 error foto, error camara, la foto no aparece, crash camara, photospicker error, cannot find CamaraPicker

| Síntoma o mensaje de Xcode | Por qué | Arreglo |
|---|---|---|
| `cannot find 'PhotosPicker' in scope` | Falta el import | `import PhotosUI` |
| `cannot find 'CamaraPicker' in scope` | No agregaste el archivo de la profe | Arrastra `CamaraPicker.swift` con "Copy items if needed" y el target palomeado |
| `value of optional type 'UIImage?' must be unwrapped…` | `Image(uiImage:)` con opcional | `if let foto = selectedImage { Image(uiImage: foto) }` |
| `cannot pass function of type '... async ...' to parameter expecting synchronous function type` | `await` fuera de `Task` | Envuelve en `Task { ... }` |
| `call can throw but is not marked with 'try'` | Falta `try?` | `try? await newItem?.loadTransferable(...)` |
| La app se cierra al abrir la cámara (dispositivo real) | Falta el permiso | Info → Add Row → Privacy - Camera Usage Description |
| La app se cierra al abrir la cámara (simulador) | El simulador no tiene cámara | `isSourceTypeAvailable(.camera)` o prueba en iPhone físico |
| La foto elegida no aparece | Falta `.onChange` o muestras la variable equivocada | Revisa los pasos E y F |
| Elijo la misma foto y no pasa nada | `selectedItem` no cambió | Al quitar la foto pon `selectedItem = nil` |
| `main actor-isolated let '…' can not be referenced from a nonisolated context` (warning) | Color de la paleta global dentro de las llaves del `PhotosPicker` | Estilos afuera de las llaves (8.3) |
| `cannot find type 'UIImage' in scope` en el modelo | El archivo solo importa `Foundation` | `import SwiftUI` o `import UIKit` |
| La foto sale aplastada o estirada | Falta `.aspectRatio` | `.resizable(...)` + `.aspectRatio(contentMode: .fit)` (o `.fill` + `.clipShape`) |

---

---

# 9. Persistencia y sonido

La persistencia viene de la **Clase 11 (Persistencia de Datos Local: UserDefaults y Keychain)**. Esa presentación no está en la carpeta de la
profe que tienes, pero sí se vio y la tiene la skill del curso. El sonido (`AVAudioPlayer`) viene de tu **tarea ejemploMusica**, no de las presentaciones.

## 9.1 ¿Qué pasa con los datos al cerrar la app? (qué guardar dónde)
🔎 persistencia, guardar datos, que se guarde al cerrar, datos permanentes, donde guardar, UserDefaults vs Keychain, se borra al cerrar, perder datos

**Todo lo que es `@State` se borra al cerrar la app.** Si quieres que algo sobreviva, tienes que guardarlo. La tabla de la clase:

| Dato | Mecanismo | Qué pasa al cerrar | Ejemplos |
|---|---|---|---|
| Estado temporal de la pantalla | `@State` | **Se pierde** | Lo que va escribiendo, la selección actual, tu lista de antojos en el examen |
| Preferencias simples | `UserDefaults` / `@AppStorage` | **Se guarda** | Nombre del usuario, modo oscuro, volumen, color favorito, música activa |
| Información sensible | **Keychain** | Se guarda **cifrado** | Contraseñas, tokens de sesión, credenciales |
| Datos con estructura (muchos registros) | SwiftData / CoreData | Se guarda | Base de datos de productos, historial (no se practicó) |

**Reglas para la defensa:**
- Guardar una contraseña en `UserDefaults`/`@AppStorage` es una **falla de seguridad**: se guarda en **texto claro** dentro del iPhone.
- Usar Keychain para el volumen es **complejidad innecesaria**.
- Elegir bien el mecanismo es una decisión técnica que te pueden pedir que justifiques.

## 9.2 UserDefaults (guardar y leer a mano)
🔎 UserDefaults, UserDefaults.standard, guardar preferencia, set forKey, string forKey, bool forKey, integer forKey, removeObject, borrar dato guardado, llave, key

**Qué es:** un "diccionario" que guarda datos **pequeños y simples** (texto, números, `Bool`) con una **llave** (un nombre).
Sobrevive al cerrar la app. **No es una base de datos** y **no es para datos sensibles.**

`UserDefaults.standard` es una instancia **compartida**, la misma en toda la app (como un Singleton).

**Guardar, leer y borrar:**

```swift
// Guardar: .set(valor, forKey: "llave")
UserDefaults.standard.set(true, forKey: "musicaActiva")
UserDefaults.standard.set(20, forKey: "edad")
UserDefaults.standard.set(0.7, forKey: "volumen")
UserDefaults.standard.set("Ismael", forKey: "nombre")

// Leer
let musica = UserDefaults.standard.bool(forKey: "musicaActiva")     // Bool
let edad = UserDefaults.standard.integer(forKey: "edad")            // Int
let volumen = UserDefaults.standard.double(forKey: "volumen")       // Double
let nombre = UserDefaults.standard.string(forKey: "nombre")         // String? (OPCIONAL)

// Borrar
UserDefaults.standard.removeObject(forKey: "musicaActiva")
```

**Qué regresa cuando la llave NO existe (nunca se guardó):**

| Método | Tipo que regresa | Si no existe la llave |
|---|---|---|
| `.bool(forKey:)` | `Bool` | `false` |
| `.integer(forKey:)` | `Int` | `0` |
| `.double(forKey:)` | `Double` | `0.0` |
| `.string(forKey:)` | `String?` | `nil` → desempaca con `if let` |
| `.object(forKey:)` | `Any?` | `nil` → sirve para saber si existe |
| `.set(valor, forKey:)` | — | Guarda (o reemplaza) |
| `.removeObject(forKey:)` | — | Borra esa llave |

**Ejemplo con botones Guardar / Leer / Borrar:**

```swift
struct UserDefaultsDocView: View {
    @State private var nombre = ""
    @State private var leido = ""

    var body: some View {
        VStack(spacing: 16) {
            TextField("Tu nombre", text: $nombre)
                .textFieldStyle(.roundedBorder)

            HStack {
                Button("Guardar") {
                    UserDefaults.standard.set(nombre, forKey: "nombreUsuario")
                }
                Button("Leer") {
                    if let guardado = UserDefaults.standard.string(forKey: "nombreUsuario") {
                        leido = guardado
                    } else {
                        leido = "No hay nada guardado"
                    }
                }
                Button("Borrar") {
                    UserDefaults.standard.removeObject(forKey: "nombreUsuario")
                    leido = ""
                }
            }
            .buttonStyle(.bordered)

            Text(leido)
        }
        .padding()
    }
}
```

**Saber si algo ya se guardó alguna vez** (porque `.integer` da `0` aunque no exista):

```swift
// dentro de una func:
if UserDefaults.standard.object(forKey: "volumen") == nil {
    print("Nunca se ha guardado el volumen")
}
```

**¿Visto en clase?** ✅ Clase 11 (persistencia).
**En el repo:** `11_Extras/UserDefaultsView.swift` → bloques 1–3.

## 9.3 `@AppStorage` (lo más fácil: como `@State` pero que se guarda)
🔎 AppStorage, @AppStorage, guardar automatico, preferencias, ajustes, settings, configuracion, recordar nombre, guardar toggle, persistir

**Qué es:** un property wrapper que **conecta una variable con una llave de `UserDefaults`**. Se usa **igual que `@State`**
(con `$` para ligarla a un control), pero **el valor se guarda solo** y sobrevive al cerrar la app.

**Cómo se escribe:**

```swift
@AppStorage("nombreUsuario") private var nombreGuardado = ""
//          ↑ la llave           ↑ nombre de la variable  ↑ valor inicial (solo si nunca se guardó)
```

**Cómo funciona (de la clase):**
1. Al dibujar la vista, busca la llave en `UserDefaults`.
2. Si **existe**, usa el valor guardado.
3. Si **no existe**, usa el valor inicial de la declaración.
4. Cada vez que cambias la variable, **se guarda sola** y se actualizan todas las vistas que usan la misma llave.

**Ejemplo de pantalla de ajustes:**

```swift
struct AjustesDocView: View {
    @AppStorage("nombreUsuario") private var nombreGuardado = ""
    @AppStorage("musicaActiva") private var musicaActiva = true
    @AppStorage("volumen") private var volumen = 0.5
    @AppStorage("colorFondo") private var colorFondo = "Verde"

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Tu nombre", text: $nombreGuardado)
                .textFieldStyle(.roundedBorder)
            Toggle("Música", isOn: $musicaActiva)
            Slider(value: $volumen, in: 0 ... 1)
            Picker(selection: $colorFondo, label: Text("Color de fondo")) {
                Text("Verde").tag("Verde")
                Text("Amarillo").tag("Amarillo")
                Text("Azul").tag("Azul")
            }
            .pickerStyle(.segmented)
            Text("Hola, \(nombreGuardado)")
        }
        .padding()
    }
}
```

**La misma llave en otra pantalla = el mismo valor** (sin pasar nada con `@Binding`):

```swift
struct SaludoDocView: View {
    @AppStorage("nombreUsuario") private var nombreGuardado = ""    // misma llave que en Ajustes
    var body: some View {
        Text(nombreGuardado.isEmpty ? "Hola" : "Hola, \(nombreGuardado)")
    }
}
```

**Tipos que acepta `@AppStorage`:** `String`, `Int`, `Double`, `Bool`, `URL`, `Data`.
**NO acepta** arreglos ni structs (`[String]`, `[Antojo]`): sale el error `no exact matches in call to initializer`. Para una lista mira 9.5.

| Quiero… | Código |
|---|---|
| Declarar | `@AppStorage("llave") private var x = valorInicial` |
| Ligar a un control | `TextField("…", text: $x)`, `Toggle("…", isOn: $x)` |
| Leer | `Text(x)` o `Text("\(x)")` |
| Cambiar | `x = nuevoValor` (se guarda solo) |
| Volver al valor inicial | Asígnalo: `x = ""` (o borra la llave con `UserDefaults.standard.removeObject(forKey: "llave")`) |

**Errores comunes:**
- Escribiste la llave distinto en dos pantallas (`"nombreUsuario"` vs `"nombreusuario"`) → no comparten el valor.
- "Cambié el valor inicial y no cambia" → ya hay algo guardado en el simulador. Borra la app del simulador (mantén presionado el ícono → Eliminar app) o usa `removeObject`.
- Guardaste una contraseña → ❌ falla de seguridad: va en Keychain (9.6).

**¿Visto en clase?** ✅ Clase 11. Es el equivalente **persistente** de `@State`.
**En el repo:** `11_Extras/AppStorageView.swift` → bloques 1–6; `00_AppCompleta/Views/PerfilDuenoView.swift`.

## 9.4 Patrón de tu tarea DefaultsApp: guardar con un botón
🔎 DefaultsApp, boton guardar preferencias, guardar al presionar, onAppear cargar, settings view, guardar cambios

`@AppStorage` guarda **en cuanto cambias** el valor. Si quieres que solo se guarde al presionar **"Guardar"** (y poder cancelar), usa
una `@State` temporal para editar, y copia al `@AppStorage` en el botón. Al abrir la pantalla, cargas lo guardado en `.onAppear`:

```swift
struct SettingsDocView: View {
    @AppStorage("nombreUsuario") private var nombreGuardado = ""     // lo guardado
    @AppStorage("colorFondo") private var colorGuardado = "Verde"

    @State private var nombre = ""                                   // lo que estás editando
    @State private var colorFondo = "Verde"

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Nombre", text: $nombre)
                .textFieldStyle(.roundedBorder)

            Picker(selection: $colorFondo, label: Text("Color de fondo")) {
                Text("Verde").tag("Verde")
                Text("Amarillo").tag("Amarillo")
                Text("Azul").tag("Azul")
            }
            .pickerStyle(.segmented)

            Button("Guardar") {
                nombreGuardado = nombre          // ahora sí se guarda
                colorGuardado = colorFondo
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {                              // al abrir la pantalla, carga lo guardado
            nombre = nombreGuardado
            colorFondo = colorGuardado
        }
    }
}
```

**En tu tarea:** `~/Desktop/swift/DefaultsApp/DefaultsApp/SettingsView.swift` (y `colorDeFondo(_:)` para convertir el nombre del color en `Color`).

## 9.5 Guardar una LISTA completa (JSON dentro de `@AppStorage`) ⚠️
🔎 guardar lista, guardar arreglo, persistir lista, que no se borre la lista, json appstorage, Codable, JSONEncoder, JSONDecoder, guardar array, guardar structs

**Problema:** `@AppStorage` no acepta arreglos. **Truco:** conviertes la lista a **texto JSON** (con `Codable`) y guardas ese texto.
Al abrir la app, lo conviertes de regreso.

```swift
struct TareaGuardada: Identifiable, Codable {     // Codable = se puede convertir a JSON y de regreso
    var id: Int
    var nombre: String
    var hecha: Bool
}

struct ListaGuardadaView: View {
    @AppStorage("tareasGuardadas") private var tareasJSON = ""      // aquí vive el texto JSON
    @State private var tareas: Array<TareaGuardada> = []            // la lista que usas en la pantalla
    @State private var nuevaTarea = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Nueva tarea", text: $nuevaTarea)
                    .textFieldStyle(.roundedBorder)
                Button("Agregar") {
                    if !nuevaTarea.isEmpty {
                        tareas.append(TareaGuardada(id: tareas.count + 1, nombre: nuevaTarea, hecha: false))
                        nuevaTarea = ""
                        guardarTareas()          // guarda después de cada cambio
                    }
                }
            }
            List(tareas) { tarea in
                Text(tarea.nombre)
            }
        }
        .padding()
        .onAppear {
            cargarTareas()                       // al abrir, recupera lo guardado
        }
    }

    // Lista → texto JSON → @AppStorage
    func guardarTareas() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(tareas),
           let texto = String(data: data, encoding: .utf8) {
            tareasJSON = texto
        }
    }

    // @AppStorage → texto JSON → lista
    func cargarTareas() {
        let decoder = JSONDecoder()
        if let data = tareasJSON.data(using: .utf8),
           let lista = try? decoder.decode(Array<TareaGuardada>.self, from: data) {
            tareas = lista
        }
    }
}
```

- **Llama `guardarTareas()` después de cada cambio** (agregar, borrar, editar).
- Si prefieres que se guarde solo con `.onChange(of: tareas)`, el struct también debe ser `Equatable` (`struct TareaGuardada: Identifiable, Codable, Equatable`) ⚠️.
- **No guardes `UIImage` así**: no es `Codable` y las fotos son muy pesadas para `UserDefaults`.

**Cómo defenderlo si te preguntan:** "`@AppStorage` solo guarda tipos simples. `Codable` y `JSONEncoder` se vieron en Modelos (convertir structs a JSON),
así que convierto la lista a un `String` JSON, que sí es tipo simple, y lo guardo en `UserDefaults`. Para listas grandes lo correcto sería
SwiftData/CoreData; para una lista chica esto es suficiente."
**¿Visto en clase?** ⚠️ La combinación no. `Codable`/`JSONEncoder` sí (Clase 10 y REST), `@AppStorage` sí (Clase 11).

## 9.6 Keychain (para contraseñas y tokens)
🔎 Keychain, llavero, contraseña, password, token, guardar contraseña, seguro, cifrado, SecItemAdd, SecItemDelete, SecItemCopyMatching, KeychainService

**Qué es:** almacenamiento **cifrado** del sistema. Es donde se guardan contraseñas y tokens. La API es de bajo nivel (en C),
así que la clase la **encapsula** en una clase de servicio para no ensuciar la vista:

`[ Vista ] ---> [ KeychainService ] ---> [ Keychain de iOS ]`

```swift
import Security

class KeychainService {
    // Guardar (de la clase)
    func save(_ value: String, for key: String) {
        // 1. Convertir el texto a Data (binario)
        guard let data = value.data(using: .utf8) else { return }

        // 2. Borrar si ya había algo con esa llave (el Keychain NO reemplaza solo)
        let queryDelete: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(queryDelete as CFDictionary)

        // 3. Diccionario con lo que se guarda
        let queryAdd: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        // 4. Guardar
        SecItemAdd(queryAdd as CFDictionary, nil)
    }

    // Leer ⚠️ (no viene en la clase, solo guardar)
    func read(for key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var resultado: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &resultado)
        if status == errSecSuccess, let data = resultado as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}
```

**Uso desde una vista:**

```swift
struct LoginKeychainDocView: View {
    @State private var token = ""
    let keychain = KeychainService()

    var body: some View {
        Button("Guardar token") {
            keychain.save("abc123", for: "tokenUsuario")
            if let guardado = keychain.read(for: "tokenUsuario") {
                token = guardado
            }
        }
    }
}
```

**¿Visto en clase?** ✅ Clase 11: el concepto y `save`. ⚠️ `read`.
En un examen de 3 horas es poco probable que lo pidan; lo importante es saber **cuándo** se usa (contraseñas sí, preferencias no).

## 9.7 Sonido con `AVAudioPlayer` ⚠️ (de tu tarea ejemploMusica)
🔎 sonido, musica, música, audio, mp3, AVAudioPlayer, AVFoundation, AVAudioSession, reproducir, play, pause, stop, volumen, loop, repetir cancion, Bundle.main.url

**Qué es:** el reproductor de audio de Apple. No viene en las presentaciones; lo hiciste en la tarea **ejemploMusica**.

**Paso 0: agregar el mp3 al proyecto.** Arrastra el archivo al navegador de Xcode → marca **"Copy items if needed"** y palomea tu **target**.
Si no está en el target, `Bundle.main.url(...)` regresa `nil` y no suena nada.

```swift
import SwiftUI
import AVFoundation          // ⚠️ AVAudioPlayer vive aquí

struct SonidoDocView: View {
    @State private var audioPlayer: AVAudioPlayer?        // opcional: al inicio no hay reproductor
    @State private var volumen: Float = 0.5               // AVAudioPlayer usa Float de 0 a 1
    @State private var silencio = false

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 16) {
                Button("Play", systemImage: "play.fill") {
                    audioPlayer?.play()
                }
                Button("Pausa", systemImage: "pause.fill") {
                    audioPlayer?.pause()
                }
                Button("Stop", systemImage: "stop.fill") {
                    audioPlayer?.stop()
                    audioPlayer?.currentTime = 0          // regresa al inicio
                }
            }
            .buttonStyle(.borderedProminent)

            Text("Volumen: \(Int(volumen * 100))%")
            Slider(value: $volumen, in: 0 ... 1)

            Toggle("Silencio", isOn: $silencio)
        }
        .padding()
        .onAppear {
            prepararAudio()                    // carga el mp3 al abrir la pantalla
        }
        .onChange(of: volumen) { oldValue, newValue in
            actualizarVolumen()
        }
        .onChange(of: silencio) { oldValue, newValue in
            actualizarVolumen()
        }
    }

    func prepararAudio() {
        // Que suene aunque el iPhone esté en modo silencio
        try? AVAudioSession.sharedInstance().setCategory(.playback)

        // Busca el archivo "MarioBros.mp3" dentro de la app
        if let sonido = Bundle.main.url(forResource: "MarioBros", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sonido)
                audioPlayer?.numberOfLoops = -1    // -1 = se repite siempre; 0 = una vez
                audioPlayer?.volume = volumen
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error al cargar el audio: \(error)")
            }
        } else {
            print("No se encontró el archivo de audio")
        }
    }

    func actualizarVolumen() {
        if silencio {
            audioPlayer?.volume = 0
        } else {
            audioPlayer?.volume = volumen
        }
    }
}
```

**Métodos y propiedades de `AVAudioPlayer`:**

| Código | Qué hace |
|---|---|
| `AVAudioPlayer(contentsOf: url)` | Crea el reproductor (puede fallar → `try` dentro de `do/catch`) |
| `.play()` | Reproduce (o sigue donde se pausó) |
| `.pause()` | Pausa (recuerda dónde iba) |
| `.stop()` | Detiene (no regresa al inicio solo) |
| `.currentTime = 0` | Regresa al inicio |
| `.volume = 0.5` | Volumen (`Float` de 0 a 1) |
| `.numberOfLoops = -1` | Repetir para siempre (`0` = una vez, `2` = 3 veces) |
| `.prepareToPlay()` | Lo deja listo para que empiece sin retraso |
| `.isPlaying` | `true` si está sonando |
| `.duration` | Cuánto dura en segundos |

**Por qué `audioPlayer?.play()` con `?`:** `audioPlayer` es opcional; si no se pudo cargar el mp3, es `nil`, y el `?` hace que no truene, simplemente no hace nada.

**Errores comunes:**
- "No se encontró el archivo de audio" en la consola → el mp3 no está en el target, o el nombre o la extensión no coinciden exactamente.
- `cannot find 'AVAudioPlayer' in scope` → falta `import AVFoundation`.
- `errors thrown from here are not handled` → `AVAudioPlayer(contentsOf:)` necesita `try` dentro de `do { } catch { }`.
- El `Slider` marca error de tipo con `volume` → el volumen es `Float`, no `Double`: declara `@State private var volumen: Float = 0.5`.

**Cómo explicarlo si te preguntan:** "AVAudioPlayer de AVFoundation reproduce un archivo de audio incluido en la app. Lo creo una vez en `.onAppear`, lo guardo en una `@State` opcional y los botones llaman `play`, `pause` y `stop`."
**En el repo:** `11_Extras/SonidoView.swift` → bloques 1–3 (usa `11_Extras/Sonidos/MarioBros.mp3`).

## 9.8 Errores comunes de persistencia (resumen)
🔎 error appstorage, no se guarda, se borra al cerrar, userdefaults no funciona, no exact matches appstorage

| Síntoma o mensaje | Por qué | Arreglo |
|---|---|---|
| Se borra todo al cerrar la app | Usaste `@State` | `@AppStorage` (simple) o JSON en `@AppStorage` (listas) |
| `no exact matches in call to initializer` en `@AppStorage` | Tipo no permitido (arreglo, struct) | Solo `String`, `Int`, `Double`, `Bool`, `URL`, `Data`; para listas, 9.5 |
| Dos pantallas no comparten el dato | Llaves escritas distinto | Copia y pega la llave exacta (o ponla en una constante) |
| El valor inicial no se aplica | Ya había un valor guardado | Borra la app del simulador o usa `removeObject(forKey:)` |
| `.string(forKey:)` no deja usar el valor directo | Regresa `String?` | `if let` o `?? ""` |
| Guardé la contraseña en `@AppStorage` | Se guarda en texto claro | Keychain |

---

# 10. Recetas de examen (paso a paso, código completo)

Esta parte es para cuando sabes **qué quieres lograr** pero no sabes **cómo**. Cada receta empieza con "Quiero…".
Todas usan el mismo ejemplo del simulacro: **Antojos de Monterrey** (`00_PRACTICA_EXAMEN.md`).

Cómo leer cada receta:
- **Necesitas:** qué debe existir antes (otro archivo, una imagen, un import).
- **Pasos:** qué hacer, en orden.
- **Código:** listo para copiar. **Todo el código de esta parte se compiló** (iOS 17, Swift 6, Xcode 26) antes de ponerlo aquí.
- **Errores que te pueden salir:** el mensaje de Xcode y cómo se arregla.
- **¿Visto en clase?** ✅ = la profe lo enseñó. ⚠️ = no viene en las láminas; úsalo solo si lo puedes explicar.

> El código va **sin comentarios** a propósito: así lo pegas tal cual y lo explicas con tus palabras.
> (En la tarea Movil02 la profe pidió que en el video el código no estuviera comentado.) La explicación está arriba de cada bloque.

> Las recetas usan una paleta llamada `paletaFondo`, `paletaSuperficie`, `paletaPrimario`, `paletaSecundario`,
> `paletaTexto` y `paletaTextoSuave` (receta 10.1, paso 4). Si no la tienes, cámbialos por colores del sistema (`.orange`, `.white`…).

---

## 10.1 Quiero armar el proyecto desde cero en 15 minutos
🔎 proyecto nuevo, empezar, crear app, estructura, carpetas, model views components utils, esqueleto, desde cero, new project, plantilla, tabview vacio

**Necesitas:** Xcode abierto. Nada más.

**Pasos:**

1. **Crear el proyecto:** File → New → Project → pestaña **iOS** → **App** → Next.
   Product Name: `ExamenAntojos` · Organization Identifier: `tec.mx` · Interface: **SwiftUI** · Language: **Swift** ·
   Testing System: None · Storage: None → Next → elige dónde guardarlo → Create. (✅ Clase 2)
2. **Crear las 4 carpetas:** en el navegador de la izquierda, clic derecho sobre la carpeta amarilla del proyecto
   (la que tiene `ContentView.swift`) → **New Folder** → `Model`. Repite para `Views`, `Components` y `Utils`.
   Arrastra `ContentView.swift` a `Views`. (La profe califica esta organización.)
3. **El modelo:** clic derecho en `Model` → New File from Template → **Swift File** → `Antojo.swift`.
   Es el "molde" de cada antojo: qué datos tiene. `Identifiable` pide un `id` para que `List` distinga cada renglón.
   `estrellas` y `fechaTexto` son **propiedades calculadas**: no se guardan, se calculan cada vez que las pides.

```swift
import Foundation

struct Antojo: Identifiable {
    var id: Int
    var nombre: String
    var descripcion: String
    var categoria: String
    var imagen: String
    var calificacion: Int
    var precio: Double
    var fecha: Date
    var esFavorito: Bool

    var estrellas: String {
        return String(repeating: "⭐️", count: calificacion)
    }

    var fechaTexto: String {
        let formato = DateFormatter()
        formato.dateStyle = DateFormatter.Style.long
        formato.timeStyle = DateFormatter.Style.none
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: fecha)
    }
}
```

4. **La paleta:** clic derecho en `Utils` → Swift File → `Paleta.swift`. Son `let` globales: se pueden usar desde
   cualquier vista. Esquema **monocromático naranja** (mismo matiz, distinta luz). Contraste comprobado: texto sobre
   fondo 14.7:1, blanco sobre `paletaPrimario` 5.2:1 (el mínimo recomendado es 4.5:1).

```swift
import SwiftUI

let paletaFondo = Color(red: 255/255, green: 247/255, blue: 237/255)
let paletaSuperficie = Color(red: 255/255, green: 237/255, blue: 213/255)
let paletaPrimario = Color(red: 194/255, green: 65/255, blue: 12/255)
let paletaSecundario = Color(red: 251/255, green: 146/255, blue: 60/255)
let paletaTexto = Color(red: 67/255, green: 20/255, blue: 7/255)
let paletaTextoSuave = Color(red: 124/255, green: 45/255, blue: 18/255)
```

5. **Los datos fijos:** en `Model` → Swift File → `ModelData.swift`. Una función que regresa la lista (forma de la
   Clase 10: `Array<Antojo>` y `append`). `fechaHaceDias` usa lo de la Clase 3B (sumar a una fecha con `DateComponents`)
   para que cada antojo tenga una fecha distinta. **Cada `id` diferente** y las imágenes (`foto1`…`foto4`) deben existir
   en `Assets.xcassets` (receta 10.41).

```swift
import Foundation

let categoriasAntojos = ["Tacos", "Hamburguesas", "Postres"]

func fechaHaceDias(dias: Int) -> Date {
    var dateComponent = DateComponents()
    dateComponent.day = -dias

    if let fecha = Calendar.current.date(byAdding: dateComponent, to: Date()) {
        return fecha
    }
    return Date()
}

func cargarAntojos() -> Array<Antojo> {
    var lista = Array<Antojo>()

    lista.append(Antojo(id: 1, nombre: "Tacos Juanito", descripcion: "Tacos de trompo con mucha piña y salsa verde.",
                        categoria: "Tacos", imagen: "foto1", calificacion: 5, precio: 120,
                        fecha: fechaHaceDias(dias: 2), esFavorito: true))
    lista.append(Antojo(id: 2, nombre: "Tacos Popo", descripcion: "Tacos de bistec para la tarde.",
                        categoria: "Tacos", imagen: "foto2", calificacion: 3, precio: 220,
                        fecha: fechaHaceDias(dias: 15), esFavorito: false))
    lista.append(Antojo(id: 3, nombre: "Taquería Doña Mary", descripcion: "Tacos de barbacoa los domingos.",
                        categoria: "Tacos", imagen: "foto3", calificacion: 4, precio: 95,
                        fecha: fechaHaceDias(dias: 40), esFavorito: true))
    lista.append(Antojo(id: 4, nombre: "Burger Barrio", descripcion: "Hamburguesa doble con tocino y papas.",
                        categoria: "Hamburguesas", imagen: "foto4", calificacion: 5, precio: 180,
                        fecha: fechaHaceDias(dias: 5), esFavorito: true))
    lista.append(Antojo(id: 5, nombre: "La Smash", descripcion: "Smash burger con queso americano.",
                        categoria: "Hamburguesas", imagen: "foto1", calificacion: 4, precio: 165,
                        fecha: fechaHaceDias(dias: 22), esFavorito: false))
    lista.append(Antojo(id: 6, nombre: "Burgers del Valle", descripcion: "Hamburguesa con aguacate y jalapeño.",
                        categoria: "Hamburguesas", imagen: "foto2", calificacion: 3, precio: 210,
                        fecha: fechaHaceDias(dias: 60), esFavorito: false))
    lista.append(Antojo(id: 7, nombre: "Nieves La Michoacana", descripcion: "Nieve de limón y paletas de fruta.",
                        categoria: "Postres", imagen: "foto3", calificacion: 4, precio: 45,
                        fecha: fechaHaceDias(dias: 1), esFavorito: true))
    lista.append(Antojo(id: 8, nombre: "Crepas Centrito", descripcion: "Crepas de Nutella con fresa.",
                        categoria: "Postres", imagen: "foto4", calificacion: 5, precio: 110,
                        fecha: fechaHaceDias(dias: 9), esFavorito: true))
    lista.append(Antojo(id: 9, nombre: "Churros El Moro", descripcion: "Churros recién hechos con chocolate.",
                        categoria: "Postres", imagen: "foto1", calificacion: 4, precio: 85,
                        fecha: fechaHaceDias(dias: 30), esFavorito: false))
    lista.append(Antojo(id: 10, nombre: "Pay de queso Lupita", descripcion: "Rebanada de pay de queso con zarzamora.",
                        categoria: "Postres", imagen: "foto2", calificacion: 2, precio: 60,
                        fecha: fechaHaceDias(dias: 75), esFavorito: false))

    return lista
}
```

6. **El TabView vacío:** en `Views/ContentView.swift` borra todo y pon esto. Ya corre: verás las 5 pestañas.
   Luego vas cambiando cada `Text(...)` por la pantalla real (receta 10.2).

```swift
struct ContentView: View {
    @State private var antojos = cargarAntojos()

    var body: some View {
        TabView {
            Text("Inicio")
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }
            Text("Lista: \(antojos.count) antojos")
                .tabItem {
                    Label("Lista", systemImage: "list.bullet")
                }
            Text("Buscar")
                .tabItem {
                    Label("Buscar", systemImage: "magnifyingglass")
                }
            Text("Estadísticas")
                .tabItem {
                    Label("Estadísticas", systemImage: "chart.bar.fill")
                }
            Text("Perfil")
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
        .tint(paletaPrimario)
    }
}
```

7. Corre la app (⌘R). Si ves las 5 pestañas, vas bien.

**Errores que te pueden salir:**
- *"Cannot find 'cargarAntojos' in scope"* → `ModelData.swift` no está en el target o el nombre está distinto. Revisa que el archivo esté dentro de la carpeta del proyecto y que la función se llame igual.
- *"Expressions are not allowed at the top level"* → escribiste una instrucción (por ejemplo `formato.dateFormat = …`) fuera de una función. Fuera de `func`/`struct` solo van declaraciones (`let`, `var`, `func`, `struct`).
- *"Cannot call value of non-function type 'String?'"* → usaste una propiedad como si fuera función: `formato.dateFormat("dd/MM")` ❌ → `formato.dateFormat = "dd/MM"` ✅.
- *"Missing argument for parameter 'esFavorito'"* → al crear un `Antojo` te faltó un dato, o los pusiste en otro orden. Van **en el mismo orden** que en el struct.
- La lista se ve rara o al tocar un renglón abre otro → **ids repetidos**. Cada antojo con su número: 1, 2, 3…

**¿Visto en clase?** ✅ Clase 2 (proyecto), Clase 10 (struct, Identifiable, ModelData), Clase 3B (fechas), Clase 7 (TabView).
**En el repo:** `08_ModelosYListas/Model/Jugador.swift` y `ModelDataJugadores.swift` · `00_AppCompleta/Utils/PaletaMascotas.swift`.

---

## 10.2 Quiero la app completa mínima (TabView + Lista + Detalle editable + Agregar + Buscador + Estadísticas + Perfil)
🔎 app completa, todos los archivos, solucion, examen completo, tabview lista detalle agregar, crud, plantilla completa, antojos

Esta es **una solución completa del simulacro**. Son 16 archivos y compilan juntos sin errores ni warnings.
Úsala para comparar con lo que hiciste o para copiar un archivo que te falte. Si la copias toda, **asegúrate de poder
explicar cada línea** (sección 11).

**Necesitas:** los archivos de la receta 10.1 (`Antojo`, `Paleta`, `ModelData`), las imágenes `foto1`…`foto4` en Assets,
`CamaraPicker.swift` (copia de `10_FotosYCamara/CamaraPicker.swift`, el de la profe) y el permiso de cámara (receta 10.42).

**Dónde va cada archivo:**

```
ExamenAntojos/
├── Model/        Antojo.swift, ModelData.swift
├── Utils/        Paleta.swift
├── Components/   AntojoRow.swift, TarjetaResumen.swift, FilaDato.swift, CamaraPicker.swift
└── Views/        ContentView.swift, InicioView.swift, ListaAntojosView.swift, DetalleAntojoView.swift,
                  AgregarAntojoView.swift, BuscadorView.swift, ResultadosView.swift,
                  EstadisticasView.swift, PerfilView.swift
```

**Cómo fluyen los datos (esto te lo pueden preguntar):**
- `ContentView` es **dueña** de la lista: `@State private var antojos = cargarAntojos()`.
- A las pestañas que **solo leen** (Inicio, Buscador, Estadísticas) les pasa `antojos` **sin `$`** (una copia para leer).
- A la pestaña que **modifica** (Lista) le pasa `$antojos` (un `@Binding`). Por eso si agregas un antojo o cambias un
  favorito en Lista, Inicio y Estadísticas se actualizan solas.
- Cada pestaña tiene **su propio `NavigationStack` adentro**. Nunca uno afuera del `TabView` (salen dos barras).

### 10.2.1 `Components/AntojoRow.swift` — el renglón de la lista
Imagen pequeña + nombre + estrellas + corazón. Recibe el antojo como `var` simple (sin `@State` ni `private`) porque
solo lo muestra. **Sin padding al HStack** (regla de la Clase 10).

```swift
import SwiftUI

struct AntojoRow: View {
    var antojo: Antojo

    var body: some View {
        HStack {
            Image(antojo.imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(antojo.nombre)
                    .font(.headline)
                    .foregroundStyle(paletaTexto)
                Text(antojo.estrellas)
                    .font(.caption)
            }

            Spacer()

            Image(systemName: antojo.esFavorito ? "heart.fill" : "heart")
                .foregroundStyle(paletaPrimario)
        }
    }
}

#Preview {
    AntojoRow(antojo: cargarAntojos()[0])
}
```

### 10.2.2 `Components/TarjetaResumen.swift` — tarjeta reutilizable (se usa 3 veces)
`.frame(maxWidth: .infinity)` hace que las 3 tarjetas de un `HStack` midan lo mismo.

```swift
import SwiftUI

struct TarjetaResumen: View {
    var icono: String
    var valor: String
    var titulo: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundStyle(paletaPrimario)
            Text(valor)
                .font(.title2)
                .bold()
                .foregroundStyle(paletaTexto)
            Text(titulo)
                .font(.caption)
                .foregroundStyle(paletaTextoSuave)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(paletaSuperficie)
        .cornerRadius(12)
    }
}

#Preview {
    HStack(spacing: 12) {
        TarjetaResumen(icono: "fork.knife", valor: "10", titulo: "Antojos")
        TarjetaResumen(icono: "heart.fill", valor: "5", titulo: "Favoritos")
        TarjetaResumen(icono: "star.fill", valor: "3.9", titulo: "Promedio")
    }
    .padding()
}
```

### 10.2.3 `Components/FilaDato.swift` — renglón "Etiqueta ……… Valor"

```swift
import SwiftUI

struct FilaDato: View {
    var etiqueta: String
    var valor: String

    var body: some View {
        HStack {
            Text(etiqueta)
                .foregroundStyle(paletaTextoSuave)
            Spacer()
            Text(valor)
                .bold()
                .foregroundStyle(paletaTexto)
        }
    }
}

#Preview {
    FilaDato(etiqueta: "Categoría", valor: "Tacos")
        .padding()
}
```

### 10.2.4 `Views/ContentView.swift` — el TabView, dueño de la lista

```swift
import SwiftUI

struct ContentView: View {
    @State private var antojos = cargarAntojos()

    var body: some View {
        TabView {
            InicioView(antojos: antojos)
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }

            ListaAntojosView(antojos: $antojos)
                .tabItem {
                    Label("Lista", systemImage: "list.bullet")
                }

            BuscadorView(antojos: antojos)
                .tabItem {
                    Label("Buscar", systemImage: "magnifyingglass")
                }

            EstadisticasView(antojos: antojos)
                .tabItem {
                    Label("Estadísticas", systemImage: "chart.bar.fill")
                }

            PerfilView()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
        .tint(paletaPrimario)
    }
}

#Preview {
    ContentView()
}
```

### 10.2.5 `Views/InicioView.swift` — fecha, carrusel, 3 tarjetas y sorpresa

```swift
import SwiftUI

struct InicioView: View {
    var antojos: Array<Antojo>

    @State private var sorpresa: Antojo? = nil

    var totalFavoritos: Int {
        var total = 0
        for antojo in antojos {
            if antojo.esFavorito {
                total += 1
            }
        }
        return total
    }

    var promedio: Double {
        if antojos.isEmpty {
            return 0
        }
        var suma = 0
        for antojo in antojos {
            suma += antojo.calificacion
        }
        return Double(suma) / Double(antojos.count)
    }

    func fechaDeHoy() -> String {
        let formato = DateFormatter()
        formato.dateFormat = "EEEE, d 'de' MMMM"
        formato.locale = Locale(identifier: "es_MX")
        return formato.string(from: Date())
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paletaFondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Hoy es \(fechaDeHoy())")
                            .font(.title3)
                            .foregroundStyle(paletaTextoSuave)

                        TabView {
                            Image("foto1")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                            Image("foto2")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                            Image("foto3")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .frame(height: 220)
                        .cornerRadius(16)

                        HStack(spacing: 12) {
                            TarjetaResumen(icono: "fork.knife", valor: "\(antojos.count)", titulo: "Antojos")
                            TarjetaResumen(icono: "heart.fill", valor: "\(totalFavoritos)", titulo: "Favoritos")
                            TarjetaResumen(icono: "star.fill", valor: promedio.formatted(.number.precision(.fractionLength(1))), titulo: "Promedio")
                        }

                        Button {
                            sorpresa = antojos.randomElement()
                        } label: {
                            Label("Recomendación sorpresa", systemImage: "sparkles")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(paletaPrimario)

                        if let antojo = sorpresa {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(antojo.nombre)
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(paletaTexto)
                                Text(antojo.descripcion)
                                    .foregroundStyle(paletaTextoSuave)
                                FilaDato(etiqueta: "Categoría", valor: antojo.categoria)
                                FilaDato(etiqueta: "Precio", valor: antojo.precio.formatted(.currency(code: "MXN")))
                                FilaDato(etiqueta: "Calificación", valor: antojo.estrellas)
                                FilaDato(etiqueta: "Registrado", valor: antojo.fechaTexto)
                                FilaDato(etiqueta: "Favorito", valor: antojo.esFavorito ? "Sí" : "No")
                            }
                            .padding()
                            .background(paletaSuperficie)
                            .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Mis Antojos")
        }
    }
}

#Preview {
    InicioView(antojos: cargarAntojos())
}
```

### 10.2.6 `Views/ListaAntojosView.swift` — lista editable + botón Agregar
`List($antojos) { $antojo in … }` entrega cada antojo **como binding**: así el detalle lo puede modificar.
`.sheet` abre el formulario encima.

```swift
import SwiftUI

struct ListaAntojosView: View {
    @Binding var antojos: Array<Antojo>

    @State private var mostrarAgregar = false

    var body: some View {
        NavigationStack {
            VStack {
                List($antojos) { $antojo in
                    NavigationLink {
                        DetalleAntojoView(antojo: $antojo)
                    } label: {
                        AntojoRow(antojo: antojo)
                    }
                }
                .listStyle(.inset)

                Button {
                    mostrarAgregar.toggle()
                } label: {
                    Label("Agregar antojo", systemImage: "plus")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(paletaPrimario)
                .padding()
            }
            .navigationTitle("Lista")
            .sheet(isPresented: $mostrarAgregar) {
                AgregarAntojoView(antojos: $antojos)
            }
        }
    }
}

#Preview {
    ListaAntojosView(antojos: .constant(cargarAntojos()))
}
```

### 10.2.7 `Views/DetalleAntojoView.swift` — detalle que modifica favorito y calificación
`@Binding var antojo` = "esta pantalla tiene permiso de cambiar el antojo de la lista". `dismiss()` regresa.

```swift
import SwiftUI

struct DetalleAntojoView: View {
    @Binding var antojo: Antojo

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {
                    Image(antojo.imagen)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 260)
                        .cornerRadius(16)

                    Text(antojo.nombre)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(paletaTexto)
                        .multilineTextAlignment(.center)

                    Text(antojo.descripcion)
                        .foregroundStyle(paletaTextoSuave)
                        .multilineTextAlignment(.center)

                    VStack(spacing: 10) {
                        FilaDato(etiqueta: "Categoría", valor: antojo.categoria)
                        Divider()
                        FilaDato(etiqueta: "Precio", valor: antojo.precio.formatted(.currency(code: "MXN")))
                        Divider()
                        FilaDato(etiqueta: "Registrado", valor: antojo.fechaTexto)
                        Divider()
                        FilaDato(etiqueta: "Calificación", valor: antojo.estrellas)
                    }
                    .padding()
                    .background(paletaSuperficie)
                    .cornerRadius(12)

                    Text("Cambiar calificación")
                        .font(.headline)
                        .foregroundStyle(paletaTexto)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Picker(selection: $antojo.calificacion, label: Text("Calificación")) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                    }
                    .pickerStyle(.segmented)

                    Toggle("Favorito", isOn: $antojo.esFavorito)
                        .tint(paletaPrimario)
                        .foregroundStyle(paletaTexto)

                    Button {
                        dismiss()
                    } label: {
                        Text("Regresar a la lista")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.bordered)
                    .tint(paletaPrimario)
                }
                .padding()
            }
        }
        .navigationTitle("Detalle")
    }
}

#Preview {
    NavigationStack {
        DetalleAntojoView(antojo: .constant(cargarAntojos()[0]))
    }
}
```

### 10.2.8 `Views/AgregarAntojoView.swift` — formulario con validación
Un `else if` por cada error, cada uno con su mensaje. El precio se escribe como texto y se convierte con `if let`.

```swift
import SwiftUI

struct AgregarAntojoView: View {
    @Binding var antojos: Array<Antojo>

    @Environment(\.dismiss) private var dismiss

    @State private var nombre = ""
    @State private var descripcion = ""
    @State private var categoria = ""
    @State private var precioTexto = ""
    @State private var calificacion = 3
    @State private var esFavorito = false

    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool

    func siguienteId() -> Int {
        var mayor = 0
        for antojo in antojos {
            if antojo.id > mayor {
                mayor = antojo.id
            }
        }
        return mayor + 1
    }

    func guardar() {
        campoEnFoco = false

        if nombre.isEmpty {
            alertMessage = "Escribe el nombre del antojo."
            showAlert.toggle()
        } else if descripcion.isEmpty {
            alertMessage = "Escribe una descripción."
            showAlert.toggle()
        } else if categoria.isEmpty {
            alertMessage = "Elige una categoría."
            showAlert.toggle()
        } else if precioTexto.isEmpty {
            alertMessage = "Escribe el precio."
            showAlert.toggle()
        } else if let precio = Double(precioTexto) {
            if precio <= 0 {
                alertMessage = "El precio debe ser mayor a 0."
                showAlert.toggle()
            } else {
                let nuevo = Antojo(id: siguienteId(), nombre: nombre, descripcion: descripcion,
                                   categoria: categoria, imagen: "foto1", calificacion: calificacion,
                                   precio: precio, fecha: Date(), esFavorito: esFavorito)
                antojos.append(nuevo)
                dismiss()
            }
        } else {
            alertMessage = "El precio debe ser un número, por ejemplo 150."
            showAlert.toggle()
        }
    }

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    Text("Nuevo antojo")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(paletaTexto)

                    Text("Nombre")
                        .font(.headline)
                    TextField("Ej. Tacos Juanito", text: $nombre)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    Text("Descripción")
                        .font(.headline)
                    TextField("Ej. Tacos de trompo con piña", text: $descripcion)
                        .textFieldStyle(.roundedBorder)
                        .focused($campoEnFoco)

                    HStack {
                        Text("Categoría")
                            .font(.headline)
                        Spacer()
                        Picker(selection: $categoria, label: Text("Categoría")) {
                            Text("Selecciona…").tag("")
                            Text("Tacos").tag("Tacos")
                            Text("Hamburguesas").tag("Hamburguesas")
                            Text("Postres").tag("Postres")
                        }
                        .pickerStyle(.menu)
                        .tint(paletaPrimario)
                    }

                    Text("Precio")
                        .font(.headline)
                    TextField("Ej. 150", text: $precioTexto)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .focused($campoEnFoco)

                    Text("Calificación")
                        .font(.headline)
                    Picker(selection: $calificacion, label: Text("Calificación")) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                    }
                    .pickerStyle(.segmented)

                    Toggle("Es favorito", isOn: $esFavorito)
                        .tint(paletaPrimario)

                    HStack(spacing: 12) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancelar")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.bordered)
                        .tint(paletaPrimario)

                        Button {
                            guardar()
                        } label: {
                            Text("Guardar")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(paletaPrimario)
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
        }
        .onTapGesture {
            campoEnFoco = false
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
    }
}

#Preview {
    AgregarAntojoView(antojos: .constant(cargarAntojos()))
}
```

### 10.2.9 `Views/BuscadorView.swift` — botón que valida y navega (patrón Clase 6C)

```swift
import SwiftUI

struct BuscadorView: View {
    var antojos: Array<Antojo>

    @State private var presupuestoTexto = ""
    @State private var categoria = ""
    @State private var presupuesto = 0.0

    @State private var isValid = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                paletaFondo
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 16) {
                    Text("Presupuesto máximo")
                        .font(.headline)
                        .foregroundStyle(paletaTexto)
                    TextField("Ej. 150", text: $presupuestoTexto)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .focused($campoEnFoco)

                    HStack {
                        Text("Categoría")
                            .font(.headline)
                            .foregroundStyle(paletaTexto)
                        Spacer()
                        Picker(selection: $categoria, label: Text("Categoría")) {
                            Text("Selecciona…").tag("")
                            Text("Tacos").tag("Tacos")
                            Text("Hamburguesas").tag("Hamburguesas")
                            Text("Postres").tag("Postres")
                        }
                        .pickerStyle(.menu)
                        .tint(paletaPrimario)
                    }

                    Button {
                        campoEnFoco = false
                        if presupuestoTexto.isEmpty {
                            isValid = false
                            alertMessage = "Escribe tu presupuesto."
                            showAlert.toggle()
                        } else if let valor = Double(presupuestoTexto) {
                            if valor <= 0 {
                                isValid = false
                                alertMessage = "El presupuesto debe ser mayor a 0."
                                showAlert.toggle()
                            } else if categoria.isEmpty {
                                isValid = false
                                alertMessage = "Elige una categoría."
                                showAlert.toggle()
                            } else {
                                presupuesto = valor
                                isValid = true
                            }
                        } else {
                            isValid = false
                            alertMessage = "El presupuesto debe ser un número, por ejemplo 150."
                            showAlert.toggle()
                        }
                    } label: {
                        Label("Buscar", systemImage: "magnifyingglass")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(paletaPrimario)
                    .alert(alertMessage, isPresented: $showAlert) {
                        Button("OK") {}
                    }
                    .navigationDestination(isPresented: $isValid) {
                        ResultadosView(antojos: antojos, presupuesto: presupuesto, categoria: categoria)
                    }

                    Spacer()
                }
                .padding()
            }
            .onTapGesture {
                campoEnFoco = false
            }
            .navigationTitle("Buscador")
        }
    }
}

#Preview {
    BuscadorView(antojos: cargarAntojos())
}
```

### 10.2.10 `Views/ResultadosView.swift` — recibe valores y filtra

```swift
import SwiftUI

struct ResultadosView: View {
    var antojos: Array<Antojo>
    var presupuesto: Double
    var categoria: String

    var resultados: Array<Antojo> {
        var lista = Array<Antojo>()
        for antojo in antojos {
            if antojo.categoria == categoria && antojo.precio <= presupuesto {
                lista.append(antojo)
            }
        }
        return lista
    }

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            if resultados.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "fork.knife.circle")
                        .font(.system(size: 60))
                        .foregroundStyle(paletaSecundario)
                    Text("No hay antojos de \(categoria) que cuesten \(presupuesto.formatted(.currency(code: "MXN"))) o menos.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(paletaTexto)
                }
                .padding()
            } else {
                List(resultados) { antojo in
                    AntojoRow(antojo: antojo)
                }
                .listStyle(.inset)
            }
        }
        .navigationTitle(categoria)
    }
}

#Preview {
    NavigationStack {
        ResultadosView(antojos: cargarAntojos(), presupuesto: 150, categoria: "Tacos")
    }
}
```

### 10.2.11 `Views/EstadisticasView.swift` — barras, dona y ProgressView

```swift
import SwiftUI
import Charts

struct ConteoAntojos: Identifiable {
    var id: String { return nombre }
    var nombre: String
    var cantidad: Int
}

struct EstadisticasView: View {
    var antojos: Array<Antojo>

    var conteoPorCategoria: Array<ConteoAntojos> {
        var resultado = Array<ConteoAntojos>()
        for categoria in categoriasAntojos {
            var cantidad = 0
            for antojo in antojos {
                if antojo.categoria == categoria {
                    cantidad += 1
                }
            }
            resultado.append(ConteoAntojos(nombre: categoria, cantidad: cantidad))
        }
        return resultado
    }

    var totalFavoritos: Int {
        var total = 0
        for antojo in antojos {
            if antojo.esFavorito {
                total += 1
            }
        }
        return total
    }

    var favoritosVsNo: Array<ConteoAntojos> {
        var resultado = Array<ConteoAntojos>()
        resultado.append(ConteoAntojos(nombre: "Favoritos", cantidad: totalFavoritos))
        resultado.append(ConteoAntojos(nombre: "No favoritos", cantidad: antojos.count - totalFavoritos))
        return resultado
    }

    var porcentajeFavoritos: Double {
        if antojos.isEmpty {
            return 0
        }
        return Double(totalFavoritos) / Double(antojos.count) * 100
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paletaFondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Antojos por categoría")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(paletaTexto)

                        Chart(conteoPorCategoria) { conteo in
                            BarMark(
                                x: .value("Categoría", conteo.nombre),
                                y: .value("Cantidad", conteo.cantidad)
                            )
                            .foregroundStyle(by: .value("Categoría", conteo.nombre))
                        }
                        .chartForegroundStyleScale([
                            "Tacos": paletaPrimario,
                            "Hamburguesas": paletaSecundario,
                            "Postres": paletaTextoSuave
                        ])
                        .frame(height: 220)

                        Text("Favoritos vs. no favoritos")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(paletaTexto)

                        Chart(favoritosVsNo) { dato in
                            SectorMark(
                                angle: .value("Cantidad", dato.cantidad),
                                innerRadius: .ratio(0.5)
                            )
                            .foregroundStyle(by: .value("Tipo", dato.nombre))
                        }
                        .chartForegroundStyleScale([
                            "Favoritos": paletaPrimario,
                            "No favoritos": paletaSecundario
                        ])
                        .chartLegend(position: .bottom, alignment: .center)
                        .frame(height: 220)

                        Text("Porcentaje de favoritos")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(paletaTexto)

                        ProgressView(value: porcentajeFavoritos, total: 100)
                            .scaleEffect(x: 1, y: 3)
                            .tint(paletaPrimario)

                        Text("\(porcentajeFavoritos, specifier: "%.0f")% de tus antojos son favoritos")
                            .foregroundStyle(paletaTextoSuave)
                    }
                    .padding()
                }
            }
            .navigationTitle("Estadísticas")
        }
    }
}

#Preview {
    EstadisticasView(antojos: cargarAntojos())
}
```

### 10.2.12 `Views/PerfilView.swift` — foto de galería o cámara

```swift
import SwiftUI
import PhotosUI

struct PerfilView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var showCamara = false
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            ZStack {
                paletaFondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        if let selectedImageBien = selectedImage {
                            Image(uiImage: selectedImageBien)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(.circle)
                                .overlay {
                                    Circle().stroke(paletaPrimario, lineWidth: 5)
                                }
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .foregroundStyle(paletaSecundario)
                        }

                        HStack(spacing: 12) {
                            PhotosPicker(
                                selection: $selectedItem,
                                matching: .images,
                                photoLibrary: .shared()) {
                                Label("Galería", systemImage: "photo.on.rectangle")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(paletaPrimario)
                            .onChange(of: selectedItem) { oldItem, newItem in
                                Task {
                                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        selectedImage = uiImage
                                    }
                                }
                            }

                            Button {
                                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                    showCamara = true
                                } else {
                                    showAlert.toggle()
                                }
                            } label: {
                                Label("Cámara", systemImage: "camera.fill")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(paletaPrimario)
                            .sheet(isPresented: $showCamara) {
                                CamaraPicker(selectedImageFromCamera: $selectedImage)
                            }
                            .alert("Este dispositivo no tiene cámara", isPresented: $showAlert) {
                                Button("OK") {}
                            }
                        }

                        VStack(spacing: 10) {
                            FilaDato(etiqueta: "Nombre", valor: "Tu nombre")
                            Divider()
                            FilaDato(etiqueta: "Matrícula", valor: "A00000000")
                            Divider()
                            FilaDato(etiqueta: "Carrera", valor: "ITC")
                        }
                        .padding()
                        .background(paletaSuperficie)
                        .cornerRadius(12)
                    }
                    .padding()
                }
            }
            .navigationTitle("Perfil")
        }
    }
}

#Preview {
    PerfilView()
}
```

**Errores que te pueden salir:**
- *"Cannot find 'CamaraPicker' in scope"* → no copiaste `CamaraPicker.swift`.
- *"Cannot find type 'Chart'"* / *"Cannot find 'PhotosPicker'"* → falta `import Charts` / `import PhotosUI` arriba del archivo.
- *"Missing argument for parameter 'antojos'"* en un `#Preview` → la vista recibe datos. Dale `cargarAntojos()` o `.constant(cargarAntojos())` si es `@Binding`.
- Los cambios del detalle no se ven al regresar → pasaste la lista sin `$`, o usaste `List(antojos)` en lugar de `List($antojos) { $antojo in }`.
- La app truena al tocar "Cámara" en un iPhone real → falta el permiso de cámara (10.42).

**¿Visto en clase?** ✅ casi todo. ⚠️ `.keyboardType`, `UIImagePickerController.isSourceTypeAvailable`, `.aspectRatio(contentMode: .fill)` en la foto del usuario.

---

## 10.3 Quiero un saludo con la fecha de hoy en español
🔎 fecha de hoy, dia de hoy, hoy es, saludo, date, dateformatter, locale es_MX, jueves 15 de octubre, today

**Necesitas:** nada.

**Pasos:** crea una función dentro de tu vista que haga los 3 pasos de la Clase 3B (1. crear el formateador, 2. elegir
estilo o formato, 3. `string(from:)`) y úsala dentro de un `Text`.

```swift
func fechaDeHoy() -> String {
    let formato = DateFormatter()
    formato.dateFormat = "EEEE, d 'de' MMMM"
    formato.locale = Locale(identifier: "es_MX")
    return formato.string(from: Date())
}
```

```swift
Text("Hoy es \(fechaDeHoy())")
```

Formatos útiles para `dateFormat` (con `locale = Locale(identifier: "es_MX")`):

| Formato | Sale |
|---|---|
| `"EEEE, d 'de' MMMM"` | jueves, 15 de octubre |
| `"dd/MM/yyyy"` | 15/10/2026 |
| `"d 'de' MMMM 'de' yyyy"` | 15 de octubre de 2026 |
| `"EEE dd MMM"` | jue 15 oct |
| `"HH:mm"` | 19:45 |

Si prefieres un estilo ya hecho: `formato.dateStyle = DateFormatter.Style.long` → "15 de octubre de 2026".

**Errores que te pueden salir:**
- Sale en inglés ("Thursday") → te faltó `formato.locale = Locale(identifier: "es_MX")`.
- Sale la hora también → con `dateStyle` pon `formato.timeStyle = DateFormatter.Style.none`.
- Lo que va entre comillas simples (`'de'`) es texto fijo. Sin ellas, `d` y `e` se interpretan como formato.

**¿Visto en clase?** ✅ Clase 3B. **En el repo:** `01_SwiftBasico/FechasYNumerosView.swift` → bloques 1 y 3.

---

## 10.4 Quiero que cada antojo tenga una fecha distinta en ModelData
🔎 fecha especifica, fecha distinta, Date(), hace dias, restar dias, sumar dias, DateComponents, byAdding, fecha fija, date from string

**El problema:** `Date()` siempre es **este momento**. Si los 10 antojos tienen `fecha: Date()`, todos tienen la misma fecha.

**Forma de clase (Clase 3B, sumar a una fecha):** una función que va "hacia atrás" X días. `Calendar.current.date(byAdding:to:)`
regresa un **opcional** (la lámina lo dice), por eso el `if let`.

```swift
func fechaHaceDias(dias: Int) -> Date {
    var dateComponent = DateComponents()
    dateComponent.day = -dias

    if let fecha = Calendar.current.date(byAdding: dateComponent, to: Date()) {
        return fecha
    }
    return Date()
}
```

Uso: `fecha: fechaHaceDias(dias: 15)`. Para meses: `dateComponent.month = -2`.

**Otra forma (⚠️ no vista en clase): una fecha exacta desde texto.** `date(from:)` convierte texto → fecha usando el
`dateFormat`. Regresa opcional; `?? Date()` significa "si no se pudo, usa hoy". **Ojo:** el formateador debe crearse
**dentro** de la función (no suelto en el archivo) y **sí** debe tener `dateFormat`; si no, todas salen con la fecha de hoy sin avisarte.

```swift
func crearFecha(texto: String) -> Date {
    let formato = DateFormatter()
    formato.dateFormat = "dd/MM/yyyy"
    if let fecha = formato.date(from: texto) {
        return fecha
    }
    return Date()
}
```

**¿Visto en clase?** ✅ forma 1 (Clase 3B). ⚠️ forma 2.

---

## 10.5 Quiero mostrar un precio en pesos y una fecha bonita
🔎 pesos, moneda, currency, MXN, precio, dinero, $185.00, formato numero, decimales, specifier, fecha bonita

| Quiero | Código | Sale |
|---|---|---|
| Precio en pesos dentro de un `Text` | `Text(antojo.precio, format: .currency(code: "MXN"))` | $185.00 |
| Precio en pesos dentro de un String | `antojo.precio.formatted(.currency(code: "MXN"))` | "$185.00" |
| 1 decimal | `Text("\(promedio, specifier: "%.1f")")` | 3.9 |
| 2 decimales como String | `promedio.formatted(.number.precision(.fractionLength(2)))` | "3.90" |
| Sin decimales | `Text("\(Int(valor))")` | 4 |
| Año sin coma | `Text("\(anio, format: .number.grouping(.never))")` | 2026 |
| Fecha larga | `antojo.fechaTexto` (propiedad calculada del struct, receta 10.1) | 15 de octubre de 2026 |

**¿Visto en clase?** ✅ Clase 3B. **En el repo:** `01_SwiftBasico/FechasYNumerosView.swift` → bloques 6 y 7.

---

## 10.6 Quiero 3 tarjetas del mismo tamaño con un componente
🔎 tarjetas iguales, mismo ancho, 3 cuadros, resumen, tiles, componente reutilizable, dividir en 3, hstack igual

**Necesitas:** `Components/TarjetaResumen.swift` (receta 10.2.2).

**Pasos:**
1. Crea el componente con parámetros (`var icono`, `var valor`, `var titulo`). Dentro, `.frame(maxWidth: .infinity)`
   **antes** de `.background`: cada tarjeta pide todo el ancho y el `HStack` lo reparte en partes iguales.
2. Úsalo 3 veces dentro de un `HStack(spacing: 12)`:

```swift
HStack(spacing: 12) {
    TarjetaResumen(icono: "fork.knife", valor: "\(antojos.count)", titulo: "Antojos")
    TarjetaResumen(icono: "heart.fill", valor: "\(totalFavoritos)", titulo: "Favoritos")
    TarjetaResumen(icono: "star.fill", valor: promedio.formatted(.number.precision(.fractionLength(1))), titulo: "Promedio")
}
```

Los valores (`totalFavoritos`, `promedio`) son propiedades calculadas con `for` (receta 10.19).

**Errores que te pueden salir:** las tarjetas salen de distinto ancho → el `.frame(maxWidth: .infinity)` falta o está
**después** del `.background` (entonces el fondo solo cubre el texto).

**¿Visto en clase?** ✅ Clase 5A (componentes), Clase 3 (stacks y frame). **En el repo:** `00_AppCompleta/Components/TarjetaResumenMascotas.swift`, `05_Layouts/PartesIgualesView.swift`.

---

## 10.7 Quiero una recomendación al azar con todos sus datos
🔎 aleatorio, random, al azar, sorpresa, recomendacion del dia, randomElement, generar recomendacion

**Pasos:**
1. Una variable opcional: `@State private var sorpresa: Antojo? = nil` (al principio no hay recomendación: `nil`).
2. El botón la llena con `randomElement()`, que regresa un opcional (si la lista estuviera vacía regresaría `nil`).

```swift
Button {
    sorpresa = antojos.randomElement()
} label: {
    Label("Recomendación sorpresa", systemImage: "sparkles")
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
}
.buttonStyle(.borderedProminent)
.tint(paletaPrimario)
```

3. Se muestra solo si ya hay una, con `if let`:

```swift
if let antojo = sorpresa {
    VStack(alignment: .leading, spacing: 8) {
        Text(antojo.nombre)
            .font(.title2)
            .bold()
            .foregroundStyle(paletaTexto)
        Text(antojo.descripcion)
            .foregroundStyle(paletaTextoSuave)
        FilaDato(etiqueta: "Categoría", valor: antojo.categoria)
        FilaDato(etiqueta: "Precio", valor: antojo.precio.formatted(.currency(code: "MXN")))
        FilaDato(etiqueta: "Calificación", valor: antojo.estrellas)
        FilaDato(etiqueta: "Registrado", valor: antojo.fechaTexto)
        FilaDato(etiqueta: "Favorito", valor: antojo.esFavorito ? "Sí" : "No")
    }
    .padding()
    .background(paletaSuperficie)
    .cornerRadius(12)
}
```

**Otra forma que vas a ver (tu tarea Movil02):** guardar una posición con `Int.random(in: 0..<antojos.count)` y mostrar
`antojos[indice]`. Funciona, pero truena si la lista está vacía; `randomElement()` + `if let` no truena.

**¿Visto en clase?** ✅ (skill: `lista.randomElement()`). **En el repo:** `01_SwiftBasico/ArreglosYCiclosView.swift` → bloque 5.

---

## 10.8 Quiero recomendar según el mes de nacimiento (idea de la tarea Movil02)
🔎 mes de nacimiento, recomendacion por mes, posicion, indice, picker meses, modulo, %

La tarea Movil02 sugería: "preguntar el mes de nacimiento y regresar el ITEM que coincida en la posición de la lista".
Enero = posición 0, febrero = 1… Si la lista tiene menos de 12, `%` (residuo) da la vuelta: con 10 antojos, noviembre (10) → 0.

```swift
struct RecomendacionPorMesView: View {
    var antojos: Array<Antojo>

    @State private var mes = 0
    @State private var recomendado: Antojo? = nil
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 16) {
            Text("¿En qué mes naciste?")
                .font(.title2)
                .bold()

            Picker(selection: $mes, label: Text("Mes")) {
                Text("Selecciona…").tag(0)
                Text("Enero").tag(1)
                Text("Febrero").tag(2)
                Text("Marzo").tag(3)
                Text("Abril").tag(4)
                Text("Mayo").tag(5)
                Text("Junio").tag(6)
                Text("Julio").tag(7)
                Text("Agosto").tag(8)
                Text("Septiembre").tag(9)
                Text("Octubre").tag(10)
                Text("Noviembre").tag(11)
                Text("Diciembre").tag(12)
            }
            .pickerStyle(.wheel)

            Button("Ver mi recomendación") {
                if mes == 0 {
                    showAlert.toggle()
                } else if antojos.isEmpty {
                    recomendado = nil
                } else {
                    let posicion = (mes - 1) % antojos.count
                    recomendado = antojos[posicion]
                }
            }
            .buttonStyle(.borderedProminent)
            .alert("Elige tu mes de nacimiento", isPresented: $showAlert) {
                Button("OK") {}
            }

            if let antojo = recomendado {
                Text(antojo.nombre)
                    .font(.title)
                    .bold()
                Text(antojo.descripcion)
                Text(antojo.estrellas)
            }
        }
        .padding()
    }
}
```

**¿Visto en clase?** ✅ Picker `.wheel` con tags (Clase 4), `%` (Clase 2).

---

## 10.9 Quiero un carrusel de imágenes
🔎 carrusel, carousel, deslizar fotos, galeria, paginas, page style, puntitos, indexViewStyle, swipe

Es un `TabView` con estilo de página (código de la lámina de la Clase 7):

```swift
struct CarruselAntojosView: View {
    var body: some View {
        TabView {
            Image("foto1")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Image("foto2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Image("foto3")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 430)
    }
}
```

**Errores:** no se ven los puntitos → falta `.indexViewStyle(.page(backgroundDisplayMode: .always))`. El carrusel ocupa
toda la pantalla → falta el `.frame(height:)` del `TabView`.

**¿Visto en clase?** ✅ Clase 7. **En el repo:** `07_TabView/CarruselView.swift` → bloque 1.

---

## 10.10 Quiero una lista con renglón componente y un detalle que modifique el elemento
🔎 lista editable, detalle, binding, favorito, toggle, cambiar dato, List($), $antojo, regresar, actualizar lista

**Pasos:**
1. La lista vive en un `@State` en la vista dueña (ContentView) y llega a la pantalla de lista como `@Binding`.
2. `List($antojos) { $antojo in … }`: con `$` cada renglón es un binding.
3. `NavigationLink { DetalleAntojoView(antojo: $antojo) } label: { AntojoRow(antojo: antojo) }`
   — al detalle **con `$`** (puede modificar), al renglón **sin `$`** (solo muestra).
4. En el detalle: `@Binding var antojo: Antojo` y controles ligados con `$antojo.esFavorito`.

Código completo: recetas 10.2.6 y 10.2.7.

**Errores que te pueden salir:**
- *"Cannot convert value of type 'Antojo' to expected argument type 'Binding<Antojo>'"* → al detalle le pasaste `antojo` sin `$`.
- *"Cannot find '$antojo' in scope"* → usaste `List(antojos) { antojo in` (sin `$`). Cambia a `List($antojos) { $antojo in`.
- En el `#Preview` del detalle: `DetalleAntojoView(antojo: .constant(cargarAntojos()[0]))`.

**¿Visto en clase?** ✅ Clase 6B (@Binding), Clase 10 (List). La lista con `$` va un poco más allá del ejemplo de clase (que es de solo lectura); explícalo así: "uso binding porque el detalle cambia el dato y quiero que se vea en la lista".
**En el repo:** `08_ModelosYListas/Views/ListaEditableView.swift` + `EditarJugadorView.swift`.

---

## 10.11 Quiero agregar un elemento con un formulario validado
🔎 agregar, nuevo, alta, registrar, formulario, append, sheet, guardar, validar, alerta, mensaje especifico, id nuevo

**Pasos:**
1. En la lista: `@State private var mostrarAgregar = false`, un botón que hace `mostrarAgregar.toggle()` y
   `.sheet(isPresented: $mostrarAgregar) { AgregarAntojoView(antojos: $antojos) }`.
2. En el formulario: un `@State` por campo, el precio **como texto** (`precioTexto`).
3. Una función `guardar()` con un `else if` por error. Si todo está bien: crea el antojo, `append` y `dismiss()`.
4. El `id` nuevo = el mayor + 1 (así nunca se repite, aunque borres):

```swift
func siguienteId() -> Int {
    var mayor = 0
    for antojo in antojos {
        if antojo.id > mayor {
            mayor = antojo.id
        }
    }
    return mayor + 1
}
```

```swift
func guardar() {
    campoEnFoco = false

    if nombre.isEmpty {
        alertMessage = "Escribe el nombre del antojo."
        showAlert.toggle()
    } else if descripcion.isEmpty {
        alertMessage = "Escribe una descripción."
        showAlert.toggle()
    } else if categoria.isEmpty {
        alertMessage = "Elige una categoría."
        showAlert.toggle()
    } else if precioTexto.isEmpty {
        alertMessage = "Escribe el precio."
        showAlert.toggle()
    } else if let precio = Double(precioTexto) {
        if precio <= 0 {
            alertMessage = "El precio debe ser mayor a 0."
            showAlert.toggle()
        } else {
            let nuevo = Antojo(id: siguienteId(), nombre: nombre, descripcion: descripcion,
                               categoria: categoria, imagen: "foto1", calificacion: calificacion,
                               precio: precio, fecha: Date(), esFavorito: esFavorito)
            antojos.append(nuevo)
            dismiss()
        }
    } else {
        alertMessage = "El precio debe ser un número, por ejemplo 150."
        showAlert.toggle()
    }
}
```

Código completo: receta 10.2.8.

**Errores que te pueden salir:**
- El formulario no se cierra → falta `dismiss()` después del `append`, o no declaraste `@Environment(\.dismiss) private var dismiss`.
- La alerta no sale → el `.alert(alertMessage, isPresented: $showAlert)` no está pegado a ninguna vista visible, o nunca hiciste `showAlert.toggle()`.
- *"Cannot use mutating member on immutable value"* al hacer `append` → la lista llegó sin `@Binding` (como `var` simple).

**¿Visto en clase?** ✅ alertas (Clase 3), `if let` (Clase 2), sheet (Clase 17), binding (6B). ⚠️ `.keyboardType(.decimalPad)`.

---

## 10.12 Quiero un botón para limpiar el formulario
🔎 limpiar, borrar campos, reset, resetear, vaciar formulario, clear

Una función que regresa cada `@State` a su valor inicial:

```swift
struct FormularioLimpiarView: View {
    @State private var nombre = ""
    @State private var precioTexto = ""
    @State private var categoria = ""
    @State private var esFavorito = false

    func limpiar() {
        nombre = ""
        precioTexto = ""
        categoria = ""
        esFavorito = false
    }

    var body: some View {
        VStack(spacing: 14) {
            TextField("Nombre", text: $nombre)
                .textFieldStyle(.roundedBorder)
            TextField("Precio", text: $precioTexto)
                .textFieldStyle(.roundedBorder)
            Picker(selection: $categoria, label: Text("Categoría")) {
                Text("Selecciona…").tag("")
                Text("Tacos").tag("Tacos")
                Text("Postres").tag("Postres")
            }
            Toggle("Favorito", isOn: $esFavorito)

            Button("Limpiar") {
                limpiar()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
```

---

## 10.13 Quiero esconder el teclado al tocar fuera
🔎 teclado, keyboard, esconder teclado, ocultar teclado, focus, FocusState, onTapGesture, dismiss keyboard

Tres pasos de la Clase 4: 1) `@FocusState private var campoEnFoco: Bool`, 2) `.focused($campoEnFoco)` en cada campo,
3) `campoEnFoco = false`. Para que sea "al tocar cualquier parte", el `.onTapGesture` va en el **Stack principal** (la profe lo dijo así).

```swift
struct TecladoRecetaView: View {
    @State private var texto = ""

    @FocusState private var campoEnFoco: Bool

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 16) {
                TextField("Escribe algo", text: $texto)
                    .textFieldStyle(.roundedBorder)
                    .focused($campoEnFoco)

                Button("Listo") {
                    campoEnFoco = false
                }
            }
            .padding()
        }
        .onTapGesture {
            campoEnFoco = false
        }
    }
}
```

**¿Visto en clase?** ✅ Clase 4 (lámina 19). **En el repo:** `03_ElementosUI/TextFieldsView.swift`.

---

## 10.14 Quiero un buscador que valide y me lleve a otra pantalla con resultados (Clase 6C)
🔎 buscador, validar y navegar, navigationDestination, isPresented, isValid, boton en lugar de navigationlink, pasar valores, resultados, presupuesto

**Pasos (los 3 de la lámina 6C):**
1. `@State private var isValid = false`.
2. Un `Button` (no `NavigationLink`) **dentro de un `NavigationStack`**. En su acción validas y pones `isValid = true` solo si todo está bien.
3. `.navigationDestination(isPresented: $isValid) { ResultadosView(...) }` **pegado al botón**, junto con el `.alert`.

```swift
Button {
    campoEnFoco = false
    if presupuestoTexto.isEmpty {
        isValid = false
        alertMessage = "Escribe tu presupuesto."
        showAlert.toggle()
    } else if let valor = Double(presupuestoTexto) {
        if valor <= 0 {
            isValid = false
            alertMessage = "El presupuesto debe ser mayor a 0."
            showAlert.toggle()
        } else if categoria.isEmpty {
            isValid = false
            alertMessage = "Elige una categoría."
            showAlert.toggle()
        } else {
            presupuesto = valor
            isValid = true
        }
    } else {
        isValid = false
        alertMessage = "El presupuesto debe ser un número, por ejemplo 150."
        showAlert.toggle()
    }
} label: {
    Label("Buscar", systemImage: "magnifyingglass")
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
}
.buttonStyle(.borderedProminent)
.tint(paletaPrimario)
.alert(alertMessage, isPresented: $showAlert) {
    Button("OK") {}
}
.navigationDestination(isPresented: $isValid) {
    ResultadosView(antojos: antojos, presupuesto: presupuesto, categoria: categoria)
}
```

La pantalla de resultados **recibe** los valores como `var` sin `private` ni `@State` (paso de valores de ida, Clase 6B)
y filtra con un `for`:

```swift
var resultados: Array<Antojo> {
    var lista = Array<Antojo>()
    for antojo in antojos {
        if antojo.categoria == categoria && antojo.precio <= presupuesto {
            lista.append(antojo)
        }
    }
    return lista
}
```

Código completo: recetas 10.2.9 y 10.2.10.

**Errores que te pueden salir:**
- No navega → el botón no está dentro de un `NavigationStack`, o nunca pones `isValid = true`.
- Navega aunque haya error → te faltó `isValid = false` en los errores, o el `else` final está mal.
- Guarda el valor convertido (`presupuesto = valor`) **antes** de `isValid = true`, si no, la otra pantalla recibe 0.

**¿Visto en clase?** ✅ Clase 6C (idéntico a la lámina), 6B. **En el repo:** `06_MultiplesPantallas/NavegacionConValidacionView.swift` → bloque 1.

---

## 10.15 Quiero un mensaje cuando la lista está vacía
🔎 lista vacia, sin resultados, no hay elementos, empty state, isEmpty, mensaje vacio

```swift
if resultados.isEmpty {
    VStack(spacing: 12) {
        Image(systemName: "fork.knife.circle")
            .font(.system(size: 60))
            .foregroundStyle(paletaSecundario)
        Text("No hay antojos de \(categoria) que cuesten \(presupuesto.formatted(.currency(code: "MXN"))) o menos.")
            .multilineTextAlignment(.center)
            .foregroundStyle(paletaTexto)
    }
    .padding()
} else {
    List(resultados) { antojo in
        AntojoRow(antojo: antojo)
    }
    .listStyle(.inset)
}
```

Un `if lista.isEmpty { mensaje } else { List … }`. El mensaje debe decir **qué pasó** y, si se puede, qué hacer (retroalimentación al usuario: punto de UI/UX).

---

## 10.16 Quiero una lista con buscador
🔎 buscar, search, buscador, filtrar por nombre, searchable, textfield buscar, contains, lowercased

**Forma sencilla (TextField + `for`):** una propiedad calculada que se rehace sola cada vez que cambia el texto.
`lowercased()` pasa todo a minúsculas para que "TACOS" encuentre "Tacos".

```swift
struct ListaConBuscadorView: View {
    var antojos: Array<Antojo>

    @State private var texto = ""

    var filtrados: Array<Antojo> {
        if texto.isEmpty {
            return antojos
        }
        var resultado = Array<Antojo>()
        for antojo in antojos {
            if antojo.nombre.lowercased().contains(texto.lowercased()) {
                resultado.append(antojo)
            }
        }
        return resultado
    }

    var body: some View {
        VStack {
            TextField("Buscar por nombre", text: $texto)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            if filtrados.isEmpty {
                Text("No hay antojos que se llamen así.")
                    .foregroundStyle(.gray)
                    .padding()
                Spacer()
            } else {
                List(filtrados) { antojo in
                    AntojoRow(antojo: antojo)
                }
                .listStyle(.inset)
            }
        }
    }
}
```

**Otra forma (⚠️ no vista en clase): `.searchable`**, la barra de búsqueda nativa. Necesita estar dentro de un `NavigationStack`.

```swift
struct ListaSearchableView: View {
    var antojos: Array<Antojo>

    @State private var texto = ""

    var filtrados: Array<Antojo> {
        if texto.isEmpty {
            return antojos
        }
        var resultado = Array<Antojo>()
        for antojo in antojos {
            if antojo.nombre.lowercased().contains(texto.lowercased()) {
                resultado.append(antojo)
            }
        }
        return resultado
    }

    var body: some View {
        NavigationStack {
            List(filtrados) { antojo in
                AntojoRow(antojo: antojo)
            }
            .listStyle(.inset)
            .navigationTitle("Antojos")
            .searchable(text: $texto, prompt: "Buscar por nombre")
        }
    }
}
```

**¿Visto en clase?** ⚠️ `.contains`, `.lowercased()`, `.searchable`. **En el repo:** `08_ModelosYListas/Views/ListaBuscarFiltrarView.swift`.

---

## 10.17 Quiero filtrar la lista por categoría
🔎 filtrar, filtro, categoria, segmented, solo tacos, todas, picker filtro

```swift
struct ListaFiltroCategoriaView: View {
    var antojos: Array<Antojo>

    @State private var categoriaElegida = "Todas"

    var filtrados: Array<Antojo> {
        var resultado = Array<Antojo>()
        for antojo in antojos {
            if categoriaElegida == "Todas" || antojo.categoria == categoriaElegida {
                resultado.append(antojo)
            }
        }
        return resultado
    }

    var body: some View {
        VStack {
            Picker(selection: $categoriaElegida, label: Text("Categoría")) {
                Text("Todas").tag("Todas")
                Text("Tacos").tag("Tacos")
                Text("Hamburguesas").tag("Hamburguesas")
                Text("Postres").tag("Postres")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Text("\(filtrados.count) antojos")
                .font(.caption)
                .foregroundStyle(.gray)

            List(filtrados) { antojo in
                AntojoRow(antojo: antojo)
            }
            .listStyle(.inset)
        }
    }
}
```

**¿Visto en clase?** ✅ Picker `.segmented` (Clase 4), `for` (Clase 2).

---

## 10.18 Quiero ordenar la lista (por nombre, precio o calificación)
🔎 ordenar, sort, sorted, de menor a mayor, mas barato primero, alfabetico, orden

`sorted { a, b in a.precio < b.precio }` regresa una **copia ordenada** (no cambia la original).
`<` = de menor a mayor; `>` = de mayor a menor.

```swift
struct ListaOrdenadaView: View {
    var antojos: Array<Antojo>

    @State private var orden = 1

    var ordenados: Array<Antojo> {
        if orden == 1 {
            return antojos.sorted { a, b in a.nombre < b.nombre }
        } else if orden == 2 {
            return antojos.sorted { a, b in a.precio < b.precio }
        } else {
            return antojos.sorted { a, b in a.calificacion > b.calificacion }
        }
    }

    var body: some View {
        VStack {
            Picker(selection: $orden, label: Text("Ordenar por")) {
                Text("Nombre").tag(1)
                Text("Precio").tag(2)
                Text("Calificación").tag(3)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            List(ordenados) { antojo in
                AntojoRow(antojo: antojo)
            }
            .listStyle(.inset)
        }
    }
}
```

**¿Visto en clase?** ⚠️ `sorted` con closure. Explícalo: "le paso una regla que compara dos elementos y regresa true si el primero va antes".

---

## 10.19 Quiero contar favoritos, sacar promedio, porcentaje, suma, el más caro y el más barato
🔎 contar, total, cuantos, promedio, average, porcentaje, percent, suma, sum, mas caro, maximo, max, mas barato, minimo, min, estadisticas

Todo con `for` (lo que se vio en clase). Ojo con **dividir entre 0** cuando la lista está vacía.

```swift
struct CalculosAntojosView: View {
    var antojos: Array<Antojo>

    var totalFavoritos: Int {
        var total = 0
        for antojo in antojos {
            if antojo.esFavorito {
                total += 1
            }
        }
        return total
    }

    var promedioCalificacion: Double {
        if antojos.isEmpty {
            return 0
        }
        var suma = 0
        for antojo in antojos {
            suma += antojo.calificacion
        }
        return Double(suma) / Double(antojos.count)
    }

    var porcentajeFavoritos: Double {
        if antojos.isEmpty {
            return 0
        }
        return Double(totalFavoritos) / Double(antojos.count) * 100
    }

    var sumaPrecios: Double {
        var suma = 0.0
        for antojo in antojos {
            suma += antojo.precio
        }
        return suma
    }

    var masCaro: Antojo? {
        var mayor: Antojo? = nil
        for antojo in antojos {
            if let actual = mayor {
                if antojo.precio > actual.precio {
                    mayor = antojo
                }
            } else {
                mayor = antojo
            }
        }
        return mayor
    }

    var masBarato: Antojo? {
        var menor: Antojo? = nil
        for antojo in antojos {
            if let actual = menor {
                if antojo.precio < actual.precio {
                    menor = antojo
                }
            } else {
                menor = antojo
            }
        }
        return menor
    }

    func contar(categoria: String) -> Int {
        var total = 0
        for antojo in antojos {
            if antojo.categoria == categoria {
                total += 1
            }
        }
        return total
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Favoritos: \(totalFavoritos)")
            Text("Promedio: \(promedioCalificacion, specifier: "%.1f") estrellas")
            Text("Favoritos: \(porcentajeFavoritos, specifier: "%.0f")%")
            Text("Gasto total: \(sumaPrecios.formatted(.currency(code: "MXN")))")
            Text("Tacos registrados: \(contar(categoria: "Tacos"))")

            if let caro = masCaro {
                Text("El más caro: \(caro.nombre) (\(caro.precio.formatted(.currency(code: "MXN"))))")
            }
            if let barato = masBarato {
                Text("El más barato: \(barato.nombre) (\(barato.precio.formatted(.currency(code: "MXN"))))")
            }
        }
        .padding()
    }
}
```

| Quiero | Idea |
|---|---|
| Contar los que cumplen algo | `var total = 0` + `for` + `if condición { total += 1 }` |
| Promedio | suma ÷ cantidad, convertidos a `Double`: `Double(suma) / Double(lista.count)` |
| Porcentaje | `Double(parte) / Double(total) * 100` |
| El mayor | guarda el primero y en el `for` cambia si encuentras uno mayor |
| Contar por categoría | función con parámetro: `contar(categoria: "Tacos")` |

**Errores:** el promedio sale entero (3 en vez de 3.6) → dividiste dos `Int`. Convierte a `Double` antes de dividir.

---

## 10.20 Quiero las estadísticas: barras por categoría, dona de favoritos y ProgressView
🔎 graficas, charts, barras, barmark, dona, pastel, sectormark, progressview, porcentaje, conteo por categoria, estadisticas

**Necesitas:** `import Charts`.

1. Un struct `Identifiable` para los datos de la gráfica y una propiedad calculada que **cuenta con `for`** a partir de
   la lista (no datos fijos: así se actualiza sola cuando agregas antojos).

```swift
struct ConteoAntojos: Identifiable {
    var id: String { return nombre }
    var nombre: String
    var cantidad: Int
}
```

```swift
var conteoPorCategoria: Array<ConteoAntojos> {
    var resultado = Array<ConteoAntojos>()
    for categoria in categoriasAntojos {
        var cantidad = 0
        for antojo in antojos {
            if antojo.categoria == categoria {
                cantidad += 1
            }
        }
        resultado.append(ConteoAntojos(nombre: categoria, cantidad: cantidad))
    }
    return resultado
}
```

2. Barras (comparar categorías — Clase 15):

```swift
Chart(conteoPorCategoria) { conteo in
    BarMark(
        x: .value("Categoría", conteo.nombre),
        y: .value("Cantidad", conteo.cantidad)
    )
    .foregroundStyle(by: .value("Categoría", conteo.nombre))
}
.chartForegroundStyleScale([
    "Tacos": paletaPrimario,
    "Hamburguesas": paletaSecundario,
    "Postres": paletaTextoSuave
])
.frame(height: 220)
```

3. Dona (partes de un total). `innerRadius: .ratio(0.5)` es el hueco:

```swift
Chart(favoritosVsNo) { dato in
    SectorMark(
        angle: .value("Cantidad", dato.cantidad),
        innerRadius: .ratio(0.5)
    )
    .foregroundStyle(by: .value("Tipo", dato.nombre))
}
.chartForegroundStyleScale([
    "Favoritos": paletaPrimario,
    "No favoritos": paletaSecundario
])
.chartLegend(position: .bottom, alignment: .center)
.frame(height: 220)
```

4. Barra de avance (lámina de la Clase 15):

```swift
ProgressView(value: porcentajeFavoritos, total: 100)
    .scaleEffect(x: 1, y: 3)
    .tint(paletaPrimario)

Text("\(porcentajeFavoritos, specifier: "%.0f")% de tus antojos son favoritos")
    .foregroundStyle(paletaTextoSuave)
```

**Por qué estas gráficas:** barras = comparar categorías; pastel/dona = partes de un total; **nunca líneas para
categorías** (las líneas son para cosas en el tiempo). La profe lo dijo en la Clase 15.

**¿Visto en clase?** ✅ Clase 15. **En el repo:** `09_Graficas/GraficaDesdeListaView.swift`, `09_Graficas/PastelYDonaView.swift` → bloques 2 y 3.

---

## 10.21 Quiero cambiar el color o el ícono según un valor
🔎 color segun valor, condicional, ternario, switch color, icono condicional, rojo verde, semaforo

Dos formas: el **ternario** (`condición ? siTrue : siFalse`) para dos opciones, y una **propiedad calculada con `switch`**
para varias.

```swift
struct CalificacionColorView: View {
    var calificacion: Int

    var colorCalificacion: Color {
        switch calificacion {
        case 5:
            return .green
        case 3...4:
            return .orange
        default:
            return .red
        }
    }

    var textoCalificacion: String {
        if calificacion >= 4 {
            return "Recomendado"
        } else if calificacion == 3 {
            return "Está bien"
        } else {
            return "No lo recomiendo"
        }
    }

    var body: some View {
        HStack {
            Image(systemName: calificacion >= 4 ? "hand.thumbsup.fill" : "hand.thumbsdown.fill")
            Text(textoCalificacion)
        }
        .font(.headline)
        .foregroundStyle(.white)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(colorCalificacion)
        .cornerRadius(20)
    }
}
```

**¿Visto en clase?** ✅ switch y ternario (Clase 2). **En el repo:** `01_SwiftBasico/FuncionesYCondicionesView.swift`.

---

## 10.22 Quiero una foto de perfil de la galería o de la cámara
🔎 foto de perfil, photospicker, camara, camarapicker, galeria, uiimage, circulo, perfil, imagen del usuario

**Necesitas:** `import PhotosUI`, `CamaraPicker.swift` (el de la profe, sin cambios) y el permiso de cámara (10.42).

**Pasos (Clase 17):**
1. `@State private var selectedItem: PhotosPickerItem? = nil` (lo que eligió) y `@State private var selectedImage: UIImage? = nil` (la imagen ya convertida).
2. `PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) { … }`.
3. `.onChange(of: selectedItem) { oldItem, newItem in Task { … loadTransferable … } }` convierte a `UIImage`.
4. Cámara: `.sheet(isPresented: $showCamara) { CamaraPicker(selectedImageFromCamera: $selectedImage) }` — llena **la misma** variable.
5. Mostrar con `if let` + `Image(uiImage:)`:

```swift
if let selectedImageBien = selectedImage {
    Image(uiImage: selectedImageBien)
        .resizable(resizingMode: .stretch)
        .aspectRatio(contentMode: .fill)
        .frame(width: 150, height: 150)
        .clipShape(.circle)
        .overlay {
            Circle().stroke(paletaPrimario, lineWidth: 5)
        }
} else {
    Image(systemName: "person.crop.circle.fill")
        .resizable(resizingMode: .stretch)
        .aspectRatio(contentMode: .fit)
        .frame(width: 150)
        .foregroundStyle(paletaSecundario)
}
```

Código completo: receta 10.2.12.

**Errores que te pueden salir:**
- *"Cannot convert value of type 'UIImage?'"* en `Image(uiImage:)` → le pasaste el opcional. Usa `if let`.
- La app truena al abrir la cámara → falta el permiso.
- En el simulador "no pasa nada" con la cámara → el simulador no tiene cámara. Por eso el ejemplo revisa
  `UIImagePickerController.isSourceTypeAvailable(.camera)` (⚠️) y muestra una alerta.
- Warning de Swift 6 sobre MainActor al poner colores de tu paleta **dentro** de las llaves del PhotosPicker → pon
  `.buttonStyle` y `.tint` **después** del PhotosPicker, como en el ejemplo.

**¿Visto en clase?** ✅ Clase 17. **En el repo:** `10_FotosYCamara/FotoPerfilView.swift`.

---

## 10.23 Quiero una pantalla "Acerca de mí"
🔎 acerca de mi, perfil, presentacion, about me, datos personales, matricula, tarjeta de perfil

```swift
struct AcercaDeMiView: View {
    let nombre = "Tu nombre completo"
    let matricula = "A00000000"
    let carrera = "Ingeniería en Tecnologías Computacionales"
    let frase = "Los mejores tacos son los de la esquina."

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {
                    Image("perfil")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .clipShape(.circle)
                        .overlay {
                            Circle().stroke(paletaPrimario, lineWidth: 5)
                        }
                        .shadow(color: paletaPrimario, radius: 5)

                    Text(nombre)
                        .font(.title)
                        .bold()
                        .foregroundStyle(paletaTexto)
                        .multilineTextAlignment(.center)

                    Text(carrera)
                        .foregroundStyle(paletaTextoSuave)
                        .multilineTextAlignment(.center)

                    Text("“\(frase)”")
                        .italic()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(paletaSuperficie)
                        .cornerRadius(12)

                    VStack(spacing: 10) {
                        FilaDato(etiqueta: "Matrícula", valor: matricula)
                        Divider()
                        FilaDato(etiqueta: "Campus", valor: "Monterrey")
                        Divider()
                        FilaDato(etiqueta: "Semestre", valor: "5to")
                    }
                    .padding()
                    .background(paletaSuperficie)
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Acerca de mí")
    }
}
```

**Necesitas:** una imagen `perfil` en Assets y `FilaDato` (10.2.3). **En el repo:** `02_PrimeraApp/TarjetaPerfilView.swift`.

---

## 10.24 Quiero un login antes de entrar a la app (sin NavigationStack dentro de otro)
🔎 login, iniciar sesion, usuario contraseña, entrar, pantalla de inicio, securefield, sesion, antes del tabview

**El problema:** si el login navega con `NavigationLink` a un `TabView` cuyas pestañas tienen `NavigationStack`, quedan
**stacks anidados** (dos barras, flechas raras).

**La solución:** una vista raíz con un `if`. Mientras no haya sesión muestra el login; cuando el login pone
`sesionIniciada = true` (por `@Binding`), muestra el `TabView`. No hay navegación, se **reemplaza** la pantalla.

```swift
struct RaizConLoginView: View {
    @State private var sesionIniciada = false

    var body: some View {
        if sesionIniciada {
            ContentView()
        } else {
            LoginAntojosView(sesionIniciada: $sesionIniciada)
        }
    }
}
```

```swift
struct LoginAntojosView: View {
    @Binding var sesionIniciada: Bool

    @State private var usuario = ""
    @State private var contrasena = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "fork.knife.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(paletaPrimario)

                Text("Mis Antojos")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(paletaTexto)

                TextField("Usuario", text: $usuario)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .focused($campoEnFoco)

                SecureField("Contraseña", text: $contrasena)
                    .textFieldStyle(.roundedBorder)
                    .focused($campoEnFoco)

                Button {
                    campoEnFoco = false
                    if usuario.isEmpty {
                        alertMessage = "Escribe tu usuario."
                        showAlert.toggle()
                    } else if contrasena.isEmpty {
                        alertMessage = "Escribe tu contraseña."
                        showAlert.toggle()
                    } else if usuario != "admin" || contrasena != "1234" {
                        alertMessage = "Usuario o contraseña incorrectos."
                        showAlert.toggle()
                    } else {
                        sesionIniciada = true
                    }
                } label: {
                    Text("Entrar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(paletaPrimario)
                .alert(alertMessage, isPresented: $showAlert) {
                    Button("OK") {}
                }
            }
            .padding(30)
        }
        .onTapGesture {
            campoEnFoco = false
        }
    }
}
```

En `TuAppApp.swift` pon `RaizConLoginView()` en lugar de `ContentView()`.

**¿Visto en clase?** ✅ validación con alertas, `@Binding`. ⚠️ `SecureField`, `.textInputAutocapitalization`.
Si te piden el login **con navegación** (patrón 6C), usa `06_MultiplesPantallas/LoginView.swift`.

---

## 10.25 Quiero una bienvenida (onboarding) con páginas antes de la app
🔎 onboarding, bienvenida, intro, tutorial, paginas, comenzar, primera vez, walkthrough

Mismo truco que el login: una raíz con `if`.

```swift
struct RaizConOnboardingView: View {
    @State private var terminoBienvenida = false

    var body: some View {
        if terminoBienvenida {
            ContentView()
        } else {
            OnboardingAntojosView(terminoBienvenida: $terminoBienvenida)
        }
    }
}
```

```swift
struct OnboardingAntojosView: View {
    @Binding var terminoBienvenida: Bool

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            TabView {
                VStack(spacing: 16) {
                    Image(systemName: "fork.knife")
                        .font(.system(size: 80))
                        .foregroundStyle(paletaPrimario)
                    Text("Guarda tus antojos")
                        .font(.title)
                        .bold()
                    Text("Registra los lugares de Monterrey que más te gustan.")
                        .multilineTextAlignment(.center)
                }
                .padding(30)

                VStack(spacing: 16) {
                    Image(systemName: "chart.bar.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(paletaPrimario)
                    Text("Ve tus estadísticas")
                        .font(.title)
                        .bold()
                    Text("Descubre qué categoría se te antoja más.")
                        .multilineTextAlignment(.center)
                }
                .padding(30)

                VStack(spacing: 16) {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(paletaPrimario)
                    Text("¿Listo?")
                        .font(.title)
                        .bold()
                    Button {
                        terminoBienvenida = true
                    } label: {
                        Text("Comenzar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(paletaPrimario)
                }
                .padding(30)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}
```

**En el repo:** `07_TabView/OnboardingView.swift`.

---

## 10.26 Quiero un menú principal con botones grandes que lleven a distintas pantallas
🔎 menu principal, home, botones grandes, cuadricula de botones, navegar a varias pantallas, dashboard de opciones

`NavigationLink` con un componente como `label`. Cada botón mide lo mismo por `.frame(maxWidth: .infinity)`.

```swift
struct MenuPrincipalAntojosView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                paletaFondo
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Text("¿Qué quieres hacer?")
                        .font(.title2)
                        .foregroundStyle(paletaTextoSuave)

                    HStack(spacing: 16) {
                        NavigationLink {
                            ListaFiltroCategoriaView(antojos: cargarAntojos())
                        } label: {
                            BotonMenu(icono: "list.bullet", titulo: "Ver antojos")
                        }
                        NavigationLink {
                            RecomendacionPorMesView(antojos: cargarAntojos())
                        } label: {
                            BotonMenu(icono: "sparkles", titulo: "Recomendación")
                        }
                    }

                    HStack(spacing: 16) {
                        NavigationLink {
                            CalculadoraView()
                        } label: {
                            BotonMenu(icono: "plus.forwardslash.minus", titulo: "Calculadora")
                        }
                        NavigationLink {
                            AcercaDeMiView()
                        } label: {
                            BotonMenu(icono: "person.fill", titulo: "Acerca de mí")
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Mis Antojos")
        }
    }
}

struct BotonMenu: View {
    var icono: String
    var titulo: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icono)
                .font(.largeTitle)
            Text(titulo)
                .font(.headline)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(paletaPrimario)
        .cornerRadius(16)
    }
}
```

**En el repo:** `06_MultiplesPantallas/MenuPrincipalView.swift`.

---

## 10.27 Quiero cambiar de pestaña con un botón
🔎 cambiar pestaña, cambiar tab, ir a otra pestaña, selection, tag, tabview selection, boton cambia tab

⚠️ No visto en clase. El `TabView` recibe `selection: $pestana`, cada pestaña lleva `.tag(número)`, y un botón cambia el número.

```swift
struct ContentView: View {
    @State private var antojos = cargarAntojos()
    @State private var pestana = 1

    var body: some View {
        TabView(selection: $pestana) {
            InicioConBotonView(pestana: $pestana)
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }
                .tag(1)

            ListaAntojosView(antojos: $antojos)
                .tabItem {
                    Label("Lista", systemImage: "list.bullet")
                }
                .tag(2)
        }
        .tint(paletaPrimario)
    }
}
```

```swift
struct InicioConBotonView: View {
    @Binding var pestana: Int

    var body: some View {
        VStack(spacing: 20) {
            Text("¡Bienvenido!")
                .font(.largeTitle)
                .bold()

            Button {
                pestana = 2
            } label: {
                Text("Ver mis antojos")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)
            .tint(paletaPrimario)
        }
        .padding()
    }
}
```

**En el repo:** `07_TabView/TabSeleccionView.swift`, `00_AppCompleta/Views/AppCompletaView.swift`.

---

## 10.28 Quiero una calculadora (texto → número → operación → resultado)
🔎 calculadora, sumar, restar, multiplicar, dividir, operacion, convertir texto a numero, Double(texto), resultado

Los `TextField` siempre dan **texto**. Para hacer cuentas lo conviertes con `Double(texto)`, que regresa opcional (si
escriben "hola" da `nil`). Por eso el `if let`. Y valida dividir entre 0.

```swift
struct CalculadoraView: View {
    @State private var numero1Texto = ""
    @State private var numero2Texto = ""
    @State private var operacion = "+"
    @State private var resultado: Double? = nil

    @State private var showAlert = false
    @State private var alertMessage = ""

    @FocusState private var campoEnFoco: Bool

    func calcular() {
        campoEnFoco = false

        if numero1Texto.isEmpty || numero2Texto.isEmpty {
            alertMessage = "Escribe los dos números."
            showAlert.toggle()
        } else if let numero1 = Double(numero1Texto), let numero2 = Double(numero2Texto) {
            if operacion == "+" {
                resultado = numero1 + numero2
            } else if operacion == "-" {
                resultado = numero1 - numero2
            } else if operacion == "×" {
                resultado = numero1 * numero2
            } else {
                if numero2 == 0 {
                    alertMessage = "No se puede dividir entre 0."
                    showAlert.toggle()
                } else {
                    resultado = numero1 / numero2
                }
            }
        } else {
            alertMessage = "Solo se pueden escribir números."
            showAlert.toggle()
        }
    }

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            VStack(spacing: 16) {
                TextField("Primer número", text: $numero1Texto)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($campoEnFoco)

                Picker(selection: $operacion, label: Text("Operación")) {
                    Text("+").tag("+")
                    Text("-").tag("-")
                    Text("×").tag("×")
                    Text("÷").tag("÷")
                }
                .pickerStyle(.segmented)

                TextField("Segundo número", text: $numero2Texto)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($campoEnFoco)

                Button {
                    calcular()
                } label: {
                    Text("Calcular")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(paletaPrimario)

                if let valor = resultado {
                    Text("Resultado: \(valor, specifier: "%.2f")")
                        .font(.title)
                        .bold()
                        .foregroundStyle(paletaTexto)
                }

                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            campoEnFoco = false
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {}
        }
        .navigationTitle("Calculadora")
    }
}
```

**¿Visto en clase?** ✅ Clase 2 (opcionales, `if let`), Clase 4 (Picker). ⚠️ `.keyboardType`.

---

## 10.29 Quiero un convertidor de moneda con Picker
🔎 convertidor, convertir, dolares, euros, tipo de cambio, moneda, conversion, unidades

`.onChange(of: moneda) { oldValue, newValue in … }` borra el resultado viejo cuando cambias de moneda.

```swift
struct ConvertidorView: View {
    @State private var pesosTexto = ""
    @State private var moneda = "USD"
    @State private var resultado = ""

    @State private var showAlert = false
    @State private var alertMessage = ""

    var tipoDeCambio: Double {
        if moneda == "USD" {
            return 18.5
        } else if moneda == "EUR" {
            return 20.1
        } else {
            return 0.12
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("Convertidor de pesos")
                .font(.title)
                .bold()

            TextField("Cantidad en pesos", text: $pesosTexto)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)

            Picker(selection: $moneda, label: Text("Moneda")) {
                Text("Dólares").tag("USD")
                Text("Euros").tag("EUR")
                Text("Yenes").tag("JPY")
            }
            .pickerStyle(.segmented)
            .onChange(of: moneda) { oldValue, newValue in
                resultado = ""
            }

            Button("Convertir") {
                if let pesos = Double(pesosTexto) {
                    let convertido = pesos / tipoDeCambio
                    resultado = convertido.formatted(.currency(code: moneda))
                } else {
                    alertMessage = "Escribe una cantidad válida, por ejemplo 500."
                    showAlert.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK") {}
            }

            if !resultado.isEmpty {
                Text(resultado)
                    .font(.largeTitle)
                    .bold()
            }

            Spacer()
        }
        .padding()
    }
}
```

---

## 10.30 Quiero una calculadora de IMC
🔎 imc, indice de masa corporal, peso estatura, clasificacion, switch rangos, bmi

`switch` con **rangos** (`..<18.5`, `18.5..<25`) para clasificar.

```swift
struct IMCRecetaView: View {
    @State private var pesoTexto = ""
    @State private var estaturaTexto = ""
    @State private var imc = 0.0

    @State private var showAlert = false
    @State private var alertMessage = ""

    var clasificacion: String {
        switch imc {
        case 0:
            return ""
        case ..<18.5:
            return "Bajo peso"
        case 18.5..<25:
            return "Peso normal"
        case 25..<30:
            return "Sobrepeso"
        default:
            return "Obesidad"
        }
    }

    var colorClasificacion: Color {
        switch imc {
        case 18.5..<25:
            return .green
        case 25..<30:
            return .orange
        default:
            return .red
        }
    }

    func calcular() {
        if pesoTexto.isEmpty || estaturaTexto.isEmpty {
            alertMessage = "Escribe tu peso y tu estatura."
            showAlert.toggle()
        } else if let peso = Double(pesoTexto), let estatura = Double(estaturaTexto) {
            if peso <= 0 || estatura <= 0 {
                alertMessage = "El peso y la estatura deben ser mayores a 0."
                showAlert.toggle()
            } else {
                imc = peso / (estatura * estatura)
            }
        } else {
            alertMessage = "Usa solo números. Ejemplo: 70 y 1.75"
            showAlert.toggle()
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("Calculadora de IMC")
                .font(.title)
                .bold()

            TextField("Peso en kg (ej. 70)", text: $pesoTexto)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)

            TextField("Estatura en metros (ej. 1.75)", text: $estaturaTexto)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)

            Button("Calcular") {
                calcular()
            }
            .buttonStyle(.borderedProminent)
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK") {}
            }

            if imc > 0 {
                Text("Tu IMC es \(imc, specifier: "%.1f")")
                    .font(.title2)
                Text(clasificacion)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(colorClasificacion)
                    .cornerRadius(20)
            }

            Spacer()
        }
        .padding()
    }
}
```

**En el repo:** `01_SwiftBasico/CalculadoraIMCView.swift`.

---

## 10.31 Quiero elegir un número con Slider o Stepper
🔎 slider, stepper, elegir numero, rango, cantidad, mas menos, barra deslizable

`Slider` da un `Double` (forma de la Clase 4 con `in:` y `onEditingChanged:`); `step: 10` lo hace avanzar de 10 en 10 (⚠️).
`Stepper` (⚠️) da botones − y +.

```swift
struct ElegirNumeroView: View {
    @State private var presupuesto = 150.0
    @State private var personas = 2

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Presupuesto: \(presupuesto.formatted(.currency(code: "MXN")))")
                .font(.headline)

            Slider(value: $presupuesto, in: 0 ... 500, step: 10,
                   onEditingChanged: { editing in
                   })
                .tint(paletaPrimario)

            Stepper("Personas: \(personas)", value: $personas, in: 1 ... 10)

            Text("Por persona: \((presupuesto / Double(personas)).formatted(.currency(code: "MXN")))")
                .foregroundStyle(.gray)
        }
        .padding()
    }
}
```

---

## 10.32 Quiero una ventana (sheet) que me regrese un valor elegido
🔎 sheet, modal, ventana emergente, regresar valor, elegir y volver, binding sheet

Igual que la cámara: la hija recibe un `@Binding`, lo cambia y se cierra con `dismiss()`.

```swift
struct ElegirCategoriaPadreView: View {
    @State private var categoria = ""
    @State private var mostrarSheet = false

    var body: some View {
        VStack(spacing: 16) {
            Text(categoria.isEmpty ? "Sin categoría" : "Elegiste: \(categoria)")
                .font(.title2)

            Button("Elegir categoría") {
                mostrarSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $mostrarSheet) {
            ElegirCategoriaSheetView(categoria: $categoria)
        }
    }
}
```

```swift
struct ElegirCategoriaSheetView: View {
    @Binding var categoria: String

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text("¿Qué se te antoja?")
                .font(.title)
                .bold()

            Button("Tacos") {
                categoria = "Tacos"
                dismiss()
            }
            Button("Hamburguesas") {
                categoria = "Hamburguesas"
                dismiss()
            }
            Button("Postres") {
                categoria = "Postres"
                dismiss()
            }
        }
        .buttonStyle(.bordered)
        .padding()
    }
}
```

**En el repo:** `06_MultiplesPantallas/SheetView.swift` → bloque 2.

---

## 10.33 Quiero borrar con confirmación (y borrar deslizando)
🔎 borrar, eliminar, delete, ondelete, swipe, deslizar, confirmar, seguro que quieres, alerta destructiva, removeAll

⚠️ `ForEach` + `.onDelete` (deslizar para borrar) y `role: .destructive` no se vieron en clase.

```swift
struct ListaConBorrarView: View {
    @Binding var antojos: Array<Antojo>

    @State private var showConfirmacion = false

    var body: some View {
        NavigationStack {
            VStack {
                if antojos.isEmpty {
                    Text("Ya no tienes antojos registrados.")
                        .foregroundStyle(.gray)
                        .padding()
                    Spacer()
                } else {
                    List {
                        ForEach(antojos) { antojo in
                            AntojoRow(antojo: antojo)
                        }
                        .onDelete { posiciones in
                            antojos.remove(atOffsets: posiciones)
                        }
                    }
                    .listStyle(.inset)
                }

                Button {
                    showConfirmacion.toggle()
                } label: {
                    Text("Borrar todos")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .padding()
                .disabled(antojos.isEmpty)
            }
            .navigationTitle("Borrar")
            .alert("¿Borrar todos los antojos?", isPresented: $showConfirmacion) {
                Button("Cancelar", role: .cancel) {}
                Button("Borrar", role: .destructive) {
                    antojos.removeAll()
                }
            } message: {
                Text("Esta acción no se puede deshacer.")
            }
        }
    }
}
```

---

## 10.34 Quiero dividir la pantalla en partes iguales
🔎 dividir pantalla, mitades, mitad, partes iguales, columnas, renglones, cuadricula, 2x2, grid, espacios iguales

**La regla:** cada hijo con `.frame(maxWidth: .infinity, maxHeight: .infinity)` pide todo el espacio; el stack lo
**reparte en partes iguales**. `spacing: 0` = pegados.

Dos mitades (arriba/abajo):

```swift
struct MitadesRecetaView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Mitad de arriba")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(paletaSuperficie)

            Text("Mitad de abajo")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(paletaSecundario)
        }
        .ignoresSafeArea()
    }
}
```

Tres columnas:

```swift
struct TresColumnasRecetaView: View {
    var body: some View {
        HStack(spacing: 8) {
            Text("1")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(paletaSuperficie)
            Text("2")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(paletaSecundario)
            Text("3")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(paletaSuperficie)
        }
        .frame(height: 120)
        .padding()
    }
}
```

Cuadrícula 2x2:

```swift
struct CuadriculaRecetaView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Text("Arriba izquierda")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(paletaSuperficie)
                Text("Arriba derecha")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(paletaSecundario)
            }
            HStack(spacing: 8) {
                Text("Abajo izquierda")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(paletaSecundario)
                Text("Abajo derecha")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(paletaSuperficie)
            }
        }
        .padding()
    }
}
```

**En el repo:** `05_Layouts/MitadesView.swift`, `05_Layouts/PartesIgualesView.swift`, `05_Layouts/CuadriculaView.swift`.

---

## 10.35 Quiero una imagen circular con borde y sombra
🔎 imagen circular, circulo, foto redonda, borde, sombra, clipShape circle, overlay stroke, shadow

Patrón de la Clase 5A (PokeImagenView):

```swift
struct ImagenCircularReceta: View {
    var nombre: String
    var ancho: CGFloat

    var body: some View {
        Image(nombre)
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: ancho)
            .clipShape(.circle)
            .overlay {
                Circle().stroke(paletaPrimario, lineWidth: 5)
            }
            .shadow(color: paletaPrimario, radius: 5)
    }
}
```

---

## 10.36 Quiero un dashboard (resumen con tarjetas, gráfica y lista)
🔎 dashboard, resumen, panel, inicio con datos, tablero

```swift
struct DashboardAntojosView: View {
    var antojos: Array<Antojo>

    var favoritos: Array<Antojo> {
        var resultado = Array<Antojo>()
        for antojo in antojos {
            if antojo.esFavorito {
                resultado.append(antojo)
            }
        }
        return resultado
    }

    var gastoTotal: Double {
        var suma = 0.0
        for antojo in antojos {
            suma += antojo.precio
        }
        return suma
    }

    var body: some View {
        ZStack {
            paletaFondo
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 12) {
                        TarjetaResumen(icono: "fork.knife", valor: "\(antojos.count)", titulo: "Antojos")
                        TarjetaResumen(icono: "heart.fill", valor: "\(favoritos.count)", titulo: "Favoritos")
                        TarjetaResumen(icono: "dollarsign.circle.fill", valor: gastoTotal.formatted(.number.precision(.fractionLength(0))), titulo: "Gasto")
                    }

                    Text("Precio de cada antojo")
                        .font(.headline)
                        .foregroundStyle(paletaTexto)

                    Chart(antojos) { antojo in
                        BarMark(
                            x: .value("Precio", antojo.precio),
                            y: .value("Antojo", antojo.nombre)
                        )
                        .foregroundStyle(paletaPrimario)
                    }
                    .frame(height: 300)

                    Text("Tus favoritos")
                        .font(.headline)
                        .foregroundStyle(paletaTexto)

                    ForEach(favoritos) { antojo in
                        AntojoRow(antojo: antojo)
                            .padding(10)
                            .background(paletaSuperficie)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}
```

Barras horizontales (precio en `x`, nombre en `y`) porque los nombres son largos. ⚠️ `ForEach` y barras horizontales no vienen en las láminas.

---

## 10.37 Quiero guardar un dato aunque se cierre la app
🔎 guardar, persistencia, appstorage, userdefaults, recordar, no se borre, nombre guardado, preferencias

`@AppStorage("llave")` funciona como `@State` pero se guarda en el iPhone. Ideal para preferencias simples
(nombre, color, un switch). **Nunca** contraseñas (eso va en Keychain).

```swift
struct NombreGuardadoView: View {
    @AppStorage("nombreUsuario") private var nombreGuardado = ""

    @State private var nombre = ""

    var body: some View {
        VStack(spacing: 16) {
            Text(nombreGuardado.isEmpty ? "Hola" : "Hola, \(nombreGuardado)")
                .font(.largeTitle)
                .bold()

            TextField("Tu nombre", text: $nombre)
                .textFieldStyle(.roundedBorder)

            Button("Guardar") {
                nombreGuardado = nombre
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            nombre = nombreGuardado
        }
    }
}
```

**¿Visto en clase?** Clase de persistencia (no está en las presentaciones de la carpeta, sí en la skill del curso). **En el repo:** `11_Extras/AppStorageView.swift`.

---

## 10.38 Quiero validar un correo, una edad en rango y una contraseña
🔎 validar correo, email, arroba, edad rango, contraseña minimo, count, caracteres, validacion completa

```swift
struct RegistroValidadoView: View {
    @State private var correo = ""
    @State private var edadTexto = ""
    @State private var contrasena = ""

    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    func validar() {
        if correo.isEmpty {
            alertTitle = "Falta el correo"
            alertMessage = "Escribe tu correo electrónico."
        } else if !correo.contains("@") || !correo.contains(".") {
            alertTitle = "Correo no válido"
            alertMessage = "El correo debe tener @ y un punto, por ejemplo ana@correo.com"
        } else if edadTexto.isEmpty {
            alertTitle = "Falta la edad"
            alertMessage = "Escribe tu edad."
        } else if Int(edadTexto) == nil {
            alertTitle = "Edad no válida"
            alertMessage = "La edad debe ser un número entero."
        } else if let edad = Int(edadTexto), edad < 15 || edad > 99 {
            alertTitle = "Edad fuera de rango"
            alertMessage = "La edad debe estar entre 15 y 99 años."
        } else if contrasena.count < 6 {
            alertTitle = "Contraseña muy corta"
            alertMessage = "La contraseña debe tener al menos 6 caracteres."
        } else {
            alertTitle = "¡Listo!"
            alertMessage = "Registro completo."
        }
        showAlert.toggle()
    }

    var body: some View {
        VStack(spacing: 14) {
            TextField("Correo", text: $correo)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            TextField("Edad", text: $edadTexto)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            SecureField("Contraseña", text: $contrasena)
                .textFieldStyle(.roundedBorder)

            Button("Registrarme") {
                validar()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }
    }
}
```

⚠️ `.contains("@")`, `.count`, `SecureField`, `.keyboardType`. **En el repo:** `03_ElementosUI/FormularioValidacionView.swift`.

---

## 10.39 Quiero puntos extra: foto opcional en el formulario de agregar
🔎 foto en formulario, foto del antojo, uiimage en modelo, foto opcional, puntos extra

⚠️ Guardar un `UIImage?` dentro del modelo no se vio en clase. Pasos:

1. Agrega el campo al struct (con `import UIKit`):

```swift
struct Antojo: Identifiable {
    var id: Int
    var nombre: String
    var imagen: String
    var foto: UIImage?
}
```

(Tu `Antojo` real tiene más campos: solo agrega `var foto: UIImage?` y, en ModelData, `foto: nil` en cada antojo.)

2. Un componente que muestre la foto si existe, o la imagen de Assets si no:

```swift
struct FotoAntojoView: View {
    var antojo: Antojo
    var ancho: CGFloat

    var body: some View {
        if let fotoBien = antojo.foto {
            Image(uiImage: fotoBien)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: ancho, height: ancho)
                .cornerRadius(12)
        } else {
            Image(antojo.imagen)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: ancho)
                .cornerRadius(12)
        }
    }
}
```

3. En el formulario, un PhotosPicker que llena `selectedImage`, y al guardar `foto: selectedImage`:

```swift
struct FormularioFotoRecetaView: View {
    @Binding var antojos: Array<Antojo>

    @State private var nombre = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        VStack(spacing: 16) {
            if let selectedImageBien = selectedImage {
                Image(uiImage: selectedImageBien)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(12)
            } else {
                Image(systemName: "photo")
                    .font(.system(size: 60))
                    .foregroundStyle(.gray)
            }

            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                Label("Elegir foto (opcional)", systemImage: "photo.on.rectangle")
            }
            .buttonStyle(.bordered)
            .onChange(of: selectedItem) { oldItem, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        selectedImage = uiImage
                    }
                }
            }

            TextField("Nombre", text: $nombre)
                .textFieldStyle(.roundedBorder)

            Button("Guardar") {
                antojos.append(Antojo(id: antojos.count + 1, nombre: nombre, imagen: "foto1", foto: selectedImage))
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
```

**En el repo:** `00_AppCompleta/Views/AgregarMascotaView.swift` → bloque 1, `10_FotosYCamara/RegistroConFotoView.swift`.

---

## 10.40 Quiero ir a otra pantalla con NavigationLink (lo más simple) y regresar
🔎 navigationlink, navegar, ir a otra pantalla, siguiente pantalla, regresar, dismiss, back, pasar un dato

```swift
struct PantallaUnoView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink("Ir a la pantalla 2") {
                    PantallaDosView(mensaje: "Hola desde la pantalla 1")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Pantalla 1")
        }
    }
}

struct PantallaDosView: View {
    var mensaje: String

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text(mensaje)
                .font(.title2)

            Button("Regresar") {
                dismiss()
            }
            .buttonStyle(.bordered)
        }
        .navigationTitle("Pantalla 2")
    }
}
```

`PantallaDosView` recibe `mensaje` como `var` (sin `private`, sin `@State`): paso de valores de ida (Clase 6B).
`dismiss()` regresa (Clase 6A). **En el repo:** `06_MultiplesPantallas/NavegacionBasicaView.swift`.

---

## 10.41 Quiero agregar imágenes a Assets y usarlas
🔎 assets, agregar imagen, imagen no aparece, Image("nombre"), xcassets, arrastrar imagen

1. Abre `Assets.xcassets` en el navegador.
2. Arrastra la imagen (png/jpg) desde Finder a la lista de la izquierda de Assets.
3. El **nombre del set** (lo que sale en la lista) es el que usas: `Image("tacos")`.
4. Usa el orden de modificadores de clase: `.resizable(resizingMode: .stretch)` → `.aspectRatio(contentMode: .fit)` → `.frame(width:)`.

**Errores:** la imagen no aparece → el nombre no coincide (mayúsculas cuentan) o pusiste la extensión (`"tacos.png"` ❌ → `"tacos"` ✅).
La imagen sale gigante → te faltó `.resizable` (sin él, `.frame` no hace nada).

---

## 10.42 Quiero poner el permiso de cámara y probarla
🔎 permiso camara, privacy camera usage description, info plist, la app truena camara, NSCameraUsageDescription

1. Navegador → clic en el proyecto (ícono azul) → selecciona el **target** → pestaña **Info**.
2. Clic derecho en la última fila de "Custom iOS Target Properties" → **Add Row**.
3. Elige **Privacy - Camera Usage Description** y en **Value** escribe el mensaje para el usuario
   (ej. "La app usa la cámara para tu foto de perfil").
4. El simulador **no tiene cámara**: pruébala en un iPhone físico. En el simulador prueba la galería.

Sin el permiso, la app **truena** al abrir la cámara (✅ Clase 17).

---

## 10.43 Quiero entregar: hacer el ZIP del proyecto para Canvas
🔎 zip, comprimir, entregar, subir a canvas, entrega, archive, proyecto completo

1. Cierra Xcode (para que guarde todo).
2. En Finder busca la carpeta del proyecto: la que contiene `ExamenAntojos.xcodeproj` **y** la carpeta `ExamenAntojos`.
3. Clic derecho sobre **esa carpeta completa** → **Comprimir "ExamenAntojos"**. Sale `ExamenAntojos.zip`.
4. Antes de subir: descomprímelo en otro lado, ábrelo y córrelo (⌘R) para confirmar que está completo.
5. Súbelo a Canvas entre 10:30 y 10:50.

**Errores:** subir solo el `.xcodeproj` (no trae el código) o solo la carpeta de código (no abre en Xcode). Va la carpeta que contiene a los dos.

---

## 10.44 Quiero centralizar mis colores en una paleta
🔎 paleta, colores, utils, color centralizado, esquema de color, monocromatico, analogo, contraste, rgb

Archivo `Utils/Paleta.swift` con `let` globales (receta 10.1, paso 4). Para **ver** tus colores, ponle a ese archivo un preview:

```swift
struct VistaPreviaPaleta: View {
    var body: some View {
        HStack(spacing: 0) {
            paletaFondo
            paletaSuperficie
            paletaSecundario
            paletaPrimario
            paletaTextoSuave
            paletaTexto
        }
        .frame(height: 100)
    }
}
```

Más paletas listas en la sección 12.5.

---

## 10.45 Quiero que salga el título de la pantalla (navigationTitle) y no sale
🔎 navigationtitle no sale, titulo no aparece, title, barra de navegacion, navigation bar, titulo pantalla

`.navigationTitle` **solo funciona dentro de un `NavigationStack`**. Sin él se ignora (sin error).

- Pantalla que es **pestaña** o **raíz**: ponle su `NavigationStack` adentro y el título sobre el contenido:
  `NavigationStack { ZStack { … }.navigationTitle("Mis Antojos") }`.
- Pantalla a la que **llegas con NavigationLink**: no le pongas otro `NavigationStack` (ya está dentro del de la anterior).
  Para verla en el Canvas, envuelve el preview: `#Preview { NavigationStack { DetalleAntojoView(...) } }`.

---

---

# 11. Defensa del código: preguntas que te puede hacer la profe

La tarea Movil02 lo dice claro (**"Criterio de autoría y dominio"**): la profe puede pedirte en persona que
**expliques, justifiques o modifiques cualquier parte** del proyecto. Si no puedes explicarlo, cuenta como falta de autoría.

Aquí van las preguntas más probables con una respuesta **corta, en primera persona**, como la dirías tú.
No te las aprendas de memoria: entiende la idea y dila con tus palabras.

> Truco para cualquier pregunta: **qué es → para qué lo usé aquí → qué pasaría si no lo pongo**.

---

## 11.1 Estado y datos (@State, @Binding, $)
🔎 defensa state, binding, signo de pesos, private, fuente de verdad, por que state, explicar binding

**1. ¿Qué es `@State`?**
Es una variable que la vista "vigila". Cuando cambia, SwiftUI vuelve a dibujar la pantalla. Lo uso para datos que
cambian con el usuario: lo que escribe, lo que elige, si se muestra una alerta. **Esta vista es dueña del dato.**

**2. ¿Por qué `private`?**
Porque ese dato solo le pertenece a esta vista y nadie de afuera lo debe cambiar. Apple lo recomienda y así se vio en clase.

**3. ¿Diferencia entre `@State` y `@Binding`?**
`@State` = esta vista **es dueña** del dato. `@Binding` = esta vista **recibe permiso** para leer y modificar el dato
de otra vista. En mi app, `ContentView` tiene la lista en `@State` y la pantalla de lista la recibe como `@Binding`
para poder agregar y cambiar favoritos.

**4. ¿Para qué es el `$`?**
Con `$` paso el **binding** (el permiso de modificar), no una copia del valor. `TextField("Nombre", text: $nombre)` lleva
`$` porque el campo tiene que escribir en mi variable.

**5. ¿Por qué a unas pestañas les pasas la lista con `$` y a otras sin `$`?**
Le doy a cada pantalla solo el permiso que necesita. Inicio y Estadísticas solo **leen**: les paso la lista sin `$`.
Lista **modifica**: le paso `$antojos`.

**6. ¿Por qué la lista está en la vista del TabView y no en cada pestaña?**
Para tener **una sola fuente de verdad**. Si cada pestaña tuviera su propia lista, al agregar un antojo en Lista no
aparecería en Estadísticas. Así, cuando cambia, todas las pestañas se redibujan con el mismo dato.

**7. ¿Por qué no usaste una variable global para la lista?**
Una variable global se puede leer, pero **no le avisa a SwiftUI** cuando cambia, entonces la pantalla no se actualiza.
`@State` sí avisa. (La var global de la Clase 10 sirve para listas de solo lectura.)

**8. ¿Qué es `.constant(...)` en el preview?**
El preview no tiene una pantalla "padre" que le pase el binding, así que le doy un binding de prueba con un valor fijo.

**9. ¿Qué es `@Environment(\.dismiss)`?**
Me da la acción de "cerrar/regresar" de la pantalla actual. Al llamar `dismiss()` regreso a la pantalla anterior o cierro la sheet.

**10. ¿Qué es `@FocusState`?**
Guarda si un campo de texto tiene el teclado activo. Lo pongo en `false` para esconder el teclado (3 pasos de la Clase 4).

---

## 11.2 Modelo y lista
🔎 defensa struct, identifiable, id, modeldata, class vs struct, list, foreach, por que id

**11. ¿Qué es un struct y para qué lo usaste?**
Es el **molde** de mis datos: dice qué tiene cada antojo (nombre, precio, categoría…). Cada antojo de la lista es un
valor hecho con ese molde.

**12. ¿Por qué struct y no class?**
Para datos simples, el struct es lo recomendado en SwiftUI: es un **valor** (se copia), es más seguro y SwiftUI detecta
fácil cuando cambia. La class es una **referencia** (todos apuntan al mismo objeto) y no le avisa a la vista cuando cambia.

**13. ¿Qué es `Identifiable` y para qué el `id`?**
Es un protocolo que obliga a tener una propiedad `id` única. `List` la usa para distinguir cada renglón. Por eso cada
antojo tiene un id distinto; con ids repetidos la lista se confunde.

**14. ¿Por qué el `id` no se muestra en pantalla?**
Es un dato interno para identificar elementos; al usuario no le sirve. La tarea lo pedía explícito.

**15. ¿Qué es una propiedad calculada?**
Una propiedad que no se guarda: se calcula cada vez que la pido. `estrellas` sale de la calificación, así nunca quedan
desincronizadas.

**16. ¿Por qué ModelData es una función?**
Porque así cada vez que la llamo me regresa la lista inicial completa. La vista dueña la llama una vez:
`@State private var antojos = cargarAntojos()`.

**17. ¿Cómo generas el id de un antojo nuevo?**
Busco el id más grande con un `for` y le sumo 1. Así nunca se repite, aunque se hayan borrado elementos.

**18. ¿Qué hace `List($antojos) { $antojo in }`?**
Recorre la lista y me da cada elemento **como binding**, para que el detalle lo pueda modificar y el cambio se vea en la lista.

**19. ¿Por qué el renglón es un componente aparte?**
Porque se reutiliza (en la lista y en resultados) y el código queda más ordenado. Si quiero cambiar el diseño del renglón,
lo cambio en un solo lugar.

**20. ¿Por qué el componente recibe `var antojo` y no `@State`?**
Porque solo **muestra** el dato, no es dueño. Si lo pusiera como `@State`, se quedaría con su propia copia y no se
actualizaría cuando cambie la lista.

---

## 11.3 Navegación y pantallas
🔎 defensa navigationstack, navigationlink, navigationdestination, isvalid, tabview, sheet, por que navigationstack

**21. ¿Qué es `NavigationStack`?**
Una pila de pantallas: cada pantalla nueva se pone "encima" y con la flecha o con `dismiss()` se quita. La raíz no se puede quitar.

**22. ¿Por qué el `NavigationStack` va dentro de cada pestaña?**
Cada pestaña tiene su propia historia de navegación. Si lo pongo afuera del `TabView`, quedan barras dobles y la navegación se rompe.

**23. ¿Qué hace `.navigationDestination(isPresented:)`?**
Navega a otra pantalla cuando la variable booleana se vuelve `true`. Lo uso en lugar de `NavigationLink` porque
**primero valido** y solo si todo está bien pongo `isValid = true` (Clase 6C).

**24. ¿Por qué un `Button` y no un `NavigationLink` en el buscador?**
`NavigationLink` navega siempre, sin preguntar. Con el botón puedo validar primero y mostrar una alerta si hay error.

**25. ¿Cómo le pasas datos a la siguiente pantalla?**
En la pantalla de destino declaro `var presupuesto: Double` (sin `private` y sin `@State`) y al crearla le asigno el
valor: `ResultadosView(presupuesto: presupuesto, …)`. Es paso de valores de ida (Clase 6B).

**26. ¿Qué es un `TabView`?**
Organiza la app en pestañas abajo. Cada vista lleva `.tabItem { Label("Texto", systemImage: "ícono") }`. `.tint` cambia el color de la pestaña seleccionada.

**27. ¿Qué es una `.sheet`?**
Una ventana que sube desde abajo encima de la pantalla actual. Se abre cuando su booleana es `true` y se cierra con `dismiss()`. La usé para el formulario de agregar y la cámara.

**28. ¿Por qué el login no navega al TabView con NavigationLink?**
Porque quedarían NavigationStacks uno dentro de otro. Uso una vista raíz con un `if`: si no hay sesión muestro el login,
si hay sesión muestro el TabView.

---

## 11.4 Swift básico
🔎 defensa opcional, if let, force unwrap, signo de admiracion, let vs var, funcion, switch, for

**29. ¿Qué es un opcional?**
Una variable que puede tener un valor **o nada** (`nil`). Se marca con `?`. `Double("hola")` regresa `nil` porque no es número.

**30. ¿Por qué `if let` y no `!`?**
Con `!` saco el valor a la fuerza y si era `nil` la app **truena**. Con `if let` solo entro si hay valor, y si no, manejo
el caso (por ejemplo, muestro una alerta). Swift lo recomienda.

**31. ¿Diferencia entre `let` y `var`?**
`let` es constante (se asigna una vez), `var` puede cambiar.

**32. ¿Por qué el precio se captura como texto?**
Porque `TextField` siempre trabaja con `String`. Después lo convierto con `Double(precioTexto)` y valido que sí sea número.

**33. ¿Cómo calculas el promedio?**
Sumo las calificaciones con un `for` y divido entre la cantidad. Convierto a `Double` antes de dividir para no perder
decimales, y si la lista está vacía regreso 0 para no dividir entre cero.

**34. ¿Para qué sirve el `switch`?**
Para elegir entre varios casos de forma ordenada, por ejemplo un color distinto según la calificación o una clasificación por rangos.

**35. ¿Qué es `Date()`?**
La fecha y hora de **este momento**. Para otra fecha sumo o resto días con `DateComponents` y `Calendar` (Clase 3B).

**36. ¿Qué es `DateFormatter` y para qué el `locale`?**
Convierte una fecha a texto con el formato que yo elija. El `locale` "es_MX" hace que salga en español ("octubre" y no "October").

---

## 11.5 Vistas, diseño y modificadores
🔎 defensa body, some view, modificadores, orden, resizable, frame, safe area, zstack, componente

**37. ¿Qué hace `body` y qué es `some View`?**
`body` es lo que se dibuja en pantalla. `some View` significa "regresa alguna vista"; Swift deduce el tipo exacto.

**38. ¿Qué es un modificador y por qué importa el orden?**
Es una función que cambia la vista (`.padding`, `.background`…). Cada uno se aplica sobre el resultado del anterior.
Ejemplo: `.padding().background(.orange)` pinta también el espacio del padding; `.background(.orange).padding()` no.

**39. ¿Por qué `.resizable` antes de `.frame`?**
Sin `.resizable` la imagen no tiene permiso de cambiar de tamaño y el `.frame` no hace nada. Después `.aspectRatio(.fit)`
evita que se deforme.

**40. ¿Qué es la safe area y `.ignoresSafeArea()`?**
La safe area es la zona que no tapan la isla dinámica ni la barra de abajo. `.ignoresSafeArea()` hace que el color de
fondo cubra **toda** la pantalla.

**41. ¿Cómo hiciste que las 3 tarjetas midan lo mismo?**
Cada tarjeta tiene `.frame(maxWidth: .infinity)`, entonces todas piden el máximo y el `HStack` reparte el ancho en partes iguales.

**42. ¿Qué es un componente y por qué reutilizar?**
Es una vista en su propio archivo que recibe datos por parámetros. Lo hago para no repetir código, para que todo se vea
consistente y para cambiar el diseño en un solo lugar (Clase 5A).

**43. ¿Para qué el `ScrollView`?**
Para que si el contenido no cabe (pantallas chicas o teclado abierto) se pueda deslizar y no se corte.

**44. ¿Para qué `Spacer()`?**
Ocupa el espacio que sobra y empuja los elementos. Uno solo al final de un `VStack` pega todo arriba.

---

## 11.6 Gráficas, fotos y cámara
🔎 defensa graficas, por que barras, charts, photospicker, task await, camarapicker, permiso camara

**45. ¿Por qué barras y no líneas para las categorías?**
Las barras sirven para **comparar categorías**. Las líneas son para **tendencias en el tiempo**; usarlas en categorías
sugiere una continuidad que no existe. La profe lo dijo en la Clase 15.

**46. ¿Por qué una dona para favoritos?**
Porque muestra **partes de un total** (cuántos son favoritos de todos).

**47. ¿De dónde salen los datos de la gráfica?**
Los calculo con un `for` a partir de la lista real. Por eso, si agrego un antojo, la gráfica se actualiza sola.

**48. ¿Qué es `PhotosPicker` y por qué `Task` y `await`?**
Es el selector de fotos nativo de SwiftUI (iOS 16+). Lo que regresa no es una imagen, es un `PhotosPickerItem`. Para
convertirlo cargo sus datos con `loadTransferable`, que tarda (es asíncrono). Por eso va dentro de `Task` con `await`:
la app no se congela mientras carga.

**49. ¿Qué es `CamaraPicker`?**
Es el archivo que nos dio la profe. SwiftUI no tiene cámara nativa, así que envuelve el `UIImagePickerController` de
UIKit con `UIViewControllerRepresentable` para usarlo en SwiftUI. Me regresa la foto por un `@Binding`
(`selectedImageFromCamera`). No lo modifiqué.

**50. ¿Por qué el permiso de cámara?**
Desde iOS 10, Apple obliga a explicarle al usuario para qué usas la cámara. Sin "Privacy - Camera Usage Description",
la app truena al abrirla.

**51. ¿Por qué `Image(uiImage:)` y no `Image("…")`?**
`Image("nombre")` es para imágenes de Assets. La foto que elige el usuario es un `UIImage` en memoria, y se muestra con `Image(uiImage:)`.

---

## 11.7 Calidad técnica: performance, memoria, batería, datos, seguridad, mantenibilidad
🔎 performance, memoria, bateria, consumo de datos, seguridad, mantenibilidad, decisiones tecnicas, trade-offs

La rúbrica pide considerar esto "cuando corresponda". Respuestas cortas:

**52. ¿Performance?**
`List` solo dibuja los renglones que se ven (es "lazy"). Los cálculos son propiedades calculadas sencillas con `for`
sobre listas chicas; no hay trabajo pesado en el `body`.

**53. ¿Memoria?**
Uso imágenes de Assets de tamaño razonable. La foto del usuario se guarda una sola vez en un `@State`.

**54. ¿Consumo de datos y batería?**
Uso imágenes **locales** (Assets) en lugar de `AsyncImage`: no gastan datos, funcionan sin internet y cargan al instante.
El costo es que la app pesa un poco más.

**55. ¿Seguridad?**
No guardo contraseñas ni datos sensibles en `UserDefaults`/`@AppStorage` (se guardan en texto plano). Eso iría en Keychain.
Solo pido el permiso de cámara cuando se usa y explico para qué.

**56. ¿Mantenibilidad?**
Carpetas `Model/Views/Components/Utils`, componentes reutilizables, la paleta en un solo archivo y nombres claros en español.
Si cambio un color o el diseño del renglón, lo cambio en un solo lugar.

**57. Si usaste algo que no se vio en clase, ¿cómo lo justificas?** (la tarea pide 5 puntos)
1) Qué usé, 2) por qué, 3) ventaja, 4) desventaja/trade-off, 5) impacto. Ejemplo con `.keyboardType(.decimalPad)`:
"Usé el teclado numérico para que el usuario no escriba letras en el precio. Ventaja: menos errores. Desventaja: no tiene
botón de 'listo', por eso agregué el `onTapGesture` para esconderlo. No afecta performance."

---

## 11.8 Modificaciones en vivo (cómo hacerlas rápido)
🔎 modificar en vivo, cambio rapido, agregar campo, cambiar color, agregar pestaña, cambiar grafica, nueva validacion

La profe puede decir "cámbiame esto" en la revisión. Lo que tienes que hacer:

**Agregar un campo al modelo** (ej. `colonia: String`)
1. En `Antojo.swift`: `var colonia: String`.
2. Xcode marca error en **cada** `Antojo(...)` de `ModelData` y del formulario ("Missing argument for parameter 'colonia'"): agrégalo en el **mismo orden** que en el struct.
3. En el formulario: `@State private var colonia = ""` + `TextField`.
4. Muéstralo en el detalle: `FilaDato(etiqueta: "Colonia", valor: antojo.colonia)`.

**Cambiar el color de toda la app**
Cambia los RGB en `Utils/Paleta.swift`. Todo se actualiza porque todas las vistas usan `paletaPrimario`, etc.

**Agregar una pestaña**
1. Crea la vista nueva (`Views/FavoritosView.swift`) con su `NavigationStack` adentro.
2. En `ContentView`, dentro del `TabView`: `FavoritosView(antojos: antojos).tabItem { Label("Favoritos", systemImage: "heart.fill") }`.

**Cambiar el tipo de gráfica**
Cambia la marca: `BarMark(x:y:)` ↔ `SectorMark(angle:)`. Para dona agrega `innerRadius: .ratio(0.5)`.
Para pastel/dona usa `.foregroundStyle(by:)` para que cada parte tenga color y leyenda.

**Agregar una validación**
Agrega otro `else if` en `guardar()` **en el lugar correcto del orden**, con su mensaje:
`} else if nombre.count < 3 { alertMessage = "El nombre debe tener al menos 3 letras."; showAlert.toggle() }`.

**Cambiar el orden de la lista**
En la vista: `List(antojos.sorted { a, b in a.precio < b.precio })` (⚠️) o usa la receta 10.18.

**Mostrar un dato más en el renglón**
En `AntojoRow`, dentro del `VStack`: `Text(antojo.categoria).font(.caption)`.

**Cambiar el texto o ícono de una pestaña**
En `ContentView`: `Label("Nuevo texto", systemImage: "otro.icono")`. Los nombres de ícono salen de la app SF Symbols.

**Que el favorito se cambie desde la lista**
En `AntojoRow` no se puede (solo lee). Hazlo en el detalle con el `Toggle` ligado a `$antojo.esFavorito`.

**Cambiar el título de una pantalla**
`.navigationTitle("Nuevo título")` sobre el contenido, dentro del `NavigationStack`.

---

---

# 12. UI/UX y rúbrica

## 12.1 Cómo califica la profe (rúbrica de la tarea Movil02)
🔎 rubrica, calificacion, puntos, criterios, como califica, evaluacion, cumplimiento funcional, calidad tecnica, dominio, ui ux, fuentes ia

La rúbrica de la tarea Movil02 tiene 5 criterios y en cada uno solo hay **COMPLETO/CORRECTO** (todos los puntos) o
**Incompleto/Incorrecto** (0). No hay medio punto: si falta una cosa del criterio, puedes perderlo entero.
Para el examen la rúbrica puede cambiar, pero seguramente se parece.

| Criterio | Puntos | Qué revisa en la práctica |
|---|---|---|
| **Cumplimiento funcional** | 35 | Que **cada** requisito numerado del enunciado esté y funcione. Lee el enunciado como checklist. |
| **Calidad técnica de la solución** | 20 | Buenas prácticas de clase: carpetas, componentes, `@State private`, `if let` y no `!`, nombres claros, sin código repetido de más, el id no se muestra. Performance, memoria, datos, batería, seguridad y mantenibilidad "cuando corresponda". |
| **Dominio y defensa técnica** | 20 | Que puedas explicar el código (en la tarea era en el video; en el examen puede ser en persona). Ver sección 11. |
| **UI/UX y usabilidad** | 20 | Paleta monocromática o análoga, contraste, márgenes, espacio en blanco, botones de buen tamaño, nada cortado, un solo idioma, sin faltas de ortografía. |
| **Fuentes y uso responsable de IA** | 5 | En la tarea: la declaración de autoría en PDF. En el examen probablemente no aplica. |

> **NOTA de la profe:** "Una aplicación que funciona correctamente no garantiza por sí sola una calificación alta. Se
> evaluará también la calidad de la solución y el dominio que el estudiante demuestre sobre lo que entregó."

---

## 12.2 Checklist antes de entregar
🔎 checklist, revisar antes de entregar, lista de verificacion, antes de subir, entrega final, revision

**Funcional**
- [ ] Leí el enunciado **requisito por requisito** y cada uno funciona en el simulador.
- [ ] La lista inicial tiene la cantidad de elementos que piden, todos distintos, con imágenes distintas.
- [ ] Cada pantalla que piden existe y se llega a ella.
- [ ] Lo que se modifica en una pantalla se ve en las demás (favorito, elementos nuevos).
- [ ] Las validaciones muestran una alerta **con un mensaje específico** por cada error.
- [ ] Hay forma de regresar desde el detalle (flecha + botón si lo piden).

**Técnico**
- [ ] Carpetas `Model/`, `Views/`, `Components/`, `Utils/` y cada archivo en la suya.
- [ ] Todas las `@State` son `private`.
- [ ] No hay `!` para sacar opcionales (uso `if let`).
- [ ] No hay código comentado de pruebas ni archivos que no se usan (`SwiftUIView.swift` vacío, etc.).
- [ ] Nombres claros (`AgregarAntojoView`, no `View2`), todo en el mismo idioma.
- [ ] El **id no se muestra** en ninguna parte.
- [ ] La app compila **sin errores** y corre (⌘R) sin tronar. Revisa también los warnings amarillos.
- [ ] Si uso algo no visto en clase, sé explicarlo (qué, por qué, ventaja, desventaja, impacto).

**UI/UX**
- [ ] Fondo de pantalla completa en cada pantalla.
- [ ] Paleta en `Utils`, monocromática o análoga, y la uso en todas las pantallas.
- [ ] El texto se lee bien sobre su fondo (contraste).
- [ ] Márgenes (`padding`) y separación (`spacing`); nada pegado a la orilla.
- [ ] Botones grandes y fáciles de tocar.
- [ ] Nada se corta en un iPhone chico (ScrollView donde haga falta). Pruébalo en el simulador.
- [ ] **Un solo idioma** en toda la interfaz (ojo con "Home", "Save", "Cancel" que pone Xcode por default).
- [ ] **Sin faltas de ortografía** ni acentos faltantes (Categoría, Descripción, Calificación, Estadísticas, Información).

**Entrega**
- [ ] Cerré Xcode, comprimí la carpeta completa del proyecto y probé abrir el ZIP (receta 10.43).

---

## 12.3 Lineamientos de UI/UX que se revisaron en clase
🔎 lineamientos ui ux, usabilidad, jerarquia visual, consistencia, legibilidad, retroalimentacion, prevencion de errores, experiencia de usuario

La tarea pide explicar cómo aplicaste estos puntos. Qué significan y cómo se ven en el código:

| Lineamiento | Qué significa | Cómo lo aplico en SwiftUI |
|---|---|---|
| **Jerarquía visual** | Lo más importante se ve primero y más grande | Título `.largeTitle`/`.title` + `.bold()`, datos secundarios `.subheadline`/`.caption` y color más suave |
| **Navegación** | El usuario siempre sabe dónde está y cómo regresar | `.navigationTitle` en cada pantalla, flecha atrás, botón "Regresar", pestañas con ícono y texto |
| **Consistencia** | Lo mismo se ve y funciona igual en toda la app | Componentes reutilizables, la misma paleta, los mismos tamaños de botón, los mismos íconos para lo mismo |
| **Legibilidad (colores y tamaños)** | Se lee sin esfuerzo | Contraste ≥ 4.5:1, nada de texto encima de fotos sin fondo, tamaños de fuente del sistema |
| **Márgenes y espacio en blanco** | Respira, no está amontonado | `.padding()` en contenedores, `VStack(spacing: 16)`, tarjetas separadas |
| **Selección adecuada de controles** | El control correcto para cada dato | Ver tabla 12.4 |
| **Retroalimentación al usuario** | La app responde a lo que haces | Alertas al guardar o con error, el corazón cambia al marcar favorito, mensaje si no hay resultados, contador "10 antojos" |
| **Prevención y manejo de errores** | Evitar que se equivoque y decirle cómo arreglarlo | Teclado numérico para números, Picker en lugar de texto libre, validar antes de guardar, mensaje **específico** ("El precio debe ser un número") |
| **Experiencia de usuario general** | Se siente fácil y agradable | Flujos cortos, botones claros, nada se corta, todo en español |

---

## 12.4 Qué control usar para cada dato
🔎 que control usar, picker o textfield, toggle, slider, stepper, datepicker, segmented, menu, eleccion de control

| El usuario tiene que… | Usa | Por qué |
|---|---|---|
| Escribir texto libre (nombre, descripción) | `TextField` | Es libre |
| Escribir una contraseña | `SecureField` ⚠️ | Oculta lo que escribe |
| Escribir un número (precio, edad) | `TextField` + `.keyboardType(.decimalPad / .numberPad)` ⚠️ + validar con `if let` | Evita letras |
| Elegir 1 de 2 a 4 opciones | `Picker` `.segmented` | Se ven todas; la profe recomienda máximo 3-4 |
| Elegir 1 de muchas opciones | `Picker` `.menu` o `.wheel` | No ocupa espacio |
| Sí / No (favorito, activar algo) | `Toggle` | Un switch es lo natural para encendido/apagado |
| Un valor en un rango (volumen, presupuesto) | `Slider` | Se ajusta con el dedo |
| Un número chico que sube de 1 en 1 (personas) | `Stepper` ⚠️ | Botones − y + exactos |
| Una fecha | `DatePicker` ⚠️ | Evita escribir fechas a mano |
| Una calificación de 1 a 5 | `Picker` `.segmented` con tags 1…5 | Toque directo, sin errores |
| Confirmar algo peligroso (borrar) | `.alert` con dos botones (`role: .destructive` ⚠️) | Prevención de errores |
| Ver un porcentaje de avance | `ProgressView(value:total:)` | Se entiende de un vistazo |

---

## 12.5 Paletas listas para copiar (monocromáticas y análoga)
🔎 paleta, colores, esquema monocromatico, esquema analogo, rgb, contraste, color scheme, colores bonitos

**Monocromático** = un solo color (matiz) en distintas claridades. **Análogo** = colores vecinos en el círculo cromático
(ej. rojo-naranja-amarillo). La tarea pide uno de los dos.

> 🎨 **¿Quieres más opciones?** En el repo hay **25 paletas** listas (10 monocromáticas claras, 10 análogas claras y 5
> oscuras), con el contraste revisado y vista previa: carpeta `12_Paletas/Paletas/`. Cómo se usan en una pantalla
> completa: `12_Paletas/ComoUsarPaletaView.swift`. En la app: menú **12 · Paletas de colores → Galería**.
> Esas paletas son un `struct` (se usan con `let paleta = Paleta()` y `paleta.fondo`). Las de abajo son `let` globales.
> Las dos formas son válidas y ninguna usa `static`.

Todas usan los mismos nombres, así que puedes cambiar de paleta sin tocar las vistas. Van en `Utils/Paleta.swift`.
Los números de contraste los calculé con la fórmula WCAG (la misma de coolors.co/contrast-checker). El mínimo
recomendado para texto normal es **4.5:1**.

**Naranja monocromática** (la de los ejemplos, ideal para comida) — texto/fondo 14.7:1 · texto suave/fondo 8.8:1 ·
blanco sobre primario 5.2:1.

```swift
import SwiftUI

let paletaFondo = Color(red: 255/255, green: 247/255, blue: 237/255)
let paletaSuperficie = Color(red: 255/255, green: 237/255, blue: 213/255)
let paletaPrimario = Color(red: 194/255, green: 65/255, blue: 12/255)
let paletaSecundario = Color(red: 251/255, green: 146/255, blue: 60/255)
let paletaTexto = Color(red: 67/255, green: 20/255, blue: 7/255)
let paletaTextoSuave = Color(red: 124/255, green: 45/255, blue: 18/255)
```

**Azul monocromática** (tecnología, viajes) — texto/fondo 13.5:1 · texto suave/fondo 8.0:1 · blanco sobre primario 6.7:1.

```swift
let paletaFondo = Color(red: 239/255, green: 246/255, blue: 255/255)
let paletaSuperficie = Color(red: 219/255, green: 234/255, blue: 254/255)
let paletaPrimario = Color(red: 29/255, green: 78/255, blue: 216/255)
let paletaSecundario = Color(red: 96/255, green: 165/255, blue: 250/255)
let paletaTexto = Color(red: 23/255, green: 37/255, blue: 84/255)
let paletaTextoSuave = Color(red: 30/255, green: 64/255, blue: 175/255)
```

**Verde monocromática** (gimnasio, salud, naturaleza) — texto/fondo 14.2:1 · texto suave/fondo 6.8:1 · blanco sobre primario 5.0:1.

```swift
let paletaFondo = Color(red: 240/255, green: 253/255, blue: 244/255)
let paletaSuperficie = Color(red: 220/255, green: 252/255, blue: 231/255)
let paletaPrimario = Color(red: 21/255, green: 128/255, blue: 61/255)
let paletaSecundario = Color(red: 74/255, green: 222/255, blue: 128/255)
let paletaTexto = Color(red: 5/255, green: 46/255, blue: 22/255)
let paletaTextoSuave = Color(red: 22/255, green: 101/255, blue: 52/255)
```

**Análoga "atardecer"** (rojo-naranja-amarillo; postres, eventos) — texto/fondo 15.1:1 · texto suave/fondo 9.2:1 ·
blanco sobre primario 6.3:1.

```swift
let paletaFondo = Color(red: 255/255, green: 251/255, blue: 235/255)
let paletaSuperficie = Color(red: 254/255, green: 243/255, blue: 199/255)
let paletaPrimario = Color(red: 190/255, green: 18/255, blue: 60/255)
let paletaSecundario = Color(red: 234/255, green: 88/255, blue: 12/255)
let paletaTexto = Color(red: 76/255, green: 5/255, blue: 25/255)
let paletaTextoSuave = Color(red: 136/255, green: 19/255, blue: 55/255)
```

**Cómo usar cada color:**

| Color | Para qué |
|---|---|
| `paletaFondo` | Fondo de toda la pantalla (`paletaFondo.ignoresSafeArea()` en un `ZStack`) |
| `paletaSuperficie` | Fondo de tarjetas y bloques encima del fondo |
| `paletaPrimario` | Botones principales (`.tint`), íconos importantes, pestaña seleccionada |
| `paletaSecundario` | Detalles, segundo color de gráficas, íconos de relleno. **No** para texto chico sobre fondo claro |
| `paletaTexto` | Títulos y texto principal |
| `paletaTextoSuave` | Subtítulos, etiquetas, texto secundario |

**Errores comunes con colores:** texto blanco sobre `paletaSecundario` (poco contraste), texto encima de una foto
sin fondo, usar colores distintos en cada pantalla, mezclar la paleta con `.blue` del sistema en botones.

---

## 12.6 Tamaños de letra, espacios y botones
🔎 tamaño de fuente, font size, tipografia, espaciado, spacing, padding, margenes, tamaño de boton, 44 puntos, area tactil

**Fuentes del sistema** (se adaptan solas si el usuario agranda la letra):

| Uso | Modificador | Tamaño aprox. |
|---|---|---|
| Título de pantalla grande | `.font(.largeTitle)` + `.bold()` | 34 |
| Título de sección | `.font(.title)` / `.font(.title2)` | 28 / 22 |
| Subtítulo | `.font(.title3)` | 20 |
| Nombre en un renglón, etiqueta de campo | `.font(.headline)` | 17 (seminegrita) |
| Texto normal | `.font(.body)` (el default) | 17 |
| Texto secundario | `.font(.subheadline)` | 15 |
| Notas, fechas, contadores | `.font(.caption)` | 12 |
| Tamaño exacto (tip de la Clase 5A) | `.font(.system(size: 21))` | 21 |

**Espacios** — usa siempre los mismos números (múltiplos de 4):

| Valor | Para qué |
|---|---|
| 4 | Entre un título y su subtítulo pegados |
| 8 | Entre elementos de un mismo grupo; padding vertical de botones |
| 12 | Entre tarjetas de una fila; esquinas (`cornerRadius(12)`) |
| 16 | `.padding()` normal (es el default) y spacing entre bloques |
| 20–24 | Entre secciones grandes de una pantalla |

**Botones:** Apple recomienda un área táctil mínima de **44×44 puntos**. Formas fáciles de lograrlo:
`.controlSize(.large)`, o en el label `.frame(maxWidth: .infinity)` + `.padding(.vertical, 8)` con `.buttonStyle(.borderedProminent)`.
Para que el fondo del botón ocupe todo el ancho, el `.frame` va **dentro** del label, no después del `.buttonStyle`.

**Íconos (SF Symbols):** usa el **mismo estilo** en toda la app (todos `.fill` o todos sin relleno) y el **mismo ícono**
para la misma idea (corazón = favorito en todas partes). Los nombres se buscan en la app **SF Symbols** (sin internet
también funciona si ya está instalada) o en el autocompletado de Xcode.

---

## 12.7 Cómo hacer que la UI se vea "bonita" rápido
🔎 ui bonita, diseño bonito, tarjetas, sombra, cornerRadius, que se vea profesional, mejorar diseño rapido

1. **Fondo de color en todas las pantallas:** `ZStack { paletaFondo.ignoresSafeArea() … }`.
2. **Agrupa en tarjetas:** `.padding()` + `.background(paletaSuperficie)` + `.cornerRadius(16)`. Lo que va junto, en la misma tarjeta.
3. **Sombra suave**, no negra fuerte: `.shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)`.
4. **Un ícono junto a cada título** (`Image(systemName:)` con el color primario).
5. **Botones de ancho completo** con el color primario.
6. **Encabezado claro** en cada pantalla (`.navigationTitle` o un `Text` grande).
7. **Espacio:** `VStack(spacing: 16)` y `.padding()` siempre.

Tarjeta lista para copiar:

```swift
struct TarjetaBonitaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "fork.knife")
                    .foregroundStyle(paletaPrimario)
                Text("Tacos Juanito")
                    .font(.headline)
                    .foregroundStyle(paletaTexto)
            }
            Text("Tacos de trompo con mucha piña.")
                .font(.subheadline)
                .foregroundStyle(paletaTextoSuave)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(paletaSuperficie)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
        .padding(.horizontal)
    }
}
```

⚠️ `.shadow(color:radius:x:y:)` con `x` e `y` no viene en las láminas (la Clase 5A usa `.shadow(color:radius:)`).

---

## 12.8 Errores de UI que bajan puntos
🔎 errores de ui, bajan puntos, que no hacer, malas practicas diseño, errores comunes interfaz

| Error | Cómo se ve | Arreglo |
|---|---|---|
| Mezclar idiomas | Pestaña "Home" y botón "Guardar" | Todo en español: "Inicio" |
| Faltas de ortografía | "Categoria", "Descripcion", "Estadisticas" | Revisa acentos en **todos** los `Text` |
| Mostrar el id | "#3 Tacos Juanito" | Quita el `Text(antojo.id)` |
| Texto sin contraste | Gris claro sobre blanco, blanco sobre amarillo | Usa `paletaTexto`/`paletaTextoSuave` |
| Texto encima de una imagen | No se lee | Pon fondo al texto o sácalo de la imagen (la tarea lo dice: "sin imágenes de background en textos") |
| Elementos pegados a la orilla | El texto toca el borde | `.padding()` |
| Contenido cortado | El botón Guardar no se ve en iPhone chico | `ScrollView` |
| Botones diminutos | Texto azul pequeño como único botón | `.buttonStyle(.borderedProminent)` + ancho completo |
| Imágenes deformadas | Fotos estiradas | `.aspectRatio(contentMode: .fit)` |
| Misma foto para todo | Los 10 antojos con la misma imagen | Imágenes distintas (la tarea lo pedía explícito) |
| Colores al azar | Cada pantalla de otro color | Una paleta en `Utils` usada en todas |
| Alertas genéricas | "Error" | Mensaje específico: "Escribe el precio" |
| Pantalla sin fondo | Blanco en unas, color en otras | Mismo fondo en todas |

---

---

# 13. Errores de Xcode: mensaje → causa → arreglo

Busca aquí **copiando el texto del error** (o una palabra de él) con ⌘F. Todos los mensajes de compilador de esta parte se provocaron a propósito en Xcode 26 / Swift 6 y se copiaron tal cual salen.

## 13.1 Cómo leer un error
🔎 como leer errores, error rojo, warning amarillo, issue navigator, no compila, build failed, fix, sugerencia, donde esta el error

- **Rojo (error):** la app **no compila**. Hay que arreglarlo sí o sí.
- **Amarillo (warning):** compila, pero algo no está bien (variable sin usar, algo viejo/deprecated). Conviene arreglarlo.
- **Morado (runtime issue):** sale **mientras corre** la app (ej. ids repetidos en una lista).
- Haz clic en el error para que Xcode te lleve a la línea. **⌘5** muestra la lista de **todos** los errores.
- Si el error trae un botón **Fix**, Xcode te propone el arreglo. Léelo antes de aceptarlo.
- **Arregla el primer error primero.** Un solo error (ej. una llave `}` de más) puede provocar 20 errores falsos abajo.
- El compilador escribe los mensajes en minúscula (`error: cannot find…`); Xcode los muestra con mayúscula (`Cannot find…`). Es el mismo mensaje.
- `'X'`, `'Y'` en los mensajes = nombres de **tu** código (tu variable, tu struct, tu tipo).

## 13.2 Errores de "dónde va el código" y llaves
🔎 top level, fuera de funcion, llaves, braces, expected, extraneous, consecutive statements, punto y coma, struct sin cerrar, codigo suelto

### 13.2.1 `Expressions are not allowed at the top level`
**Qué significa:** escribiste una **instrucción** (asignar, llamar una función, `print`) **fuera** de cualquier `func` o `struct`. Fuera de todo solo se pueden **declarar** cosas (`let`, `var`, `func`, `struct`).

```swift
// ❌ esto NO compila:
import Foundation

let formato = DateFormatter()
formato.dateFormat = "dd/MM/yyyy"     // ← instrucción suelta
```

**Arreglo:** mete las instrucciones **dentro** de la función donde se usan:

```swift
func cargarAntojos() -> Array<Antojo> {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    var lista = Array<Antojo>()
    // lista.append(...)
    return lista
}
```

### 13.2.2 `Expected 'func' keyword in instance method declaration`
**Qué significa:** pusiste una instrucción (ej. `print("hola")`) directo dentro de un `struct`, fuera del `body` y fuera de una función. Dentro de un struct solo van propiedades (`var`/`let`) y funciones (`func`).

**Arreglo:** muévela a una acción (`Button`, `.onAppear`) o dentro de una `func`.

### 13.2.3 `Expected '}' in struct` / `Expected '}' at end of brace statement`
**Qué significa:** abriste una llave `{` y **no la cerraste**.
**Arreglo:** selecciona todo (**⌘A**) y presiona **⌃I** para re-indentar: donde la sangría se ve rara, ahí falta la llave. Haz doble clic en una `{` y Xcode resalta su pareja.

### 13.2.4 `Extraneous '}' at top level`
**Qué significa:** sobra una `}` (cerraste de más).
**Arreglo:** borra la llave sobrante; usa ⌘A + ⌃I para ver dónde.

### 13.2.5 `Consecutive statements on a line must be separated by ';'`
**Qué significa:** pusiste dos instrucciones en la misma línea sin nada en medio, o te faltó un operador o una coma.

```swift
// ❌ esto NO compila:
let a = 5 let b = 6
```

**Arreglo:** una instrucción por línea. Si es una lista de parámetros, te falta una **coma** entre ellos.

### 13.2.6 `'main' attribute can only apply to one type in a module`
**Qué significa:** hay **dos** `@main` (por ejemplo copiaste el archivo App de otro proyecto).
**Arreglo:** deja solo el `@main` de tu archivo `TuAppApp.swift`; borra el otro archivo o quítale `@main`.

## 13.3 Nombres, parámetros y llamadas
🔎 cannot find in scope, not found, no existe, redeclaration, duplicado, missing argument, extra argument, argument label, etiqueta, parametro, orden de parametros, no member

### 13.3.1 `Cannot find 'X' in scope`
**Qué significa:** Swift no conoce ese nombre **en ese lugar**. (Antes decía `Use of unresolved identifier 'X'`: es el mismo error.)

Causas y arreglos:

| Causa | Arreglo |
|---|---|
| Lo escribiste mal (`nonbre`, `Nombre` vs `nombre`) | Swift distingue mayúsculas. Copia el nombre exacto |
| La variable está en **otra** vista o función | Pásala como parámetro (`DetalleView(antojo: antojo)`) |
| Usas una variable de un `ForEach`/`List` fuera de sus llaves | Solo existe dentro de `{ antojo in … }` |
| El archivo con ese struct no existe en tu proyecto | Cópialo (revisa `NECESITA:` en el repo) |
| Falta el `import` | `Chart` → `import Charts`; `PhotosPicker` → `import PhotosUI` (ver 13.10) |
| `Cannot find '$t' in scope` | Usaste `$` en una variable que **no** es `@State`/`@Binding` (ver 13.8.4) |

### 13.3.2 `Cannot find type 'X' in scope`
Igual que el anterior, pero con un **tipo** (struct, View). Ej. `Cannot find type 'View' in scope` → al archivo le falta `import SwiftUI` (lo creaste como "Swift File").

### 13.3.3 `Invalid redeclaration of 'X'`
**Qué significa:** hay **dos cosas con el mismo nombre** en el proyecto (dos `struct Antojo`, dos `func cargarAntojos()`, dos `var nombre` en el mismo struct).
**Arreglo:** ⇧⌘F busca `struct Antojo` y borra o renombra uno. Pasa mucho al copiar archivos del repo: si ya tienes un `DetalleView`, renombra el que copiaste.

### 13.3.4 `Missing argument for parameter 'nombre' in call`
**Qué significa:** al crear el struct o llamar la vista **te faltó un dato** que es obligatorio.

```swift
// ❌ esto NO compila:
struct Antojo { var id: Int; var nombre: String }
let a = Antojo(id: 1)                    // falta nombre
```

**Arreglo:** pásalo: `Antojo(id: 1, nombre: "Tacos")`. Si es una vista con `@Binding` en el `#Preview`: `MiVista(texto: .constant("hola"))`. También sale como `Missing arguments for parameters 'a', 'b' in call` cuando faltan varios.

### 13.3.5 `Extra argument 'nombre' in call`
**Qué significa:** le pasaste un dato que el struct **no tiene** (o lo escribiste diferente).
**Arreglo:** revisa los nombres de las propiedades del struct. Si querías ese dato, agrégalo al struct.

### 13.3.6 `Argument passed to call that takes no arguments`
**Qué significa:** la vista/función **no recibe nada** y le pasaste algo (`DetalleView(nombre: "x")` pero `DetalleView` no tiene `var nombre`).
**Arreglo:** agrega `var nombre: String` a esa vista (sin `@State` ni `private`, Clase 6B) o quita el argumento.

### 13.3.7 `Missing argument label 'nombre:' in call`
**Qué significa:** la función pide la etiqueta y no la escribiste.

```swift
func saludar(nombre: String) { }
// ❌ saludar("Ana")
saludar(nombre: "Ana")       // ✅
```

Si quieres llamarla sin etiqueta, decláralo con `_` y **espacio**: `func saludar(_ nombre: String)`.

### 13.3.8 `Incorrect argument label in call (have 'name:', expected 'nombre:')`
**Arreglo:** usa la etiqueta que dice `expected`.

### 13.3.9 `Argument 'id' must precede argument 'nombre'`
**Qué significa:** los datos van en **el mismo orden** en que declaraste las propiedades del struct.
**Arreglo:** reordénalos como en el struct.

### 13.3.10 `Value of type 'Antojo' has no member 'precio'`
**Qué significa:** ese struct **no tiene** esa propiedad (o la escribiste distinto).
**Arreglo:** revisa el nombre exacto en el struct, o agrégala. Con un modificador mal escrito sale igual: `Value of type 'Text' has no member 'fontt'`.

### 13.3.11 `Instance member 'nombre' cannot be used on type 'Antojo'; did you mean to use a value of this type instead?`
**Qué significa:** usaste el **molde** (`Antojo.nombre`) en vez de **un antojo** (`antojo.nombre`). El struct no tiene nombre; cada antojo sí.
**Arreglo:** usa la variable (minúscula): `antojo.nombre`, `lista[0].nombre`.

### 13.3.12 `Instance member 'padding' cannot be used on type 'View'`
**Qué significa:** pusiste un modificador **solo**, sin una vista antes (ej. `.padding()` en una línea suelta o después de cerrar una llave equivocada).
**Arreglo:** el modificador debe ir pegado a una vista: `Text("Hola").padding()`.

### 13.3.13 `Cannot use instance member 'a' within property initializer; property initializers run before 'self' is available`
**Qué significa:** intentaste calcular una propiedad usando **otra propiedad** al declararla.

```swift
// ❌ esto NO compila:
@State private var lista = cargarAntojos()
var total = lista.count
```

**Arreglo:** hazla **propiedad calculada** (se calcula cada vez que se usa):

```swift
var total: Int {
    return lista.count
}
```

## 13.4 Tipos y conversiones
🔎 cannot convert value of type, tipo incorrecto, string a int, int a double, double a int, binary operator, mismatching types, convertir tipos, return type

### 13.4.1 `Cannot convert value of type 'String' to expected argument type 'Int'`
**Qué significa:** pasaste un **texto** donde se esperaba un **número** (o al revés).
**Arreglo:** convierte: texto → número con `Int(texto)` / `Double(texto)` (regresan **opcional**, usa `if let`); número → texto con `String(numero)` o `"\(numero)"`.

### 13.4.2 `Cannot assign value of type 'String' to type 'Int'`
**Qué significa:** la variable es `Int` y le quieres guardar un `String`. Una variable **no cambia de tipo**.
**Arreglo:** convierte el valor o usa otra variable.

### 13.4.3 `Binary operator '+' cannot be applied to operands of type 'String' and 'Int'`
**Qué significa:** no se puede sumar texto con número.

```swift
let edad = 20
// ❌ let s = "Edad: " + edad
let s = "Edad: " + String(edad)     // ✅ concatenar
let s2 = "Edad: \(edad)"            // ✅ interpolación (más fácil)
```

### 13.4.4 `Binary operator '*' cannot be applied to operands of type 'Int' and 'Double'`
**Qué significa:** Swift **no mezcla** `Int` y `Double` en una operación.
**Arreglo:** convierte uno: `Double(cantidad) * precio`.

### 13.4.5 `Cannot convert value of type 'Int' to specified type 'Double'`
Sale con `let p: Double = fav / total * 100` porque `fav / total` es `Int`. Además, `1 / 3` en enteros da **0**.

```swift
func porcentaje(fav: Int, total: Int) -> Double {
    if total == 0 {
        return 0                                  // evita dividir entre 0
    }
    return Double(fav) / Double(total) * 100
}
```

### 13.4.6 `Cannot convert value of type 'Double' to specified type 'Int'`
**Arreglo:** `Int(miDouble)` (corta los decimales: `Int(3.9)` = 3).

### 13.4.7 `Cannot convert return expression of type 'Int' to return type 'String'`
**Qué significa:** la función dice `-> String` y regresas un número.
**Arreglo:** `return String(numero)` o cambia el tipo de retorno.

### 13.4.8 `Result values in '? :' expression have mismatching types 'String' and 'Int'`
**Qué significa:** en el ternario `condicion ? a : b`, **las dos opciones deben ser del mismo tipo**.
**Arreglo:** `esFavorito ? "Sí" : "No"` (los dos String).

### 13.4.9 `No exact matches in call to initializer`
**Qué significa:** llamaste un `init` con un tipo que no acepta. El caso típico: `Text(numero)`.

```swift
let n = 5
// ❌ Text(n)
Text("\(n)")          // ✅
Text(String(n))       // ✅
```

### 13.4.10 `Reference to member 'red' cannot be resolved without a contextual type`
(También: `Cannot infer contextual base in reference to member 'title'`.)
**Qué significa:** escribiste `.red` o `.title` sin que Swift sepa de qué tipo es. Pasa con `let c = .red` o cuando el modificador anterior está mal escrito.
**Arreglo:** pon el tipo: `let c = Color.red` / `let c: Color = .red`. Si sale junto a otro error, arregla primero el otro.

### 13.4.11 `'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead.`
**Qué significa:** en Swift no se puede hacer `texto[0]` para sacar una letra.
**Arreglo:** usa `texto.first` (opcional), `Array(texto)[0]` o `texto.prefix(1)`.

### 13.4.12 `Generic parameter 'Element' could not be inferred` / `Empty collection literal requires an explicit type`
**Qué significa:** creaste un arreglo vacío sin decir **de qué** (`let a = []`, `let a = Array()`).
**Arreglo:** di el tipo: `var lista = Array<Antojo>()` o `var lista: [Antojo] = []`.

### 13.4.13 `The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions`
**Qué significa:** escribiste una operación o una vista **demasiado larga** y Swift se tarda en adivinar los tipos. Muchas veces el problema real es un error de tipo escondido (mezclar Int y Double).
**Arreglo:** divide la cuenta en varias `let` con tipo explícito; o parte el `body` en componentes/vistas más chicas.

## 13.5 Opcionales (`?`, `nil`, `if let`)
🔎 optional, opcional, unwrap, nil, if let, value of optional type must be unwrapped, conditional binding, force unwrap, signo de admiracion, ??

### 13.5.1 `Value of optional type 'Int?' must be unwrapped to a value of type 'Int'`
**Qué significa:** ese valor **puede ser `nil`** (opcional) y lo usas como si siempre existiera. Pasa con `Int(texto)`, `Double(texto)`, `lista.first`, `randomElement()`, `Calendar…date(byAdding:)` (→ `Date?`), `UIImage?` en `Image(uiImage:)`.

```swift
func convertir(texto: String) -> Int {
    if let numero = Int(texto) {      // ✅ optional binding (lo recomienda Swift, Clase 2)
        return numero + 1
    }
    return 0                            // si no era número
}
```

Para imágenes de la cámara/galería:

```swift
if let fotoBien = foto {
    Image(uiImage: fotoBien)
        .resizable(resizingMode: .stretch)
        .aspectRatio(contentMode: .fit)
}
```

**No uses `!`** para arreglarlo: si el valor es `nil`, la app **truena** (ver 13.14.2).

### 13.5.2 `Initializer for conditional binding must have Optional type, not 'String'`
**Qué significa:** usaste `if let` con algo que **no es opcional**. No hay nada que "desempacar".
**Arreglo:** quita el `if let` y usa el valor directo; o, si querías convertir, convierte adentro: `if let n = Int(texto)`.

### 13.5.3 `Cannot use optional chaining on non-optional value of type 'String'`
**Arreglo:** quita el `?` (`texto?.count` → `texto.count`).

### 13.5.4 `Cannot force unwrap value of non-optional type 'String'`
**Arreglo:** quita el `!`.

## 13.6 let, var y "no se puede modificar"
🔎 let constant, cannot assign, immutable, self is immutable, mutating, no puedo cambiar variable, get-only, never mutated, property wrapper var

### 13.6.1 `Cannot assign to value: 'x' is a 'let' constant`
**Qué significa:** `let` = constante, solo se asigna **una vez**.
**Arreglo:** cámbiala a `var`.

### 13.6.2 `Cannot use mutating member on immutable value: 'lista' is a 'let' constant`
**Qué significa:** hiciste `lista.append(...)` (o `remove`) sobre un `let`.
**Arreglo:** `var lista = Array<Antojo>()`.

### 13.6.3 `Cannot assign to property: 'a' is a 'let' constant`
Igual, pero con una propiedad de un struct guardado en `let`: `let a = Antojo(...)` → `a.nombre = "x"` falla. Usa `var a`.

### 13.6.4 `Left side of mutating operator isn't mutable: 'self' is immutable`
(En otros casos: `Cannot assign to property: 'self' is immutable`.)
**Qué significa (en una vista):** quieres cambiar una variable de la vista que **no es `@State`**. Las vistas son structs que SwiftUI vuelve a crear; solo `@State` (o `@Binding`) pueden cambiar.

```swift
// ❌ esto NO compila:
struct Contador: View {
    var contador = 0
    var body: some View {
        Button("Sumar") { contador += 1 }
    }
}
```

**Arreglo:** `@State private var contador = 0`.

**Qué significa (en un struct normal):** una `func` que cambia propiedades del struct necesita `mutating` (⚠️ no visto en clase):

```swift
struct ContadorDatos {
    var n = 0
    mutating func sumar() {
        n += 1
    }
}
```

### 13.6.5 `Cannot assign to property: 'doble' is a get-only property`
**Qué significa:** es una **propiedad calculada** (`var doble: Int { return … }`): solo se lee, no se asigna.
**Arreglo:** cambia la propiedad de la que depende, no la calculada.

### 13.6.6 `Property wrapper can only be applied to a 'var'`
**Qué significa:** pusiste `@State private let`. **Arreglo:** `@State private var`.

### 13.6.7 `Variable 'x' used before being initialized`
**Qué significa:** declaraste `var x: Int` sin valor y la usaste antes de darle uno. (Este error sale al **compilar** con ⌘B, no siempre mientras escribes.)
**Arreglo:** dale valor inicial: `var x = 0`.

## 13.7 Errores de vistas (SwiftUI)
🔎 does not conform to protocol View, type () cannot conform to View, buildExpression, opaque return type, some View, body vacio, vista, print en body, if en body

### 13.7.1 `Type 'V' does not conform to protocol 'View'`
**Qué significa:** tu `struct X: View` **no tiene `body`** (o lo escribiste mal: `var Body`, `var body: View`).
**Arreglo:**

```swift
struct MiVista: View {
    var body: some View {
        Text("Hola")
    }
}
```

### 13.7.2 `Type '()' cannot conform to 'View'`
**Qué significa:** dentro del `body` (o de un `VStack`, `HStack`…) pusiste algo que **no es una vista**: una asignación (`x = 5`), un `print()`, un `append`. Dentro de los stacks solo van vistas.
**Arreglo:** esas instrucciones van **dentro de una acción**: `Button("…") { x = 5 }`, `.onAppear { print("…") }`, o en una `func`.

### 13.7.3 `Static method 'buildExpression' requires that 'Int' conform to 'View'`
**Qué significa:** pusiste un valor suelto (un número, un String, un struct) dentro de un stack.
**Arreglo:** envuélvelo en una vista: `Text("\(n)")`.

### 13.7.4 `Function declares an opaque return type, but has no return statements in its body from which to infer an underlying type`
**Qué significa:** una propiedad `var algo: some View { }` quedó **vacía** (sin ninguna vista adentro).
**Arreglo:** pon al menos una vista dentro, o bórrala.

### 13.7.5 `Contextual closure type '@MainActor () -> Void' expects 0 arguments, but 1 was used in closure body`
**Qué significa:** pusiste un parámetro (`x in`) en un closure que no recibe nada, como la acción de un `Button`.
**Arreglo:** `Button("Sumar") { contador += 1 }` (sin `x in`).

### 13.7.6 `Incorrect argument labels in call (have 'label:selection:_:', expected 'selection:content:label:')`
**Qué significa:** escribiste el `Picker` con los parámetros en otro orden.
**Arreglo (forma de clase):** `Picker(selection: $seleccion, label: Text("Etiqueta")) { … }`.

## 13.8 `@State`, `@Binding` y `$`
🔎 binding, $, dolar, State, use wrapper instead, use wrapped value instead, Binding<String>, TextField no funciona, constant, pasar binding

### 13.8.1 `Cannot convert value 't' of type 'String' to expected type 'Binding<String>', use wrapper instead`
**Qué significa:** ese control **modifica** la variable, así que necesita el **binding** (`$`). Pasa con `TextField`, `Toggle`, `Slider`, `Picker`, `.alert(isPresented:)`, `.sheet(isPresented:)`, o una vista que recibe `@Binding`.
**Arreglo:** ponle `$`: `TextField("Nombre", text: $nombre)`, `.alert("Hola", isPresented: $showAlert)`, `EditarView(nombre: $nombre)`.

### 13.8.2 `Cannot convert value '$t' of type 'Binding<String>' to expected type 'String', use wrapped value instead`
**Qué significa:** al revés: la vista **solo muestra** el dato (`var t: String`), pero le mandaste `$t`.
**Arreglo:** quita el `$`. Regla (Clase 6B): **sin `$` = solo leer; con `$` = leer y modificar.**

### 13.8.3 `Cannot convert value of type 'Binding<[J]>.Element' (aka 'Binding<J>') to expected argument type 'J'`
**Qué significa:** en `List($lista) { $item in … }` le mandaste `$item` a una vista que recibe el valor normal.
**Arreglo:** al renglón que solo muestra mándale `item` (sin `$`); al detalle que modifica, `$item`:

```swift
List($antojos) { $antojo in
    NavigationLink {
        EditarAntojoView(antojo: $antojo)     // con $: modifica
    } label: {
        AntojoRow(antojo: antojo)             // sin $: solo muestra
    }
}
```

### 13.8.4 `Cannot find '$t' in scope`
**Qué significa:** pusiste `$` a una variable que no es `@State` ni `@Binding`.
**Arreglo:** decláralo `@State private var t = ""` (si esta vista es dueña) o `@Binding var t: String` (si se lo pasa otra).

### 13.8.5 `Cannot convert value 'l' of type '[J2]' to expected type 'Binding<[J2]>', use wrapper instead`
**Qué significa:** escribiste `List(lista) { $item in }`. Si quieres bindings en el renglón, la lista también va con `$`: `List($lista) { $item in }`.

### 13.8.6 Preview: `Missing argument for parameter 't' in call`
La vista tiene `@Binding var t: String` y el `#Preview` no le pasa nada.

```swift
#Preview {
    EditarAntojoView(antojo: .constant(Antojo(id: 1, nombre: "Tacos", precio: 100, favorito: true)))
}
```

## 13.9 Listas, `ForEach` e `Identifiable`
🔎 identifiable, hashable, ForEach, List, id, ids repetidos, duplicate id, init rowContent, conform, lista no aparece, renglones cruzados

### 13.9.1 `Initializer 'init(_:rowContent:)' requires that 'Antojo' conform to 'Identifiable'`
**Qué significa:** `List(lista)` necesita saber cómo distinguir cada elemento. El struct debe ser `Identifiable` (Clase 10).
**Arreglo:** `struct Antojo: Identifiable { var id: Int … }`.

### 13.9.2 `Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'Antojo' conform to 'Identifiable'`
Mismo problema, pero con `ForEach(lista)`. Mismo arreglo.

### 13.9.3 `Type 'Antojo' does not conform to protocol 'Identifiable'`
**Qué significa:** pusiste `: Identifiable` pero el struct **no tiene una propiedad llamada exactamente `id`**.
**Arreglo:** agrega `var id: Int` (o `let id = UUID()` si no tienes un número natural).

### 13.9.4 `Generic struct 'ForEach' requires that 'Antojo' conform to 'Hashable'`
**Qué significa:** usaste `ForEach(lista, id: \.self)` con una lista de **structs**. `id: \.self` solo sirve para listas simples (`[String]`, `[Int]`).
**Arreglo:** haz el struct `Identifiable` y usa `ForEach(lista) { antojo in … }` o `List(lista)`.

### 13.9.5 `Non-constant range: argument must be an integer literal` (warning)
**Qué significa:** escribiste `ForEach(0..<n)` con una variable.
**Arreglo:** `ForEach(0..<n, id: \.self) { i in … }` (⚠️ no visto en clase), o mejor recorre la lista directamente.

### 13.9.6 Ids repetidos (warning morado en la consola)
Mensaje: `ForEach<Array<Antojo>, Int, …>: the ID 1 occurs multiple times within the collection, this will give undefined results!`
**Síntoma:** renglones repetidos o cruzados; al tocar uno abre otro; el favorito cambia en el antojo equivocado.
**Arreglo:** cada elemento con un `id` distinto (1, 2, 3…). Para nuevos: el id más grande + 1.

## 13.10 Faltan `import`
🔎 import, cannot find Chart, cannot find PhotosPicker, PhotosPickerItem, Charts, PhotosUI, SwiftUI, Foundation, UIKit

| Mensaje | Falta |
|---|---|
| `Cannot find 'Chart' in scope` (o `BarMark`, `SectorMark`…) | `import Charts` |
| `Cannot find type 'PhotosPickerItem' in scope` / `Cannot find 'PhotosPicker' in scope` | `import PhotosUI` |
| `Cannot find type 'View' in scope` / `Cannot find 'Text' in scope` | `import SwiftUI` |
| `Cannot find type 'Date' in scope` (archivo sin imports) | `import Foundation` (o `SwiftUI`, que ya lo incluye) |

Los `import` van **hasta arriba** del archivo, uno por línea.

## 13.11 Funciones, `return` y `switch`
🔎 missing return, return, switch must be exhaustive, default, funcion no regresa, result of call is unused

### 13.11.1 `Missing return in global function expected to return 'String'`
(En una vista o struct: `Missing return in instance method expected to return 'String'`.)
**Qué significa:** la función promete regresar algo (`-> String`), pero hay un camino (ej. el `else`) donde no regresa nada. Sale al compilar (⌘B).

```swift
func clasificar(n: Int) -> String {
    if n > 5 {
        return "alto"
    }
    return "bajo"          // ✅ un return para cuando no entra al if
}
```

### 13.11.2 `Switch must be exhaustive`
**Qué significa:** en un `switch` con `String` o `Int` hay valores que no cubriste.
**Arreglo:** agrega `default:` al final.

```swift
func categoria(c: String) -> Int {
    switch c {
    case "Tacos":
        return 1
    default:
        return 0
    }
}
```

### 13.11.3 `Result of call to 'f()' is unused` (warning)
**Qué significa:** llamaste una función que **regresa** algo y no lo guardaste. Seguro olvidaste usarlo (`Text(f())`, `let x = f()`).

## 13.12 `throws`, `try` y `async`
🔎 try, throws, do catch, call can throw, async, await, Task, loadTransferable, concurrency, JSONEncoder

### 13.12.1 `Call can throw, but it is not marked with 'try' and the error is not handled`
**Qué significa:** esa función puede **fallar** (ej. `JSONEncoder().encode`, `JSONDecoder().decode`). Swift te obliga a manejar el error.

```swift
func codificar() -> String {
    let jsonEncoder = JSONEncoder()
    do {
        let jsonData = try jsonEncoder.encode([Empleado(id: 1, nombre: "Ana")])
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
    } catch {
        print("Error inesperado \(error)")
    }
    return ""
}
```

Otra forma: `try?` (si falla, regresa `nil`).

### 13.12.2 `'async' call in a function that does not support concurrency`
**Qué significa:** llamaste algo `async` (que tarda, como `loadTransferable` de PhotosPicker) fuera de un `Task`.
**Arreglo (forma de clase, Clase 17):**

```swift
.onChange(of: selectedItem) { oldItem, newItem in
    Task {
        if let data = try? await newItem?.loadTransferable(type: Data.self),
           let uiImage = UIImage(data: data) {
            selectedImage = uiImage
        }
    }
}
```

### 13.12.3 `Expression is 'async' but is not marked with 'await'`
**Arreglo:** pon `await` antes de la llamada (dentro de un `Task { }`).

## 13.13 Warnings (amarillo) que vas a ver
🔎 warning, amarillo, never mutated, never used, deprecated, obsoleto, will never be executed, onChange deprecated

| Warning | Qué significa | Arreglo |
|---|---|---|
| `Variable 'x' was never mutated; consider changing to 'let' constant` | Usaste `var` pero nunca la cambias | Cámbiala a `let` (o ignóralo) |
| `Initialization of immutable value 'x' was never used; consider replacing with assignment to '_' or removing it` | Declaraste algo y no lo usas | Bórralo o úsalo |
| `'onChange(of:perform:)' was deprecated in iOS 17.0: Use 'onChange' with a two or zero parameter action closure instead.` | Usaste la forma vieja con un parámetro (`{ nuevo in }`) | Forma de clase: `.onChange(of: x) { oldValue, newValue in }` |
| `Will never be executed` | Hay código que nunca puede correr (ej. un `if` con una constante que siempre es igual) | Revisa la condición |
| `Result of call to 'f()' is unused` | Ver 13.11.3 | Usa el resultado |
| `Non-constant range: argument must be an integer literal` | Ver 13.9.5 | |

Sobre `.foregroundColor`, `.cornerRadius` y `NavigationView`: Apple los considera "viejos", pero con iOS 17 **no** marcan warning. `.foregroundColor` y `.foregroundStyle` se vieron en clase (usa la que ya use tu proyecto). `NavigationView` es la forma vieja: usa **`NavigationStack`**.

## 13.14 La app truena (crash) o la consola se queja
🔎 crash, truena, se cierra la app, fatal error, index out of range, unexpectedly found nil, SIGABRT, Thread 1, division by zero, NSCameraUsageDescription, source type not available, morado, runtime

Cuando la app truena, Xcode se detiene en una línea marcada en rojo y dice `Thread 1: …`. El mensaje completo está en la **consola** (⇧⌘Y).

### 13.14.1 `Fatal error: Index out of range`
**Qué significa:** pediste una posición que **no existe** en el arreglo (ej. `lista[5]` con 3 elementos; `lista[0]` con lista vacía). Recuerda: empieza en **0** y el último es `count - 1`.
**Arreglo:** revisa antes: `if indice < lista.count { … }`, o usa `lista.first` / `randomElement()` con `if let`.

### 13.14.2 `Fatal error: Unexpectedly found nil while unwrapping an Optional value`
**Qué significa:** usaste `!` en un opcional que era `nil` (ej. `Int(texto)!` cuando el usuario escribió letras).
**Arreglo:** cambia el `!` por `if let` (13.5.1).

### 13.14.3 `Fatal error: Division by zero`
**Qué significa:** dividiste un `Int` entre 0 (ej. promedio con la lista vacía).
**Arreglo:** `if total == 0 { return 0 }` antes de dividir.

### 13.14.4 Crash al abrir la cámara: falta el permiso
Mensaje en consola: `This app has crashed because it attempted to access privacy-sensitive data without a usage description. The app's Info.plist must contain an NSCameraUsageDescription key with a string value explaining to the user how the app uses this data.` (Xcode muestra `Thread 1: signal SIGABRT`).
**Arreglo:** agrega **Privacy - Camera Usage Description** en la pestaña Info (ver 1.14).

### 13.14.5 Crash al abrir la cámara en el simulador: `Source type 1 not available`
**Qué significa:** el simulador **no tiene cámara**.
**Arreglo:** prueba en iPhone físico. Para que no truene en el simulador, revisa antes (⚠️ no visto en clase): `if UIImagePickerController.isSourceTypeAvailable(.camera) { showCamara = true } else { /* alerta */ }`. En el repo: `10_FotosYCamara/TomarFotoView.swift`.

### 13.14.6 `No image named 'tacos' found in asset catalog for …` (consola)
La imagen no aparece. El nombre no coincide con el de Assets (mayúsculas, espacios) o está vacío (`''`). Ver 1.8.

### 13.14.7 `Picker: the selection "x" is invalid and does not have an associated tag, this will give undefined results.`
**Qué significa:** el valor inicial de tu variable no coincide con ningún `.tag(...)`, o los tags son de **otro tipo** (variable `Int` con `.tag("1")` String).
**Arreglo:** el tipo de la variable y de los tags deben ser iguales, y el valor inicial debe existir como tag (ej. `@State private var categoria = ""` + `Text("Selecciona…").tag("")`).

### 13.14.8 `Modifying state during view update, this will cause undefined behavior.`
**Qué significa:** cambias un `@State` **mientras se dibuja** la vista (ej. dentro de una propiedad calculada o directo en el `body`).
**Arreglo:** cambia el estado solo en acciones: `Button`, `.onAppear`, `.onChange`.

### 13.14.9 `Accessing State's value outside of being installed on a View. This will result in a constant Binding of the initial value and will not update.`
**Qué significa:** usaste un `@State` fuera de una vista que se esté mostrando (ej. en el `init` o desde otro struct que no es `View`).
**Arreglo:** el `@State` se usa solo dentro del `body` o de las acciones de esa vista.

### 13.14.10 `Publishing changes from background threads is not allowed…`
Solo sale con `ObservableObject`, que **no se usa en el curso**. Si lo ves, estás usando un patrón que no es de clase.

## 13.15 Errores de Xcode (build, firma, preview)
🔎 codesign, firma, signing, development team, multiple commands produce, cannot preview, preview crashed, build failed, simulador no abre, unable to boot

| Mensaje | Qué significa | Arreglo |
|---|---|---|
| `Signing for "MisAntojos" requires a development team. Select a development team in the Signing & Capabilities editor.` | Falta el Team (solo pasa al correr en iPhone físico) | Proyecto → TARGETS → **Signing & Capabilities** → **Team** = tu Personal Team |
| `Command CodeSign failed with a nonzero exit code` | Problema de firma o archivos raros en la carpeta | Clean Build Folder (⇧⌘K); revisa el Team; cierra y abre Xcode |
| `Multiple commands produce '…/MisAntojos.app/README.md'` | Dos archivos con **el mismo nombre** en carpetas distintas (ej. dos `.md`, dos `datos.json`) | Renombra uno |
| `Cannot preview in this file` / `Preview crashed` / "Preview paused" | Hay errores en algún archivo, o la vista truena al dibujarse | ⌘B y arregla los errores; ⌥⌘P; revisa que el `#Preview` le pase datos válidos |
| `Build Failed` sin error visible | El error está en otro archivo | **⌘5** (Issue navigator) |
| El simulador no abre / `Unable to boot the Simulator` | El simulador se trabó | Cierra el Simulador; Device → Erase All Content and Settings; o reinicia la Mac |
| Errores rarísimos que no tienen sentido | Caché vieja | Ver 1.16 (Clean Build Folder → borrar DerivedData) |

## 13.16 No sale error, pero "no funciona" (síntomas)
🔎 no funciona, no aparece, no se ve, dos barras, doble navegacion, navigationTitle no sale, titulo no aparece, imagen no aparece, teclado no se esconde, alerta no sale, cambios no se ven, no se actualiza, boton no responde, fondo no cubre, texto no se ve

| Síntoma | Causa más común | Arreglo |
|---|---|---|
| **El `navigationTitle` no aparece** | La vista no está dentro de un `NavigationStack` | Pon `NavigationStack { }` en la pantalla raíz (o en cada pestaña) y el `.navigationTitle` sobre el **contenido**, adentro. En el preview de pantallas empujadas: `NavigationStack { MiVista() }` |
| **Dos barras de navegación / dos flechas "<"** | Hay un `NavigationStack` dentro de otro (ej. uno afuera del TabView y otro en la pestaña, o en la pantalla destino) | Solo uno: en la raíz de cada pestaña. Las pantallas a las que llegas con `NavigationLink` **no** llevan `NavigationStack` |
| **El `NavigationLink` no hace nada / se ve gris** | No hay `NavigationStack` arriba | Agrega el `NavigationStack` en la vista raíz |
| **La imagen no aparece** | Nombre distinto al de Assets, o `imagen: ""` | Copia el nombre exacto del Image Set |
| **La imagen sale gigante o deformada** | Falta `.resizable` o `.aspectRatio` | `.resizable(resizingMode: .stretch)` → `.aspectRatio(contentMode: .fit)` → `.frame(width: …)` (en ese orden, Clase 3) |
| **El teclado no se esconde** | Falta `@FocusState` | `@FocusState private var campoEnFoco: Bool` + `.focused($campoEnFoco)` en el TextField + `.onTapGesture { campoEnFoco = false }` en el **Stack principal** (Clase 4) |
| **La alerta no sale** | Nunca prendes la booleana, o el `.alert` está pegado a una vista que no se muestra (dentro de un `if` falso) | `showAlert.toggle()` en la acción; pega el `.alert` al botón o al stack principal |
| **Los cambios del detalle no se ven al regresar** | Pasaste una **copia** (`List(lista)` + `var antojo`) en vez de un binding | `List($lista) { $item in }` y en el detalle `@Binding var antojo: Antojo`, llamado con `$` (Clase 6B) |
| **Los cambios no se ven en otra pestaña** | Cada pestaña carga su propia lista | Un solo `@State private var lista` en la vista del `TabView`; con `$` a quien modifica, sin `$` a quien solo lee |
| **Agregué un elemento y no aparece** | Hiciste `append` a una copia, o la lista es un `let`/`var` global sin `@State` | La lista debe ser `@State` (o `@Binding` en el formulario) |
| **El botón solo responde en el texto, no en todo el rectángulo** | El `.frame` va afuera del label | El `.frame(maxWidth: .infinity)` va **dentro** del label |
| **El fondo no cubre toda la pantalla (quedan bordes blancos)** | Falta `.ignoresSafeArea()` | `ZStack { color.ignoresSafeArea() … }` |
| **El texto no se ve** | Modo oscuro con fondo claro fijo, o poco contraste | Colores de tu paleta para texto y fondo; prueba con ⇧⌘A en el simulador |
| **La lista tiene fondo gris aunque puse color** | `List` dibuja su propio fondo | `.scrollContentBackground(.hidden)` + `.background(color)` |
| **Renglones repetidos o al tocar uno abre otro** | Ids repetidos | Ver 13.9.6 |
| **El contenido se corta abajo** | No hay `ScrollView` | Envuelve el contenido en `ScrollView { }` |
| **El Slider/Toggle/TextField no cambia** | No le pasaste `$` o la variable no es `@State` | `@State private var` + `$variable` |
| **El Picker no cambia de opción** | Tipo de tag distinto al de la variable | Ver 13.14.7 |
| **La gráfica no se actualiza** | La gráfica usa una copia fija de los datos | Que use la misma lista `@State` (o se la pases sin `$`) |
| **La foto elegida no aparece** | No convertiste el `PhotosPickerItem` a `UIImage`, o no está el `Task` | Pasos A–F de la Clase 17 (`.onChange` + `Task` + `loadTransferable`) |
| **El preview no muestra nada** | La vista recibe datos y el preview no se los da, o la lista está vacía | Pásale datos de prueba en el `#Preview` |

---

# 14. Glosario

Palabras que vas a oír en clase o ver en errores, explicadas en 1–2 frases con un ejemplo mini. Están en orden alfabético; los símbolos van primero.

## 14.1 Símbolos
🔎 simbolos, signo de dolar, guion bajo, arroba, signo de interrogacion, signo de admiracion, flecha, backslash, diagonal invertida, punto, dos puntos

| Símbolo | Qué significa | Ejemplo |
|---|---|---|
| `$` | Pide el **binding** de una variable `@State`/`@Binding`: permiso para **leer y modificar** desde otro lado | `TextField("Nombre", text: $nombre)` |
| `$item` en `List($lista) { $item in }` | `$item` es el binding del elemento; `item` (sin `$`) es su valor | `EditarView(item: $item)` |
| `_` (guion bajo + espacio en un parámetro) | Al llamar la función **no** se escribe la etiqueta | `func saludar(_ nombre: String)` → `saludar("Ana")` |
| `_` (como nombre) | "No me importa este valor" | `let _ = calcular()` |
| `@` | Marca un **atributo** o **property wrapper** | `@State`, `@Binding`, `@main` |
| `@main` | "Aquí empieza la app". Solo uno por proyecto | `@main struct MiApp: App` |
| `?` (en un tipo) | El valor es **opcional**: puede ser `nil` | `var foto: UIImage?` |
| `?` (en una llamada) | *Optional chaining*: si es `nil`, no sigue | `item?.loadTransferable(...)` |
| `!` (después de un valor) | *Force unwrap*: "confía en que no es nil". Si es nil, **truena** | `Int(texto)!` ❌ evítalo |
| `!` (antes de un Bool) | "No" (lo contrario) | `if !antojo.favorito { }` |
| `??` | Valor por default si es `nil` (⚠️ no visto en clase) | `Int(texto) ?? 0` |
| `->` | "Regresa" (tipo de retorno de una función) | `func total() -> Int` |
| `\(...)` | **Interpolación**: mete un valor dentro de un texto | `"Hola \(nombre)"` |
| `\.self` | "Usa el elemento mismo como id" (solo en listas simples) | `ForEach(nombres, id: \.self)` |
| `.algo` (al inicio) | Un valor de un tipo que Swift ya conoce por el contexto | `.font(.title)`, `.foregroundStyle(.red)` |
| `{ x in … }` | Un **closure** que recibe `x` | `List(lista) { antojo in … }` |
| `//` | Comentario de una línea (Swift lo ignora) | `// esto es una nota` |
| `...` y `..<` | Rangos: `1...5` incluye el 5; `0..<5` no incluye el 5 | `for i in 1...5 { }` |
| `==`, `!=` | Igual a / diferente de | `if nombre == "" { }` |
| `&&`, `\|\|` | Y / O | `if a > 0 && b > 0 { }` |
| `+=`, `-=` | Sumar/restar a la misma variable | `contador += 1` |
| `%` | Residuo de una división | `7 % 2` = 1 (sirve para saber si es par) |

## 14.2 A – C
🔎 glosario a, glosario b, glosario c, App, argumento, array, asset, async, await, binding, body, bool, bundle, canvas, charts, ciclo, class, closure, codable, componente, conformar, constante

- **Alerta (`.alert`)**: ventanita del sistema con título, mensaje y botones. Se prende con una `Bool`. `.alert("Falta el nombre", isPresented: $showAlert) { Button("OK") {} }`.
- **`App` (protocolo)**: el struct principal de la app (el de `@main`). Su `body` es una `Scene`, no una `View`.
- **Argumento**: el **valor** que le mandas a una función al llamarla. En `saludar(nombre: "Ana")`, `"Ana"` es el argumento.
- **Array / arreglo**: lista ordenada de valores del **mismo tipo**. `Array<Antojo>` y `[Antojo]` son lo mismo. `var lista = [1, 2, 3]`.
- **Asset**: un recurso (imagen, color) guardado en `Assets.xcassets`. Se usa por su nombre: `Image("tacos")`.
- **`async` / `await`**: marcan código que **tarda** (cargar una foto). Se llama dentro de un `Task { }` con `await`. Clase 17: `try? await newItem?.loadTransferable(type: Data.self)`.
- **Binding**: una "conexión" a un dato que es de **otra** vista: permite leerlo y modificarlo, y SwiftUI se entera del cambio. Se crea con `$`.
- **`@Binding`**: property wrapper para recibir un binding. "Esta vista recibe permiso para leer y modificar el dato de otra vista" (Clase 6B). `@Binding var nickname: String`.
- **`body`**: la propiedad obligatoria de toda `View`: describe **qué se ve**. `var body: some View { Text("Hola") }`.
- **`Bool`**: tipo con solo dos valores: `true` / `false`. `var esFavorito: Bool`.
- **Breakpoint**: flecha azul en una línea; la app se pausa ahí para depurar.
- **Build / compilar**: convertir tu código en app (⌘B). Si hay errores rojos, el build falla.
- **Bundle (`Bundle.main`)**: el "paquete" de la app con todos sus archivos (mp3, json). `Bundle.main.url(forResource: "MarioBros", withExtension: "mp3")`.
- **Canvas**: el panel de Xcode que muestra el `#Preview` (⌥⌘↩).
- **`Character`**: un solo carácter. `let letra: Character = "A"`.
- **Charts**: framework de Apple para gráficas (iOS 16+; pastel/dona iOS 17+). Necesita `import Charts`. `Chart { BarMark(...) }`.
- **Ciclo / loop**: repetir código. `for antojo in lista { }`, `while x < 10 { }`.
- **`class`**: como un struct, pero es de **referencia**: si la copias, las dos variables apuntan al **mismo** objeto. En el curso se usan para protocolos (Clase 8) y en `CamaraPicker` (Coordinator).
- **Closure**: un bloque de código que se pasa como valor (las llaves de un `Button`, de un `List`). `Button("OK") { contador += 1 }`.
- **Codable**: protocolo para convertir un struct a/desde JSON. `struct Empleado: Codable { … }`.
- **Componente**: una vista reutilizable en su propio archivo (en `Components/`), que recibe datos por parámetros. `AntojoRow(antojo: antojo)` (Clase 5A).
- **Conformar (a un protocolo)**: cumplir lo que pide el protocolo. `struct Antojo: Identifiable` "se conforma a Identifiable" porque tiene `id`.
- **Consola**: área de abajo (⇧⌘Y) donde salen los `print()` y los errores al correr.
- **Constante**: valor que no cambia; se declara con `let`.
- **Coordinator**: clase de UIKit que usa `CamaraPicker` para recibir la foto. No lo modificas.
- **`CustomStringConvertible`**: protocolo para decidir cómo se imprime un struct con `print()` (propiedad `description`).

## 14.3 D – H
🔎 glosario d, date, dateformatter, declarar, default, diccionario, dismiss, double, environment, error, extension, float, focusstate, foreach, foundation, frame, funcion, global, hashable

- **`Date`**: tipo para fecha y hora. `Date()` = **ahora mismo**.
- **`DateFormatter`**: convierte una `Date` en texto (Clase 3B). `formato.dateStyle = .long` + `formato.locale = Locale(identifier: "es_MX")` + `formato.string(from: fecha)`.
- **`DateComponents`**: piezas de una fecha (días, meses) para **sumar** a una fecha. `dateComponent.month = 2` + `Calendar.current.date(byAdding:to:)`.
- **Declarar**: crear una variable/constante/función. `var x = 5` declara `x`.
- **`default`**: el caso "cualquier otro" en un `switch`.
- **Deprecated**: algo viejo que Apple ya no recomienda. Funciona, pero sale un warning.
- **Diccionario**: pares llave → valor (⚠️ no visto en clase). `["Tacos": 3, "Postres": 1]`.
- **`dismiss()`**: cierra la pantalla actual o regresa a la anterior. `@Environment(\.dismiss) private var dismiss` → `dismiss()` (Clase 6A).
- **`Divider()`**: línea separadora delgada.
- **`Double`**: número con decimales (64 bits). `var precio: Double = 189.5`.
- **`@Environment`**: lee un valor que da el sistema. En el curso: `@Environment(\.dismiss)`.
- **Error (rojo) / warning (amarillo)**: ver parte 13.
- **Etiqueta de parámetro (label)**: el nombre que se escribe al llamar: `saludar(nombre: "Ana")`. Con `_ nombre` no se escribe.
- **Extension**: agregar cosas a un tipo que ya existe (⚠️ no visto en clase, no lo uses).
- **`Float`**: número con decimales de menos precisión. Usa `Double` salvo que te lo pidan (`AVAudioPlayer.volume` es `Float`).
- **`@FocusState`**: dice si un `TextField` tiene el teclado. Sirve para esconderlo (Clase 4). `@FocusState private var campoEnFoco: Bool`.
- **`ForEach`**: repite una vista por cada elemento, dentro de un `VStack`, `List`, `Picker` o `Chart`. `ForEach(lista) { antojo in Text(antojo.nombre) }`.
- **Foundation**: librería base de Apple (Date, String, JSON…). `SwiftUI` ya la incluye.
- **`frame`**: modificador para el tamaño/ancho/alto de una vista. `.frame(width: 200)`, `.frame(maxWidth: .infinity)`.
- **Función (`func`)**: bloque de código con nombre que puedes llamar. `func total() -> Int { return lista.count }`.
- **Global**: algo declarado **fuera** de todo struct/función; se puede usar desde cualquier archivo. `func cargarAntojos()` en `ModelData.swift`.
- **Hashable**: protocolo que permite usar un valor como id único con `\.self`. `String` e `Int` ya lo son.

## 14.4 I – M
🔎 glosario i, identifiable, if let, import, indice, inferencia, init, instancia, int, interpolacion, label, let, list, mainactor, memberwise, metodo, modal, modelo, modelData, modificador

- **`Identifiable`**: protocolo que exige una propiedad llamada **exactamente `id`**. Con él, `List(lista)` distingue cada elemento (Clase 10).
- **`if let`**: *optional binding*. "Si el opcional tiene valor, sácalo y úsalo". La forma recomendada (Clase 2). `if let n = Int(texto) { … } else { … }`.
- **`import`**: trae una librería al archivo. `import SwiftUI`, `import Charts`, `import PhotosUI`.
- **Índice**: posición en un arreglo. Empieza en **0**. `lista[0]` es el primero.
- **Inferencia de tipos**: Swift adivina el tipo por el valor. `var x = 5` → `Int`; `var y = 5.0` → `Double`.
- **`init` (inicializador)**: la función que **crea** un struct/clase con sus datos. `Antojo(id: 1, nombre: "Tacos")` llama al `init`.
- **Instancia**: un objeto concreto creado a partir de un struct/clase. `Antojo` es el molde; `Antojo(id: 1, …)` es una instancia.
- **`Int`**: número entero. `var calificacion: Int = 5`.
- **Interpolación**: meter valores en un texto con `\( )`. `"Cuesta \(precio)"`.
- **`Label`**: texto + ícono SF Symbol juntos. `Label("Inicio", systemImage: "house")`.
- **`let`**: declara una **constante**: se asigna una sola vez.
- **`List`**: vista que muestra filas con scroll y separadores (Clase 10). `List(lista) { antojo in AntojoRow(antojo: antojo) }`.
- **`@MainActor` / MainActor**: el "hilo principal", donde se dibuja la pantalla. Xcode 26 pone todo tu código ahí por default, por eso casi no tendrás errores de hilos.
- **Memberwise init**: el `init` **automático** que Swift crea para un struct con todas sus propiedades, en el orden en que las declaraste.
- **Método**: una función que vive **dentro** de un struct/clase. `antojo.fechaTexto()`.
- **Modal**: pantalla que aparece **encima** (sube desde abajo): `.sheet` o `.fullScreenCover`.
- **Modelo**: el struct que representa tus datos (`Antojo`). Va en `Model/`.
- **ModelData**: archivo con la **lista fija** de datos de prueba (`func cargarAntojos() -> Array<Antojo>`). Va en `Model/`.
- **Modificador (modifier)**: función que cambia una vista y se encadena con `.`: `.font()`, `.padding()`, `.foregroundStyle()`. **El orden importa** (Clase 3).
- **`mutating`**: palabra para una `func` de un struct que cambia sus propiedades (⚠️ no visto en clase).

## 14.5 N – P
🔎 glosario n, navigationlink, navigationstack, nil, opcional, optional binding, padding, parametro, photospicker, photosui, preview, print, private, propiedad, propiedad calculada, property wrapper, protocolo, push

- **`NavigationLink`**: botón/enlace que **empuja** otra pantalla. Necesita un `NavigationStack` arriba. `NavigationLink("Ver detalle") { DetalleView() }`.
- **`NavigationStack`**: contenedor que maneja una **pila** de pantallas, con barra de título y flecha "<" (Clase 6A). Uno por pestaña, en la vista raíz.
- **`.navigationDestination(isPresented:)`**: navega cuando una `Bool` se vuelve `true`; para validar antes de pasar (Clase 6C).
- **`nil`**: "no hay valor". Solo los **opcionales** pueden ser `nil`. No es lo mismo que `0` o `""`.
- **Opcional (Optional)**: tipo que puede tener valor **o** `nil`. Se marca con `?`: `var segundoNombre: String?`.
- **Optional binding**: sacar el valor de un opcional de forma segura con `if let`.
- **`padding`**: espacio **por dentro** alrededor de una vista. `.padding()`, `.padding(.horizontal, 20)`.
- **Parámetro**: la variable que una función **declara** para recibir un dato. En `func saludar(nombre: String)`, `nombre` es el parámetro.
- **`PhotosPicker`**: componente nativo para elegir fotos de la galería (iOS 16+, Clase 17). Necesita `import PhotosUI`.
- **`PhotosPickerItem`**: lo que regresa el PhotosPicker. **No se puede mostrar directo**: se convierte a `UIImage`.
- **`#Preview`**: bloque al final del archivo que dibuja la vista en el Canvas.
- **`print()`**: escribe un mensaje en la consola. `print("valor:", x)`.
- **`private`**: solo se puede usar dentro de ese struct. Apple recomienda `@State private var` (Clase 3).
- **Propiedad**: una variable que vive dentro de un struct. `var nombre: String` en `Antojo`.
- **Propiedad calculada (computed property)**: propiedad que **se calcula** cada vez que se lee; no guarda nada. `var estrellas: String { return String(repeating: "⭐️", count: calificacion) }`.
- **Property wrapper**: "envoltura" que le da superpoderes a una variable: `@State`, `@Binding`, `@FocusState`, `@AppStorage`, `@Environment`.
- **Protocolo**: lista de requisitos (propiedades/métodos) que un tipo debe cumplir. "Equivalente a las interfaces" (Clase 8). `View`, `Identifiable`, `Codable` son protocolos.
- **Push**: cuando una pantalla nueva se pone **encima** en la pila de un `NavigationStack` (con `NavigationLink`).

## 14.6 R – S
🔎 glosario r, glosario s, rango, return, safe area, scene, scope, scrollview, sf symbol, sheet, simulador, some view, spacer, stack, state, string, struct, swift, swift 6, swiftui

- **Rango**: secuencia de números. `1...5` (1 a 5), `0..<lista.count` (0 a count-1).
- **`return`**: regresa un valor de una función y la termina. `return lista.count`.
- **Safe area**: la zona "segura" de la pantalla (sin el notch ni la barra de abajo). `.ignoresSafeArea()` hace que un fondo la cubra.
- **Scene**: una ventana de la app (`WindowGroup`). Solo en el archivo App.
- **Scope**: la zona donde existe una variable: entre sus llaves `{ }`. Una variable de un `for` no existe fuera del `for`.
- **`ScrollView`**: hace que el contenido se pueda deslizar si no cabe.
- **SF Symbol**: íconos del sistema, gratis, sin assets. `Image(systemName: "star.fill")`. Catálogo: app SF Symbols o ⇧⌘L → Symbols.
- **`.sheet`**: pantalla que sube desde abajo, encima de la actual. `.sheet(isPresented: $mostrar) { FormularioView() }` (se usa para la cámara, Clase 17).
- **Simulador**: el iPhone virtual donde corre tu app (⌘R).
- **`some View`**: "regresa **alguna** vista" (SwiftUI decide el tipo exacto). Por eso `var body: some View`.
- **`Spacer()`**: espacio **elástico** que empuja a los demás elementos.
- **Stack (`VStack`, `HStack`, `ZStack`)**: acomodan vistas vertical, horizontal o encimadas (Clase 3).
- **`@State`**: property wrapper para datos que **cambian** y que **esta vista es dueña**. Cuando cambian, la pantalla se redibuja. `@State private var nombre = ""`.
- **`String`**: texto. `var nombre: String = "Tacos"`.
- **`struct`**: un "molde" que agrupa datos relacionados (un antojo con nombre, precio…). También las vistas son structs. Es de **valor**: al copiarlo, la copia es independiente.
- **Swift**: el lenguaje de programación de Apple.
- **Swift 6**: la versión del lenguaje, más estricta con los hilos (concurrencia). Con MainActor por default casi no la notas.
- **SwiftUI**: el framework para hacer pantallas **declarando** qué se ve (`Text`, `VStack`, `Button`…).

## 14.7 T – Z
🔎 glosario t, tabview, tag, target, task, ternario, toggle, tipo, uiimage, uikit, userdefaults, appstorage, uuid, var, view, vista, windowgroup, zstack

- **`TabView`**: la barra de pestañas de abajo (Clase 7). Cada vista lleva `.tabItem { Label("…", systemImage: "…") }`.
- **`.tag()`**: el **valor que se guarda** cuando eliges esa opción en un `Picker` (lo que se ve es el `Text`).
- **Target**: lo que Xcode compila (tu app). Los archivos deben "pertenecer al target" para entrar a la app.
- **`Task { }`**: ejecuta código `async` (que tarda) desde un lugar normal, como `.onChange` (Clase 17).
- **Ternario (`? :`)**: un `if` en una línea que regresa un valor. `esFavorito ? "heart.fill" : "heart"`.
- **Tipo**: qué clase de valor guarda algo: `Int`, `Double`, `String`, `Bool`, `Antojo`…
- **`Toggle`**: interruptor on/off ligado a una `Bool`. `Toggle("Favorito", isOn: $esFavorito)`.
- **`UIImage`**: imagen de UIKit (la que regresan la cámara y la galería). Se muestra con `Image(uiImage: foto)`.
- **UIKit**: el framework **viejo** de pantallas de Apple. En el curso solo aparece dentro de `CamaraPicker` (`UIImagePickerController`).
- **`UserDefaults` / `@AppStorage`**: guardan datos simples que **sobreviven** al cerrar la app (nombre, color, volumen). `@AppStorage("nombre") var nombre = ""`.
- **`UUID()`**: genera un id único automático. `let id = UUID()` (cuando no tienes un número natural).
- **`var`**: declara una **variable**: se puede cambiar.
- **`View` / vista**: cualquier cosa que se ve (pantalla, texto, botón). Un struct que se conforma a `View` y tiene `body`.
- **`WindowGroup`**: la ventana de la app en el archivo `@main`. Adentro va la primera pantalla.
- **`ZStack`**: pone vistas **una encima de otra** (la última queda arriba). Para fondos de pantalla completa y texto sobre imágenes.

---

