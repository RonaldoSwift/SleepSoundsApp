//
//  GetDetallePaqueteResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import Foundation

struct GetDetallePaqueteResponse: Decodable {
    
    var detalleDePaquete: DetalleDePaquete
    
    private enum CodingKeys: String, CodingKey {
        case detalleDePaquete = "detalleDePaquete"
    }
}

struct DetalleDePaquete: Decodable {
    var idDetalle: Int
    var nombre: String
    var cantidadDeMusica: Int
    var tiempoDeDuracion: Int
    var nombreDeCategoria: String
    var tituloDeDetalle: String
    var detalle: String
    
    private enum CodingKeys: String, CodingKey {
        case idDetalle
        case nombre
        case cantidadDeMusica
        case tiempoDeDuracion
        case nombreDeCategoria
        case tituloDeDetalle
        case detalle
    }
}
