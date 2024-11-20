//
//  CustomTabIndicator.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import SwiftUI

struct CustomTabIndicator: View {
    
    var count: Int
    @Binding var current: Int
    
    var body: some View {
        HStack {
            ForEach(0..<count, id: \.self) { index in
                ZStack {
                    if(current - 1) == index {
                        Circle()
                            .fill(Color.blue)
                    }
                    else {
                        Circle()
                            .fill(Color.colorBoton)
                            .overlay(
                                Circle()
                                    .stroke(Color.colorBoton,lineWidth: 1.5)
                            )
                    }
                }
                .frame(width: 10, height: 10)
            }
        }
    }
}
