//
//  View+Extension.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import Foundation
import SwiftUI

extension View {
    
    func navigation(_ view: any View, _ isActive: Binding<Bool>) -> some View {
        modifier(
            NavigationModifier(destinationView: AnyView(view), isActive: isActive)
        )
    }
    
}
