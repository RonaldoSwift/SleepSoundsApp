//
//  SplashView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        ZStack {
            Color.colorFondo.edgesIgnoringSafeArea(.all)
            VStack {
                Image(ImageResource.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 104,height: 126)
                Text("Sleep Sounds")
                    .font(.custom("SF-Pro-Rounded-Bold", size: 25))
                    .foregroundColor(Color.white)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.spring) {
                    appRootManager.currentRoot = .slider
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
