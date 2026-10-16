// ═══════════════════════════════════════════════════════════════
//  GymHoyView.swift  ·  17 App Gym
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Hoy": fecha de hoy en español, 3 tarjetas iguales
//              (racha, minutos y calorías de la semana), mensaje según la
//              racha (switch), tu nivel (switch con rangos), último
//              entrenamiento y un ejercicio SORPRESA al azar.
//  ÚSALO PARA: un "home" con cálculos sobre la lista: contar días seguidos,
//              sumar lo de la última semana, elegir algo al azar.
//  BUSCA:      racha, streak, dias seguidos, while, semana, ultimos 7 dias,
//              switch rangos, randomElement, al azar, sorpresa, String repeating,
//              fecha de hoy, comparar fechas, mismo dia
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/GymHoyView.swift.
//   2. Pega el archivo y cambia lo marcado con ✏️.
//   3. Desde la vista del TabView:  GymHoyView(entrenamientos: lista)  (sin $)
//  NECESITA:   Model/ (EntrenamientoGym, EjercicioGym, ModelDataGym),
//              Utils/PaletaGym.swift, Components/TarjetaGym.swift.
//  ⚠️ NO VISTO EN CLASE: ciclo while (bloque 2, racha). Es como un for que
//     se repite MIENTRAS la condición sea verdadera. Se puede defender: es
//     sintaxis básica de cualquier lenguaje. @AppStorage para el peso
//     (clase de persistencia, compartido con la pestaña Ejercicios).
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct GymHoyView: View {

    // Solo lee la lista → var sin @State ni private (se la pasa GymAppView).
    var entrenamientos: [EntrenamientoGym]

    // Misma llave que en GymEjerciciosView → comparten el valor guardado.
    @AppStorage("pesoPersonaGym") private var pesoPersona = 70.0

    // El ejercicio que salió al azar. Opcional: al inicio no hay ninguno.
    @State private var sorpresa: EjercicioGym? = nil

    let paleta = PaletaGym()

    // ── 1. ¿Hubo entrenamiento ESE día? ─────────────────────────────
    // Date guarda fecha Y hora; para saber si dos fechas son el MISMO DÍA
    // se convierten a texto "dd/MM/yyyy" y se comparan los textos.
    // (Otra forma: Calendar.current.isDate(a, inSameDayAs: b) ⚠️ no vista.)
    func huboEntrenamiento(dia: Date) -> Bool {
        let textoDia = textoFechaGym(fecha: dia, formato: "dd/MM/yyyy")
        for entrenamiento in entrenamientos {
            if textoFechaGym(fecha: entrenamiento.fecha, formato: "dd/MM/yyyy") == textoDia {
                return true
            }
        }
        return false
    }

    // ── 2. Racha: días SEGUIDOS entrenando (hacia atrás desde hoy) ──
    var rachaDias: Int {
        var racha = 0
        var diasAtras = 0
        // Si hoy todavía no entrenas, la racha se cuenta desde ayer.
        if !huboEntrenamiento(dia: Date()) {
            diasAtras = 1
        }
        // ⚠️ while: se repite MIENTRAS haya entrenamiento ese día.
        while huboEntrenamiento(dia: fechaHaceDiasGym(dias: diasAtras)) {
            racha += 1
            diasAtras += 1
        }
        return racha
    }

    // ── 3. ¿La fecha cae en los últimos 7 días? ─────────────────────
    func esDeEstaSemana(fecha: Date) -> Bool {
        let textoFecha = textoFechaGym(fecha: fecha, formato: "dd/MM/yyyy")
        for dias in 0...6 {
            if textoFechaGym(fecha: fechaHaceDiasGym(dias: dias), formato: "dd/MM/yyyy") == textoFecha {
                return true
            }
        }
        return false
    }

    var minutosSemana: Int {
        var suma = 0
        for entrenamiento in entrenamientos {
            if esDeEstaSemana(fecha: entrenamiento.fecha) {
                suma += entrenamiento.minutos
            }
        }
        return suma
    }

    var caloriasSemana: Double {
        var suma = 0.0
        for entrenamiento in entrenamientos {
            if esDeEstaSemana(fecha: entrenamiento.fecha) {
                suma += entrenamiento.calorias
            }
        }
        return suma
    }

    // ── 4. Mensaje según la racha (switch con rangos) ───────────────
    var mensajeRacha: String {
        switch rachaDias {
        case 0:
            return "Hoy es un gran día para empezar tu racha."           // ✏️
        case 1...2:
            return "¡Buen comienzo! No rompas la cadena."
        case 3...6:
            return "¡Vas muy bien! Ya es un hábito."
        default:
            return "¡Imparable! Más de una semana seguida."
        }
    }

    // ── 5. Nivel según las calorías de la semana ───────────────────
    var nivel: String {
        switch Int(caloriasSemana) {
        case 0..<500:
            return "Principiante"
        case 500..<1500:
            return "Constante"
        case 1500..<3000:
            return "Atleta"
        default:
            return "Leyenda"
        }
    }

    // ── 6. El entrenamiento más reciente (buscar el mayor con for) ──
    // Las fechas se comparan con  >  igual que los números.
    var ultimo: EntrenamientoGym? {
        var masReciente: EntrenamientoGym? = nil
        for entrenamiento in entrenamientos {
            if let actual = masReciente {
                if entrenamiento.fecha > actual.fecha {
                    masReciente = entrenamiento
                }
            } else {
                masReciente = entrenamiento
            }
        }
        return masReciente
    }

    var body: some View {
        NavigationStack {
            ZStack {
                paleta.fondo
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        // ── 7. Fecha de hoy en español ─────────────
                        VStack(alignment: .leading, spacing: 4) {
                            Text(textoFechaGym(fecha: Date(), formato: "EEEE d 'de' MMMM"))         // "jueves 15 de octubre"
                                .font(.headline)
                                .foregroundStyle(paleta.textoSuave)
                            Text("¡A entrenar!")                                       // ✏️
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(paleta.texto)
                        }

                        // ── 8. 3 tarjetas iguales (componente) ─────
                        HStack(spacing: 12) {
                            TarjetaGym(valor: "\(rachaDias)", etiqueta: "Días seguidos", icono: "flame.fill")
                            TarjetaGym(valor: "\(minutosSemana)", etiqueta: "Minutos (7 días)", icono: "timer")
                            TarjetaGym(valor: "\(Int(caloriasSemana))", etiqueta: "Calorías (7 días)", icono: "bolt.fill")
                        }

                        // ── 9. Racha y nivel ───────────────────────
                        VStack(alignment: .leading, spacing: 8) {
                            // String(repeating:count:) repite un texto n veces.
                            // min(…, 7) para que no salgan 30 fueguitos.
                            Text(rachaDias > 0 ? String(repeating: "🔥", count: min(rachaDias, 7)) : "💤")
                                .font(.title)
                            Text(mensajeRacha)
                                .font(.headline)
                                .foregroundStyle(paleta.texto)
                            Text("Tu nivel esta semana: \(nivel)")
                                .foregroundStyle(paleta.primario)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(paleta.superficie)
                        .cornerRadius(16)

                        // ── 10. Último entrenamiento (opcional → if let) ─
                        if let ultimoEntrenamiento = ultimo {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Último entrenamiento")
                                    .font(.caption)
                                    .foregroundStyle(paleta.textoSuave)
                                Text(ultimoEntrenamiento.ejercicio)
                                    .font(.headline)
                                    .foregroundStyle(paleta.texto)
                                Text("\(ultimoEntrenamiento.fechaTexto) · \(ultimoEntrenamiento.minutos) min · \(ultimoEntrenamiento.calorias, specifier: "%.0f") kcal")
                                    .foregroundStyle(paleta.textoSuave)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(paleta.superficie)
                            .cornerRadius(16)
                        }

                        // ── 11. Ejercicio sorpresa (randomElement) ──
                        Button {
                            // randomElement() regresa OPCIONAL (la lista podría
                            // estar vacía) → if let.
                            if let ejercicio = cargarEjerciciosGym().randomElement() {
                                sorpresa = ejercicio
                            }
                        } label: {
                            Label("Ejercicio sorpresa", systemImage: "dice.fill")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundStyle(paleta.textoSobrePrimario)
                                .background(paleta.primario)
                                .cornerRadius(14)
                        }

                        if let ejercicio = sorpresa {
                            HStack(alignment: .top, spacing: 14) {
                                Image(systemName: ejercicio.icono)
                                    .font(.largeTitle)
                                    .foregroundStyle(paleta.primario)
                                    .frame(width: 56)
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(ejercicio.nombre)
                                        .font(.title3)
                                        .bold()
                                        .foregroundStyle(paleta.texto)
                                    Text("\(ejercicio.tipo) · \(ejercicio.grupoMuscular)")
                                        .foregroundStyle(paleta.primario)
                                    Text(ejercicio.descripcionRutina())
                                        .foregroundStyle(paleta.textoSuave)
                                    // Mismo método del protocolo, la clase decide la fórmula.
                                    Text("30 min ≈ \(ejercicio.caloriasQuemadas(minutos: 30, pesoPersona: pesoPersona), specifier: "%.0f") kcal")
                                        .bold()
                                        .foregroundStyle(paleta.secundario)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(paleta.superficie)
                            .cornerRadius(16)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Hoy")
        }
    }
}

#Preview {
    GymHoyView(entrenamientos: cargarEntrenamientosEjemploGym())
        .preferredColorScheme(.dark)
}
