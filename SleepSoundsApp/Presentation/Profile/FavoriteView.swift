//
//  FavoriteView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 9/12/24.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        ZStack {
            Color(ColorResource.colorFondo)
                .ignoresSafeArea()
            VStack {
                Image(ImageResource.favorit)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 85, height: 85)
                Text("Favorite is Empty")
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                Text("Your favorite packs will be stored here")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .foregroundColor(Color.colorTextSlider)
                    .padding(.bottom)
            }
        }
        .navigationTitle("Favorite")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FavoriteView()
}
