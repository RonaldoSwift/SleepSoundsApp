//
//  GetNatureResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 6/12/24.
//

import Foundation

struct GetNatureResponse: Decodable {
    
    var listaDeNature: [ListaDeNature]
    
    private enum CodingKeys: String, CodingKey {
        case listaDeNature = "listaDeNatureEntity"
    }
}

struct ListaDeNature: Decodable {
    var id: Int
    var imagen: String
    var nombre: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imagen
        case nombre
    }
}
