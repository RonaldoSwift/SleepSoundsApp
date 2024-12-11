//
//  SleepSoundsGRDB.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 9/12/24.
//

import Foundation
import Combine
import GRDB

var dataBaseQueue: DatabaseQueue!

class SleepSoundsGRDB {
    
    let publicadorIncertarPaquete = PassthroughSubject<String, Error>()
    let publicadorListaDePaquetes = PassthroughSubject<[PaqueteEntity],Error>()
    
    func inicializadorBaseDeDatos() {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("db.sqlite")
        let dataBasePath = fileURL.path
        dataBaseQueue = try! DatabaseQueue(path: dataBasePath)
    }
    
    func crearTabla() {
        do {
            try dataBaseQueue.write ({ (dataBase:Database) in
                try dataBase.create(table: "PaqueteEntity", body: { definicionDeTabla in
                    definicionDeTabla.primaryKey("paqueteID", .integer)
                    definicionDeTabla.column("imagen", .text).notNull()
                    definicionDeTabla.column("nombre", .text).notNull()
                    definicionDeTabla.column("cantidadDeMusica", .integer)
                    definicionDeTabla.column("tiempoDeDuracion", .integer)
                    definicionDeTabla.column("nombreDeCategoria", .text).notNull()
                })
            })
        }
        catch let error {
            print("Error en la creacion de la tabla")
            print(error)
        }
    }
    
    func getProductoFromTabla() {
        var paqueteEntity: [PaqueteEntity] = []
        do {
            try dataBaseQueue.read({ (database:Database) in
                let rows = try Row.fetchAll(database, sql: "SELECT paqueteID, imagen, nombre, cantidadDeMusica, tiempoDeDuracion, nombreDeCategoria FROM PaqueteEntity")
                paqueteEntity = rows.map { (row:Row) in
                    PaqueteEntity(
                        paqueteID: row[0],
                        imagen: row[1],
                        nombre: row[2],
                        cantidadDeMusica: row[3],
                        tiempoDeDuracion: row[4],
                        nombreDeCategoria: row[5]
                    )
                }
            })
            publicadorListaDePaquetes.send(paqueteEntity)
        } catch let error {
            publicadorListaDePaquetes.send(completion: .failure(error))
        }
    }
    
    func insertarProductosALaTabla(paqueteId: Int, imagen: String, nombre: String, cantidadDeMusica: Int, tiempoDeDuracion: Int, nombreDeCategoria: String) {
        do {
            try dataBaseQueue.write { (dataBase: Database) in
                try dataBase.execute(sql: "INSERT INTO PaqueteEntity (paqueteID, imagen, nombre,  cantidadDeMusica, tiempoDeDuracion, nombreDeCategoria) VALUES (?,?,?,?,?,?)", arguments: [paqueteId, imagen, nombre, cantidadDeMusica, tiempoDeDuracion, nombreDeCategoria])
                publicadorIncertarPaquete.send("Se incerto correctamente")
            }
        } catch let error {
            publicadorIncertarPaquete.send(completion: .failure(error))
        }
    }
}
