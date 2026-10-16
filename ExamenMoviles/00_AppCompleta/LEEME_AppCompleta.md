# App Completa "Mis Mascotas": cómo usarla en el examen

Es una app de 4 pestañas que junta todos los temas:

| Pestaña | Archivo | Temas que usa |
|---|---|---|
| Inicio | `Views/InicioMascotasView.swift` | stacks, imagen circular, 3 tarjetas iguales, `for` para contar, `@AppStorage` (lee), cambiar de pestaña |
| Mascotas | `Views/ListaMascotasView.swift` | `List` con `$`, `NavigationLink`, sheet, borrar con `.onDelete` |
| ↳ Detalle | `Views/DetalleMascotaView.swift` | `@Binding`, Toggle, Slider, Stepper, `dismiss()` |
| ↳ Agregar | `Views/AgregarMascotaView.swift` | formulario, Picker, `if let Int(...)`, alertas, PhotosPicker, `append` |
| Estadísticas | `Views/EstadisticasMascotasView.swift` | Charts: barras, barras horizontales, dona, ProgressView |
| Perfil | `Views/PerfilDuenoView.swift` | `@AppStorage`, PhotosPicker, Picker segmentado |

La raíz es `Views/AppCompletaView.swift` (el TabView). Ahí vive la lista (`@State`).

---

## 1. Meterla a tu proyecto (5 minutos)

1. Crea tu proyecto en Xcode como en clase: pestaña **iOS → App** → Product Name, Organization Identifier **tec.mx**, Interface **SwiftUI**, Language **Swift**.
2. En Finder abre `examen/ExamenMoviles/00_AppCompleta/`.
3. Arrastra las carpetas **Model, Utils, Components y Views** a la carpeta amarilla de tu proyecto en Xcode.
   - Marca **Copy items if needed**.
   - Marca tu **target** en "Add to targets".
4. Copia las imágenes: en `Assets.xcassets` arrastra una imagen y nómbrala **mascota** y otra **perfil**
   (o cambia esos nombres en `ModelDataMascotas.swift`, `InicioMascotasView.swift` y `PerfilDuenoView.swift`).
5. Abre `TuAppApp.swift` y cambia:
   ```swift
   WindowGroup {
       AppCompletaView()
   }
   ```
6. Corre con ⌘R. Si compila, ya tienes una app de 4 pestañas.

> Si tu proyecto ya trae `ContentView.swift`, puedes dejarlo o borrarlo. No estorba.

## 2. Cambiarle el nombre a todo (Buscar y Reemplazar)

Menú **Find → Find and Replace in Project** (⌥⇧⌘F). También: lupa del panel izquierdo → cambia "Find" por "Replace".

Hazlo en este orden y con **Matching Case** (respetando mayúsculas):

1. `Mascotas` → `Productos` (plural primero)
2. `mascotas` → `productos`
3. `Mascota` → `Producto`
4. `mascota` → `producto`

Luego cambia los textos que ve el usuario (busca `✏️`). Ojo con los acentos y con "la/el" ("la mascota" → "el producto").

Los **nombres de archivo** no se cambian solos. Si quieres, renómbralos en Xcode (clic en el nombre del archivo). No es obligatorio para que compile.

## 3. Cambios típicos: qué archivo tocar

