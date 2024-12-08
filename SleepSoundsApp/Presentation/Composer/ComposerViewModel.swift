//
//  ComposerViewModel.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 6/12/24.
//

import Foundation
import Combine

@MainActor

final class ComposerViewModel: ObservableObject {
    
    let repository: Repository
    
    var cancelLables = Set<AnyCancellable>()
    
    @Published private(set) var composerUiState = ComposerUiState.inicial
    
    init(repository: Repository) {
        self.repository = repository
        startChild()
        startNature()
        startAnimal()
    }
    
    func startChild() {
        composerUiState = ComposerUiState.cargandoChild
        repository.getChild()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.composerUiState = ComposerUiState.error("Ocurrio un error \(error)")
                }
            }, receiveValue: { (child: [Childd]) in
                self.composerUiState = ComposerUiState.successChild(child)
            })
            .store(in: &cancelLables)
    }
    
    func startNature() {
        composerUiState = ComposerUiState.cargandoNature
        repository.getNature()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.composerUiState = ComposerUiState.error("Ocurrio un error \(error)")
                }
            }, receiveValue: { (nature: [Nature]) in
                self.composerUiState = ComposerUiState.successNature(nature)
            })
            .store(in: &cancelLables)
    }
    
    func startAnimal() {
        composerUiState = ComposerUiState.cargandoAnimal
        repository.getAnimal()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.composerUiState = ComposerUiState.error("Ocurrio un error \(error)")
                }
            }, receiveValue: { (animal: [Animal]) in
                self.composerUiState = ComposerUiState.successAnimal(animal)
            })
            .store(in: &cancelLables)
    }
}
