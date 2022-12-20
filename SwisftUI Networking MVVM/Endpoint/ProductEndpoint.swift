//
//  NewsEndpoint.swift
//  SwisftUI Networking MVVM
//
//  Created by Madushan Senavirathna on 2022-12-20.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum ProductAPI {
    case getProductData
}

extension ProductAPI: APIBuilder {
        
    var baseUrl: URL {
        switch self {
        case .getProductData:
            return URL(string: "https://dummyjson.com")!
        }
    }
    
    var path: String {
        return "/products"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }    
    
}

