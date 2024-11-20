//
//  SliderRootView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import SwiftUI

struct SliderRootView: View {
    
    @State var isActiveButtonStart: Bool = false
    @State var isActiveLoginApple: Bool = false
    
    var body: some View {
        NavigationView {
            SliderView(
                onClickStart: {
                    isActiveButtonStart = true
                }, onClickLoginApple: {
                    isActiveLoginApple = true
                }
            )
            .navigation(DiscoverView(),$isActiveButtonStart)
            .navigation(DiscoverView(),$isActiveLoginApple)
        }
    }
}

#Preview {
    SliderRootView()
}
