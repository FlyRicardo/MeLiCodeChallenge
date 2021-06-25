//
//  ItemListView.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 20/06/21.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    
    //MARK: - States
    @StateObject var productListObservableObject: ProductListViewObservableObject
    
    var body: some View {
        VStack {
            //Search Bar
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Colors.yellow, .white]), startPoint: .center, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 90)
                
                SearchBarView(text: $productListObservableObject.searchText, searchByProduct: $productListObservableObject.searchByProduct)
                
            }
            if productListObservableObject.isLoading {
                //Loading Shimmer Animation
                ScrollView {
                    VStack {
                        ForEach(0...2, id: \.self) { raw in
                            ListAnimationView()
                                .frame(height: 180)
                                .padding()
                        }
                    }
                }
                .padding(.bottom, 1)
            }
            else {
                ScrollView {
                    LazyVStack {
                        ForEach(productListObservableObject.products, id: \.id) { product in
                            let productItemObservableObject = ProductItemObservableObject(product: product)
                            ProductItemView(productItemObservableObject: productItemObservableObject)
                        }
                        .frame(height: 180)
                        .padding()
                    }
                }
                .padding(.bottom, 1)
            }
            
        }.alert(isPresented: $productListObservableObject.showError) { () -> Alert in
            Alert(title: Text(Constants.Categories.Localizable.alertErrorDescription),
                  message: Text(productListObservableObject.errorDescription),
                  dismissButton: .default(Text(Constants.Categories.Localizable.alertErrorButton)))
            
        }
        
    }
}
