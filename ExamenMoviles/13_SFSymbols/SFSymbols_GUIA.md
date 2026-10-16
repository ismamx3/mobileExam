# SF Symbols: guía de cuál usar (en español)

> Los íconos que ya trae iOS. Se usan con `Image(systemName: "nombre")`, sin agregar nada a Assets.
> Busca con ⌘F lo que quieres representar: `comida`, `borrar`, `perfil`, `favorito`, `gym`, `viaje`…
> Para VER todos los íconos: corre la app → **13 · SF Symbols → Catálogo completo**. Lista completa: `SFSymbols_TODOS.md`.

**Regla rápida:** la versión `.fill` (rellena) se usa para lo **seleccionado** o lo importante; la normal (contorno) para lo demás.
Ej. corazón vacío `heart` = no es favorito, corazón lleno `heart.fill` = sí es favorito.

```swift
Image(systemName: "heart.fill")          // ícono solo
    .font(.title)                         // tamaño
    .foregroundStyle(.red)                // color
Label("Favoritos", systemImage: "star.fill") // ícono + texto (TabView, botones)
Button("Agregar", systemImage: "plus") { }
```

## Pestañas del TabView

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `house.fill` | Inicio / pantalla principal | 13.0 |
| `list.bullet` | Lista de elementos | 13.0 |
| `list.bullet.rectangle.fill` | Lista con detalle | 15.0 |
| `square.grid.2x2.fill` | Galería, categorías o menú de opciones | 13.0 |
| `magnifyingglass` | Buscar / buscador | 13.0 |
| `chart.bar.fill` | Estadísticas / gráficas | 13.0 |
| `chart.pie.fill` | Resumen / proporciones | 13.0 |
| `person.crop.circle.fill` | Perfil del usuario | 13.0 |
| `gearshape.fill` | Ajustes / configuración | 14.0 |
| `star.fill` | Favoritos / destacados | 13.0 |
| `heart.fill` | Favoritos / me gusta | 13.0 |
| `bell.fill` | Notificaciones / avisos | 13.0 |
| `calendar` | Calendario / agenda | 13.0 |
| `map.fill` | Mapa / lugares | 13.0 |
| `cart.fill` | Carrito / compras | 13.0 |
| `bookmark.fill` | Guardados / leer después | 13.0 |
| `sparkles` | Recomendación sorpresa / descubrir | 13.0 |
| `info.circle.fill` | Acerca de / información | 13.0 |

## Acciones (botones)

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `plus` | Agregar (botón chico, toolbar) | 13.0 |
| `plus.circle.fill` | Agregar (botón grande) | 13.0 |
| `pencil` | Editar | 13.0 |
| `square.and.pencil` | Editar / escribir nota | 13.0 |
| `trash` | Borrar | 13.0 |
| `trash.fill` | Borrar (destructivo, en rojo) | 13.0 |
| `square.and.arrow.up` | Compartir | 13.0 |
| `square.and.arrow.down` | Guardar / descargar | 13.0 |
| `xmark` | Cerrar una hoja / cancelar | 13.0 |
| `xmark.circle.fill` | Limpiar un campo de texto / cerrar | 13.0 |
| `checkmark` | Confirmar / listo | 13.0 |
| `checkmark.circle.fill` | Completado / guardado con éxito | 13.0 |
| `arrow.clockwise` | Recargar / reintentar | 13.0 |
| `arrow.uturn.backward` | Deshacer | 14.0 |
| `line.3.horizontal.decrease.circle` | Filtrar | 15.0 |
| `arrow.up.arrow.down` | Ordenar | 13.0 |
| `slider.horizontal.3` | Ajustes de filtro / preferencias | 13.0 |
| `ellipsis.circle` | Más opciones (menú) | 13.0 |
| `chevron.right` | Ir al detalle (flechita del renglón) | 13.0 |
| `chevron.left` | Regresar | 13.0 |
| `arrow.right.circle.fill` | Siguiente / continuar | 13.0 |
| `paperplane.fill` | Enviar | 13.0 |
| `doc.on.doc` | Copiar | 13.0 |
| `link` | Abrir una liga | 13.0 |
| `shuffle` | Mezclar / al azar | 13.0 |
| `dice.fill` | Recomendación al azar | 15.0 |
| `arrow.triangle.2.circlepath` | Cambiar / sincronizar | 14.0 |
| `eye` | Mostrar contraseña | 13.0 |
| `eye.slash` | Ocultar contraseña | 13.0 |
| `rectangle.portrait.and.arrow.right` | Cerrar sesión | 15.0 |
| `person.badge.plus` | Registrarse / agregar persona | 13.0 |
| `qrcode` | Código QR | 13.0 |
| `printer.fill` | Imprimir | 13.0 |
| `mic.fill` | Grabar voz / micrófono | 13.0 |

