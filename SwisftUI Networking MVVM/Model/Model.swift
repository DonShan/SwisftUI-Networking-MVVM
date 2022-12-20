//
//  Model.swift
//  SwisftUI Networking MVVM
//
//  Created by Madushan Senavirathna on 2022-12-20.
//

import Foundation

import Foundation
 

// MARK: - Product
struct ProductResponse: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - ProductElement
struct Product: Codable, Identifiable {
    let id = UUID()
    let title, productDescription: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?

    enum CodingKeys: String, CodingKey {
        case id, title
        case productDescription = "description"
        case price, discountPercentage, rating, stock, brand, category, thumbnail, images
    }
}

extension Product {
    static var dummyData: Product {
        .init(title: "iPhone 9", productDescription: "An apple mobile which is nothing like apple", price: 549, discountPercentage: 12.96, rating: 4.69, stock: 94, brand: "Apple", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg", images: [
            "https://i.dummyjson.com/data/products/1/1.jpg",
            "https://i.dummyjson.com/data/products/1/2.jpg",
            "https://i.dummyjson.com/data/products/1/3.jpg",
            "https://i.dummyjson.com/data/products/1/4.jpg",
            "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
        ])
    }
}
