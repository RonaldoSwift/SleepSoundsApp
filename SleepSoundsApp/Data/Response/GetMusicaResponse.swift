//
//  GetMusicaResponse.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 26/11/24.
//

import Foundation

struct GetMusicaResponse: Decodable {
    
    var musicaResponse: MusicaResponse
    
    private enum CodingKeys: String, CodingKey {
        case musicaResponse = "musica"
    }
}

struct MusicaResponse: Decodable {
    var id: Int
    var artista: String
    var titulo: String
    var album: String
    var categoria: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case artista
        case titulo
        case album
        case categoria
    }
}
