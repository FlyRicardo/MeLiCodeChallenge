//
//  ProductItemView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 20/06/21.
//

import Foundation
import SwiftUI
import Kingfisher

struct ProductItemView: View {
    //MARK: - States
    
    @StateObject var productItemObservableObject: ProductItemObservableObject
    
    //MARK: - Content View
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 180)
                        .foregroundColor(Colors.gray)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                    HStack {
                        VStack {
                            // Thumbnail
                            KFImage(productItemObservableObject.product.thumbnailUrl)
                                .placeholder {
                                    // Placeholder while downloading
                                    Image("DefaultImage", bundle: nil)
                                        .aspectRatio(contentMode: .fit)
                                }
                                .resizable()
                                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                .aspectRatio(contentMode: .fit)
                                .background(Colors.gray)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                        .padding(.leading, 10)

                        // Product info
                        VStack(alignment: .center) {
                            ProductItemLabelsView(product: productItemObservableObject.product)
                        }
                        .padding([.top, .bottom, .trailing], 10)
                        
                    }
                }
            }
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {

    static let productModel = ProductModel(id: "1",
                                           title: "Portatil Lenovo Amd Athon Gold 4gb 128 gb Ssd W10 Pro 14' Hd",
                                           price: "300.000",
                                           thumbnailUrl: URL(string:""),
                                           currency: "COP",
                                           installment: "",
                                           shippingCost: "Free")
    static let productItemObservableObject = ProductItemObservableObject(product: productModel)
    
    static var previews: some View {
        ProductItemView(productItemObservableObject: productItemObservableObject)
    }
}
