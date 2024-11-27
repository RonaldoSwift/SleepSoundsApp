//
//  DiscoverViewModel.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation
import Combine

@MainActor
final class DiscoverViewModel: ObservableObject{
    
    let repository: Repository
    
    var cancelLables = Set<AnyCancellable>()
    
    @Published private(set) var discoverUiState = DiscoverUiState.inicial
    
    init(repository: Repository) {
        self.repository = repository
        startListaDePaquete()
    }
    
    func startListaDePaquete() {
        discoverUiState = DiscoverUiState.cargando
        repository.getListaDePaquete()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.discoverUiState = DiscoverUiState.error("Ocurrio un error \(error)")
                }
            }, receiveValue: { (musica:[Paquete]) in
                self.discoverUiState = DiscoverUiState.success(musica)
            })
            .store(in: &cancelLables)
    }
}
