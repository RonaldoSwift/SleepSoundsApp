//
//  ModalDetallePaqueteView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 27/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ModalDetallePaqueteView: View {
    
    @State private var detalleDePaqueteViewModel = DetalleDePaqueteViewModel(
        repository: Repository(
            webServiceAPI: WebServiceAPI()
        )
    )
    
    @State private var showLoadingDetalle: Bool = false
    @State private var showLoadingMusica: Bool = false
    @State private var showLoadingDestacado: Bool = false
    @State private var showAlert: Bool = false
    @State private var mensajeDeAlerta: String = ""
    @State private var tituloDeAlerta: String = "Error"
    
    @State private var detalleDePaquete: Detalle = Detalle(
        id: 0,
        nombre: "",
        cantidadDeMusica: 0,
        tiempoDeDuracion: 0,
        nombreDeCategoria: "",
        tituloDeDetalle: "",
        detalle: ""
    )
    
    @State private var musicaDeDetalle: Musica = Musica(
        id: 0,
        artista: "",
        titulo: "",
        album: "",
        categoria: ""
    )
    @State private var arrayDestacado: [Destacado] = []
    
    var body: some View {
        ZStack {
            Color(ColorResource.colorFondo)
                .ignoresSafeArea()
            ScrollView {
                if (showLoadingDetalle == true) {
                    ProgressView()
                } else {
                    VStack (alignment: .leading){
                        Text(detalleDePaquete.nombre)
                            .font(.title)
                            .bold()
                            .foregroundColor(Color.white)
                        HStack {
                            Text("\(detalleDePaquete.cantidadDeMusica) songs")
                            Text(". \(detalleDePaquete.nombreDeCategoria)")
                        }
                        .foregroundColor(Color.colorTextSlider)
                        .padding(.bottom,17)
                        
                        ButonCapsulePlayAndStartComponent()
                        
                        Text(detalleDePaquete.tituloDeDetalle)
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding(.top,15)
                        
                        Text(detalleDePaquete.detalle)
                            .foregroundColor(Color.colorTextSlider)
                            .padding(.bottom,15)
                        
                        if (showLoadingMusica == true) {
                            ProgressView()
                        } else {
                            CardMusicComponent(
                                artista: musicaDeDetalle.artista,
                                titulo: musicaDeDetalle.titulo,
                                album: musicaDeDetalle.album,
                                categoria: musicaDeDetalle.categoria
                            )
                        }
                        
                        if (showLoadingDestacado == true) {
                            ProgressView()
                        } else {
                            Text("Featured On")
                                .font(.title3)
                                .foregroundColor(Color.white)
                            DestacadoListComponent(arrayDestacado: arrayDestacado)
                        }
                    }
                    .padding()
                }
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
        .onAppear{
            detalleDePaqueteViewModel.startDetalleDeMusica(idDetalle: 1)
            detalleDePaqueteViewModel.startMusica()
            detalleDePaqueteViewModel.startPaqueteDestacado()
        }
        .onReceive(detalleDePaqueteViewModel.$detalleDePqueteUiState) { detalleDePaqueteUiState in
            switch (detalleDePaqueteUiState) {
            case .inicial:
                break
            case .cargandoDetalle:
                showLoadingDetalle = true
            case .cargandoMusica:
                showLoadingMusica = true
            case .cargandoDestacado:
                showLoadingDestacado = true
            case .error(let error):
                showAlert = true
                showLoadingDetalle = false
                showLoadingMusica = false
                showLoadingDestacado = false
                mensajeDeAlerta = error
            case .successDetalle(let detalle):
                showLoadingDetalle = false
                detalleDePaquete = detalle
            case .successMusica(let musica):
                showLoadingMusica = false
                musicaDeDetalle = musica
            case .successDestacado(let destacados):
                showLoadingDestacado = false
                arrayDestacado = destacados
            }
        }
    }
}

#Preview {
    ModalDetallePaqueteView()
}
