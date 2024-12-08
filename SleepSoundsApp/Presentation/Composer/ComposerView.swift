//
//  ComposerView.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import SwiftUI

struct ComposerView: View {
    
    @State private var composerViewModel = ComposerViewModel(
        repository: Repository(
            webServiceAPI: WebServiceAPI()
        )
    )
    
    @State private var showLoadingChild: Bool = false
    @State private var showLoadingNature: Bool = false
    @State private var showLoadingAnimal: Bool = false
    @State private var showAlert: Bool = false
    @State private var mensajeDeAlerta: String = ""
    @State private var tituloDeAlerta: String = "Error"
    @State private var childdLista: [Childd] = []
    @State private var natureLista: [Nature] = []
    @State private var animalLista: [Animal] = []
    
    var body: some View {
        ZStack {
            Color(ColorResource.colorFondo)
                .ignoresSafeArea()
            ScrollView {
                if (showLoadingChild == true) {
                    ProgressView()
                } else {
                    CardChildListComponent(
                        tituloDeLista: "Child",
                        descripcionDeCard: "Quickly stabilize your baby’s emotions",
                        arrayChildd: $childdLista
                    )
                }
                
                if (showLoadingNature == true) {
                    ProgressView()
                } else {
                    CardNatureListComponent(
                        tituloDeLista: "Nature",
                        descripcionDeCard: "It will allow you to merge with nature",
                        arrayNature: $natureLista
                    )
                }
                
                if (showLoadingAnimal == true) {
                    ProgressView()
                } else {
                    CardAnimalListComponent(
                        tituloDeLista: "Animals",
                        descripcionDeCard: "Animal voices will improve your sleep",
                        arrayAnimal: $animalLista
                    )
                }
            }
            .navigationTitle("Composer")
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
        .onReceive(composerViewModel.$composerUiState) { composerUiState in
            switch (composerUiState) {
            case .inicial:
                break
            case .cargandoChild:
                showLoadingChild = true
            case .cargandoNature:
                showLoadingNature = true
            case .cargandoAnimal:
                showLoadingAnimal = true
            case .error(let error):
                showAlert = true
                showLoadingChild = false
                showLoadingNature = false
                showLoadingAnimal = false
                mensajeDeAlerta = error
            case .successChild(let childs):
                showLoadingChild = false
                childdLista = childs
            case .successNature(let natures):
                showLoadingNature = false
                natureLista = natures
            case .successAnimal(let animals):
                showLoadingAnimal = false
                animalLista = animals
            }
        }
    }
}

#Preview {
    ComposerView()
}
