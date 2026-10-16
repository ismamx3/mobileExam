# App de ejemplo: "Mis Viajes" (16_AppViajes)

App completa para explorar destinos de México, planear viajes (fechas, personas y presupuesto) y guardar las **fotos** de cada viaje.
Cubre los temas que la app de Mascotas **no** usa: **cámara**, **varias fotos**, **datos desde un JSON**, **bienvenida (onboarding)**,
**carrusel**, **buscador**, **cuadrícula** y **fechas**.

Vista raíz: **`ViajesAppView`**. En el repo: menú principal → la abre a pantalla completa.

---

## 1. Qué hace (pantallas)

```
ViajesAppView  (raíz: decide con un if)
├─ OnboardingViajesView        bienvenida de 3 páginas (solo la 1a vez)
└─ TabView
   ├─ Explorar   ExplorarViajesView        chips + buscador + cuadrícula de destinos (del JSON)
   │    └─ DetalleDestinoViajesView        carrusel de fotos, ❤️ favorito, datos, "Planear viaje"
   │         └─ (sheet) PlanearViajeViajesView   DatePicker ida/regreso, Stepper personas, presupuesto
   ├─ Mis viajes MisViajesView             lista con "Faltan X días", borrar deslizando
   │    └─ DetalleViajeViajesView          fechas en español, Toggle "Ya fui", FOTOS (cámara + galería)
   │         └─ (fullScreenCover) FotoGrandeViajesView   foto en grande + borrar
   ├─ Favoritos  FavoritosViajesView       solo los destinos con ❤️
   └─ Ajustes    AjustesViajesView         resumen con for + "ver la bienvenida otra vez"
```

## 2. Temas del examen que cubre

