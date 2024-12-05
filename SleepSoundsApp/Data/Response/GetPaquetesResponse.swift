//
//  GetPaquetesResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation

struct GetPaquetesResponse: Decodable {
    
    var listaDePaquetes: [ListaDePaquetes]
    
    private enum CodingKeys: String, CodingKey {
        case listaDePaquetes = "listaDePaquetesEntity"
    }
}

struct ListaDePaquetes: Decodable {
    var id: Int
    var imagen: String
    var nombre: String
    var cantidadDeMusica: Int
    var tiempoDeDuracion: Int
    var nombreCategoria: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imagen
        case nombre
        case cantidadDeMusica
        case tiempoDeDuracion
        case nombreCategoria
    }
}