| Quiero… | Toca |
|---|---|
| **Agregar un campo** al modelo (ej. `raza: String`) | 1) `Model/Mascota.swift`: agrega `var raza: String`. 2) `Model/ModelDataMascotas.swift`: agrega `raza: "..."` en cada `Mascota(...)`. 3) `Views/AgregarMascotaView.swift`: un `@State private var raza = ""`, su `TextField`, su validación y `raza: raza` en el `Mascota(...)` de `guardarMascota()`. 4) Mostrarlo: `FilaDatoMascota(...)` en `DetalleMascotaView.swift` o un `Text` en `MascotaRow.swift`. |
| **Quitar un campo** | Bórralo del modelo y compila (⌘B). Xcode marca en rojo cada lugar que lo usaba. Bórralo ahí. |
| **Cambiar las opciones del Picker** | `especiesMascotas` en `Model/ModelDataMascotas.swift`. La gráfica de barras se actualiza sola. Para el ícono de cada opción: `iconoEspecie` en `Mascota.swift`. |
| **Cambiar los colores** de toda la app | Solo `Utils/PaletaMascotas.swift`. Verifica contraste en coolors.co/contrast-checker. |
| **Cambiar, quitar o agregar pestañas** | `Views/AppCompletaView.swift`. Cada pestaña es una vista + `.tabItem { Label(...) }` + `.tag(n)`. Si quitas la pestaña 2, arregla el botón de Inicio (`pestanaSeleccionada = 2`). |
| **Cambiar la gráfica** | `Views/EstadisticasMascotasView.swift`. Para barras de otro dato, cambia el `for` de `conteoPorEspecie()`. Para pastel en vez de dona, borra `innerRadius:`. **No cambies las barras por líneas**: la Clase 15 dice que `LineMark` NO sirve para comparar categorías (especies); úsala solo si el eje x es tiempo (días, meses). |
| **Cambiar los mensajes de validación** | `guardarMascota()` en `Views/AgregarMascotaView.swift`. |
| **Cambiar las tarjetas de Inicio** | `Views/InicioMascotasView.swift`, bloque 2, y sus cálculos (`totalVacunadas`, `pesoPromedio`) arriba del `body`. |
| **Que el renglón muestre otra cosa** | `Components/MascotaRow.swift`. |
| **Agregar cámara** | Lee el encabezado de `Views/PerfilDuenoView.swift` (4 pasos). |
| **Que la lista no se pueda borrar** | En `ListaMascotasView.swift` borra el `.onDelete { ... }`. |

## 4. Cosas que NO se vieron en clase (por si te preguntan)

Todas están marcadas con `⚠️ NO VISTO EN CLASE` en el código, con su explicación:

- `TabView(selection:)` + `.tag` → para cambiar de pestaña con un botón.
- `ForEach` + `.onDelete` → borrar deslizando (Lista). `ForEach` también en Inicio y dentro del Picker de especie.
- `Stepper` → botones − / + para la edad.
- `step:` en el Slider → avanza de 0.5 en 0.5.
- `.keyboardType(.numberPad)` → teclado de solo números.
- `var accion: () -> Void` → pasarle a un botón qué hacer.
- `.annotation` → número encima de la barra.
- Barras horizontales (x y y intercambiados) en Estadísticas.
- `var foto: UIImage?` dentro del modelo.
- `.aspectRatio(contentMode: .fill)` solo en las fotos que elige el usuario (en clase siempre es `.fit`).
- `Button(role: .destructive)` → botón rojo de "Borrar mis datos".
- `.preferredColorScheme(.light)` → forzar modo claro (lo usaste en Movil2).

Si alguno te da miedo defenderlo, quítalo: la app sigue funcionando.

## 5. Lo que SÍ sigue la forma exacta de clase

- Renglón de la lista (`MascotaRow`): HStack **sin padding** (Clase 10).
- `func cargarMascotas() -> Array<Mascota>` (Clase 10). La lista vive en un `@State` porque se modifica.
- Imágenes: `.resizable(resizingMode: .stretch)` + `.aspectRatio(contentMode: .fit)` + `.frame(width:)` (Clase 3).
- Foto circular: `.clipShape(.circle)` + `.overlay { Circle().stroke(...) }` + `.shadow(...)` (Clase 5A).
- PhotosPicker con los pasos A–F (Clase 17). Única diferencia: el color del botón va fuera de las llaves (ver comentario).
- `Picker(selection: $x, label: Text("..."))` y alertas con `.toggle()` (Clases 3 y 4).
- `.onTapGesture { ... = false }` en el Stack principal para esconder el teclado (Clase 4).
- `@Binding` + `.constant(...)` en el preview, `@Environment(\.dismiss)` + `dismiss()` (Clases 6A y 6B).
- `.tabItem { Label(...) }` + `.tint(...)` (Clase 7).
- Dona con `innerRadius: .ratio(0.5)`, colores con `.foregroundStyle(by:)` + `.chartForegroundStyleScale`, ProgressView con `.scaleEffect(x: 1, y: 3)` (Clase 15).

## 6. Si algo falla

- **"Cannot find X in scope"** → te faltó copiar un archivo. Busca `X` en este repo (⌘⇧F) y cópialo.
- **La imagen no sale** → el nombre en el código no es igual al del asset (mayúsculas cuentan).
- **El texto sale blanco** → el teléfono está en modo oscuro. `AppCompletaView` ya fuerza modo claro con `.preferredColorScheme(.light)`.
- **Warning amarillo en PhotosPicker** → los colores van fuera de las llaves del `PhotosPicker` (ver `AgregarMascotaView.swift`).
