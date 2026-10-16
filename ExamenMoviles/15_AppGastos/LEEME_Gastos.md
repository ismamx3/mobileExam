# 15 · App "Mis Gastos" (control de gastos con login)

App completa de ejemplo enfocada en lo que **no** usa la app de Mascotas: **login**, **navegar con validación (Clase 6C)**,
**paso de valores de ida y de ida y vuelta (Clase 6B)**, **dinero** (pesos, sumas, promedios, porcentajes), secciones,
buscador, borrar, `Stepper`, `switch` y gráficas de **líneas en el tiempo** con línea de presupuesto.

Para verla: corre el repo → **Empieza aquí → Mis Gastos**. Usuario `alumno`, contraseña `1234`.

---

## Pantallas

| Pantalla | Qué hace | Archivo |
|---|---|---|
| Login | Usuario + contraseña, alerta con el error exacto, pasa el nombre a la app | `Views/GastosLoginView.swift` |
| Resumen | Saludo con el nombre, total del mes, presupuesto con barra de color (verde / naranja / rojo), 3 tarjetas, últimos gastos | `Views/GastosResumenView.swift` |
| Gastos | Lista agrupada por categoría con subtotales, buscador, borrar deslizando, "Borrar todo" | `Views/GastosListaView.swift` |
| Detalle | Datos de un gasto (solo ver) + las 5 formas de mostrar dinero + botón regresar | `Views/GastoDetalleView.swift` |
| Agregar (hoja) | Concepto, monto, categoría, método, fecha; valida y hace `append` | `Views/GastoAgregarView.swift` |
| Estadísticas | Dona por categoría, línea de gasto por día con línea de presupuesto, barras efectivo vs tarjeta | `Views/GastosEstadisticasView.swift` |
| Ahorro | Calculadora: Slider + Stepper + TextField → botón con el **patrón 6C exacto** | `Views/GastosCalculadoraView.swift` |
| Resultado | Recibe meta, meses e ingreso; cuánto ahorrar por mes / semana / día y fecha de la meta | `Views/GastosResultadoAhorroView.swift` |
| Perfil | Nombre, presupuesto, ir a editarlo, cerrar sesión | `Views/GastosPerfilView.swift` |
| Editar presupuesto | Lo cambia con `@Binding`: se ve al regresar en todas las pestañas | `Views/GastosEditarPresupuestoView.swift` |

```
15_AppGastos/
├── Model/        GastoApp.swift (el molde) · ModelDataGastos.swift (14 gastos con fechas distintas)
├── Utils/        PaletaGastos.swift (paleta Menta de 12_Paletas)
├── Components/   GastoRow · GastosTarjetaResumen · GastosFilaDato
└── Views/        GastosAppView (raíz) + las 10 pantallas de arriba
```

---

## Tema del examen → dónde está en esta app

