//
//  GetChildResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 6/12/24.
//

import Foundation

struct GetChildResponse: Decodable {
    
    var listaDeChild: [ListaDeChild]
    
    private enum CodingKeys: String, CodingKey {
        case listaDeChild = "listaDeChildEntity"
    }
}

struct ListaDeChild: Decodable {
    var id: Int
    var imagen: String
    var nombre: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imagen
        case nombre
    }
}
