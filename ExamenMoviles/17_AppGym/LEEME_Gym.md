# 17 · App "Mi Gym" (rutinas y registro de entrenamientos)

App completa con 5 pestañas, paleta **oscura** y datos que **no se borran al cerrar la app**.
Se enfoca en lo que la app de Mascotas (`00_AppCompleta`) **no** usa: **protocolos y clases**, **Picker dependiente**,
**Stepper**, **Slider con `onEditingChanged`**, **guardar una lista completa**, **gráfica de puntos**, **`switch` con rangos**,
**`while`**, **al azar** y **fechas** (racha de días seguidos, últimos 7 días).

Vista raíz: **`GymAppView`** (en la app del repo: menú principal → Mi Gym).

---

## Pantallas

| Pestaña | Archivo | Qué hace |
|---|---|---|
| **Hoy** | `Views/GymHoyView.swift` | Fecha de hoy en español, 3 tarjetas iguales (racha, minutos y calorías de los últimos 7 días), mensaje según la racha, tu nivel, último entrenamiento y un **ejercicio sorpresa** al azar |
| **Registrar** | `Views/GymRegistrarView.swift` | Formulario: grupo muscular → ejercicio (**Picker dependiente**), minutos (`.wheel`), intensidad (`.segmented`), series y repeticiones (**Stepper**), peso (**Slider**), récord (**Toggle**), fecha (DatePicker). Calcula las calorías con el **método del protocolo** y valida con alertas |
| **Historial** | `Views/GymHistorialView.swift` + `Views/GymDetalleView.swift` | Lista **agrupada por grupo muscular** (secciones), del más nuevo al más viejo; detalle al tocar; **deslizar para borrar**; volver a los datos de ejemplo |
| **Progreso** | `Views/GymProgresoView.swift` | 3 gráficas, cada una del tipo correcto: **puntos** (minutos vs calorías), **barras** (minutos por grupo), **líneas** (calorías de los últimos 7 días) |
| **Ejercicios** | `Views/GymEjerciciosView.swift` | El catálogo: **3 clases** que cumplen el **protocolo** `EjercicioGym`. Con dos Slider (tu peso y minutos) cada tarjeta calcula sus calorías con **su propia fórmula** |

Carpetas (como pide el curso):

```
17_AppGym/
├── Model/        EjercicioGym (protocolo + 3 clases), EntrenamientoGym (struct Codable),
│                 ModelDataGym (catálogo, opciones, fechas de ejemplo), PersistenciaGym (guardar/cargar)
├── Utils/        PaletaGym (copia de 12_Paletas/Paletas/PaletaGymNeonOscura.swift)
├── Components/   TarjetaGym, EntrenamientoGymRow, FilaDatoGym
└── Views/        GymAppView (raíz) y las 5 pestañas + detalle
```

---

## Tema del examen → dónde se usa en esta app