| Tema | Dónde se usa (archivo → bloque) | ¿Visto en clase? |
|---|---|---|
| Patrón 6C: `isValid` + `Button` + `.alert` + `.navigationDestination(isPresented:)` | `GastosCalculadoraView.swift` → bloque 4 | ✅ Clase 6C |
| Paso de valores de IDA (`var` sin `@State` ni `private`) | `GastosResultadoAhorroView.swift`, `GastoDetalleView.swift`, `GastosResumenView.swift` | ✅ Clase 6B |
| Paso de valores IDA Y VUELTA (`@State` → `$` → `@Binding`) | `GastosAppView` → `GastosPerfilView` → `GastosEditarPresupuestoView` | ✅ Clase 6B |
| `.constant(...)` en el `#Preview` de una vista con `@Binding` | `GastosEditarPresupuestoView.swift`, `GastosLoginView.swift` | ✅ Clase 6B |
| Regresar por código con `dismiss()` | `GastoDetalleView.swift` → bloque 4, `GastosResultadoAhorroView.swift` → bloque 6 | ✅ Clase 6A |
| Login que cambia a la app SIN anidar `NavigationStack` (`if` en la raíz) | `GastosAppView.swift` → bloques 1 y 3, `GastosLoginView.swift` | 🟡 `if` básico + `@Binding` (6B) |
| Lista compartida entre pestañas (`@State` en la raíz) | `GastosAppView.swift` → bloque 2 | ✅ Clases 6B y 7 |
| Dinero: `Text(x, format: .currency(code: "MXN"))`, `.formatted(...)`, `specifier` | `GastoDetalleView.swift` → bloque 3 | ✅ Clase 3B |
| Texto → número con `if let x = Double(texto)` | `GastoAgregarView.swift` → `guardarGasto()` | ✅ Clase 2 |
| Sumar, promedio (sin dividir entre 0), máximo, porcentaje con `for` | `GastosResumenView.swift` (propiedades calculadas) | 🟡 básico |
| Propiedad calculada en vez de `@State` para totales | `GastosResumenView.swift` (`totalDelMes`, `promedio`, …) | ✅ Clases 5A/10 |
| Color y mensaje según el valor con `switch` | `GastosResumenView.swift` (`colorPresupuesto`), `GastosResultadoAhorroView.swift` | 🟡 básico (⚠️ rangos de `Double`) |
| `ProgressView(value:total:)` + `.scaleEffect(x: 1, y: 3)` | `GastosResumenView.swift` → bloque 2 | ✅ Clase 15 |
| Fechas: `DateFormatter` con `dateFormat` / `dateStyle`, `es_MX`, sumar días y meses | `GastoApp.swift`, `ModelDataGastos.swift`, `GastosResultadoAhorroView.swift` (`fechaMeta`) | ✅ Clase 3B |
| Saber si un gasto es de ESTE mes (comparar `"MM/yyyy"`) | `GastoApp.swift` (`mesTexto`), `GastosResumenView.swift` (`gastosDelMes`) | ✅ Clase 3B (truco) |
| Dona con `SectorMark(… innerRadius: .ratio(0.5))` + colores opción C | `GastosEstadisticasView.swift` → bloque 1 | ✅ Clase 15 |
| Línea en el TIEMPO (`LineMark` con fechas) | `GastosEstadisticasView.swift` → bloque 2 | ✅ Clase 15 (⚠️ `unit: .day`) |
| Línea de referencia `RuleMark` | `GastosEstadisticasView.swift` → bloque 2 | ⚠️ (de tu tarea graficas) |
| Barras con un solo color (opción A) | `GastosEstadisticasView.swift` → bloque 3 | ✅ Clase 15 |
| Picker con opción vacía + `.segmented` | `GastoAgregarView.swift` → bloques 4 y 5 | ✅ Clase 4 |
| Slider con `onEditingChanged` | `GastosCalculadoraView.swift` → bloque 1 | ✅ Clase 4 (⚠️ `step:`) |
| Esconder teclado (`@FocusState` + `.onTapGesture` en el Stack principal) | `GastoAgregarView.swift`, `GastosLoginView.swift` | ✅ Clase 4 |
| Alerta con mensaje dinámico + `toggle()` | todas las pantallas con formulario | ✅ Clase 3 |
| Componentes con parámetros | `Components/` (3 componentes) | ✅ Clase 5A |
| Paleta en `Utils` usada con `let paleta = PaletaGastos()` | todas las vistas | ✅ rúbrica (paleta análoga) |
| `SecureField` | `GastosLoginView.swift` | ⚠️ |
| `Stepper` | `GastosCalculadoraView.swift` → bloque 2, `GastosEditarPresupuestoView.swift` → bloque 2 | ⚠️ |
| `DatePicker` | `GastoAgregarView.swift` → bloque 6 | ⚠️ |
| `Section`, `.searchable`, `.onDelete`, `.confirmationDialog`, `ToolbarItem` | `GastosListaView.swift` | ⚠️ |

---

## Cómo usarla en el examen

1. Arrastra la carpeta `15_AppGastos` a tu proyecto (marca **Copy items if needed** y tu target).
2. En `TuAppApp.swift` cambia `ContentView()` por `GastosAppView()`.
3. ¿Otro tema? Usa ⌘⌥F (Find & Replace) para cambiar `Gasto` → `TuCosa` y ajusta los campos de `Model/GastoApp.swift`.
4. ¿Sin login? En `GastosAppView` pon `@State private var sesionIniciada = true`.
5. ¿Solo quieres una pieza? Cada archivo dice en su encabezado qué más necesita (`NECESITA:`).

---

## Explicación paso a paso

### 1. ¿Quién es dueño de qué? (paso de valores)

```
GastosAppView            @State private var gastos, presupuesto, nombreUsuario, sesionIniciada   ← DUEÑA
 ├─ GastosLoginView           @Binding sesionIniciada, nombreUsuario     (los CAMBIA al entrar)
 ├─ GastosResumenView         var gastos, var presupuesto, var nombre     (solo LEE)
 ├─ GastosListaView           @Binding var gastos                          (agrega y borra)
 │    ├─ GastoDetalleView          var gasto                               (solo LEE · ida)
 │    └─ GastoAgregarView          @Binding var gastos                     (hace append)
 ├─ GastosEstadisticasView    var gastos, var presupuesto                  (solo LEE)
 ├─ GastosCalculadoraView     (sus propios @State)
 │    └─ GastosResultadoAhorroView  var meta, var meses, var ingreso        (solo LEE · ida)
 └─ GastosPerfilView          @Binding presupuesto, sesionIniciada
      └─ GastosEditarPresupuestoView  @Binding var presupuesto             (lo CAMBIA · ida y vuelta)
```

- **Ida (solo mostrar):** en la pantalla 2, `var dato: Tipo` (sin `@State`, sin `private`). En la pantalla 1, `Pantalla2(dato: valor)`.
- **Ida y vuelta (modificar):** en la pantalla 2, `@Binding var dato: Tipo` (sin `private`, sin valor inicial). En la 1, `@State private var dato` y se pasa **con `$`**: `Pantalla2(dato: $dato)`.
- **Regla:** cada dato tiene **un solo dueño** con `@State`. Si una pestaña tuviera su propio `@State private var gastos = cargarGastosApp()`, sería **otra lista**, y lo que agregas en "Gastos" no aparecería en "Resumen".
- **Por qué no `@Binding` en todo:** dale a cada vista solo el permiso que necesita (Clase 6B). Si Resumen solo muestra, con `var` basta, y así no puede borrar la lista por error.

