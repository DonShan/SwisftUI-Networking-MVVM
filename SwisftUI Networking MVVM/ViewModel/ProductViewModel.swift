//
//  ProductViewModel.swift
//  SwisftUI Networking MVVM
//
//  Created by Madushan Senavirathna on 2022-12-20.
//

import Foundation
import Combine

protocol ProductViewModl {
    
    func getProductData()
}

class ProductViewModelImpl: ObservableObject, ProductViewModl {
    
    private let service: ProductService
    
    private(set) var products = [Product]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: ProductService){
        self.service = service
    }
    
    func getProductData() {
        
        self.state = .loading
        
        let cancelabale = service
            .request(from: .getProductData)
            .sink { res in
                switch res {
                case .finished:
                    //send back the data
                    self.state = .success(content: self.products)
                    break
                case .failure(let error):
                    //send back the error
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: { [weak self] response in
                
                guard let self = self else { return }
                print(response)
                self.products = response.products
                    
                }
            self.cancellables.insert(cancelabale)
            }

    }
