# 14 · App "Mi Agenda" (fechas a fondo)

App completa de pendientes y eventos **con fecha y hora**. Su tema fuerte es lo que no usa la app de Mascotas:
**`Date`, `DateFormatter`, `dateFormat`, sumar y restar días, "faltan X días", agrupar por día, `DatePicker`
y una gráfica de líneas en el tiempo.**

Para verla: corre la app del repo → **Empieza aquí → App Agenda**. O abre `Views/AgendaAppView.swift` y usa el Canvas.

---

## Pantallas

| Pestaña | Qué hace | Archivo |
|---|---|---|
| **Hoy** | Saludo según la hora ("Buenos días/tardes/noches"), fecha de hoy en 3 formatos, 3 tarjetas iguales (pendientes hoy, esta semana, vencidos), lo de hoy y lo que sigue | `Views/AgendaHoyView.swift` |
| **Agenda** | Lista **agrupada por día** ("Hoy", "Mañana", "martes 20 de octubre"), filtro Pendientes/Todos/Hechos, borrar deslizando, botón para agregar | `Views/AgendaListaView.swift` |
| → Detalle | La **misma fecha en 7 formatos**, cambiar la fecha con `DatePicker`, marcar completado, prioridad (todo con `@Binding`) | `Views/AgendaDetalleView.swift` |
| → Agregar | Formulario en sheet: título, categoría, prioridad, **fecha y hora futura** con `DatePicker`, validación con alertas | `Views/AgendaAgregarView.swift` |
| **Semana** | Los próximos 7 días como botones (jue 15, vie 16…) con cuántos eventos tiene cada uno; tocas uno y ves sus eventos | `Views/AgendaSemanaView.swift` |
| **Progreso** | Gráfica de **líneas** de completados por día (última semana), barras por categoría, % completado | `Views/AgendaProgresoView.swift` |
| **Fechas** | **Laboratorio**: eliges una fecha y ves EN VIVO cada estilo, cada `dateFormat`, sumar/restar, comparar, ordenar y texto → fecha, con el código al lado | `Views/AgendaGuiaFechasView.swift` |

## Archivos

```
14_AppAgenda/
├── Model/
│   ├── EventoAgenda.swift        el struct + propiedades calculadas de fecha (fechaTexto, horaTexto, textoCuandoFalta…)
│   └── ModelDataAgenda.swift     19 eventos con fechas DISTINTAS (relativas a hoy y exactas)
├── Utils/
│   ├── FechasAgenda.swift        ⭐ TODAS las funciones de fechas, explicadas
│   └── PaletaAgenda.swift        paleta "Lavanda" (análoga) de 12_Paletas
├── Components/
│   ├── EventoAgendaRow.swift     renglón con etiqueta "Hoy / Mañana / En 3 días / Vencido"
│   ├── TarjetaAgenda.swift       tarjeta número + etiqueta (3 del mismo ancho)
│   └── FilaDatoAgenda.swift      renglón "Etiqueta ……… Valor"
└── Views/  (las 7 pantallas de la tabla de arriba + AgendaAppView, la raíz)
```

## Qué tema del examen se usa y dónde

