//
//  CardMusicComponent.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 28/11/24.
//

import Foundation
import SwiftUI

struct CardMusicComponent: View {
    
    var artista: String
    var titulo: String
    var album: String
    var categoria: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("LIST OF SONGS")
                .font(.system(size: 14))
                .foregroundColor(Color.colorTextSlider)
            
            HStack {
                Text("01")
                    .foregroundColor(Color.colorTextSlider)
                
                Button(action: {
                    
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
                .padding(8)
                Text(artista)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                Spacer()
            }
            
            HStack {
                Text("02")
                    .foregroundColor(Color.colorTextSlider)
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 40, height: 40)
                        Image(ImageResource.pause)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(8)
                Text(titulo)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
            
            HStack {
                Text("03")
                    .foregroundColor(Color.colorTextSlider)
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 40, height: 40)
                        Image(ImageResource.candado)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(8)
                Text(album)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
            HStack {
                Text("04")
                    .foregroundColor(Color.colorTextSlider)
                
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 40, height: 40)
                        Image(ImageResource.candado)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(8)
                Text(categoria)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.colorBoton)
        .cornerRadius(12)
    }
}
