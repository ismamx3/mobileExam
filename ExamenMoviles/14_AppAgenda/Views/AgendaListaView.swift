// ═══════════════════════════════════════════════════════════════
//  AgendaListaView.swift  ·  14 App Agenda
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Pestaña "Agenda": la lista de eventos AGRUPADA POR DÍA
//              (una sección por día: "Hoy", "Mañana", "martes 20 de
//              octubre"…), ordenada por fecha. Se puede filtrar
//              (pendientes / todos / hechos), borrar deslizando, abrir el
//              detalle (que modifica con @Binding) y agregar en una sheet.
//  ÚSALO PARA: listas agrupadas por fecha (agenda, gastos por día,
//              historial de entrenamientos…).
//  BUSCA:      lista por dia, agrupar por fecha, secciones, section, ordenar
//              por fecha, sort, filtro segmented, borrar, swipe, agregar,
//              sheet, binding, List($lista)
//
//  CÓMO AGRUPA POR DÍA (sin nada raro):
//   1. Ordeno la lista por fecha.
//   2. Recorro los eventos con un for y saco la "clave" de su día
//      (claveDiaAgenda → "15/10/2026"). Si esa clave no está todavía en
//      mi arreglo de días, la agrego. Resultado: los días sin repetir,
//      en orden.
//   3. En el List hago una Section por cada día y adentro recorro TODOS
//      los eventos (con $ para poder editarlos), pero solo muestro los
//      que tienen la clave de ese día (un if).
//
//  CÓMO COPIARLO:
//   1. En tu proyecto: Views/ → New File → SwiftUI View.
//   2. Pega el archivo. Recibe la lista como @Binding (la MODIFICA).
//  NECESITA:   Model/EventoAgenda.swift, Utils/FechasAgenda.swift,
//              Utils/PaletaAgenda.swift, Components/EventoAgendaRow.swift,
//              Views/AgendaDetalleView.swift, Views/AgendaAgregarView.swift.
//  DE CLASE: List($lista) { $item in } + NavigationLink al detalle con
//     @Binding (Clase 10), .sheet(isPresented:) (Clase 17), Picker
//     .segmented (Clase 4).
//  ⚠️ NO VISTO EN CLASE: Section (agrupar), .sort (ordenar),
//     .swipeActions (borrar deslizando), ForEach con $ dentro de Section.
// ═══════════════════════════════════════════════════════════════

import SwiftUI

// Un día de la lista: su clave "dd/MM/yyyy" (sirve de id) y una fecha
// de ese día (para el título de la sección).
struct DiaAgenda: Identifiable {
    var id: String          // la clave del día, ej. "15/10/2026"
    var fecha: Date
}

struct AgendaListaView: View {

    // @Binding: esta pantalla MODIFICA la lista de la raíz (Clase 6B).
    @Binding var eventos: Array<EventoAgenda>

    @State private var filtro = "Pendientes"        // tag del Picker
    @State private var mostrarAgregar = false

    let paleta = PaletaAgenda()

    // ¿El evento pasa el filtro elegido en el Picker?
    func pasaFiltro(evento: EventoAgenda) -> Bool {
        if filtro == "Pendientes" {
            return !evento.completado
        } else if filtro == "Hechos" {
            return evento.completado
        }
        return true                                 // "Todos"
    }

    // Los días que tienen eventos (sin repetir y en orden de fecha)
    var dias: Array<DiaAgenda> {
        var resultado = Array<DiaAgenda>()
        let ordenados = eventos.sorted { $0.fecha < $1.fecha }     // ⚠️ sorted
        for evento in ordenados {
            if pasaFiltro(evento: evento) {
                let clave = claveDiaAgenda(fecha: evento.fecha)
                var yaEsta = false
                for dia in resultado {
                    if dia.id == clave {
                        yaEsta = true
                    }
                }
                if !yaEsta {
                    resultado.append(DiaAgenda(id: clave, fecha: evento.fecha))
                }
            }
        }
        return resultado
    }

    // Título de cada sección: "Hoy · jueves 15 de octubre"
    func tituloDia(fecha: Date) -> String {
        let fechaBonita = formatearFechaAgenda(fecha: fecha, formato: "EEEE d 'de' MMMM")
        let dias = diasEntreAgenda(desde: Date(), hasta: fecha)
        switch dias {
        case 0:
            return "Hoy · " + fechaBonita
        case 1:
            return "Mañana · " + fechaBonita
        case -1:
            return "Ayer · " + fechaBonita
        default:
            return fechaBonita
        }
    }

    // Borra por id (no por posición): así no se confunde si la lista
    // está ordenada o filtrada distinto a como se ve.
    func borrarEvento(id: Int) {
        var indiceABorrar = -1
        for indice in 0..<eventos.count {
            if eventos[indice].id == id {
                indiceABorrar = indice
            }
        }
        if indiceABorrar >= 0 {
            eventos.remove(at: indiceABorrar)
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // ── 1. Filtro (Picker segmented, Clase 4) ───────────
                Picker(selection: $filtro, label: Text("Mostrar")) {
                    Text("Pendientes").tag("Pendientes")
                    Text("Todos").tag("Todos")
                    Text("Hechos").tag("Hechos")
                }
                .pickerStyle(.segmented)
                .padding()

                // ── 2. Lista agrupada por día ───────────────────────
                if dias.isEmpty {
                    Spacer()
                    Text("No hay eventos aquí 🎉")
                        .foregroundStyle(paleta.textoSuave)
                    Spacer()
                } else {
                    List {
                        ForEach(dias) { dia in
                            Section {
                                // Recorro TODOS con $ (para el detalle con @Binding)
                                // y muestro solo los de este día.
                                ForEach($eventos) { $evento in
                                    if claveDiaAgenda(fecha: evento.fecha) == dia.id && pasaFiltro(evento: evento) {
                                        NavigationLink {
                                            AgendaDetalleView(evento: $evento)      // con $: lo modifica
                                        } label: {
                                            EventoAgendaRow(evento: evento)         // sin $: solo muestra
                                        }
                                        // ⚠️ NO VISTO EN CLASE: deslizar a la izquierda para borrar
                                        .swipeActions {
                                            Button(role: .destructive) {
                                                borrarEvento(id: evento.id)
                                            } label: {
                                                Label("Borrar", systemImage: "trash")
                                            }
                                        }
                                        .listRowBackground(paleta.superficie)
                                    }
                                }
                            } header: {
                                Text(tituloDia(fecha: dia.fecha))
                                    .foregroundStyle(paleta.primario)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)       // apaga el fondo gris del List
                }

                // ── 3. Botón para agregar (abre una sheet) ──────────
                Button {
                    mostrarAgregar = true
                } label: {
                    Label("Agregar evento", systemImage: "calendar.badge.plus")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(paleta.textoSobrePrimario)
                        .background(paleta.primario)
                        .cornerRadius(14)
                }
                .padding()
            }
            .background(paleta.fondo)
            .navigationTitle("Agenda")
            .sheet(isPresented: $mostrarAgregar) {
                AgendaAgregarView(eventos: $eventos)        // con $: hace append
            }
            // ⚠️ NO VISTO EN CLASE: sort ordena la lista REAL (sort cambia la
            // original; sorted regresa una copia). Así, dentro de cada día,
            // los eventos salen por hora.
            .onAppear {
                eventos.sort { $0.fecha < $1.fecha }
            }
        }
    }
}

#Preview {
    AgendaListaView(eventos: .constant(cargarEventosAgenda()))
}
