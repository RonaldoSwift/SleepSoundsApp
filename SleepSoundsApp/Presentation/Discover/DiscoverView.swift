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
            webServiceAPI: WebServiceAPI(),
            sleepSoundsGRDB: SleepSoundsGRDB()
        )
    )
    
    var onClickEnCardPaquete: () -> Void
    var onClickEnButtonPlay: () -> Void
    
    @State private var showLoadingMusica: Bool = false
    @State private var showAlert: Bool = false
    @State private var mensajeDeAlerta: String = ""
    @State private var tituloDeAlerta: String = "Error"
    @State private var arrayDePaquete: [Paquete] = []
    
    
    var body: some View {
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
                    PaqueteCardComponente(
                        onClickInCardPaquete: {
                            onClickEnCardPaquete()
                        },
                        onClickInPlay: {
                            onClickEnButtonPlay()
                        },
                        arrayDePaquetes: $arrayDePaquete
                    )
                }
            }
            .navigationTitle("Discover")
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
                arrayDePaquete = musicas
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
