//
//  NavigationModifier.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import Foundation
import SwiftUI

struct NavigationModifier: ViewModifier {
    
    var destinationView: AnyView
    @Binding var isActive: Bool

    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(
                    destination: destinationView,
                    isActive: $isActive
                ) {
                    EmptyView()
                }
            )
    }
}
