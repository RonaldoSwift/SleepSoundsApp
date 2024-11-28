//
//  DetalleDePaqueteView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import SwiftUI

struct DetalleDePaqueteView: View {
    
    @State private var showModal = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            DetalleDePaqueteViewiOS16()
        } else {
            DetalleDePaqueteViewiOS15()
        }
    }
}

#Preview {
    DetalleDePaqueteView()
}