### 2. El patrón 6C, línea por línea (`GastosCalculadoraView.swift`)

```swift
@State private var isValid = false        // 1. ¿pasa la validación?
@State private var showAlert = false

Button {                                  // 2. Button EN LUGAR de NavigationLink (dentro de un NavigationStack)
    if ingresoLimpio.isEmpty {
        isValid = false                   //    falla → no navega
        mensajeAlerta = "Escribe tu ingreso mensual."
        showAlert.toggle()                //    y prende la alerta
    } else if let numero = Double(ingresoLimpio) {
        ingreso = numero
        isValid = true                    //    pasa → navega
    }
} label: { Text("Calcular") }
.alert(mensajeAlerta, isPresented: $showAlert) {      // la alerta va pegada AL BOTÓN
    Button("OK") {}
}
.navigationDestination(isPresented: $isValid) {        // 3. modificador AL BOTÓN: navega si isValid == true
    GastosResultadoAhorroView(meta: meta, meses: meses, ingreso: ingreso)   // y pasa los valores (6B)
}
```

**Errores típicos:**
- **No navega:** falta el `NavigationStack` arriba, o el `.navigationDestination` quedó en una vista que no se muestra.
- **Navega aunque haya error:** falta `isValid = false` en las ramas de error.
- **"Missing argument for parameter 'meta'":** la pantalla destino tiene `var meta: Double` sin valor y no se lo pasaste.

### 3. Login sin anidar NavigationStack (`GastosAppView.swift`)

Cada pestaña lleva su propio `NavigationStack`. Si el login "empujara" el TabView, quedarían dos `NavigationStack` uno dentro de
otro: dos barras, y la flecha "<" regresaría al login. Por eso la raíz decide con un `if`:

```swift
@State private var sesionIniciada = false

var body: some View {
    if sesionIniciada {
        TabView { … }                                    // la app
    } else {
        GastosLoginView(sesionIniciada: $sesionIniciada, nombreUsuario: $nombreUsuario)
    }
}
```

El login, cuando todo es correcto, hace `sesionIniciada = true` (es `@Binding`, así que cambia la de la raíz) y la pantalla cambia
sola. "Cerrar sesión" (en Perfil) la regresa a `false`.

### 4. Dinero

| Quiero… | Código | Resultado |
|---|---|---|
| Pesos dentro de un `Text` (forma de clase) | `Text(monto, format: .currency(code: "MXN"))` | `$1,250.50` (`MX$` si el iPhone está en inglés) |
| Pesos como `String` (forma de clase) | `monto.formatted(.currency(code: "MXN"))` | igual |
| Siempre `$`, aunque esté en inglés ⚠️ | `monto.formatted(.currency(code: "MXN").locale(Locale(identifier: "es_MX")))` | `$1,250.50` |
| 2 decimales con `specifier` | `Text("$\(monto, specifier: "%.2f")")` | `$1250.50` |
| Porcentaje sin decimales | `Text("\(porcentaje, specifier: "%.0f")%")` | `42%` |
| Texto → número | `if let monto = Double(texto) { … }` | `nil` si escribieron letras |
| Coma decimal → punto ⚠️ | `texto.replacingOccurrences(of: ",", with: ".")` | `"12,5"` → `"12.5"` |

- **Sumar con un `for`:** `var suma = 0.0` → `for gasto in gastos { suma += gasto.monto }`.
- **Promedio:** `suma / Double(cantidad)`. Antes revisa que haya elementos (`if lista.isEmpty { return 0 }`): dividir un `Double` entre 0 da `nan` o `inf` y en pantalla sale basura.
- **Porcentaje:** `parte / total * 100`, revisando que `total > 0`.
- **`Int` y `Double` no se mezclan:** `meta / Double(meses)` (convierte el `Int` antes de dividir).

### 5. Fechas que usa esta app

| Para | Código | Archivo |
|---|---|---|
| Fechas distintas en ModelData (hace N días) | `DateComponents` + `.day = -dias` + `Calendar.current.date(byAdding:to:)` con `if let` | `ModelDataGastos.swift` |
| "15 de octubre" | `dateFormat = "d 'de' MMMM"` + `locale = es_MX` | `GastoApp.swift` (`fechaTexto`) |
| "jueves, 15 de octubre de 2026" | `dateStyle = .full` | `GastoDetalleView.swift` |
| Fecha de hoy + N meses | `dateComponent.month = meses` | `GastosResultadoAhorroView.swift` (`fechaMeta`) |
| ¿Es de este mes? | Comparar `"MM/yyyy"` de las dos fechas | `GastoApp.swift` (`mesTexto`) |
| Agrupar por día para la gráfica | Clave `"yyyy-MM-dd"` | `GastosEstadisticasView.swift` |

Recuerda: `dateFormat` es una **propiedad** y se le asigna con `=` (`formato.dateFormat = "dd/MM/yyyy"`), no se llama con paréntesis.
Y todo eso va **dentro de una función** o propiedad calculada, nunca suelto en el archivo.
