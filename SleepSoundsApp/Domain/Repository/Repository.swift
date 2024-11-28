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
    
    func getListaDePaquete()-> AnyPublisher<[Paquete], Error> {
        return webServiceAPI.fetchObtenerListaDeMusicaDiscover().map { (getObtenerListaDePaqueteResponse:GetPaquetesResponse) in
            getObtenerListaDePaqueteResponse.listaDePaquetes.map { (listaDePaquetes:ListaDePaquetes) in
                let descripcion: String
                if (listaDePaquetes.cantidadDeMusica == 0) {
                    descripcion = "\(listaDePaquetes.tiempoDeDuracion) minutos"
                } else {
                    descripcion = "\(listaDePaquetes.cantidadDeMusica) songs"
                }
                
                return Paquete(
                    id: listaDePaquetes.id,
                    imagen: listaDePaquetes.imagen,
                    nombre: listaDePaquetes.nombre,
                    descripcion: descripcion,
                    nombreDeCategoria: listaDePaquetes.nombreDeCategoria
                )
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getDetalleDeMusica(idDeDetalle: Int) -> AnyPublisher<Detalle, Error> {
        return webServiceAPI.fetchObtenerDetalleDePaquetePorID(idDetalle: idDeDetalle).map { (getDetallePaqueteResponse:GetDetallePaqueteResponse) in
            Detalle(
                id: getDetallePaqueteResponse.detalleDePaquete.idDetalle,
                nombre: getDetallePaqueteResponse.detalleDePaquete.nombre,
                cantidadDeMusica: getDetallePaqueteResponse.detalleDePaquete.cantidadDeMusica,
                tiempoDeDuracion: getDetallePaqueteResponse.detalleDePaquete.tiempoDeDuracion,
                nombreDeCategoria: getDetallePaqueteResponse.detalleDePaquete.nombreDeCategoria,
                tituloDeDetalle: getDetallePaqueteResponse.detalleDePaquete.tituloDeDetalle,
                detalle: getDetallePaqueteResponse.detalleDePaquete.detalle
            )
        }
        .eraseToAnyPublisher()
    }
    
    func getMusica() -> AnyPublisher<Musica, Error> {
        return webServiceAPI.fetchObtenerMusica().map { (getMusicaResponse:GetMusicaResponse) in
            Musica(
                id: getMusicaResponse.musicaResponse.id,
                artista: getMusicaResponse.musicaResponse.artista,
                titulo: getMusicaResponse.musicaResponse.titulo,
                album: getMusicaResponse.musicaResponse.album,
                categoria: getMusicaResponse.musicaResponse.categoria
            )
        }
        .eraseToAnyPublisher()
    }
    
    func getPaqueteDestacado() -> AnyPublisher<[Destacado], Error> {
        return webServiceAPI.fetchObtenerListaDeDestacado().map { (getDestacadoResponse:GetDestacadoResponse) in
            getDestacadoResponse.paqueteDestacado.map { (paquetesDestacado:PaquetesDestacado) in
                Destacado(
                    id: paquetesDestacado.id,
                    imagen: paquetesDestacado.imagen,
                    nombre: paquetesDestacado.nombre,
                    cantidadDeMusica: paquetesDestacado.cantidadDeMusica,
                    nombreDeCategoria: paquetesDestacado.nombreDeCategoria
                )
            }
        }
        .eraseToAnyPublisher()
    }
}
