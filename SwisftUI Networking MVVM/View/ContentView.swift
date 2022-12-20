//
//  ContentView.swift
//  SwisftUI Networking MVVM
//
//  Created by Madushan Senavirathna on 2022-12-19.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ProductViewModelImpl(service: ProductServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getProductData)
            case .success(let products):
                NavigationView{
                    List(products) { item in
                        ProductView(product: item)
                    }
                    .navigationTitle(Text("Products"))
                }
            }
            
        }.onAppear(perform: viewModel.getProductData)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
