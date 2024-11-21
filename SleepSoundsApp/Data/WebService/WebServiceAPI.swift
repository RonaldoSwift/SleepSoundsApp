//
//  WebServiceAPI.swift
//  SleepSoundsApp
//
//  Created by Ronaldo Andre on 20/11/24.
//

import Foundation
import Combine

class WebServiceAPI {
    
    func fetchObtenerListaDeMusicaDiscover() -> AnyPublisher<GetObtenerListaDeMusicaDiscoverResponse,Error> {
        guard let urlComponnets = URLComponents(string: "http://192.168.1.58:7023/obtenerListaDeMusicaDiscover") else {
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
            .decode(type: GetObtenerListaDeMusicaDiscoverResponse.self, decoder: JSONDecoder())
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
