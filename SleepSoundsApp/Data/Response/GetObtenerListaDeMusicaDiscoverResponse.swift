//
//  GetObtenerListaDeMusicaDiscoverResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation

struct GetObtenerListaDeMusicaDiscoverResponse: Decodable {
    
    var listaDeMusicasDiscover: [ListaDeMusicasDiscover]
    
    private enum CodingKeys: String, CodingKey {
        case listaDeMusicasDiscover = "listaDeMusicasDiscoverEntity"
    }
}

struct ListaDeMusicasDiscover: Decodable {
    var id: Int
    var imagen: String
    var nombre: String
    var songs: Int
    var instrumental: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case imagen
        case nombre
        case songs
        case instrumental
    }
}
