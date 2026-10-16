// ═══════════════════════════════════════════════════════════════
//  MiPrimeraAppView.swift  ·  02 Mi primera app
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     La app "HelloWorld" de la Clase 3, tal como la armó la
//              profesora: 2 Text + 1 TextField + 1 Button. Al presionar
//              el botón aparece "Hola <nombre>". Trae además lo demás
//              que se vio en esa clase: imagen de Assets, fondo de
//              pantalla completa, alerta y esconder el teclado.
//  ÚSALO PARA: cualquier pantalla "escribe algo → botón → resultado".
//  BUSCA:      hello world, helloworld, hola mundo, mi primera app,
//              teclea tu nombre, mensaje de bienvenida, textfield,
//              boton, button, @State, private, accion, Text, saludo,
//              alerta, teclado, FocusState, onTapGesture, Gravity
//
//  CÓMO COPIARLO:
//   1. En tu proyecto pega el struct en ContentView.swift (o crea
//      Views/MiPrimeraAppView.swift).
//   2. Cambia lo marcado con ✏️
//  NECESITA:   imagen "foto1" en Assets (en clase era "Gravity").
//
//  PASOS EN XCODE (Clase 3):
//   · Crear proyecto: File → New → Project → iOS → App → Next.
//     Product Name, Team, Organization Identifier (tec.mx),
//     Interface: SwiftUI, Language: Swift. Sin Core Data ni Tests.
//   · Archivos: TuAppApp.swift = punto de entrada (entry-point).
//     ContentView.swift = una vista (pantalla), código front y back.
//     Assets.xcassets = folder de imágenes y fotos.
//   · Vista previa: menú Editor → Canvas. Simulador: arriba, junto al
//     nombre del proyecto (ej. iPhone 17 Pro). Correr: ⌘R.
//   · Librería de Objetos: menú View → Show Library, o ⇧⌘L.
//     Arrastra el elemento a tu código o dale doble clic.
//   · Agregar una imagen: navegador del proyecto (izquierda) →
//     Assets.xcassets → arrastra y suelta la imagen.
//
//  ASÍ VIENE ContentView AL CREAR EL PROYECTO:
//       VStack {
//           Image(systemName: "globe")
//               .imageScale(.large)
//               .foregroundStyle(.tint)
//           Text("Hola Mundo")
//       }
//       .padding()
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct MiPrimeraAppView: View {

    // @State: SwiftUI necesita variables "modificables" para muchos
    // elementos (como el TextField). Apple recomienda fuertemente
    // marcarlas private, porque son locales a esta vista.
    // Se usan con tipos simples (String, Int...) y no se recomienda
    // compartirlas con otras vistas.
    @State private var username: String = ""
    @State private var mensaje = "Mensaje Final"          // ✏️ texto inicial

    @State private var showAlert = false                  // alerta: paso 1
    @FocusState private var campoEnFoco: Bool             // teclado: paso 1

    var body: some View {
        // ── 4. Fondo: OPCIÓN 1 de clase (ZStack principal) ─────────
        ZStack {
            Color.cyan.opacity(0.25)                       // ✏️ color de fondo
                .ignoresSafeArea()

            VStack(alignment: .leading) {

                // ── 1. Los elementos: 2 Text + 1 TextField + 1 Button ──
                Text("Teclea tu nombre:")                  // ✏️

                // TextField = etiqueta + variable ligada (@State).
                // Como la variable es String, se actualiza mientras escribes.
                TextField(
                    "Nombre",                              // ✏️ etiqueta (placeholder)
                    text: $username
                )
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                .focused($campoEnFoco)                     // teclado: paso 2

                // Button = etiqueta + acción. La acción es una función
                // o código entre llaves que corre al tocar el botón.
                // (En clase la etiqueta decía "Boton".)
                Button("Saludar") {                        // ✏️ etiqueta
                    saludar()
                }
                .buttonStyle(.borderedProminent)

                // ── 2. El resultado de la acción ─────────────────
                Text(mensaje)

                // ── 3. Imagen de Assets (orden de modificadores de clase) ──
                // Sin modificadores la imagen queda muy grande.
                Image("foto1")                             // ✏️ en clase: Image("Gravity")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
            .padding()
            // ── 5. Alerta: paso 2 (el modifier con isPresented) ──
            // En clase: .alert("Esta es un mensaje de alerta", isPresented: $showAlert)
            //           { Button("OK") {}  Button("Not OK") {} }
            .alert("Escribe tu nombre antes de presionar el botón", isPresented: $showAlert) {   // ✏️
                Button("OK") {}
            }
        }
        // ── 6. Teclado: se esconde al tocar cualquier parte ──────
        // Va en el Stack principal.
        .onTapGesture {
            campoEnFoco = false
        }
    }

    // La acción del botón (la puedes llamar desde las llaves del Button
    // o pasarla directo: Button("Saludar", action: saludar)).
    func saludar() {
        campoEnFoco = false                                // teclado: paso 3
        if username.isEmpty {
            showAlert.toggle()                             // alerta: paso 3
        } else {
            mensaje = "Hola \(username)"                   // ✏️ mensaje de bienvenida
        }
    }
}

#Preview {
    MiPrimeraAppView()
}
