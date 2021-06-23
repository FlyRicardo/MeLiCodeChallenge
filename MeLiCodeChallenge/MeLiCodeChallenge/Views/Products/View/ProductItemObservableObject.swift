//
//  ProductItemObservableObject.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 20/06/21.
//

import Foundation

class ProductItemObservableObject: ObservableObject {
    
    //MARK: Publised Variables
    @Published var product: ProductModel
    
    init(product: ProductModel) {
        self.product = product
    }
}

extension ProductItemObservableObject: ProductListViewProtocol{
    
}
