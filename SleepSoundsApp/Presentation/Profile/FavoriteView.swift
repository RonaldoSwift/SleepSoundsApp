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
                Text("Favorite")
            }
        }
        .navigationTitle("Favorite")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FavoriteView()
}
