//
//  DetalleDePaqueteViewModel.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import Foundation
import Combine

@MainActor
final class DetalleDePaqueteViewModel: ObservableObject {
    
    let repository: Repository
    
    var cancelLables = Set<AnyCancellable>()
    
    @Published private(set) var detalleDePqueteUiState = DetalleDePqueteUiState.inicial
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func startDetalleDeMusica(idDetalle: Int) {
        detalleDePqueteUiState = DetalleDePqueteUiState.cargandoDetalle
        repository.getDetalleDeMusica(idDeDetalle: idDetalle)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.detalleDePqueteUiState = DetalleDePqueteUiState.error("Ocurrio un error \(error)")
                }
            }, receiveValue: { (detalle:Detalle) in
                self.detalleDePqueteUiState = DetalleDePqueteUiState.successDetalle(detalle)
            })
            .store(in: &cancelLables)
    }
    
    func startMusica() {
        detalleDePqueteUiState = DetalleDePqueteUiState.cargandoMusica
        repository.getMusica()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.detalleDePqueteUiState = DetalleDePqueteUiState.error("Ocurrio un error \(error)")
                }
            }, receiveValue: { (musica: Musica) in
                self.detalleDePqueteUiState = DetalleDePqueteUiState.successMusica(musica)
            })
            .store(in: &cancelLables)
    }
    
    func startPaqueteDestacado() {
        detalleDePqueteUiState = DetalleDePqueteUiState.cargandoDestacado
        repository.getPaqueteDestacado()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.detalleDePqueteUiState = DetalleDePqueteUiState.error("Ocurrio un error \(error)")
                }
            }, receiveValue: { (destacados: [Destacado]) in
                self.detalleDePqueteUiState = DetalleDePqueteUiState.successDestacado(destacados)
            })
            .store(in: &cancelLables)
    }
}
