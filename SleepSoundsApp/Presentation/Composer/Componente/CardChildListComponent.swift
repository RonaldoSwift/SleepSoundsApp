//
//  CardChildListComponent.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 7/12/24.
//

import Foundation
import SwiftUI

struct CardChildListComponent: View {
    
    var tituloDeLista: String
    var descripcionDeCard: String
    @Binding var arrayChildd: [Childd]
    @State private var selectedChildId: Int? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(tituloDeLista)
                .font(.system(size: 20))
                .foregroundColor(Color.white)
            Text(descripcionDeCard)
                .font(.system(size: 15))
                .foregroundColor(Color.colorTextSlider)
            
            ScrollView (.horizontal) {
                HStack {
                    ForEach(arrayChildd, id: \.id) { child in
                        Button(action: {
                            if selectedChildId == child.id {
                                selectedChildId = nil
                            } else {
                                selectedChildId = child.id
                            }
                        }) {
                            VStack(spacing: 0) {
                                Image(child.imagen)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text(child.nombre)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(Color.colorBotonList)
                            }
                            .frame(width: 120)
                            .background(                                selectedChildId == child.id ? Color.colorPushButton : Color.colorBoton
                            )
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                        }
                    }
                }
            }
            
        }
        .padding()
    }
}