| Tema | Dónde en esta app | ¿Clase? |
|---|---|---|
| `Date()` = este momento | `Utils/FechasAgenda.swift` (todas), `AgendaGuiaFechasView` bloque 1 | ✅ Clase 3B |
| `DateFormatter` en 3 pasos, `dateStyle`/`timeStyle` | `FechasAgenda.swift` → `fechaConEstiloAgenda` · Laboratorio bloque 2 · Detalle bloque 3 | ✅ Clase 3B |
| `locale = Locale(identifier: "es_MX")` | todas las funciones de `FechasAgenda.swift` | ✅ Clase 3B |
| `dateFormat` a la medida (`"EEEE d 'de' MMMM"`, `"h:mm a"`…) | `FechasAgenda.swift` → `formatearFechaAgenda` · Laboratorio bloque 3 | ✅ Clase 3B |
| Sumar/restar con `DateComponents` + `Calendar.current.date(byAdding:to:)` + `if let` | `FechasAgenda.swift` → `fechaAgenda` · Laboratorio bloque 4 · Semana (7 días con un `for`) | ✅ Clase 3B |
| Fechas distintas en el ModelData | `Model/ModelDataAgenda.swift` | ✅ (forma A) · ⚠️ (forma B, `date(from:)`) |
| Propiedades calculadas en el modelo | `Model/EventoAgenda.swift` (`fechaTexto`, `horaTexto`, `diaSemana`, `textoCuandoFalta`, `esHoy`, `estaVencido`, `icono`) | ✅ Clase 10 / skill |
| `switch` (con números y con Strings) | `textoCuandoFalta`, `icono` (modelo) · saludo por hora (Hoy) · título de sección (Agenda) | ✅ Clase 2 |
| Texto → número con `if let` | saludo: `Int(formatearFechaAgenda(fecha: Date(), formato: "HH"))` (Hoy) | ✅ Clase 2 |
| Comparar fechas con `<` `>` | `estaVencido` (modelo) · validación "fecha ya pasó" (Agregar) · Laboratorio bloque 5 | 🟡 básico |
| Contar con `for` + `if` | Hoy (pendientes, semana, vencidos) · Progreso (por día y por categoría) | ✅ / 🟡 |
| TabView con lista compartida (`@State` en la raíz, `var`/`@Binding` en las pestañas) | `AgendaAppView.swift` | ✅ Clase 7 / 6B |
| Lista con `List($lista) { $item in }` + detalle con `@Binding` | `AgendaListaView` + `AgendaDetalleView` | ✅ Clase 10 / 6B |
| Agregar con sheet + validación + `append` + `dismiss` | `AgendaAgregarView` | ✅ Clases 3, 6A, 17 |
| Picker `.segmented` y con opción vacía | Agenda (filtro) · Agregar (categoría y prioridad) · Detalle (prioridad) | ✅ Clase 4 |
| Teclado con `@FocusState` + `.onTapGesture` en el Stack principal | `AgendaAgregarView` | ✅ Clase 4 |
| Gráfica de **líneas** en el tiempo · barras por categoría | `AgendaProgresoView` bloques 1 y 3 | ✅ Clase 15 |
| `ProgressView` con `.scaleEffect(x: 1, y: 3)` | `AgendaProgresoView` bloque 4 | ✅ Clase 15 |
| Paleta en `Utils/` (análoga) | `Utils/PaletaAgenda.swift` (`let paleta = PaletaAgenda()`) | ✅ rúbrica |
| `DatePicker` (elegir fecha y hora) | Agregar (con `in: Date()...`) · Detalle · Laboratorio | ⚠️ |
| Agrupar en `Section` por día | `AgendaListaView` | ⚠️ |
| Ordenar por fecha (`sorted`, `sort`) | Hoy, Agenda, Semana, Laboratorio | ⚠️ |
| Días entre dos fechas (`dateComponents(_:from:to:)`) | `FechasAgenda.swift` → `diasEntreAgenda` | ⚠️ |
| Texto → fecha (`date(from:)`) | `FechasAgenda.swift` → `fechaExactaAgenda` · Laboratorio bloque 6 | ⚠️ |
| Borrar deslizando (`.swipeActions`) | `AgendaListaView` | ⚠️ |

## Cómo usarla en el examen

1. Arrastra la carpeta `14_AppAgenda` a tu proyecto (marca **Copy items if needed** y tu target).
2. En `TuAppApp.swift` cambia `ContentView()` por `AgendaAppView()`.
3. Para adaptarla: **⌘⌥F** (Buscar y reemplazar) `EventoAgenda` → tu modelo; cambia los datos de `ModelDataAgenda.swift`.
4. Si solo necesitas las fechas: copia `Utils/FechasAgenda.swift` (todas las funciones) y listo.

