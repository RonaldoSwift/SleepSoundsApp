import SwiftUI

struct MenuView: View {
    
    @State private var navegarADetalle: Bool = false
    @State private var showModalDetallePaquete = false
    @State private var showModalPlayMusic = false
    
    @State private var navegarAFavorite: Bool = false
    
    var sharedMusicViewModel = SharedMusicViewModel()
    var sharedPaqueteViewModel = SharedPaqueteViewModel()
    
    init() {
        //Navigation Bar
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.configureWithTransparentBackground()
        navBarAppearence.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navBarAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
        
        //TabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(Color.colorBoton)
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        TabView {
            NavigationView {
                DiscoverView(
                    onClickEnCardPaquete: {
                        navegarADetalle = true
                    },
                    onClickEnButtonPlay: {
                        //queda pendiente
                    }
                )
                .navigation(DetalleDePaqueteView(onClickOnAppear: {
                    showModalDetallePaquete = true
                }), $navegarADetalle)
                .sheet(
                    ModalDetallePaqueteView(onClickInPlay: {
                        showModalDetallePaquete = false
                        showModalPlayMusic = true
                    }),
                    $showModalDetallePaquete
                )
                .fullSheet(
                    SleepPlayerView(
                        musicMediaplayer: MusicMediaPlayer(musica: Musica(
                            id: 0, artista: "", titulo: "", album: "", urlDeMusica: "", bloqueado: false))),
                    $showModalPlayMusic
                )
                .environmentObject(sharedPaqueteViewModel)
            }
            .tabItem {
                Image(systemName: "moon.stars")
                Text("Discover")
            }
            
            NavigationView {
                ComposerView()
            }
            .tabItem {
                Image(ImageResource.composerIcono)
                    .renderingMode(.template)
                Text("Composer")
            }
            
            NavigationView {
                ProfileView(
                    onClickEnFavorite: {
                        navegarAFavorite = true
                    }
                )
                    .navigationTitle("Profile")
                    .navigation(FavoriteView(), $navegarAFavorite)
            }
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
