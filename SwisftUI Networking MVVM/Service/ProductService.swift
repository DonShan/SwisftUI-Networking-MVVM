//
//  ProductService.swift
//  SwisftUI Networking MVVM
//
//  Created by Madushan Senavirathna on 2022-12-20.
//

import Foundation
import Combine

protocol ProductService {
    func request(from endpint: ProductAPI) -> AnyPublisher<ProductResponse, APIError>
}

struct ProductServiceImpl: ProductService {
    func request(from endpint: ProductAPI) -> AnyPublisher<ProductResponse, APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<ProductResponse, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...2999).contains(response.statusCode) {
                    
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: ProductResponse.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
           
    }
    
    
}
