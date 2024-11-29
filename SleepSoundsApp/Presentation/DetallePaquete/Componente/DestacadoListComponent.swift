//
//  DestacadoListComponent.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 28/11/24.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct DestacadoListComponent: View {
    
    var arrayDestacado: [Destacado]
    
    var body: some View {
        HStack {
            ForEach(arrayDestacado, id: \.id) { destacado in
                Button {
                    
                } label: {
                    ZStack {
                        VStack(alignment: .leading, spacing: 8) {
                            WebImage(url: URL(string: destacado.imagen))
                                .cornerRadius(10)
                                .overlay(
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
                                        .padding(8), alignment: .topLeading
                                )
                            Text(destacado.nombre)
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .lineLimit(1)
                            HStack {
                                Text("\(destacado.cantidadDeMusica) Songs")
                                Text(". \(destacado.nombreDeCategoria)")
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
        .padding(.leading,10)
    }
}
