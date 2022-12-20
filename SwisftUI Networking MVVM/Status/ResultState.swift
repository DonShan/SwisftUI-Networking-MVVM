//
//  ResultState.swift
//  SwisftUI Networking MVVM
//
//  Created by Madushan Senavirathna on 2022-12-20.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Product])
    case failed(error: Error)
}