---

## Explicación paso a paso: cómo funcionan las fechas

### 1. Un `Date` es UN instante

`Date()` guarda **un momento exacto**: día y hora juntos, hasta los segundos. No sabe de idiomas ni de formatos.

```swift
let ahorita = Date()      // constructor vacío = fecha y hora de ESTE momento (Clase 3B)
print(ahorita)            // 2026-10-16 03:54:36 +0000   ← en inglés y en hora UTC: feo
```

Por eso **nunca** se muestra un `Date` directo en un `Text`: siempre se convierte a texto con un `DateFormatter`.

### 2. `DateFormatter` convierte un Date en TEXTO (3 pasos de clase)

```swift
func fechaDeHoy() -> String {
    let fechaActual = Date()
    let formato = DateFormatter()                     // 1. generar el formateador
    formato.dateStyle = DateFormatter.Style.long      // 2. elegir el estilo
    formato.timeStyle = DateFormatter.Style.none      //    .none = sin hora
    formato.locale = Locale(identifier: "es_MX")      //    en español de México
    return formato.string(from: fechaActual)          // 3. obtener el String → "15 de octubre de 2026"
}
```

- El `Date` **no cambia**: el formateador solo decide **cómo se ve**.
- Sin `locale` sale en inglés (el idioma del simulador).

### 3. Dos formas de elegir cómo se ve

| Forma | Cuándo | Ejemplo | Resultado |
|---|---|---|---|
| **`dateStyle` / `timeStyle`** (estilos de Apple) | Rápido, estándar | `.long` | `15 de octubre de 2026` |
| **`dateFormat`** (a la medida) | Quieres un formato exacto | `"EEEE d 'de' MMMM"` | `jueves 15 de octubre` |

Letras de `dateFormat` que más se usan: `d`/`dd` día · `M`/`MM` mes en número · `MMM` mes corto · `MMMM` mes completo ·
`yyyy` año · `EEE`/`EEEE` día de la semana · `HH` hora 0–23 · `h` hora 1–12 · `mm` minutos · `a` a.m./p.m. ·
`'texto'` sale tal cual. **El laboratorio (pestaña Fechas) te muestra cada una en vivo.**

### 4. Fechas DISTINTAS en tu ModelData

Si pones `fecha: Date()` en todos, **todos quedan iguales** (la hora en que abriste la app). Dos formas:

**A) Relativa a hoy (forma de clase, la recomendada):** sumas días con `DateComponents`.

```swift
func fechaHaceDias(dias: Int) -> Date {
    var dateComponent = DateComponents()
    dateComponent.day = -dias                          // negativo = hacia atrás
    if let fecha = Calendar.current.date(byAdding: dateComponent, to: Date()) {
        return fecha
    }
    return Date()
}
// fecha: fechaHaceDias(dias: 3)
```

**¿Por qué el `if let`?** `Calendar.current.date(byAdding:to:)` regresa un **opcional** (`Date?`): la lámina dice
*"Solo aguas… esta constante es OPCIONAL"*. Puede no poder calcularla, así que se desempaca con `if let` (nunca con `!`).

**B) Exacta escrita como texto ⚠️:** `date(from:)` lee un texto usando el `dateFormat`.

```swift
func crearFecha(texto: String) -> Date? {
    let formato = DateFormatter()
    formato.dateFormat = "dd/MM/yyyy HH:mm"           // el texto DEBE venir así
    return formato.date(from: texto)                   // nil si no coincide
}
```

### 5. Comparar, "faltan X días" y "¿es hoy?"

- **Comparar:** las fechas se comparan como números: `if fecha < Date() { "ya pasó" }`. La más antigua es la "más chica".
- **¿Es el mismo día?** Dos fechas con distinta hora pueden ser el mismo día. Truco con lo de clase: conviértelas a
  texto `"dd/MM/yyyy"` y compara los textos (`claveDiaAgenda`).
