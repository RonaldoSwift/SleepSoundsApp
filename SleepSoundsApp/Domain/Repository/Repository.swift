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
    
    func getListaDeMusica()-> AnyPublisher<[Musica], Error> {
        return webServiceAPI.fetchObtenerListaDeMusicaDiscover().map { (getObtenerListaDeMusicaDiscoverResponse:GetObtenerListaDeMusicaDiscoverResponse) in
            getObtenerListaDeMusicaDiscoverResponse.listaDeMusicasDiscover.map { (listaDeMusicasDiscover:ListaDeMusicasDiscover) in
                Musica(
                    id: listaDeMusicasDiscover.id,
                    imagen: listaDeMusicasDiscover.imagen,
                    nombre: listaDeMusicasDiscover.nombre,
                    songs: listaDeMusicasDiscover.songs,
                    instrumental: listaDeMusicasDiscover.instrumental
                )
            }
        }
        .eraseToAnyPublisher()
    }
}