| Tema | Dónde se usa en esta app | ¿Visto en clase? |
|---|---|---|
| Modelo `struct` Codable + Identifiable | `16_AppViajes/Model/DestinoViajes.swift` | ✅ Clase 10 (Identifiable) · Codable: clase REST |
| Cargar datos desde un **.json** de la app | `16_AppViajes/Model/DestinoViajes.swift` → `cargarDestinosViajes()` | ⚠️ `Bundle.main.url` y `Data(contentsOf:)` · ✅ `JSONDecoder` y do/try/catch |
| Propiedades calculadas (`estadoTexto`, `dias`, `imagenPrincipal`) | `16_AppViajes/Model/ViajePlaneado.swift`, `DestinoViajes.swift` | ✅ |
| `switch` para elegir ícono | `DestinoViajes.swift` → `iconoCategoria` | ✅ Clase 2 |
| **Fechas**: sumar días, fecha en español, "faltan X días" | `16_AppViajes/Utils/FechasViajes.swift` → bloques 1 a 4 | ✅ Clase 3B (bloques 1–3) · ⚠️ bloque 4 |
| **DatePicker** (elegir fecha) | `16_AppViajes/Views/PlanearViajeViajesView.swift` → bloque 2 | ⚠️ |
| **Stepper** (número de personas) | `16_AppViajes/Views/PlanearViajeViajesView.swift` → bloque 3 | ⚠️ |
| Cálculo en vivo con propiedad calculada | `16_AppViajes/Views/PlanearViajeViajesView.swift` → bloque 4 | ✅ |
| Validación con alerta y mensaje específico | `PlanearViajeViajesView.swift` → `guardarViaje()` | ✅ Clase 3 (alerta en 3 pasos) |
| `.onChange(of:) { oldValue, newValue in }` | `PlanearViajeViajesView.swift` (fecha de ida) y `DetalleViajeViajesView.swift` (foto de cámara) | ✅ Clase 4 |
| `.sheet` + `@Binding` + `append` + `dismiss()` | `DetalleDestinoViajesView.swift` → bloque 4 y `PlanearViajeViajesView.swift` | ✅ Clases 17, 6B, 6A |
| **Cámara** con `CamaraPicker` | `16_AppViajes/Views/DetalleViajeViajesView.swift` → bloque 4 | ✅ Clase 17 · ⚠️ `isSourceTypeAvailable` |
| **Varias fotos** de la galería | `16_AppViajes/Views/DetalleViajeViajesView.swift` → bloque 4 | ✅ PhotosPicker (Clase 17) · ⚠️ `maxSelectionCount` |
| Cuadrícula de fotos / destinos | `DetalleViajeViajesView.swift` → bloque 5 · `ExplorarViajesView.swift` → bloque 3 | ⚠️ `LazyVGrid` |
| Foto en grande a pantalla completa | `DetalleViajeViajesView.swift` (`.fullScreenCover`) | ⚠️ |
| **Carrusel** dentro de un ScrollView | `16_AppViajes/Views/DetalleDestinoViajesView.swift` → bloque 1 | ✅ Clase 7 |
| **Bienvenida (onboarding)** de páginas | `16_AppViajes/Views/OnboardingViajesView.swift` → bloque 2 | ✅ carrusel de la Clase 7 |
| Bienvenida solo la primera vez | `16_AppViajes/Views/ViajesAppView.swift` → bloque 1 (`@AppStorage` + `if`) | ✅ @AppStorage (persistencia) |
| `@AppStorage` con la misma llave en 2 vistas | `16_AppViajes/Views/AjustesViajesView.swift` → bloque 3 | ✅ |
| TabView con 4 pestañas y `.tint` | `16_AppViajes/Views/ViajesAppView.swift` → bloque 2 | ✅ Clase 7 |
| Datos compartidos entre pestañas (`$` y sin `$`) | `ViajesAppView.swift` → bloque 2 | ✅ Clase 6B / 7 |
| Chips de categorías que se deslizan | `16_AppViajes/Views/ExplorarViajesView.swift` → bloque 2 | ⚠️ `ScrollView(.horizontal)` |
| Buscador | `ExplorarViajesView.swift` (`.searchable`) | ⚠️ |
| Filtrar con `for` + `if` + `append` | `ExplorarViajesView.swift` (`indicesFiltrados`), `FavoritosViajesView.swift` | ✅ |
| Lista con binding, borrar deslizando | `16_AppViajes/Views/MisViajesView.swift` → bloque 2 | ✅ List/NavigationLink · ⚠️ `ForEach($…)` + `.onDelete` |
| Lista vacía con mensaje | `MisViajesView.swift` → bloque 1 · `FavoritosViajesView.swift` → bloque 1 | ✅ |
| Toggle que modifica el elemento (`$viaje.yaFui`) | `16_AppViajes/Views/DetalleViajeViajesView.swift` → bloque 3 | ✅ Clase 4 / 6B |
| Precio en pesos | `DetalleDestinoViajesView.swift` → bloque 3 · `PlanearViajeViajesView.swift` → bloque 4 | ✅ Clase 3B (`.currency(code: "MXN")`) |
| Texto sobre imagen (ZStack) | `16_AppViajes/Components/TarjetaDestinoViajes.swift` | ✅ ZStack · ⚠️ `ZStack(alignment:)` |
| Componentes reutilizables con parámetros | `16_AppViajes/Components/` (5 componentes) | ✅ Clase 5A |
| 3 tarjetas del mismo ancho | `16_AppViajes/Views/AjustesViajesView.swift` → bloque 1 | ✅ |
| Paleta en Utils (struct sin `static`) | `16_AppViajes/Utils/PaletaViajes.swift` (= `PaletaOceanoAnaloga` de 12_Paletas) | ✅ |

## 3. Dónde vive cada dato

