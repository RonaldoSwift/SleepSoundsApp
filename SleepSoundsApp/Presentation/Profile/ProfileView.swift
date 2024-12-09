//
//  ProfileView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    var onClickEnFavorite: () -> Void
    
    var body: some View {
        ZStack {
            Color(ColorResource.colorFondo)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                // Tarjeta
                VStack {
                    Image(ImageResource.authorization)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 85)
                    Text("Authorization")
                        .font(.system(size: 23))
                        .foregroundColor(Color.white)
                    Text("In order to access the library of favorite packs   of sounds, log in with Apple ID")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color.colorTextSlider)
                        .padding(.bottom)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Login with Apple ID")
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.colorFondo)
                        .cornerRadius(30)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.colorBoton)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .padding(.horizontal)
                Spacer()
                
                ScrollView {
                    
                    ButtonComponente(
                        clickInButton: {},
                        imagen: ImageResource.primiun,
                        texto: "Get premium",
                        colorForeground: Color.colorNaranjaStart
                    )
                    
                    ButtonComponente(
                        clickInButton: {
                            onClickEnFavorite()
                        },
                        imagen: ImageResource.favorite,
                        texto: "Favorite",
                        colorForeground: Color.white
                    )
                    VStack(spacing: 0) {
                        ButtonComponente(
                            clickInButton: {},
                            imagen: ImageResource.private,
                            texto: "Private policy",
                            colorForeground: Color.white
                        )
                        ButtonComponente(
                            clickInButton: {},
                            imagen: ImageResource.licence,
                            texto: "License agreement",
                            colorForeground: Color.white
                        )
                    }
                    .padding(.top,20)
                    
                    VStack(spacing: 0) {
                        ButtonComponente(
                            clickInButton: {},
                            imagen: ImageResource.rate,
                            texto: "Rate us",
                            colorForeground: Color.white
                        )
                        ButtonComponente(
                            clickInButton: {},
                            imagen: ImageResource.send,
                            texto: "Get premium",
                            colorForeground: Color.white
                        )
                    }
                    .padding(.top,20)
                }
                
            }
            .padding(.top)
        }
    }
}

#Preview {
    ProfileView(onClickEnFavorite: {})
}
