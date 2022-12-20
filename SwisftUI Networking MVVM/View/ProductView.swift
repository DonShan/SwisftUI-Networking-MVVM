//
//  ProductView.swift
//  SwisftUI Networking MVVM
//
//  Created by Madushan Senavirathna on 2022-12-20.
//

import SwiftUI
import URLImage

struct ProductView: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            
            if let imageUrl = product.thumbnail,
               let url = URL(string: imageUrl) {
                
                URLImage(url) {
                    // This view is displayed before download starts
                    EmptyView()
                } inProgress: { progress in
                    // Display progress
                    Text("Loading...")
                        .font(.callout)
                        .foregroundColor(Color.orange)
                } failure: { error, retry in
                    PlaceHolderImageView()
                    
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                PlaceHolderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4){
                Text(product.brand ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(product.productDescription ?? "N/A")
                    .foregroundColor(.black)
                    .font(.footnote)
                    .lineLimit(20)
            }
        }
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
