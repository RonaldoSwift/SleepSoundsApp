//
//  DetalleDePaqueteViewiOS16.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 27/11/24.
//

import Foundation
import SwiftUI

@available(iOS 15.0, *)
struct DetalleDePaqueteViewiOS15: View {
    
    var body: some View {
        ZStack {
            Image(ImageResource.fondoDetalle)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack(spacing: 20) {
                MoodYDreamsComponent(
                    imagen: ImageResource.moodDetalle,
                    titulo: "Mood",
                    mood: "Lighthearted")
                MoodYDreamsComponent(
                    imagen: ImageResource.dreamsDetalle,
                    titulo: "Dreams",
                    mood: "Daydreams")
            }
            .offset(y: -80)
        }
    }
}
