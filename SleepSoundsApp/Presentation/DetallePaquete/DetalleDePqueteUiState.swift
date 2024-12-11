//
//  DetalleDePqueteUiState.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import Foundation

enum DetalleDePqueteUiState {
    case inicial
    case cargandoDetalle
    case cargandoMusica
    case cargandoDestacado
    case error(String)
    case successDetalle(Detalle)
    case successMusica([Musica])
    case successDestacado([Destacado])
    case guardadoEnFavoritoDB(String)
    case errorGuardadoFavoritoDB(String)
}