```
ViajesAppView        @State private var destinos   (del JSON)     ← DUEÑA
                     @State private var viajes     (2 de ejemplo) ← DUEÑA
                     @AppStorage("viajesVioOnboarding")           ← se guarda en el iPhone
 ├─ OnboardingViajesView   @Binding var vioOnboarding   (lo pone en true)
 ├─ ExplorarViajesView     @Binding destinos, @Binding viajes
 │    └─ DetalleDestino…   @Binding destino (UNO: $destinos[indice]), @Binding viajes
 │         └─ Planear…     var destino (solo lee), @Binding viajes (append)
 ├─ MisViajesView          @Binding viajes
 │    └─ DetalleViaje…     @Binding viaje (UNO: $viaje)  → Toggle y fotos
 ├─ FavoritosViajesView    @Binding destinos, @Binding viajes
 └─ AjustesViajesView      var viajes (solo lee) + @AppStorage con la MISMA llave
```

Regla: **un solo dueño con `@State`**. Quien solo muestra recibe `var` y quien modifica recibe `@Binding` (y se le pasa con `$`).

## 4. Cómo copiarla a tu examen

1. Arrastra la carpeta `16_AppViajes` a tu proyecto (marca **Copy items if needed** y tu **target**).
2. Copia también `10_FotosYCamara/CamaraPicker.swift` (el de la profe, sin cambiarlo).
3. Copia las imágenes `destino_*` a tus Assets, o cambia los nombres en el JSON por tus imágenes.
4. Agrega el **permiso de cámara** (paso 5.5 abajo).
5. En `TuAppApp.swift` cambia `ContentView()` por `ViajesAppView()`.
6. Para adaptar: cambia el JSON (mismas llaves) o las propiedades del struct **y** las llaves del JSON juntas.

---

## 5. Explicación paso a paso

### 5.1 Cargar datos desde un archivo JSON

1. **El JSON** (`destinos_viajes.json`) es un arreglo `[ { … }, { … } ]`. Cada `{ }` es un destino.
2. **El struct** `DestinoViajes: Codable, Identifiable` tiene una propiedad por cada llave, con el **mismo nombre exacto**
   (`"costoAproximado"` ↔ `var costoAproximado: Double`). Si una llave falta o se escribe distinto, la lectura falla.
3. **La función** `cargarDestinosViajes()` hace 3 pasos dentro de un `do { } catch { }`:
   - `Bundle.main.url(forResource: "destinos_viajes", withExtension: "json")` busca el archivo **dentro de la app**.
     Regresa un opcional: si es `nil`, el archivo no se agregó al **target**.
   - `try Data(contentsOf: url)` lee el archivo completo.
   - `try JSONDecoder().decode(Array<DestinoViajes>.self, from: data)` lo convierte en structs (igual que en la clase de REST).
4. Si algo falla, cae en el `catch`, imprime el error en la consola y regresa `[]` (la app no truena; la lista sale vacía).
5. La raíz la llama una vez: `@State private var destinos = cargarDestinosViajes()`.

> Todo esto va **dentro** de la función. Fuera de una función solo puedes declarar (`let`, `var`, `func`).

### 5.2 Bienvenida que sale solo la primera vez

- `@AppStorage("viajesVioOnboarding") private var vioOnboarding = false` en la raíz. Es como `@State`, pero **se guarda** en el iPhone.
- La raíz decide con un **`if`**: `if vioOnboarding { TabView… } else { OnboardingViajesView(vioOnboarding: $vioOnboarding) }`.
- "Comenzar" pone `vioOnboarding = true` (por eso recibe un `@Binding`) y la raíz cambia sola a la app.
- **¿Por qué no un NavigationLink?** Porque quedaría la flecha "<" para regresar a la bienvenida y, como cada pestaña ya tiene su
  `NavigationStack`, saldrían dos barras de navegación. Con el `if`, la bienvenida se **reemplaza** por la app.
- Para verla otra vez: pestaña Ajustes → "Ver la bienvenida otra vez" (pone la **misma llave** en `false`).

### 5.3 Carrusel dentro de un ScrollView (el error de hoy)

