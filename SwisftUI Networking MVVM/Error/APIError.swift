//
//  APIError.swift
//  SwisftUI Networking MVVM
//
//  Created by Madushan Senavirathna on 2022-12-20.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Faild to decode that object from the sevice"
        case .errorCode(let code):
            return "\(code) - Somthing wet wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