## Estados y mensajes

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `checkmark.seal.fill` | Verificado / aprobado / vacunado | 13.0 |
| `exclamationmark.triangle.fill` | Advertencia (amarillo/naranja) | 13.0 |
| `exclamationmark.circle.fill` | Error en un campo | 13.0 |
| `xmark.octagon.fill` | Error grave / prohibido | 13.0 |
| `info.circle` | Información / ayuda corta | 13.0 |
| `questionmark.circle` | Ayuda / preguntas | 13.0 |
| `clock.fill` | Pendiente / en espera | 13.0 |
| `hourglass` | Cargando / esperando | 13.0 |
| `circle` | Tarea sin completar | 13.0 |
| `checkmark.circle` | Tarea completada (sin relleno) | 13.0 |
| `flag.fill` | Marcar / meta | 13.0 |
| `bolt.fill` | Rápido / energía | 13.0 |
| `flame.fill` | Popular / tendencia / picante | 13.0 |
| `crown.fill` | Premium / el mejor | 14.0 |
| `trophy.fill` | Logro / ganador | 16.0 |
| `medal.fill` | Medalla / reconocimiento | 16.0 |
| `hand.thumbsup.fill` | Me gusta / recomendado | 13.0 |
| `hand.thumbsdown.fill` | No me gusta | 13.0 |
| `face.smiling` | Feliz / buen estado de ánimo | 14.0 |
| `tray` | Lista vacía / sin elementos | 13.0 |

## Personas y comunicación

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `person.fill` | Usuario | 13.0 |
| `person.2.fill` | Amigos / grupo | 13.0 |
| `person.3.fill` | Equipo | 13.0 |
| `person.text.rectangle.fill` | Credencial / identificación | 15.0 |
| `graduationcap.fill` | Escuela / carrera / alumno | 14.0 |
| `briefcase.fill` | Trabajo | 13.0 |
| `envelope.fill` | Correo | 13.0 |
| `phone.fill` | Teléfono / llamar | 13.0 |
| `message.fill` | Mensajes | 13.0 |
| `bubble.left.and.bubble.right.fill` | Chat / comentarios | 13.0 |
| `at` | Usuario o correo (@) | 13.0 |
| `hand.wave.fill` | Saludo / bienvenida | 14.0 |
| `figure.wave` | Bienvenida / persona saludando | 14.0 |

## Fechas y tiempo

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `calendar` | Fecha | 13.0 |
| `calendar.badge.plus` | Agendar / agregar evento | 13.0 |
| `calendar.circle.fill` | Fecha (en círculo) | 13.0 |
| `clock` | Hora | 13.0 |
| `alarm.fill` | Alarma / recordatorio | 13.0 |
| `timer` | Temporizador | 13.0 |
| `stopwatch.fill` | Cronómetro | 13.0 |
| `sun.max.fill` | De día / mañana | 13.0 |
| `moon.fill` | De noche / modo oscuro | 13.0 |
| `hourglass.bottomhalf.filled` | Tiempo restante | 15.0 |

