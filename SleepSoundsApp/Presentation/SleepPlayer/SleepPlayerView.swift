//
//  SleepPlayerView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 28/11/24.
//

import SwiftUI
import AVFoundation

struct SleepPlayerView: View {
    
    @ObservedObject var sleepPlayerViewModel: SleepPlayerViewModel
    
    @State private var currentPlayerTime: Double = 0.0
    @State private var isButtonPlayed: Bool = false
    
    @EnvironmentObject var sharedMusicViewModel: SharedMusicViewModel

    
    init(musicMediaplayer: MusicMediaPlayer) {
        sleepPlayerViewModel = .init(musicMediaPlayer: musicMediaplayer)
        
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.configureWithTransparentBackground()
        navBarAppearence.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.red,
        ]
        navBarAppearence.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.blue,
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
        UINavigationBar.appearance().standardAppearance = navBarAppearence
        UINavigationBar.appearance().tintColor = .green
    }
    
    var body: some View {
        ZStack {
            Color(ColorResource.colorFondo)
                .ignoresSafeArea()
            
            VStack {
                Image(ImageResource.musicIm)
                    .padding(.bottom,30)
                Text("Guitar Camp")
                    .font(.system(size: 20))
                    .foregroundColor(Color.colorTextSlider)
                    .padding(.bottom,5)
                Text("Ronaldo")
                    .bold()
                    .font(.system(size: 35))
                    .foregroundColor(Color.white)
                    .padding(.bottom,80)
                
                Slider(value: $sleepPlayerViewModel.progressValue) { didChange in
                    sleepPlayerViewModel.didSliderChanged(didChange)
                }
                .padding(.bottom,30)

                HStack(spacing: 15) {
                    Button(action: {}, label: {
                        Image(systemName: "backward.fill")
                            .font(.system(size: 25))
                    })
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)

                    Button(action: {
                        isButtonPlayed.toggle()
                        if isButtonPlayed {
                            sleepPlayerViewModel.musicMediaPlayer.play()
                        } else {
                            sleepPlayerViewModel.musicMediaPlayer.pause()
                        }
                    }, label: {
                        if isButtonPlayed {
                            Image(systemName: "pause.fill")
                                .font(.system(size: 35))
                        } else {
                            Image(systemName: "play.fill")
                                .font(.system(size: 35))
                        }
                    })
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)

                    Button(action: {}, label: {
                        Image(systemName: "forward.fill")
                            .font(.system(size: 25))
                    })
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                }
            }
            .padding()
        }
    }
}

#Preview {
    SleepPlayerView(musicMediaplayer: MusicMediaPlayer(musica: Musica(id: 0, artista: "", titulo: "", album: "", urlDeMusica: "", bloqueado: false)))
}
