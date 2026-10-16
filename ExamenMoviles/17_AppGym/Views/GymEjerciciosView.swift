// ═══════════════════════════════════════════════════════════════
//  GymEjerciciosView.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Ejercicios": muestra el catálogo, que es una
//              lista del tipo del PROTOCOLO con las 3 CLASES mezcladas
//              (CardioGym, FuerzaGym, FlexibilidadGym). Con dos Slider
//              (tu peso y minutos) cada tarjeta calcula sus calorías con
//              SU fórmula. El botón "Lo hice" cambia una propiedad
//              { get set } de la clase.
//  ÚSALO PARA: demostrar protocolos y clases en pantalla (Clase 8):
//              "mismo método, distinto resultado según la clase".
//  BUSCA:      protocolo, protocol, clases, class, polimorfismo, conformar,
//              get set, metodo del protocolo, Slider, AppStorage, redibujar clase
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GymEjerciciosView.swift.
//   2. Pega el archivo. Cambia lo marcado con ✏️.
//  NECESITA:   Model/EjercicioGym.swift, Model/ModelDataGym.swift,
//              Utils/PaletaGym.swift.
//  ⚠️ NO VISTO EN CLASE: ForEach con índices (bloque 3): recorre la lista
//     por posición (0, 1, 2…) porque las clases del protocolo no son
//     Identifiable. @AppStorage es de la clase de persistencia.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GymEjerciciosView: View {

    // Las CLASES se guardan en @State para que NO se vuelvan a crear cada
    // vez que SwiftUI redibuja (si no, vecesRealizado regresaría a 0).
    @State private var catalogo = cargarEjerciciosGym()

    // OJO: una CLASE no le avisa a SwiftUI cuando cambia una propiedad
    // suya. Por eso, al tocar "Lo hice", también se suma 1 a este @State:
    // ese cambio SÍ hace que la pantalla se redibuje y lea el número nuevo.
    @State private var toques = 0

    // Se guarda y se comparte con Hoy y Registrar (misma llave).
    @AppStorage("pesoPersonaGym") private var pesoPersona = 70.0
    @State private var minutosPrueba = 30.0

    let paleta = PaletaGym()

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {

                        // ── 1. Qué es esta pantalla ────────────────
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Un protocolo, 3 clases")
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text("Todos cumplen el protocolo EjercicioGym: tienen nombre, ícono y el método caloriasQuemadas. Pero cada CLASE lo calcula a su manera: Cardio usa tu peso y la intensidad, Fuerza solo cuenta el 70% del tiempo y Flexibilidad da lo mismo por minuto.")
                                .font(.subheadline)
                                .foregroundStyle(paleta.textoSuave)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 2. Datos para el cálculo (Slider de clase) ──
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Tu peso: \(Int(pesoPersona)) kg")
                                .foregroundStyle(paleta.texto)
                            Slider(value: $pesoPersona, in: 40 ... 150)
                                .tint(paleta.primario)
                            Text("Minutos: \(Int(minutosPrueba))")
                                .foregroundStyle(paleta.texto)
                            Slider(value: $minutosPrueba, in: 5 ... 90)
                                .tint(paleta.primario)
                            Text("Hoy marcaste \(toques) ejercicio(s) como hechos.")
                                .font(.caption)
                                .foregroundStyle(paleta.textoSuave)
                        }
                        .padding()
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 3. El catálogo: cada tarjeta es una CLASE distinta ──
                        ForEach(catalogo.indices, id: \.self) { indice in
                            let ejercicio = catalogo[indice]
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(spacing: 12) {
                                    Image(systemName: ejercicio.icono)
                                        .font(.title2)
                                        .foregroundStyle(paleta.textoSobrePrimario)
                                        .frame(width: 48, height: 48)
                                        .background(paleta.primario)
                                        .clipShape(.circle)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(ejercicio.nombre)
                                            .font(.headline)
                                            .foregroundStyle(paleta.texto)
                                        Text("Clase: \(ejercicio.tipo) · \(ejercicio.grupoMuscular)")
                                            .font(.caption)
                                            .foregroundStyle(paleta.primario)
                                    }
                                    Spacer()
                                    // MISMO método para las 3 clases; cada una usa su fórmula.
                                    Text("\(ejercicio.caloriasQuemadas(minutos: Int(minutosPrueba), pesoPersona: pesoPersona), specifier: "%.0f") kcal")
                                        .font(.headline)
                                        .foregroundStyle(paleta.secundario)
                                }

                                Text(ejercicio.descripcionRutina())
                                    .font(.subheadline)
                                    .foregroundStyle(paleta.textoSuave)

                                HStack {
                                    Text("Lo has hecho \(ejercicio.vecesRealizado) \(ejercicio.vecesRealizado == 1 ? "vez" : "veces")")
                                        .font(.caption)
                                        .foregroundStyle(paleta.textoSuave)
                                    Spacer()
                                    Button {
                                        // registrarVez() cambia vecesRealizado ({ get set })
                                        // dentro de la clase…
                                        ejercicio.registrarVez()
                                        // …y esto avisa a SwiftUI que redibuje.
                                        toques += 1
                                    } label: {
                                        Label("Lo hice", systemImage: "checkmark.circle.fill")
                                            .font(.subheadline)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .foregroundStyle(paleta.textoSobrePrimario)
                                            .background(paleta.primario)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .padding()
                            .background(paleta.superficie)
                            .cornerRadius(16)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Ejercicios")
        }
    }
}

#Preview {
    GymEjerciciosView()
        .preferredColorScheme(.dark)
}