| Tema | Dónde (archivo → bloque) | ¿Visto? |
|---|---|---|
| **Protocolo** con `{ get }` y `{ get set }` | `Model/EjercicioGym.swift` → bloque 1 | ✅ Clase 8 (Protocolos) |
| **Clases que se conforman** al protocolo, con `init` | `Model/EjercicioGym.swift` → bloques 2, 3 y 4 | ✅ Clase 8 |
| Mismo método, **distinta fórmula** por clase | `Model/EjercicioGym.swift` → bloque 5; `Views/GymRegistrarView.swift` → bloque 8 | ✅ Clase 8 |
| Lista del **tipo del protocolo** con las 3 clases mezcladas | `Model/ModelDataGym.swift` → bloque 2 | ✅ Clase 8 |
| Clases en `@State` + "tick" para redibujar | `Views/GymEjerciciosView.swift` (arriba del body) | ✅ (explicado) |
| **Picker dependiente** + `.onChange { oldValue, newValue in }` que resetea | `Views/GymRegistrarView.swift` → bloques 1 y 2 | ✅ Clase 4 (`ForEach` ⚠️) |
| Picker `.wheel` y `.segmented` con `.tag` | `Views/GymRegistrarView.swift` → bloques 3 y 4 | ✅ Clase 4 |
| **Slider** con `in: 0 ... 200`, `onEditingChanged` y `.tint` | `Views/GymRegistrarView.swift` → bloque 5 | ✅ Clase 4 |
| **Stepper** | `Views/GymRegistrarView.swift` → bloque 5 | ⚠️ |
| Toggle | `Views/GymRegistrarView.swift` → bloque 6 | ✅ Clase 4 |
| Mostrar/ocultar controles con `if` | `Views/GymRegistrarView.swift` → bloque 5 | ✅ |
| DatePicker | `Views/GymRegistrarView.swift` → bloque 7 | ⚠️ |
| Validación con alertas (mensaje por error) + `append` + id nuevo | `Views/GymRegistrarView.swift` → función `guardar()` | ✅ Clase 3 / 10 |
| **Guardar una lista** como JSON en UserDefaults | `Model/PersistenciaGym.swift` → bloques 1, 2 y 3; `Views/GymAppView.swift` → bloque 3 | ⚠️ (juntar Codable + UserDefaults) |
| `@AppStorage` compartido entre pestañas (peso) | `GymHoyView`, `GymRegistrarView`, `GymEjerciciosView` | ✅ clase de persistencia |
| **Fechas distintas** en ModelData ("hace X días") | `Model/ModelDataGym.swift` → bloque 5 | ✅ Clase 3B |
| Fecha → texto con `dateFormat` | `Model/ModelDataGym.swift` → bloque 6; `Model/EntrenamientoGym.swift` | ✅ Clase 3B |
| **¿Mismo día?** comparando fechas como texto | `Views/GymHoyView.swift` → bloque 1 | ✅ (DateFormatter) |
| **Racha** de días seguidos con `while` | `Views/GymHoyView.swift` → bloque 2 | ⚠️ `while` (básico) |
| Sumar lo de los **últimos 7 días** | `Views/GymHoyView.swift` → bloque 3 | ✅ ciclos + fechas |
| **`switch` con rangos** (`case 1...2:`) | `Views/GymHoyView.swift` → bloques 4 y 5; `GymRegistrarView` (`factorIntensidad`) | ✅ Clase 2 |
| Buscar el **más reciente** (comparar fechas con `>`) | `Views/GymHoyView.swift` → bloque 6 | ✅ |
| `String(repeating:count:)` (🔥🔥🔥) | `Views/GymHoyView.swift` → bloque 9 | ✅ (tarea Movil2) |
| **Al azar** con `randomElement()` + `if let` | `Views/GymHoyView.swift` → bloque 11 | ✅ |
| 3 tarjetas iguales (componente con parámetros) | `Components/TarjetaGym.swift`; `GymHoyView` → bloque 8 | ✅ Clase 5A |
| `@State` en la raíz, `var` a quien lee, `@Binding` a quien modifica | `Views/GymAppView.swift` → bloques 1 y 2 | ✅ Clases 6B y 7 |
| `NavigationStack` dentro de cada pestaña | todas las pestañas | ✅ Clases 6A y 7 |
| List con **Section** (agrupada) | `Views/GymHistorialView.swift` → bloque 4 | ⚠️ |
| Ordenar por fecha (`sorted`) | `Views/GymHistorialView.swift` → bloque 1 | ⚠️ |
| **Deslizar para borrar** (`swipeActions`) + borrar por id | `Views/GymHistorialView.swift` → bloques 2 y 4 | ⚠️ |
| Lista vacía con mensaje | `Views/GymHistorialView.swift` → bloque 3 | ✅ |
| Detalle que solo muestra + `dismiss()` | `Views/GymDetalleView.swift` | ✅ Clases 6A y 10 |
| **PointMark** (relación entre 2 variables) | `Views/GymProgresoView.swift` → bloque 3 | ✅ Clase 15 |
| **BarMark** por categoría (sumado con `for`) | `Views/GymProgresoView.swift` → bloques 1 y 4 | ✅ Clase 15 |
| **LineMark** en el tiempo (últimos 7 días) | `Views/GymProgresoView.swift` → bloques 2 y 5 | ✅ Clase 15 |
| Colores B + C (`foregroundStyle(by:)` + `chartForegroundStyleScale`) | `Views/GymProgresoView.swift` → bloque 3 | ✅ Clase 15 |
| Paleta oscura + `.preferredColorScheme(.dark)` | `Utils/PaletaGym.swift`; `Views/GymAppView.swift` | ✅ paleta / ⚠️ colorScheme |

