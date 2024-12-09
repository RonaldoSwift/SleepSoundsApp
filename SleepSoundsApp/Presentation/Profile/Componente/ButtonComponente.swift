//
//  ButtonComponente.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 9/12/24.
//

import Foundation
import SwiftUI

struct ButtonComponente: View {
    var clickInButton: () -> Void
    var imagen: ImageResource
    var texto: String
    var colorForeground: Color
    
    var body: some View {
        Button {
            clickInButton()
        } label: {
            HStack {
                Image(imagen)
                Text(texto)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal)
            .frame(height: 60)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.colorBoton.opacity(0.1))
            )
        }
        .font(.system(size: 20))
        .foregroundColor(colorForeground)
    }
}
