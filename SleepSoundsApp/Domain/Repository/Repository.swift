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
        return webServiceAPI.fetchObtenerListaDePaquetes().map { (getPaquetesResponse:GetPaquetesResponse) in
            getPaquetesResponse.listaDePaquetes.map { (listaDePaquetes:ListaDePaquetes) in
                
                let descripcion: String
                
                if (listaDePaquetes.cantidadDeMusica == 0) {
                    descripcion = "\(listaDePaquetes.tiempoDeDuracion) hours"
                } else {
                    descripcion = "\(listaDePaquetes.cantidadDeMusica) songs"
                }
                return Paquete(
                    id: listaDePaquetes.id,
                    imagen: listaDePaquetes.imagen,
                    nombre: listaDePaquetes.nombre,
                    cantidadDeMusica: listaDePaquetes.cantidadDeMusica,
                    tiempoDeDuracion: listaDePaquetes.tiempoDeDuracion,
                    nombreDeCategoria: listaDePaquetes.nombreCategoria
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
    
    func getMusica(idMusica: Int) -> AnyPublisher<[Musica], Error> {
        return webServiceAPI.fetchObtenerListaDeMusicasPorID(idDeMusica: idMusica).map { (getMusicaResponse:GetMusicaResponse) in
            getMusicaResponse.musicasResponse.map { (musicaResponse:MusicaResponse) in
                Musica(
                    id: musicaResponse.id,
                    artista: musicaResponse.artista,
                    titulo: musicaResponse.titulo,
                    album: musicaResponse.album,
                    urlDeMusica: musicaResponse.urlDeMusica,
                    bloqueado: true
                )
            }
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
    
    func getChild() -> AnyPublisher<[Childd], Error> {
        return webServiceAPI.fetchObtenerListaChild().map { (getChildResponse:GetChildResponse) in
            getChildResponse.listaDeChild.map { (listaDeChild:ListaDeChild) in
                Childd(
                    id: listaDeChild.id,
                    imagen: listaDeChild.imagen,
                    nombre: listaDeChild.nombre
                )
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getNature() ->AnyPublisher<[Nature], Error> {
        return webServiceAPI.fetchObtenerListaNature().map { (getNatureResponse:GetNatureResponse) in
            getNatureResponse.listaDeNature.map { (listaDeNature:ListaDeNature) in
                Nature(
                    id: listaDeNature.id,
                    imagen: listaDeNature.imagen,
                    nombre: listaDeNature.nombre
                )
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getAnimal() -> AnyPublisher<[Animal], Error> {
        return webServiceAPI.fetchObtenerListaAnimal().map { (getAnimalResponse:GetAnimalResponse) in
            getAnimalResponse.listaDeAnimal.map { (listaDeAnimal:ListaDeAnimal) in
                Animal(
                    id: listaDeAnimal.id,
                    imagen: listaDeAnimal.imagen,
                    nombre: listaDeAnimal.nombre
                )
            }
        }
        .eraseToAnyPublisher()
    }
    
}
