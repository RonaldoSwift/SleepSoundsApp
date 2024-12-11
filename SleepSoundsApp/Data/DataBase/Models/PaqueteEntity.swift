//
//  PaqueteEntity.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 10/12/24.
//

import Foundation
import GRDB

struct PaqueteEntity: Codable, FetchableRecord, PersistableRecord {
    var paqueteID: Int
    var imagen: String
    var nombre: String
    var cantidadDeMusica: Int
    var tiempoDeDuracion: Int
    var nombreDeCategoria: String
}
