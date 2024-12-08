//
//  GetAnimalResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 6/12/24.
//

import Foundation

struct GetAnimalResponse: Decodable {
    
    var listaDeAnimal: [ListaDeAnimal]
    
    private enum CodingKeys: String, CodingKey {
        case listaDeAnimal = "listaDeAnimalEntity"
    }
}

struct ListaDeAnimal: Decodable {
    var id: Int
    var imagen: String
    var nombre: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imagen
        case nombre
    }
}
