//
//  SheetFullModifier.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 28/11/24.
//

import Foundation
import SwiftUI

struct SheetFullModifier: ViewModifier {
    
    var presentingView: AnyView
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                self.presentingView
            }
    }
}
