//
//  CardNatureListComponent.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 7/12/24.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CardNatureListComponent: View {
    
    var tituloDeLista: String
    var descripcionDeCard: String
    @Binding var arrayNature: [Nature]
    @State private var selectedNatureId: Int? = nil
    
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
                    ForEach(arrayNature, id: \.id) { nature in
                        Button(action: {
                            if selectedNatureId == nature.id {
                                selectedNatureId = nil
                            } else {
                                selectedNatureId = nature.id
                            }
                        }) {
                            VStack(spacing: 0) {
                                WebImage(url: URL(string: "\(nature.imagen)"))
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text(nature.nombre)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 4)
                                    .background(Color.colorBotonList)
                            }
                            .frame(width: 120)
                            .background(selectedNatureId == nature.id ? Color.colorPushNature : Color.colorBoton
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
