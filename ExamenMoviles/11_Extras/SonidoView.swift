// ═══════════════════════════════════════════════════════════════
//  SonidoView.swift  ·  11 Extras (sonido)
// ───────────────────────────────────────────────────────────────
//  QUÉ ES:     Reproducir un .mp3 que viene dentro de la app con
//              AVAudioPlayer: Play, Pausa, Stop, volumen y silencio.
//              (Igual que la práctica ejemploMusica.)
//  ÚSALO PARA: música de fondo, efecto de sonido al presionar algo.
//  BUSCA:      sonido, musica, audio, mp3, AVAudioPlayer, AVFoundation,
//              play, stop, pausa, volumen, mute, sound, music
//
//  CÓMO COPIARLO:
//   1. Arrastra tu .mp3 al navegador del proyecto (en Xcode).
//      Marca "Copy items if needed" y que el TARGET de tu app esté
//      palomeado (si no, Bundle.main no lo encuentra).
//      El de este repo está en 11_Extras/Sonidos/MarioBros.mp3
//   2. En tu proyecto crea Views/SonidoView.swift y pega el archivo.
//   3. Cambia el nombre del archivo marcado con ✏️
//      (forResource = nombre SIN extensión, withExtension = "mp3").
//  NECESITA:   el .mp3 dentro del proyecto. import AVFoundation (ya viene).
//  ⚠️ NO VISTO EN CLASE: .onDisappear (para apagar la música al salir)
// ═══════════════════════════════════════════════════════════════

import SwiftUI
import AVFoundation             // AVAudioPlayer vive aquí

struct SonidoView: View {

    // El reproductor. Es opcional: nil hasta que se carga el archivo.
    @State private var audioPlayer: AVAudioPlayer?

    @State private var volumen: Float = 0.5      // AVAudioPlayer usa Float (0 a 1)
    @State private var silencio = false
    @State private var mensaje = ""

    var body: some View {
        ZStack {
            Color.red.opacity(0.08)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {

                    Image(systemName: "music.note")
                        .font(.system(size: 80))
                        .foregroundStyle(.red)

                    Text("Música de fondo")                                   // ✏️ tu texto
                        .font(.title)
                        .bold()

                    // ── 1. Botones Play / Pausa / Stop ────────────
                    HStack(spacing: 12) {
                        Button {
                            audioPlayer?.play()
                        } label: {
                            Label("Play", systemImage: "play.fill")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)

                        Button {
                            audioPlayer?.pause()
                        } label: {
                            Label("Pausa", systemImage: "pause.fill")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)

                        Button {
                            audioPlayer?.stop()
                            audioPlayer?.currentTime = 0      // regresa al inicio
                        } label: {
                            Label("Stop", systemImage: "stop.fill")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                    .controlSize(.large)
                    .tint(.red)

                    // ── 2. Volumen con Slider ─────────────────────
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Volumen: \(Int(volumen * 100))%")
                            .font(.headline)
                        HStack {
                            Image(systemName: "speaker.fill")
                            Slider(value: $volumen, in: 0 ... 1)
                                .tint(.red)
                            Image(systemName: "speaker.wave.3.fill")
                        }
                    }

                    // ── 3. Silencio con Toggle ────────────────────
                    Toggle("Silencio", isOn: $silencio)
                        .font(.headline)
                        .tint(.red)

                    if !mensaje.isEmpty {
                        Text(mensaje)
                            .foregroundStyle(.red)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            prepararAudio()
        }
        .onDisappear {
            audioPlayer?.stop()        // ⚠️ NO VISTO EN CLASE: apaga la música al salir de la pantalla
        }
        // Cada vez que cambia el volumen o el silencio, se actualiza el reproductor
        .onChange(of: volumen) { oldValue, newValue in
            actualizarVolumen()
        }
        .onChange(of: silencio) { oldValue, newValue in
            actualizarVolumen()
        }
        .navigationTitle("Sonido")
    }

    // Carga el .mp3 que viene dentro de la app
    func prepararAudio() {
        // Para que suene aunque el iPhone esté en modo silencio
        try? AVAudioSession.sharedInstance().setCategory(.playback)

        // Busca el archivo en la app. Regresa opcional → if let
        if let sonido = Bundle.main.url(forResource: "MarioBros", withExtension: "mp3") {   // ✏️ nombre del archivo
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sonido)
                audioPlayer?.numberOfLoops = -1     // -1 = se repite para siempre (0 = una vez)
                audioPlayer?.volume = volumen
                audioPlayer?.prepareToPlay()
            } catch {
                mensaje = "Error al cargar el audio"
                print("Error al cargar audio: \(error)")
            }
        } else {
            mensaje = "No se encontró el archivo de audio"
        }
    }

    func actualizarVolumen() {
        audioPlayer?.volume = silencio ? 0 : volumen
    }
}

#Preview {
    NavigationStack {
        SonidoView()
    }
}
