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
            
            ComposerView()
                .tabItem {
                    Image(ImageResource.composerIcono)
                        .renderingMode(.template)
                    Text("Composer")
                }
            ProfileView()
                .tabItem {
                    Image(ImageResource.profileIcono)
                        .renderingMode(.template)
                    Text("Profile")
                }
        }
        .background(Color.colorFondo.ignoresSafeArea())
    }
}

#Preview {
    MenuView()
}
