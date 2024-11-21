//
//  DiscoverUiState.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation

enum DiscoverUiState {
    case inicial
    case cargando
    case error(String)
    case success([Musica])
}
