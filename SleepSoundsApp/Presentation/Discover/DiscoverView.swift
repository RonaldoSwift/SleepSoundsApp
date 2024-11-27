//
//  DiscoverView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 19/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoverView: View {
    
    @State private var discoverViewModel = DiscoverViewModel(
        repository: Repository(
            webServiceAPI: WebServiceAPI()
        )
    )
    
    var onClickEnCardPaquete: () -> Void
    var onClickEnButtonPlay: () -> Void
    
    @State private var showLoadingMusica: Bool = false
    @State private var showAlert: Bool = false
    @State private var mensajeDeAlerta: String = ""
    @State private var tituloDeAlerta: String = "Error"
    @State private var arrayDeMusicas: [Paquete] = []
    
    @State private var navegarADetalle: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(ColorResource.colorFondo)
                    .ignoresSafeArea()
                ScrollView {
                    ScrollView (.horizontal) {
                        HStack {
                            CategoriaDiscover(image: "All", textoDeCategoria: "All")
                            CategoriaDiscover(image: "Ambient", textoDeCategoria: "Ambient")
                            CategoriaDiscover(image: "ForKids", textoDeCategoria: "For Kids")
                        }
                        .padding(.top,15)
                        .padding(.leading,15)
                    }
                    .padding(.bottom,10)
                    if (showLoadingMusica == true) {
                        ProgressView()
                    }
                    else {
                        MusicaCardComponente(
                            onClickInCardPaquete: {
                                navegarADetalle = true
                            },
                            onClickInPlay: {
                                onClickEnButtonPlay()
                            },
                            arrayDePaquetes: arrayDeMusicas
                        )
                    }
                }
                .navigationTitle("Discover")
                .navigation(DetalleDePaqueteView(), $navegarADetalle)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(tituloDeAlerta),
                message: Text(mensajeDeAlerta),
                dismissButton: .default(
                    Text("Aceptar"),
                    action: {
                    }
                )
            )
        }
        .onReceive(discoverViewModel.$discoverUiState) { discoverUiState in
            switch (discoverUiState) {
            case .inicial:
                break
            case .cargando:
                showLoadingMusica = true
            case .error(let error):
                showAlert = true
                showLoadingMusica = false
                mensajeDeAlerta = error
            case .success(let musicas):
                showLoadingMusica = false
                tituloDeAlerta = "Correcto"
                arrayDeMusicas = musicas
            }
        }
    }
}

#Preview {
    DiscoverView(
        onClickEnCardPaquete: {},
        onClickEnButtonPlay: {}
    )
}
