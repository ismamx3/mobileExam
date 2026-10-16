// ═══════════════════════════════════════════════════════════════
//  BindingIdaYVueltaView.swift  ·  06 Múltiples pantallas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Paso de valores de IDA Y VUELTA con @Binding.
//              Esta pantalla tiene el dato (@State). La pantalla de
//              edición lo cambia (@Binding) y el cambio se ve aquí
//              al regresar, sin código extra.
//  ÚSALO PARA: editar perfil, ajustes, cualquier pantalla que MODIFICA
//              un dato de la pantalla anterior.
//  BUSCA:      binding, @Binding, ida y vuelta, regresar valor, modificar
//              dato de otra pantalla, editar, state vs binding, $,
//              fuente de verdad, observable, observer, bindable
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/BindingIdaYVueltaView.swift
//   2. Pega el archivo completo.
//   3. Cambia lo marcado con ✏️
//  NECESITA:   06_MultiplesPantallas/EditarNicknameView.swift
//
//  LOS CONCEPTOS (recapitulación de la clase 6B, para defenderlo):
//   @State   = esta vista es dueña del dato.
//   @Binding = esta vista recibe permiso para leer y modificar el dato
//              de otra vista.
//   - La vista base (@State) es la ÚNICA FUENTE DE VERDAD: ahí se
//     guarda el valor real.
//   - Con $nickname se pasa una referencia al dato (un Binding) a la
//     vista hija. La hija NO guarda el dato: solo tiene acceso para
//     leerlo y cambiarlo. Cuando lo modifica, el cambio viaja de regreso
//     y actualiza el dato en la vista base.
//   - Ideal para: valores individuales o pocos datos sencillos.
//
//  LOS 3 PASOS DE LA CLASE:
//   1. Detalle: variable de clase que 1) sea @Binding, 2) NO sea
//      privada y 3) no tenga valor inicial.
//   2. Base:    generar una variable @State private.
//   3. Base:    asignarla al llamar la vista PERO con la variable
//               @State. No olvidar el $:
//          Clase:  DetalleView(nickname: $nickname)
//          Aquí:   EditarNicknameView(nickname: $nickname, ...)
//
//  ¿Y SI LOS DATOS CRECEN? (clase 6B)
//   Para modelos más complejos Swift tiene el framework Observation
//   (@Observable en el modelo, @Bindable en la vista hija): las vistas
//   "observan" el objeto y se actualizan solas cuando cambia.
//   La profesora dijo: "No lo utilizaremos todavía". Por eso este repo
//   NO usa @Observable.
//   Tarea que dejó: investigar el patrón de diseño OBSERVER. En corto:
//   un objeto (el sujeto) avisa automáticamente a todos los que lo
//   observan cuando cambia, sin que tengan que estar preguntando.
//   @Observable aplica ese patrón: el modelo es el sujeto y las vistas
//   son los observadores.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct BindingIdaYVueltaView: View {

    // Paso 2: la vista base es dueña de los datos
    @State private var nickname: String = ""        // ✏️
    @State private var notificaciones = true        // ✏️

    var body: some View {
        NavigationStack {
            ZStack {
                Color.mint.opacity(0.12)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .font(.system(size: 80))
                        .foregroundStyle(.mint)

                    Text("Tu nickname")
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    Text(nickname.isEmpty ? "(todavía no tienes)" : nickname)
                        .font(.largeTitle)
                        .bold()

                    Text(notificaciones ? "🔔 Notificaciones activadas" : "🔕 Notificaciones apagadas")
                        .font(.title3)

                    Spacer()

                    // Paso 3: se manda CON $ para dar permiso de modificar
                    NavigationLink {
                        EditarNicknameView(nickname: $nickname, notificaciones: $notificaciones)
                    } label: {
                        Text("Editar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                }
                .padding(30)
            }
            .navigationTitle("Ida y vuelta")
        }
    }
}

#Preview {
    BindingIdaYVueltaView()
}
