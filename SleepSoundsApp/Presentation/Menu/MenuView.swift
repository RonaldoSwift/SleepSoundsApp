import SwiftUI

struct MenuView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.colorFondo)
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            DiscoverView(
                onClickEnCardPaquete: {},
                onClickEnButtonPlay: {}
            )
            .tabItem {
                Image(systemName: "moon.stars")
                Text("Discover")
            }
        }
        .background(Color.colorFondo.ignoresSafeArea()) // Color de fondo adicional
    }
}

#Preview {
    MenuView()
}
