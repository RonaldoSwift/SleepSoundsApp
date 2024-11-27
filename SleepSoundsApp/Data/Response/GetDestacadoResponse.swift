//
//  GetDestacadoResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import Foundation

struct GetDestacadoResponse: Decodable {
    
    var paqueteDestacado: [PaquetesDestacado]
    
    private enum CodingKeys: String, CodingKey {
        case paqueteDestacado = "listaDeDestacadosEntity"
    }
}

struct PaquetesDestacado: Decodable {
    var id: Int
    var imagen: String
    var nombre: String
    var cantidadDeMusica: Int
    var nombreDeCategoria: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imagen
        case nombre
        case cantidadDeMusica
        case nombreDeCategoria
    }
}