```swift
TabView {
    ForEach(destino.imagenes, id: \.self) { nombreImagen in
        Image(nombreImagen)
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(height: 240)
    }
}
.tabViewStyle(.page)                                     // sin esto NO es carrusel (sale una barra de pestañas)
.indexViewStyle(.page(backgroundDisplayMode: .always))   // puntitos con fondo
.frame(height: 280)                                      // OBLIGATORIO dentro de un ScrollView
```

Dentro de un `ScrollView` el `TabView` no sabe qué alto tener (le ofrecen alto "infinito") y queda con **alto 0**: invisible.
En la bienvenida no hace falta el `.frame` porque ahí el `TabView` no está dentro de un `ScrollView`.

### 5.4 Cámara con CamaraPicker (Clase 17)

1. Copia `CamaraPicker.swift` de la profe (en el repo: `10_FotosYCamara/CamaraPicker.swift`).
2. Variables: `@State private var fotoCamara: UIImage? = nil` (ahí regresa la foto) y `@State private var showCamara = false`.
3. Botón: `showCamara = true`. Antes se revisa `UIImagePickerController.isSourceTypeAvailable(.camera)` ⚠️: el **simulador no tiene
   cámara** y abrir `CamaraPicker` ahí truena; en lugar de eso se muestra una alerta.
4. `.sheet(isPresented: $showCamara) { CamaraPicker(selectedImageFromCamera: $fotoCamara) }`: el `@Binding` regresa la foto.
5. `.onChange(of: fotoCamara) { oldValue, newValue in … }`: cuando llega una foto, se agrega a `viaje.fotos` y se limpia `fotoCamara`.

### 5.5 Permiso de cámara (obligatorio, Clase 17)

1. Navegador del proyecto → clic en el proyecto (lo de hasta arriba).
2. Selecciona el **target** → pestaña **Info**.
3. Clic derecho en la última fila de **Custom iOS Target Properties** → **Add Row**.
4. Elige **Privacy - Camera Usage Description** y en **Value** escribe el mensaje (ej. "La app usa la cámara para tus fotos de viaje.").

Sin esto la app **truena** al abrir la cámara. En este repo ya está en Build Settings (`INFOPLIST_KEY_NSCameraUsageDescription`).
La prueba final de la cámara se hace en un **iPhone físico**.

### 5.6 Varias fotos de la galería

- Igual que el PhotosPicker de la Clase 17, pero con un **arreglo**: `@State private var seleccionGaleria: Array<PhotosPickerItem> = []`
  y `PhotosPicker(selection: $seleccionGaleria, maxSelectionCount: 10, matching: .images, photoLibrary: .shared())` ⚠️.
- En el `.onChange` se usa un `for` para convertir **cada** foto con `loadTransferable` (dentro de `Task`, porque es asíncrono).
- Al final se limpia la selección (`seleccionGaleria = []`) para que la siguiente vez no se agreguen otra vez las mismas.
- Los estilos del botón (`.buttonStyle`, `.tint`) van **fuera** de las llaves del `PhotosPicker`; con colores de la paleta dentro de las
  llaves, Swift 6 marca un warning.

### 5.7 Fechas en esta app

| Quiero… | Cómo | Archivo |
|---|---|---|
| La fecha de hoy + 7 días | `fechaDentroDeDiasViajes(dias: 7)` → `DateComponents` + `Calendar.current.date(byAdding:to:)` (Clase 3B) | `Utils/FechasViajes.swift` bloque 1 |
| "15 de octubre de 2026" | `DateFormatter` con `dateStyle = .long` y `locale = es_MX` | bloque 2 |
| "15 oct" | `dateFormat = "d MMM"` (**con `=`**, es una propiedad) | bloque 3 |
| Días entre dos fechas | `Calendar.current.dateComponents([.day], from:to:)` ⚠️ | bloque 4 |
| "Faltan 10 días" / "¡Es mañana!" | propiedad calculada con `if / else if` | `Model/ViajePlaneado.swift` (`estadoTexto`) |
| Que el usuario elija la fecha | `DatePicker("Ida", selection: $fechaIda, in: Date()..., displayedComponents: .date)` ⚠️ | `Views/PlanearViajeViajesView.swift` bloque 2 |
| Que el regreso sea después de la ida | `if dias <= 0 { alerta }` + `.onChange(of: fechaIda)` que recorre el regreso | `PlanearViajeViajesView.swift` |

