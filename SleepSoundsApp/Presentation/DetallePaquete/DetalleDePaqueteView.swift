//
//  DetalleDePaqueteView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import SwiftUI

struct DetalleDePaqueteView: View {
    
    var onClickOnAppear: () -> Void

    var body: some View {
        if #available(iOS 16.0, *) {
            DetalleDePaqueteViewiOS16()
                .onAppear(perform: {
                    onClickOnAppear()
                })
        } else {
            DetalleDePaqueteViewiOS15()
                .onAppear(perform: {
                    onClickOnAppear()
                })
        }
    }
}

#Preview {
    DetalleDePaqueteView(onClickOnAppear: {})
}
