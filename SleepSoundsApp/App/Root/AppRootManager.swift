//
//  AppRootManager.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: AppRoots = .splash
    
    enum AppRoots {
        case splash
        case slider
    }
}
