//
//  SheetModifier.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 27/11/24.
//

import Foundation
import SwiftUI

struct SheetModifier: ViewModifier {
    var presentingView: AnyView
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                self.presentingView
            }
    }
}
