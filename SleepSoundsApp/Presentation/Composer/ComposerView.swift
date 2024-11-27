//
//  ComposerView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import SwiftUI

struct ComposerView: View {
    var body: some View {
        ZStack {
            Color(ColorResource.colorFondo)
                .ignoresSafeArea()
            ScrollView {
                ScrollView (.horizontal) {
                    HStack {
                        Text("ComposerView")
                    }
                }
            }
        }
    }
}

#Preview {
    ComposerView()
}
