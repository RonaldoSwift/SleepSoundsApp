//
//  MoodYDreamsComponent.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 27/11/24.
//

import Foundation
import SwiftUI

struct MoodYDreamsComponent: View {
    
    var imagen: ImageResource
    var titulo: String
    var mood: String
    
    var body: some View {
        VStack{
            Image(imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
            Text(titulo)
            Text(mood)
                .font(.title)
                .bold()
        }
        .foregroundColor(Color.white)
    }
}
