//
//  ComposerUiState.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 6/12/24.
//

import Foundation

enum ComposerUiState {
    case inicial
    case cargandoChild
    case cargandoNature
    case cargandoAnimal
    case error(String)
    case successChild([Childd])
    case successNature([Nature])
    case successAnimal([Animal])
}
