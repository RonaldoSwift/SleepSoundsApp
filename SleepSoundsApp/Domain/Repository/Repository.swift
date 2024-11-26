//
//  Repository.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation
import Combine

class Repository {
    private let webServiceAPI: WebServiceAPI
    
    var cancelLable = Set<AnyCancellable>()
    
    init(webServiceAPI: WebServiceAPI) {
        self.webServiceAPI = webServiceAPI
    }
    
    func getListaDeMusica()-> AnyPublisher<[Paquete], Error> {
        return webServiceAPI.fetchObtenerListaDeMusicaDiscover().map { (getObtenerListaDePaqueteResponse:GetObtenerListaDePaqueteResponse) in
            getObtenerListaDePaqueteResponse.listaDePaquetes.map { (listaDePaquetes:ListaDePaquetes) in
                Paquete(
                    id: listaDePaquetes.id,
                    imagen: listaDePaquetes.imagen,
                    nombre: listaDePaquetes.nombre,
                    cantidadDeMusica: listaDePaquetes.cantidadDeMusica,
                    tiempoDeDuracion: listaDePaquetes.tiempoDeDuracion,
                    nombreDeCategoria: listaDePaquetes.nombreDeCategoria
                )
            }
        }
        .eraseToAnyPublisher()
    }
}