### 5.8 Filtrar con chips y buscador sin perder el binding

`indicesFiltrados` guarda las **posiciones** de los destinos que pasan el filtro (`for` + `if` + `append`). Con la posición se puede
mandar al detalle `$destinos[indice]` (un binding), y si ahí tocas el ❤️, cambia en la lista original. Si filtraras los destinos
directamente, el detalle recibiría una **copia** y el cambio se perdería.

---

## 6. ⚠️ Lo que no se vio en clase (y cómo explicarlo)

| Qué | Frase para defenderlo |
|---|---|
| `Bundle.main.url` + `Data(contentsOf:)` | "Busca el archivo dentro de la app y lo lee; después es igual que decodificar la respuesta de un GET." |
| `DatePicker` | "Es un control para elegir fechas; se liga a un `@State` de tipo `Date` igual que un TextField a un String." |
| `Stepper` | "Botones − y + que cambian un número dentro de un rango." |
| `Calendar.dateComponents([.day], from:to:)` | "Cuenta cuántos días hay entre dos fechas; regresa un opcional y lo saco con `if let`." |
| `maxSelectionCount` | "Es el mismo PhotosPicker de clase, pero deja elegir varias fotos y por eso uso un arreglo." |
| `isSourceTypeAvailable(.camera)` | "Pregunta si el dispositivo tiene cámara para no tronar en el simulador." |
| `LazyVGrid` | "Acomoda las vistas en columnas, como una cuadrícula." |
| `ScrollView(.horizontal)` | "El mismo ScrollView de clase, pero se desliza de lado." |
| `.searchable` | "Agrega la barra de búsqueda y guarda lo escrito en un `@State`." |
| `ForEach($…)` + `.onDelete` | "ForEach repite el renglón; onDelete agrega borrar deslizando." |
| `.fullScreenCover(item:)` | "Como `.sheet`, pero cubre toda la pantalla." |
| `ZStack(alignment:)`, `.clipped()`, `.lineLimit`, `role: .destructive`, `.navigationBarTitleDisplayMode(.inline)`, `.preferredColorScheme` | Detalles de diseño: acomodo de capas, recorte, una sola línea, botón rojo, título chico, modo claro. |
| `UIImage` dentro del modelo | "Cada viaje guarda sus fotos para que no se mezclen; en clase la foto vivía en un `@State` de la vista." |

## 7. Errores típicos

| Síntoma | Causa | Arreglo |
|---|---|---|
| La lista de destinos sale vacía | El `.json` no está en el target o una llave no coincide | Revisa la consola: ahí sale el error del `catch` |
| El carrusel no se ve | `TabView` dentro de `ScrollView` sin `.frame(height:)` | Ponle `.frame(height: 280)` |
| El carrusel muestra una barra de pestañas | Falta `.tabViewStyle(.page)` | Agrégalo |
| La app truena al tocar "Cámara" | Falta el permiso de cámara | Info → Add Row → Privacy - Camera Usage Description |
| En el simulador sale "no tiene cámara" | El simulador no tiene cámara | Usa la galería o un iPhone físico |
| El ❤️ no se actualiza en Explorar | Se pasó una copia sin `$` | `DetalleDestinoViajesView(destino: $destinos[indice], …)` |
| La bienvenida sale siempre | Las llaves de `@AppStorage` no son iguales | Usa exactamente `"viajesVioOnboarding"` en las dos vistas |
