//
//  MenuView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            DiscoverView(
                onClickEnCardMusic: {},
                onClickEnButtonPlay: {}
            )
                .tabItem{
                    Image(systemName: "moon.stars")
                    Text("Discover")
                }
        }
    }
}

#Preview {
    MenuView()
}