## Dinero y compras

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `dollarsign.circle.fill` | Precio / costo | 13.0 |
| `creditcard.fill` | Pago con tarjeta | 13.0 |
| `banknote.fill` | Efectivo | 14.0 |
| `cart.fill` | Carrito | 13.0 |
| `bag.fill` | Bolsa de compras | 13.0 |
| `basket.fill` | Canasta / súper | 16.0 |
| `tag.fill` | Etiqueta de precio / oferta | 13.0 |
| `gift.fill` | Regalo | 13.0 |
| `percent` | Descuento / porcentaje | 13.0 |
| `storefront.fill` | Tienda / negocio | 17.0 |
| `chart.line.uptrend.xyaxis` | Ganancias / va subiendo | 15.0 |
| `chart.line.downtrend.xyaxis` | Gastos / va bajando | 16.0 |
| `wallet.pass.fill` | Cartera / boletos guardados | 14.0 |

## Comida y bebida (antojos)

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `fork.knife` | Restaurante / comida | 15.0 |
| `fork.knife.circle.fill` | Restaurante (en círculo) | 15.0 |
| `takeoutbag.and.cup.and.straw.fill` | Comida para llevar / rápida | 15.0 |
| `cup.and.saucer.fill` | Café / cafetería | 15.0 |
| `mug.fill` | Café o té | 16.1 |
| `wineglass.fill` | Bar / bebidas | 16.0 |
| `birthday.cake.fill` | Postres / pasteles / cumpleaños | 16.0 |
| `carrot.fill` | Saludable / verduras | 16.0 |
| `fish.fill` | Mariscos / pescado | 16.0 |
| `popcorn.fill` | Botanas / cine | 16.0 |
| `frying.pan.fill` | Cocinar / recetas | 16.0 |
| `refrigerator.fill` | Cocina / despensa | 16.0 |
| `leaf.fill` | Vegano / natural | 14.0 |
| `flame.fill` | Picante | 13.0 |
| `waterbottle.fill` | Agua / bebida | 17.0 |

## Lugares y viajes

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `mappin.and.ellipse` | Ubicación de un lugar | 13.0 |
| `mappin.circle.fill` | Lugar marcado | 13.1 |
| `location.fill` | Mi ubicación | 13.0 |
| `map.fill` | Mapa | 13.0 |
| `globe.americas.fill` | Mundo / viajes | 15.0 |
| `airplane` | Vuelos / viajes | 13.0 |
| `suitcase.fill` | Equipaje / viaje | 15.0 |
| `building.2.fill` | Ciudad / edificios | 14.0 |
| `tent.fill` | Acampar | 16.0 |
| `mountain.2.fill` | Montaña / naturaleza | 16.1 |
| `beach.umbrella.fill` | Playa / vacaciones | 16.0 |
| `ticket.fill` | Boletos / eventos | 14.0 |
| `binoculars.fill` | Explorar / descubrir | 14.0 |
| `signpost.right.fill` | Direcciones / camino | 14.0 |
| `bed.double.fill` | Hotel / hospedaje | 13.0 |

## Transporte

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `car.fill` | Auto | 13.0 |
| `bus.fill` | Camión / transporte público | 14.0 |
| `tram.fill` | Metro / tren ligero | 13.0 |
| `bicycle` | Bicicleta | 14.0 |
| `figure.walk` | Caminando | 14.0 |
| `ferry.fill` | Barco / ferry | 15.0 |
| `fuelpump.fill` | Gasolina | 15.0 |
| `parkingsign.circle.fill` | Estacionamiento | 15.0 |
| `scooter` | Scooter | 15.0 |

