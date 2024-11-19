//
//  SleepSoundsAppApp.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 18/11/24.
//

import SwiftUI

@main
struct SleepSoundsAppApp: App {
    
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    SplashRootView()
                case .slider:
                    SliderRootView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
