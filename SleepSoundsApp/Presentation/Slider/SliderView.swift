import SwiftUI

struct SliderView: View {
    
    var onClickStart: () -> Void
    var onClickLoginApple: () -> Void
    
    @State private var currentIndex: Int = 1
    @State private var shouldNavigateToNextView: Bool = false
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(1...3, id: \.self) { index in
                    VStack {
                        Image("pic\(index)")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 290)
                            .padding(.horizontal, 20)
                        Text("Exclusive sounds")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        Text("We have an author's library of sounds that you will not find anywhere else")
                            .font(.system(size: 17, weight: .light))
                            .foregroundColor(Color.colorTextSlider)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            CustomTabIndicator(count: 3, current: $currentIndex)
                .padding(.bottom, 30)
            
            Button {
                if currentIndex < 3 {
                    // Avanza al siguiente índice
                    withAnimation {
                        currentIndex += 1
                    }
                } else {
                    // Cambia a la siguiente vista
                    shouldNavigateToNextView = true
                    onClickStart()
                }
            } label: {
                Text(currentIndex == 3 ? "Start" : "Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Capsule().fill(Color.colorBoton))
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 25)
            
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
            .padding(.bottom, 50)
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