## Deporte, gym y salud

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `figure.run` | Correr / cardio | 16.0 |
| `figure.strengthtraining.traditional` | Pesas / gimnasio | 16.0 |
| `dumbbell.fill` | Gimnasio / rutina | 16.0 |
| `figure.yoga` | Yoga / estiramiento | 16.0 |
| `figure.pool.swim` | Natación | 16.0 |
| `sportscourt.fill` | Cancha / deportes | 13.0 |
| `soccerball` | Fútbol | 16.0 |
| `basketball.fill` | Básquetbol | 16.0 |
| `football.fill` | Fútbol americano | 16.0 |
| `tennisball.fill` | Tenis | 16.0 |
| `baseball.fill` | Béisbol | 16.0 |
| `heart.text.square.fill` | Salud / signos vitales | 14.0 |
| `waveform.path.ecg` | Ritmo cardiaco | 13.0 |
| `cross.case.fill` | Primeros auxilios / médico | 14.0 |
| `pills.fill` | Medicinas | 14.0 |
| `bandage.fill` | Lesión / curita | 13.0 |
| `stethoscope` | Doctor / consulta | 14.0 |
| `drop.fill` | Agua / hidratación | 14.0 |
| `scalemass.fill` | Peso | 14.0 |
| `bed.double.fill` | Dormir / descanso | 13.0 |
| `brain.head.profile` | Mente / bienestar | 15.0 |
| `lungs.fill` | Respiración | 14.0 |

## Escuela, libros y trabajo

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `book.fill` | Libro | 13.0 |
| `books.vertical.fill` | Librero / biblioteca | 14.0 |
| `book.closed.fill` | Libro cerrado / leído | 14.0 |
| `text.book.closed.fill` | Libro de texto / materia | 14.0 |
| `graduationcap.fill` | Graduación / carrera | 14.0 |
| `backpack.fill` | Mochila / escuela | 16.0 |
| `pencil.and.ruler.fill` | Útiles / diseño | 16.0 |
| `highlighter` | Subrayar / estudiar | 14.0 |
| `newspaper.fill` | Noticias | 14.0 |
| `doc.text.fill` | Documento | 13.0 |
| `folder.fill` | Carpeta | 13.0 |
| `paperclip` | Adjuntar | 13.0 |
| `checklist` | Lista de pendientes | 15.0 |
| `note.text` | Nota | 14.0 |
| `lightbulb.fill` | Idea / tip | 13.0 |
| `brain` | Pensar / aprender | 15.0 |
| `studentdesk` | Salón de clases | 13.1 |

## Música, video y entretenimiento

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `music.note` | Canción | 13.0 |
| `music.note.list` | Playlist / lista de canciones | 13.0 |
| `headphones` | Escuchar / audífonos | 13.0 |
| `guitars.fill` | Instrumentos / banda | 14.0 |
| `pianokeys` | Piano / teclado musical | 14.0 |
| `film.fill` | Película | 13.0 |
| `tv.fill` | Serie / TV | 13.0 |
| `play.rectangle.fill` | Video | 13.0 |
| `gamecontroller.fill` | Videojuegos | 13.0 |
| `theatermasks.fill` | Teatro / eventos | 15.0 |
| `mic.fill` | Cantar / podcast | 13.0 |
| `radio.fill` | Radio | 14.0 |
| `play.fill` | Reproducir | 13.0 |
| `pause.fill` | Pausa | 13.0 |
| `stop.fill` | Detener | 13.0 |
| `forward.fill` | Adelantar | 13.0 |
| `backward.fill` | Regresar canción | 13.0 |
| `speaker.wave.2.fill` | Volumen | 14.0 |
| `speaker.slash.fill` | Silencio | 13.0 |
| `repeat` | Repetir | 13.0 |

