//
//  SliderView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import SwiftUI

struct SliderView: View {
    
    var onClickStart: () -> Void
    var onClickLoginApple: () -> Void
    
    @State private var currentIndex: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(1...3,id: \.self) { index in
                    VStack {
                        Image("pic\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 20)
                        Text("Exclusive sounds")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.top,20)
                        Text("We have an author's library of sounds that you will not find anywhere else")
                            .font(.system(size: 17, weight: .light))
                            .foregroundColor(Color.colorTextSlider)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top,10)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            CustomTabIndicator(count: 3, current: $currentIndex)
                .padding(.bottom,25)
            
            Button {
                onClickStart()
            } label: {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Capsule().fill(Color.colorBoton))
                    .padding(.horizontal, 20)
            }
            .padding(.bottom,25)
            
            Button {
                onClickLoginApple()
            } label: {
                HStack {
                    Image(systemName: "apple.logo")
                    Text("Login with Apple")
                }
                .font(.headline)
                .foregroundColor(.white)
            }
            .padding(.bottom,35)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(ColorResource.colorFondo).ignoresSafeArea())
    }
}

#Preview {
    SliderView(
        onClickStart: {},
        onClickLoginApple: {}
    )
}
