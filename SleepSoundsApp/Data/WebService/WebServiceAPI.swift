//
//  WebServiceAPI.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation
import Combine

class WebServiceAPI {
    
    func fetchObtenerListaDePaquetes() -> AnyPublisher<GetPaquetesResponse,Error> {
        guard let urlComponnets = URLComponents(string: "http://192.168.1.58:7023/obtenerListaDePaquetes") else {
            return Fail(error: WebServiceError.errorURL)
                .eraseToAnyPublisher()
        }
        guard let validUrl = urlComponnets.url else {
            return Fail(error: WebServiceError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebServiceError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw WebServiceError.errorData(errorResponse.messages)
            }
            .decode(type: GetPaquetesResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchObtenerDetalleDePaquetePorID(idDetalle: Int) -> AnyPublisher<GetDetallePaqueteResponse,Error> {
        guard let urlComponnets = URLComponents(string: "http://192.168.1.58:7023/obtenerDetalleDePaquetePorID?idDeMusica=\(idDetalle)") else {
            return Fail(error: WebServiceError.errorURL)
                .eraseToAnyPublisher()
        }
        guard let validUrl = urlComponnets.url else {
            return Fail(error: WebServiceError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebServiceError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw WebServiceError.errorData(errorResponse.messages)
            }
            .decode(type: GetDetallePaqueteResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchObtenerListaDeMusicasPorID(idDeMusica: Int) -> AnyPublisher<GetMusicaResponse,Error> {
        guard let urlComponnets = URLComponents(string: "http://192.168.1.58:7023/obtenerMusicasPorId?idDeMusica=\(idDeMusica)") else {
            return Fail(error: WebServiceError.errorURL)
                .eraseToAnyPublisher()
        }
        guard let validUrl = urlComponnets.url else {
            return Fail(error: WebServiceError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebServiceError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw WebServiceError.errorData(errorResponse.messages)
            }
            .decode(type: GetMusicaResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchObtenerListaDeDestacado() -> AnyPublisher<GetDestacadoResponse,Error> {
        guard let urlComponnets = URLComponents(string: "http://192.168.1.58:7023/obtenerListaDeDestacado") else {
            return Fail(error: WebServiceError.errorURL)
                .eraseToAnyPublisher()
        }
        guard let validUrl = urlComponnets.url else {
            return Fail(error: WebServiceError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebServiceError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw WebServiceError.errorData(errorResponse.messages)
            }
            .decode(type: GetDestacadoResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchObtenerListaChild() -> AnyPublisher<GetChildResponse, Error> {
        guard let urlComponnets = URLComponents(string: "http://192.168.1.58:7023/obtenerListaDeChild") else {
            return Fail(error: WebServiceError.errorURL)
                .eraseToAnyPublisher()
        }
        guard let validUrl = urlComponnets.url else {
            return Fail(error: WebServiceError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebServiceError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw WebServiceError.errorData(errorResponse.messages)
            }
            .decode(type: GetChildResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchObtenerListaNature() -> AnyPublisher<GetNatureResponse, Error> {
        guard let urlComponnets = URLComponents(string: "http://192.168.1.58:7023/obtenerListaDeNature") else {
            return Fail(error: WebServiceError.errorURL)
                .eraseToAnyPublisher()
        }
        guard let validUrl = urlComponnets.url else {
            return Fail(error: WebServiceError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebServiceError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw WebServiceError.errorData(errorResponse.messages)
            }
            .decode(type: GetNatureResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchObtenerListaAnimal() -> AnyPublisher<GetAnimalResponse, Error> {
        guard let urlComponnets = URLComponents(string: "http://192.168.1.58:7023/obtenerListaDeAnimal") else {
            return Fail(error: WebServiceError.errorURL)
                .eraseToAnyPublisher()
        }
        guard let validUrl = urlComponnets.url else {
            return Fail(error: WebServiceError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebServiceError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw WebServiceError.errorData(errorResponse.messages)
            }
            .decode(type: GetAnimalResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    enum WebServiceError: Error, Equatable {
        case errorURL
        case urlInvalido
        case errorData(String)
        case errorStatusCode
        case errorDesconocido
    }
}
