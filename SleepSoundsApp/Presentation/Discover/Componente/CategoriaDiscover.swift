//
//  CategoriaDiscover.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation
import SwiftUI

struct CategoriaDiscover: View {
    
    var image: String
    var textoDeCategoria: String
    
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 8) {
                Image(image)
                    .foregroundColor(.white)
                Text(textoDeCategoria)
                    .foregroundColor(.white)
                    .font(.body)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(Color.colorBoton)
            .clipShape(Capsule())
        }
    }
}
