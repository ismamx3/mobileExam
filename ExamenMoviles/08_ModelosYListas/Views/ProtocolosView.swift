// ═══════════════════════════════════════════════════════════════
//  ProtocolosView.swift  ·  08 Modelos y listas
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pantalla que usa el protocolo Personaje y sus 3 clases (batalla).
//  ÚSALO PARA: demostrar que varias clases cumplen un protocolo con lógica distinta.
//  BUSCA:      protocolo, protocol, clases, class, batalla, atacar, curar, switch, ProgressView vida
//
//  CÓMO COPIARLO:
//   1. En tu proyecto crea Views/ProtocolosView.swift.
//   2. Pega el archivo completo (trae 2 structs: la pantalla y la tarjeta).
//   3. Cambia lo marcado con ✏️
//  NECESITA:   08_ModelosYListas/Model/Personaje.swift (protocolo + Guerrero, Mago, Arquero)
// ═══════════════════════════════════════════════════════════════

import SwiftUI

struct ProtocolosView: View {

    // Las clases se guardan en @State para que NO se vuelvan a crear
    // cada vez que SwiftUI redibuja la pantalla.
    @State private var guerrero = Guerrero()
    @State private var mago = Mago()
    @State private var arquero = Arquero()

    @State private var atacante = "Guerrero"
    @State private var objetivo = "Mago"
    @State private var mensaje = "Elige quién ataca y a quién."

    // OJO: una CLASE no avisa a SwiftUI cuando cambian sus propiedades.
    // Por eso cada acción también suma 1 a `turno` (un Int en @State):
    // ese cambio sí hace que la pantalla se redibuje y lea la vida nueva.
    @State private var turno = 0

    // Regresa la clase según el texto elegido en el Picker.
    // El tipo de regreso es el PROTOCOLO: sirve para cualquiera de las 3.
    func buscarPersonaje(_ tipo: String) -> Personaje {
        switch tipo {
        case "Mago":
            return mago
        case "Arquero":
            return arquero
        default:
            return guerrero
        }
    }

    func atacar() {
        turno += 1
        let personaje1 = buscarPersonaje(atacante)
        let personaje2 = buscarPersonaje(objetivo)

        if atacante == objetivo {
            mensaje = "Turno \(turno): nadie se puede atacar a sí mismo."
        } else if personaje1.vida == 0 {
            mensaje = "Turno \(turno): \(personaje1.nombre) ya no puede pelear."
        } else {
            // Mismo método, distinto resultado según la clase.
            let dano = personaje1.atacar()
            if dano == 0 {
                mensaje = "Turno \(turno): \(personaje1.nombre) se quedó sin energía y descansa."
            } else {
                personaje2.recibirAtaque(dano)
                mensaje = "Turno \(turno): \(personaje1.nombre) atacó a \(personaje2.nombre) con \(dano) de daño."
            }
        }
    }

    func curar() {
        turno += 1
        let personaje = buscarPersonaje(objetivo)
        personaje.curar()
        mensaje = "Turno \(turno): \(personaje.nombre) se curó."
    }

    func reiniciar() {
        guerrero = Guerrero()
        mago = Mago()
        arquero = Arquero()
        turno = 0
        mensaje = "Batalla reiniciada."
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ── 1. Una tarjeta por clase ─────────────────────────
                // Se le pasan VALORES (no la clase) para que se redibuje bien.
                PersonajeTarjetaView(nombre: guerrero.nombre, icono: guerrero.icono,
                                     vida: guerrero.vida, vidaMaxima: 100,
                                     energia: guerrero.energia, descripcion: guerrero.describir())
                PersonajeTarjetaView(nombre: mago.nombre, icono: mago.icono,
                                     vida: mago.vida, vidaMaxima: 80,
                                     energia: mago.energia, descripcion: mago.describir())
                PersonajeTarjetaView(nombre: arquero.nombre, icono: arquero.icono,
                                     vida: arquero.vida, vidaMaxima: 90,
                                     energia: arquero.energia, descripcion: arquero.describir())

                // ── 2. Elegir atacante y objetivo ────────────────────
                Text("Ataca")
                    .font(.headline)
                Picker(selection: $atacante, label: Text("Ataca")) {
                    Text("Guerrero").tag("Guerrero")
                    Text("Mago").tag("Mago")
                    Text("Arquero").tag("Arquero")
                }
                .pickerStyle(.segmented)

                Text("Objetivo")
                    .font(.headline)
                Picker(selection: $objetivo, label: Text("Objetivo")) {
                    Text("Guerrero").tag("Guerrero")
                    Text("Mago").tag("Mago")
                    Text("Arquero").tag("Arquero")
                }
                .pickerStyle(.segmented)

                // ── 3. Botones que llaman métodos del protocolo ──────
                HStack(spacing: 12) {
                    Button {
                        atacar()
                    } label: {
                        Label("Atacar", systemImage: "bolt.fill")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)

                    Button {
                        curar()
                    } label: {
                        Label("Curar", systemImage: "cross.case.fill")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }

                Text(mensaje)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.purple.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Button("Reiniciar batalla") {
                    reiniciar()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .navigationTitle("Protocolos")                         // ✏️
    }
}

// ── Componente: tarjeta con los datos de un personaje ──────────────
// Recibe valores simples (String, Int), por eso no lleva @State.
struct PersonajeTarjetaView: View {
    var nombre: String
    var icono: String
    var vida: Int
    var vidaMaxima: Int
    var energia: Int
    var descripcion: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icono)
                .font(.system(size: 30))
                .foregroundStyle(.purple)
                .frame(width: 44)

            VStack(alignment: .leading, spacing: 6) {
                Text(nombre)
                    .font(.headline)
                Text(descripcion)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                // ProgressView: barra de avance (de la clase de gráficas).
                ProgressView(value: Double(vida), total: Double(vidaMaxima))
                    .tint(vida > vidaMaxima / 3 ? .green : .red)
                Text("Vida: \(vida)/\(vidaMaxima)  ·  Energía: \(energia)")
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        ProtocolosView()
    }
}