## Fotos y cámara

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `camera.fill` | Tomar foto | 13.0 |
| `camera.circle.fill` | Cámara (botón redondo) | 13.0 |
| `photo` | Foto / galería | 13.0 |
| `photo.fill` | Foto (relleno) | 13.0 |
| `photo.on.rectangle` | Elegir de la galería (PhotosPicker) | 13.0 |
| `photo.stack.fill` | Varias fotos / álbum | 16.0 |
| `photo.badge.plus` | Agregar foto | 17.0 |
| `camera.viewfinder` | Escanear | 13.0 |
| `person.crop.circle.badge.plus` | Agregar foto de perfil | 13.0 |
| `video.fill` | Grabar video | 13.0 |

## Naturaleza y clima

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `sun.max.fill` | Soleado | 13.0 |
| `cloud.fill` | Nublado | 13.0 |
| `cloud.rain.fill` | Lluvia | 13.0 |
| `cloud.bolt.fill` | Tormenta | 13.0 |
| `snowflake` | Frío / nieve | 15.0 |
| `wind` | Viento | 13.0 |
| `thermometer.medium` | Temperatura | 16.0 |
| `umbrella.fill` | Llevar paraguas | 13.0 |
| `leaf.fill` | Planta / ecología | 14.0 |
| `tree.fill` | Árbol / parque | 16.1 |
| `moon.stars.fill` | Noche estrellada | 13.0 |
| `sunrise.fill` | Amanecer | 13.0 |
| `sunset.fill` | Atardecer | 13.0 |
| `rainbow` | Arcoíris | 17.0 |
| `drop.fill` | Agua / humedad | 14.0 |

## Animales y mascotas

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `pawprint.fill` | Mascotas (general) | 15.0 |
| `dog.fill` | Perro | 17.0 |
| `cat.fill` | Gato | 17.0 |
| `bird.fill` | Ave | 16.0 |
| `fish.fill` | Pez | 16.0 |
| `tortoise.fill` | Tortuga / lento | 13.0 |
| `hare.fill` | Conejo / rápido | 13.0 |
| `ant.fill` | Insecto | 13.0 |
| `ladybug.fill` | Catarina / bichos | 14.0 |
| `lizard.fill` | Reptil | 16.0 |
| `teddybear.fill` | Peluche / juguete | 16.0 |

## Tecnología

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `iphone` | Celular | 14.0 |
| `laptopcomputer` | Laptop | 14.0 |
| `desktopcomputer` | Computadora | 13.0 |
| `applewatch` | Reloj inteligente | 14.0 |
| `wifi` | Internet / wifi | 13.0 |
| `wifi.slash` | Sin internet | 13.0 |
| `antenna.radiowaves.left.and.right` | Señal / transmisión | 13.0 |
| `battery.100` | Batería | 13.0 |
| `cpu` | Procesador / hardware | 14.0 |
| `keyboard` | Teclado | 13.0 |
| `display` | Pantalla / monitor | 14.0 |
| `icloud.fill` | Nube / respaldo | 13.0 |
| `barcode` | Código de barras | 13.0 |
| `chevron.left.forwardslash.chevron.right` | Código / programación | 15.0 |
| `terminal.fill` | Terminal / consola | 14.0 |
| `server.rack` | Servidor | 14.0 |

## Hogar

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `house.fill` | Casa | 13.0 |
| `sofa.fill` | Sala | 16.0 |
| `lamp.desk.fill` | Escritorio / estudiar | 16.0 |
| `lightbulb.fill` | Luz | 13.0 |
| `fan.fill` | Ventilador | 17.0 |
| `washer.fill` | Lavadora / lavandería | 16.0 |
| `shower.fill` | Baño / regadera | 16.0 |
| `key.fill` | Llave / acceso | 14.0 |
| `door.left.hand.open` | Entrar / puerta | 16.0 |
| `powerplug.fill` | Enchufe / energía | 15.0 |

