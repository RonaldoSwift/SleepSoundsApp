//
//  DetalleDePaqueteView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import SwiftUI

struct DetalleDePaqueteView: View {
    var body: some View {
        ZStack {
            Image(ImageResource.fondoDetalle)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("DetalleDePaqueteView")
            }
        }
    }
}

#Preview {
    DetalleDePaqueteView()
}
