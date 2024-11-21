//
//  MusicaCardComponente.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct MusicaCardComponente: View {
    
    var onClickInCardMusica: () -> Void
    var onClickInPlay: () -> Void
    var arrayDeMusicas: [Musica]
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 50) {
            ForEach(arrayDeMusicas, id: \.id) { musica in
                Button {
                    onClickInCardMusica()
                } label: {
                    ZStack {
                        VStack(alignment: .leading, spacing: 8) {
                            WebImage(url: URL(string: musica.imagen))
                                .cornerRadius(10)
                                .overlay(
                                    Button(action: {
                                        onClickInPlay()
                                    }) {
                                        ZStack {
                                            Circle()
                                                .fill(Color.black.opacity(0.5))
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "play.fill")
                                                .foregroundColor(.white)
                                                .frame(width: 24, height: 24)
                                        }
                                    }
                                        .padding(8),
                                    alignment: .topLeading
                                )
                            Text(musica.nombre)
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .lineLimit(1)
                            HStack {
                                Text("\(musica.songs) songs")
                                Text(". \(musica.instrumental)")
                            }
                            .font(.subheadline)
                            .foregroundColor(Color.colorTextSlider)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.leading,20)
    }
}