## Gráficas y datos

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `chart.bar.fill` | Barras (comparar categorías) | 13.0 |
| `chart.bar.xaxis` | Barras con eje | 14.0 |
| `chart.pie.fill` | Pastel / dona (partes de un total) | 13.0 |
| `chart.xyaxis.line` | Líneas (tendencia en el tiempo) | 15.0 |
| `chart.dots.scatter` | Puntos (relación entre 2 datos) | 16.1 |
| `chart.line.uptrend.xyaxis` | Tendencia que sube | 15.0 |
| `percent` | Porcentaje | 13.0 |
| `number` | Número / cantidad | 13.0 |
| `sum` | Total / suma | 13.0 |
| `function` | Fórmula | 13.0 |
| `tablecells` | Tabla | 14.0 |
| `list.number` | Lista numerada / ranking | 13.0 |
| `gauge.with.dots.needle.33percent` | Medidor / avance | 17.0 |

## Flechas y navegación

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `chevron.right` | Siguiente / ir al detalle | 13.0 |
| `chevron.left` | Regresar | 13.0 |
| `chevron.down` | Desplegar | 13.0 |
| `chevron.up` | Contraer | 13.0 |
| `arrow.right` | Siguiente paso | 13.0 |
| `arrow.left` | Paso anterior | 13.0 |
| `arrow.up` | Subir | 13.0 |
| `arrow.down` | Bajar | 13.0 |
| `arrow.up.right` | Abrir afuera / externo | 13.0 |
| `arrow.clockwise` | Recargar | 13.0 |
| `arrow.counterclockwise` | Restablecer | 13.0 |
| `arrow.left.arrow.right` | Intercambiar / convertir | 14.0 |
| `arrow.up.left.and.arrow.down.right` | Expandir / pantalla completa | 13.0 |
| `arrowshape.turn.up.left.fill` | Responder | 13.0 |
| `arrow.triangle.turn.up.right.diamond.fill` | Cómo llegar / indicaciones | 14.0 |

## Formas, números y letras

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `circle.fill` | Punto / indicador | 13.0 |
| `square.fill` | Cuadro | 13.0 |
| `triangle.fill` | Triángulo | 13.0 |
| `diamond.fill` | Rombo | 14.0 |
| `hexagon.fill` | Hexágono | 13.0 |
| `seal.fill` | Sello / insignia | 14.0 |
| `1.circle.fill` | Paso 1 / primer lugar | 13.0 |
| `2.circle.fill` | Paso 2 / segundo lugar | 13.0 |
| `3.circle.fill` | Paso 3 / tercer lugar | 13.0 |
| `number.circle.fill` | Número | 13.0 |
| `a.circle.fill` | Letra / opción A | 13.0 |
| `plus.square.fill` | Sumar / agregar | 13.0 |
| `minus.circle.fill` | Restar / quitar | 13.0 |
| `multiply` | Multiplicar | 13.0 |
| `divide` | Dividir | 13.0 |
| `equal` | Igual / resultado | 13.0 |
| `plusminus` | Más o menos | 13.0 |

## Ajustes y sistema

| Ícono (nombre exacto) | Úsalo para | Desde iOS |
|---|---|---|
| `gearshape.fill` | Ajustes | 14.0 |
| `slider.horizontal.3` | Preferencias | 13.0 |
| `switch.2` | Interruptores / opciones | 14.0 |
| `power` | Encender / apagar | 13.0 |
| `paintbrush.fill` | Personalizar / tema | 13.0 |
| `paintpalette.fill` | Colores / paleta | 14.0 |
| `textformat.size` | Tamaño de letra | 13.0 |
| `globe` | Idioma | 13.0 |
| `circle.lefthalf.filled` | Modo claro / oscuro | 15.0 |
| `bell.badge.fill` | Notificaciones nuevas | 14.0 |
| `lock.fill` | Contraseña / bloqueado | 13.0 |
| `lock.shield.fill` | Seguridad | 13.0 |
| `hand.raised.fill` | Privacidad | 13.0 |
| `accessibility` | Accesibilidad | 17.0 |
| `trash.fill` | Borrar datos | 13.0 |
