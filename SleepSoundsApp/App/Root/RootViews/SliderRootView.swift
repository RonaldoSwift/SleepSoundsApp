//
//  SliderRootView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import SwiftUI

struct SliderRootView: View {
    
    @EnvironmentObject var appRootManager: AppRootManager
    
    var body: some View {
        NavigationView {
            SliderView(
                onClickStart: {
                    appRootManager.currentRoot = .menu
                }, onClickLoginApple: {
                    appRootManager.currentRoot = .menu
                }
            )
        }
    }
}

#Preview {
    SliderRootView()
}
