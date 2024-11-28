//
//  ButonCapsulePlayAndStartComponent.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 28/11/24.
//

import Foundation
import SwiftUI

struct ButonCapsulePlayAndStartComponent: View {
    
    @State private var botonseleccionado: Bool = false
    @State private var isPlaySelected: Bool = false
    
    var body: some View {
        HStack(spacing: 16) {
            Button {
                isPlaySelected.toggle()
            } label: {
                ZStack {
                    Capsule()
                        .fill(isPlaySelected ? Color.colorNaranjaStart : Color.colorPushButton)
                        .frame(minHeight: 40)
                    HStack(spacing: 8) {
                        Image(systemName: isPlaySelected ? "lock.open" : "play.fill")
                            .foregroundColor(isPlaySelected ? .white : .white)
                            .foregroundColor(isPlaySelected ? .black : .white)
                            .font(.body)
                        Text(isPlaySelected ? "Unlock" : "Play")
                            .foregroundColor(isPlaySelected ? .white : .white)
                            .foregroundColor(isPlaySelected ? .black : .white)
                            .font(.body)
                    }
                    .padding(.vertical, 8)
                }
                .frame(maxWidth: .infinity)
            }
            
            Button {
                botonseleccionado.toggle()
            } label: {
                ZStack {
                    Capsule()
                        .fill(botonseleccionado ? Color.colorNaranjaStart : Color.colorBoton)
                        .frame(minHeight: 40)
                    HStack(spacing: 8) {
                        Image(ImageResource.startIcon)
                            .renderingMode(.template)
                            .foregroundColor(botonseleccionado ? .white : Color.colorNaranjaStart)
                        Text("Unifavorite")
                            .foregroundColor(botonseleccionado ? .white : Color.colorNaranjaStart)
                            .font(.body)
                    }
                    .padding(.vertical, 8)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}