---

## Cómo copiarla a tu app del examen

1. Arrastra la carpeta `17_AppGym` a tu proyecto con **Copy items if needed** y tu target marcado.
2. En `TuAppApp.swift`: `WindowGroup { GymAppView() }`.
3. Para adaptarla a otro tema: cambia el protocolo y las clases (`Model/EjercicioGym.swift`), los datos (`Model/ModelDataGym.swift`)
   y los textos marcados con ✏️. Usa ⌘⌥F (Buscar y reemplazar) con cuidado de mayúsculas.

---

## Explicación paso a paso

### 1. Protocolos y clases (Clase 8)

**¿Qué es un protocolo?** Una **lista de requisitos** sin código: "quien se conforme a mí debe tener ESTO".
Es como un contrato. En otros lenguajes se llama *interfaz*.

```swift
protocol EjercicioGym {
    var nombre: String { get }                 // { get }: basta con poder LEERLA (puede ser let)
    var vecesRealizado: Int { get set }        // { get set }: también se MODIFICA (tiene que ser var)
    func caloriasQuemadas(minutos: Int, pesoPersona: Double) -> Double
    func descripcionRutina() -> String
    func registrarVez()
}
```

**¿Qué es conformar?** Escribir `class CardioGym: EjercicioGym` y darle a la clase **todo** lo de la lista.
Si falta algo, Xcode marca: *"Type 'CardioGym' does not conform to protocol 'EjercicioGym'"* (y te ofrece "Fix" para
agregar lo que falta).

**`init`:** las **clases** no tienen el init automático que tienen los structs; hay que escribirlo y darle valor a cada
propiedad que no tenga uno:

```swift
init(nombre: String, grupoMuscular: String, icono: String, met: Double) {
    self.nombre = nombre          // self.nombre = la propiedad · nombre = el parámetro
    ...
    self.vecesRealizado = 0
}
```

**¿Por qué cada clase calcula distinto? (polimorfismo)** Las 3 clases tienen el **mismo método**
`caloriasQuemadas(minutos:pesoPersona:)`, pero cada una lo escribe a su manera:

| Clase | Fórmula |
|---|---|
| `CardioGym` | MET × peso × horas (depende de tu peso y de qué tan intenso es) |
| `FuerzaGym` | MET 5 × peso × horas, pero solo el 70% del tiempo (el resto es descanso entre series) |
| `FlexibilidadGym` | 2.5 kcal por minuto (no usa el peso; lo recibe porque el protocolo lo pide) |

Quien usa el ejercicio **no necesita saber** cuál clase es: llama `ejercicio.caloriasQuemadas(...)` y cada una responde
con su fórmula. Por eso una lista puede ser del tipo del protocolo y guardar las 3 mezcladas:

```swift
func cargarEjerciciosGym() -> [EjercicioGym] {
    return [ CardioGym(...), FuerzaGym(...), FlexibilidadGym(...) ]
}
```

(En Swift nuevo a veces verás `[any EjercicioGym]`: es lo mismo; el `any` solo hace explícito que ahí cabe cualquier
cosa que cumpla el protocolo.)

**Clases en pantalla — ojo:** un `struct` en `@State` redibuja la pantalla cuando cambia; una **clase no avisa** cuando
cambia una propiedad suya. Por eso en `GymEjerciciosView` el botón "Lo hice" hace dos cosas: llama
`ejercicio.registrarVez()` (cambia la clase) **y** suma 1 a un `@State private var toques`, que sí obliga a redibujar.
Las clases se guardan en `@State private var catalogo = cargarEjerciciosGym()` para que **no se vuelvan a crear** en cada
redibujo (si no, el contador regresaría a 0).

### 2. Picker dependiente con `.onChange` (Clase 4)

El segundo Picker tiene **opciones que cambian** según el primero:

```swift
@State private var grupo = ""            // "" = no ha elegido
@State private var ejercicio = ""

Picker(selection: $grupo, label: Text("Grupo muscular")) {
    Text("Selecciona…").tag("")
    Text("Piernas").tag("Piernas")
    // …
}
.onChange(of: grupo) { oldValue, newValue in
    ejercicio = ""                       // ← RESETEA el segundo Picker
}

Picker(selection: $ejercicio, label: Text("Ejercicio")) {
    Text("Selecciona…").tag("")
    ForEach(ejerciciosDelGrupoGym(grupo: grupo), id: \.self) { nombre in   // ⚠️ ForEach
        Text(nombre).tag(nombre)
    }
}
```

**¿Por qué resetear?** Si eliges "Piernas → Sentadilla" y luego cambias a "Pecho", "Sentadilla" ya no existe en las
opciones de Pecho: el Picker quedaría apuntando a un `tag` que no existe. `.onChange` detecta el cambio del grupo y
regresa el ejercicio a `""`. `oldValue` es el valor anterior y `newValue` el nuevo (forma de la lámina).

### 3. Guardar una lista para que no se borre (JSON + UserDefaults) ⚠️

`@State` vive solo mientras la app está abierta. Para que la lista **sobreviva** al cerrar la app:

1. El modelo es **`Codable`** (se puede convertir a JSON) y **`Equatable`** (para `.onChange`).
2. **Guardar:** `JSONEncoder().encode(lista)` → `Data` → `UserDefaults.standard.set(datos, forKey: "llave")`.
3. **Cargar:** `UserDefaults.standard.data(forKey: "llave")` → `JSONDecoder().decode([Modelo].self, from: datos)`.
   Si no hay nada guardado (primera vez), se usan los datos de ejemplo.
4. En la vista dueña: `@State private var lista = cargar…()` y
   `.onChange(of: lista) { oldValue, newValue in guardar…(newValue) }` → **se guarda sola** cada vez que agregas o borras.

Cómo defenderlo: *"UserDefaults solo guarda tipos simples (String, Int, Double, Bool, Data). Por eso convierto la lista a
JSON con Codable y guardo esos datos con una llave."*

**¿Qué guardar dónde?** (clase de persistencia)

| Dato | Dónde |
|---|---|
| Temporal (lo que escribe, la pestaña abierta) | `@State` (se pierde al cerrar) |
| Preferencias y datos chicos (tu peso, esta lista) | `UserDefaults` / `@AppStorage` |
| **Contraseñas y tokens** | **Keychain** — nunca UserDefaults: ahí se guarda en texto claro |
| Muchos datos con estructura | SwiftData / CoreData (no se practicó) |

### 4. Fechas que se usan aquí

- **Fechas distintas** en los datos de ejemplo: `fechaHaceDiasGym(dias: 3)` suma `-3` días con `DateComponents` +
  `Calendar.current.date(byAdding:to:)` (Clase 3B). Regresa opcional → `if let`.
- **¿Mismo día?** Una `Date` guarda fecha **y hora**, así que dos entrenamientos del mismo día no son "iguales". Se
  convierten a texto `"dd/MM/yyyy"` y se comparan los textos (`GymHoyView` → bloque 1).
- **Racha:** empieza hoy (o ayer, si hoy no has entrenado) y va hacia atrás **mientras** (`while`) haya entrenamiento
  ese día, sumando 1.
- **Más reciente:** las fechas se comparan con `>` igual que los números.

### 5. ¿Qué gráfica uso? (Clase 15)

| Quiero mostrar… | Gráfica | En esta app |
|---|---|---|
| **Relación entre 2 datos** (¿más minutos → más calorías?) | **Puntos** `PointMark` | Minutos vs calorías |
| **Comparar categorías** | **Barras** `BarMark` | Minutos por grupo muscular |
| **Cambio en el tiempo** | **Líneas** `LineMark` | Calorías de los últimos 7 días |
| **Partes de un total** | Pastel / dona `SectorMark` | (en la app de Mascotas, `00_AppCompleta`) |

**Nunca líneas para comparar categorías** (la lámina lo dice). Los datos de cada gráfica se **calculan** de la lista
con `for` en una propiedad calculada (`minutosPorGrupo`, `caloriasUltimos7Dias`).

**Paleta oscura:** los ejes de las gráficas los pinta el sistema. Con fondo oscuro hay que poner
`.preferredColorScheme(.dark)` en la vista raíz; si no, los números de los ejes salen negros sobre negro.