- **Faltan X días ⚠️:** `Calendar.current.dateComponents([.day], from: hoy, to: fecha).day` (`diasEntreAgenda`).

### 6. Elegir una fecha en pantalla: `DatePicker` ⚠️

```swift
@State private var fecha = Date()

DatePicker("Fecha y hora", selection: $fecha, in: Date()...,          // in: Date()... = solo de hoy en adelante
           displayedComponents: [.date, .hourAndMinute])               // .date = día · .hourAndMinute = hora
    .environment(\.locale, Locale(identifier: "es_MX"))                // calendario en español
```

`selection` va con `$` porque el `DatePicker` **cambia** la variable (como un `TextField`).

### 7. Guardar la fecha en el modelo y mostrarla

En el struct va `var fecha: Date`. Para mostrarla, una **propiedad calculada** que la convierte a texto:

```swift
var fechaTexto: String {
    return fechaConEstiloAgenda(fecha: fecha, estiloFecha: .long, estiloHora: .none)
}
// En la vista:  Text(evento.fechaTexto)
```

---

## Errores típicos con fechas

| Error / síntoma | Por qué | Arreglo |
|---|---|---|
| `Cannot call value of non-function type 'String?'` | Escribiste `formato.dateFormat("dd/MM/yyyy")` | Es una propiedad: `formato.dateFormat = "dd/MM/yyyy"` |
| `Expressions are not allowed at the top level` | Configuraste el formateador **fuera de una función** | Muévelo **dentro** de una `func` (o de una propiedad calculada) |
| `Value of optional type 'Date?' must be unwrapped` | `date(byAdding:)` y `date(from:)` regresan opcional | `if let fecha = … { }` |
| La fecha sale en inglés | Falta `locale` | `formato.locale = Locale(identifier: "es_MX")` |
| Todas las fechas salen iguales | Pusiste `Date()` en todas, o `date(from:)` dio `nil` y cayó al `?? Date()` | Usa fechas relativas (forma A) o revisa que el texto coincida con el `dateFormat` |
| `date(from:)` siempre da `nil` | No le pusiste `dateFormat`, o el texto no coincide (`"2024-04-15"` con `"dd/MM/yyyy"`) | Pon el `dateFormat` exacto del texto |
| Sale el **mes** donde iban los **minutos** | `MM` es mes, `mm` son minutos | `"HH:mm"` |
| La hora sale "08" en la noche | `hh` es 1–12 | `"HH:mm"` (24 h) o `"h:mm a"` (con a.m./p.m.) |
| El año sale mal a fin de diciembre | `YYYY` es el año de la semana | Usa `yyyy` |
| "Mañana a las 8" sale como "0 días" | Restaste fechas con hora | Compara días con `startOfDay` (ver `diasEntreAgenda`) |

## Si la profe pregunta

- **¿Qué es `Date`?** "Un instante: guarda día y hora. Para mostrarlo uso un DateFormatter en 3 pasos: lo creo, le doy un estilo o un dateFormat y le pido el string."
- **¿Por qué `if let` al sumar días?** "Porque `Calendar.current.date(byAdding:to:)` regresa un opcional; con `if let` lo desempaco sin riesgo de que truene."
- **¿Por qué la lista vive en `AgendaAppView`?** "Porque es la dueña del dato (`@State`). Las pestañas que solo leen la reciben como `var`; la que la modifica, como `@Binding`. Así todas ven la misma lista."
- **¿Por qué líneas en Progreso?** "Porque muestran la evolución en el tiempo (días seguidos). Para comparar categorías usé barras, como dice la Clase 15."
- **¿Qué es `DatePicker`?** "Un control para elegir fecha y hora; se liga con `$` a una variable `@State` de tipo Date. No lo vimos en clase, pero funciona igual que un TextField o un Toggle."
